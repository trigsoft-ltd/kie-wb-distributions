<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Locale" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://jakarta.apache.org/taglibs/i18n-1.0" prefix="i18n" %>
<%
	String jsessionidsso = request.getParameter("JSESSIONIDSSO");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String redirectTo = request.getParameter("redirectTo");
	try {
		request.login(username, password);
	}
	catch(Exception e) {
		// Nothing required. User couldn't login due to security.
	}
	finally {
		Cookie myCookie = new Cookie("JSESSIONIDSSO", jsessionidsso);
		response.addCookie(searchStringCookie);
		response.sendRedirect(redirectTo);
	}
%>
