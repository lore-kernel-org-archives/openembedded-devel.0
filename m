Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1vk-0007an-5o
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:28 +0200
Received: by weyr6 with SMTP id r6so3663821wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Z/Lly0DSP1sgnQsOOlJYa+ckVnDoqLf6/eah0GiZe9Q=;
	b=dc8VWmm3foVr/LkWospaBliHUmrdW1f0BBe8WeeELv+Sm3LeEvCJ/PE7vg3HOtqvd4
	Yo4ra5fdhVv4Y6CVvx2QgdKAm+is7P+tsw2Jxtci3ESBQU+RtCJXlSdOZTpQ+wRNDRxi
	3rrs3hUO6EcmUgznQjBpWEy4jgwW1Fc8qSssEe9+ElQR6YlPqdtzvYIA2UC8z9vbb+aO
	jzNuHM8q1pu+UXdNMNUTuAbdOtwgVgaUNrwuHLn/YgXfiKECK2yn1SFe/w/d1ePy895O
	NfMnJyCORrQD32ZKzOOQ5F0VhnU9CIZLTzYjtThmmoiKBDDHc9J0Rh5g7DYcj27J+JDI
	/IBg==
Received: by 10.180.107.103 with SMTP id hb7mr2746151wib.3.1343699991782;
	Mon, 30 Jul 2012 18:59:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm4003261wiz.4.2012.07.30.18.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:38 +0200
Message-Id: <edd4f5c9bb90ef248be5b1da7e149b5aea8f68f7.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 13/24] gnuplot: import from meta-smartphone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 02:11:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnuplot/gnuplot-4.4.4/automake-1.12.x.patch    |   44 ++
 .../gnuplot/gnuplot-4.4.4/subdirs.patch            |   11 +
 meta-oe/recipes-extended/gnuplot/gnuplot.inc       |   35 ++
 .../gnuplot/gnuplot/gnuplot.desktop                |    8 +
 .../recipes-extended/gnuplot/gnuplot/gnuplot.png   |  Bin 0 -> 9383 bytes
 .../recipes-extended/gnuplot/gnuplot/qtopia.trm    |  483 ++++++++++++++++++++
 meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb  |   16 +
 7 files changed, 597 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot.inc
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.png
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
new file mode 100644
index 0000000..51f703c
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/automake-1.12.x.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Backport
+
+It's fixed in 4.6 and 4.7(HEAD)
+
+http://sourceforge.net/tracker/?func=detail&aid=3523591&group_id=2055&atid=102055
+
+diff -uNr gnuplot-4.4.4.orig/Makefile.am gnuplot-4.4.4/Makefile.am
+--- gnuplot-4.4.4.orig/Makefile.am	2012-07-20 10:54:49.075828905 +0200
++++ gnuplot-4.4.4/Makefile.am	2012-07-20 10:55:22.380831313 +0200
+@@ -1,5 +1,5 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+-AUTOMAKE_OPTIONS = foreign 1.2h
++AUTOMAKE_OPTIONS = foreign
+ 
+ SUBDIRS = config m4 term src  $(LISPDIR) man share
+ 
+diff -uNr gnuplot-4.4.4.orig/configure.in gnuplot-4.4.4/configure.in
+--- gnuplot-4.4.4.orig/configure.in	2011-09-02 06:09:40.000000000 +0200
++++ gnuplot-4.4.4/configure.in	2012-07-20 10:55:53.289833224 +0200
+@@ -16,10 +16,11 @@
+ dnl configure.in body
+ 
+ dnl Compiler characteristics
+-dnl Check for ANSI C prototypes, the const and inline keywords,
+-dnl and ANSI style stringification
++dnl Check for the const and inline keywords and ANSI style stringification
++dnl automake 1.12 dropped support for AM_C_PROTOTYPES and ansi2knr
++dnl But our code still tests for #ifdef PROTOTYPES, so define it here
++AC_DEFINE(PROTOTYPES,1,[Automake 1.12 dropped support for building without prototypes])
+ AC_PROG_CC
+-AM_C_PROTOTYPES
+ AC_PROG_CPP
+ AC_C_CONST
+ AC_C_INLINE
+diff -uNr gnuplot-4.4.4.orig/src/Makefile.am gnuplot-4.4.4/src/Makefile.am
+--- gnuplot-4.4.4.orig/src/Makefile.am	2010-10-06 06:53:16.000000000 +0200
++++ gnuplot-4.4.4/src/Makefile.am	2012-07-20 10:56:02.376834548 +0200
+@@ -1,5 +1,5 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+-AUTOMAKE_OPTIONS = ansi2knr foreign 1.2h
++AUTOMAKE_OPTIONS = foreign
+ 
+ # in the spirit of automake ...
+ pkglibexecdir = $(libexecdir)/@PACKAGE@/@VERSION_MAJOR@
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
new file mode 100644
index 0000000..8c7d1f0
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot-4.4.4/subdirs.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.am	2007-08-23 13:10:15.560659023 +0200
++++ gnuplot-4.2.0/Makefile.am	2007-08-23 13:10:34.961764629 +0200
+@@ -1,7 +1,7 @@
+ ## Process this file with automake to produce Makefile.in -*-Makefile-*-
+ AUTOMAKE_OPTIONS = foreign 1.2h
+ 
+-SUBDIRS = config m4 term src docs $(LISPDIR) man demo tutorial share
++SUBDIRS = config m4 term src  $(LISPDIR) man share
+ 
+ EXTRA_DIST = BUGS CodeStyle Copyright FAQ GNUmakefile INSTALL INSTALL.gnu \
+ Makefile.maint PATCHLEVEL PGPKEYS PORTING README README.1ST README.exp \
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
new file mode 100644
index 0000000..b72bbd7
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -0,0 +1,35 @@
+DESCRIPTION = "Gnuplot is a portable command-line driven interactive datafile \
+(text or binary) and function plotting utility."
+HOMEPAGE = "http://www.gnuplot.info/"
+SECTION = "console/scientific"
+LICENSE = "BSD-4"
+LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
+DEPENDS = "virtual/libx11 gd cairo readline"
+
+inherit autotools
+
+acpaths = ""
+
+EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
+                --without-lisp-files \
+                --without-tutorial \
+                --disable-wxwidgets"
+
+do_compile_prepend() {
+    install -m 0644 ${WORKDIR}/qtplot-0.2/qtopia.trm ${S}/term/
+}
+
+do_install_append() {
+    install -d ${D}${datadir}/applications/
+    install -m 0644 ${WORKDIR}/gnuplot.desktop ${D}${datadir}/applications/
+    install -d ${D}${datadir}/pixmaps/
+    install -m 0644 ${WORKDIR}/gnuplot.png ${D}${datadir}/pixmaps/
+}
+
+PACKAGES =+ "${PN}-x11-dbg ${PN}-x11"
+DESCRIPTION_${PN}-x11 = "X11 display terminal for Gnuplot."
+SECTION_${PN}-x11 = "x11/scientific"
+FILES_${PN}-x11 = "${libexecdir} ${datadir}/applications ${datadir}/pixmaps ${libdir}/X11 "
+
+FILES_${PN} += "${datadir}/texmf"
+FILES_${PN}-x11-dbg += "${libexecdir}/gnuplot/*/.debug"
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop b/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
new file mode 100644
index 0000000..f67df9e
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.desktop
@@ -0,0 +1,8 @@
+[Desktop Entry]
+Name=Gnuplot
+Comment=Plot data and function graphs
+Exec=x-terminal-emulator -e gnuplot
+Terminal=false
+Type=Application
+Icon=gnuplot
+Categories=Science;
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.png b/meta-oe/recipes-extended/gnuplot/gnuplot/gnuplot.png
new file mode 100644
index 0000000000000000000000000000000000000000..054cd9e7c73f2a78a9f2dd91ef8cce52ac520389
GIT binary patch
literal 9383
zcmdT~y-EZz5Y8SV{$OPzVqxI}*ou{MqK6<Ng4&6Nogmm)+laMRVxg6tZ{Rcd0OC_v
zS!w3T?M>#A*~HBxy2ss4GC%pgZ*t)l?q+vqb7pFON+~td+v@J=`!c*I#`Whx=j&SE
z#!t34yXqTWkFU?SdS>!`>*zwM=~;MJ>i%I)sYTW6uI*n|)$-EYd-bg^9a#3ND);&U
z&^qqSjI%!Q0D<!vh~){i)JmK{#i_{o2E-a-#0f-w#bD0|?E3*XxQi3Oi&-{R76ZpN
zB+*z@s2l+V!l^nXf#Z=~h5(}|!e*PEoH7J3G)`&GXKLgp;87BD^4gAEaRTfy8lbTA
z`+*pW6NoxS5iqYwx*$%#0zwwIeB6NPR9*rYBm)YEHQD6|G$G^ssFVMPfTv^m2q4v(
zP8Lr5+GpyC6JU?g8cm?#=z=(b<i{xCDo&uk9^O6#K&zpyn}+~K>DUI?9c$+&5Q~t;
z69ME2NNpcOtkZwmfkiwEai>VM&!`ujXTZAhDtHR5yF}Vk&$ltKFaq^uw-5&3Mg%5T
zmH=K@Kz%506Ud+#=9I$jB>7$9LXt@gy8|vDDdvQ>4?r6wkV&}|x(o?Wh1!y6n;*e$
zv;z^zL7`Nfprr7iApzlq!Xd>)4hhh_-)@87=F#;7$2Nh~T}WNeLCPlJ2>9z$Jb~El
z5F4LBolyd*+HUH&egY@JU6&XoP`iu~s;Vch%tL+KF0{?3A~NIV4nVR;-MVg*zYa`q
z_z6%IeITv*r?taRrN&m_zW^F6t&twTRnbqz3Nr%>xSpe9SB~&p^ZzDdKxS4Sv}x`@
yC@4={`6Cr*dcc9Je=+_tN9q6=zWYG>=5el|ee`j5y70Af2TSxecDgU?$5%hDrHYvV

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm b/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
new file mode 100644
index 0000000..b52f9bb
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/qtopia.trm
@@ -0,0 +1,483 @@
+/*
+ * $Id: dumb.trm,v 1.16 2004/04/13 17:24:16 broeker Exp $
+ *
+ */
+
+/* GNUPLOT - qtopia.trm */
+
+/*[
+ * Copyright 1991 - 1993, 1998, 2004   Thomas Williams, Colin Kelley
+ *
+ * Permission to use, copy, and distribute this software and its
+ * documentation for any purpose with or without fee is hereby granted,
+ * provided that the above copyright notice appear in all copies and
+ * that both that copyright notice and this permission notice appear
+ * in supporting documentation.
+ *
+ * Permission to modify the software is granted, but not the right to
+ * distribute the complete modified source code.  Modifications are to
+ * be distributed as patches to the released version.  Permission to
+ * distribute binaries produced by compiling modified sources is granted,
+ * provided you
+ *   1. distribute the corresponding source modifications from the
+ *    released version in the form of a patch file along with the binaries,
+ *   2. add special version identification to distinguish your version
+ *    in addition to the base release version number,
+ *   3. provide your name and address as the primary contact for the
+ *    support of your modified version, and
+ *   4. retain our contact information in regard to use of the base
+ *    software.
+ * Permission to distribute the released version of the source code along
+ * with corresponding source modifications in the form of a patch file is
+ * granted with same provisions 2 through 4 for binary distributions.
+ *
+ * This software is provided "as is" without express or implied warranty
+ * to the extent permitted by applicable law.
+]*/
+
+/*
+ * This file is included by ../term.c.
+ *
+ * This terminal driver supports:
+ *   qtopia terminals
+ *
+ * AUTHORS
+ *   Michael Neuroth, 2004-05-16
+ *           INTERNET: michael.neuroth@freenet.de
+ *
+ * send your comments or suggestions to (gnuplot-info@lists.sourceforge.net).
+ *
+ */
+#include "driver.h"
+
+#define NO_QTOPIA_ENHANCED_SUPPORT
+
+#ifdef TERM_REGISTER
+register_term(qtopia_driver)
+#endif
+
+#ifdef TERM_PROTO
+TERM_PUBLIC void QTOPIA_options __PROTO((void));
+TERM_PUBLIC void QTOPIA_init __PROTO((void));
+TERM_PUBLIC void QTOPIA_graphics __PROTO((void));
+TERM_PUBLIC void QTOPIA_text __PROTO((void));
+TERM_PUBLIC void QTOPIA_reset __PROTO((void));
+TERM_PUBLIC void QTOPIA_linetype __PROTO((int linetype));
+TERM_PUBLIC void QTOPIA_move __PROTO((unsigned int x, unsigned int y));
+TERM_PUBLIC void QTOPIA_point __PROTO((unsigned int x, unsigned int y,
+				     int point));
+TERM_PUBLIC void QTOPIA_vector __PROTO((unsigned int x, unsigned int y));
+TERM_PUBLIC void QTOPIA_put_text __PROTO((unsigned int x, unsigned int y,
+					const char *str));
+TERM_PUBLIC void QTOPIA_arrow __PROTO((unsigned int sx, unsigned int sy,
+				     unsigned int ex, unsigned int ey,
+				     int head));
+
+#define ENHqtopia_put_text NULL
+
+
+#define QTOPIA_XMAX 4096
+#define QTOPIA_YMAX 4096
+
+#ifdef ZAURUS
+#define QTOPIA_VCHAR (QTOPIA_YMAX/25)
+#define QTOPIA_HCHAR (QTOPIA_XMAX/40)
+#define QTOPIA_VTIC (QTOPIA_YMAX/50)
+#define QTOPIA_HTIC (QTOPIA_XMAX/40)
+#else
+#define QTOPIA_VCHAR (QTOPIA_YMAX/25)
+#define QTOPIA_HCHAR (QTOPIA_XMAX/50)
+#define QTOPIA_VTIC (QTOPIA_YMAX/100)
+#define QTOPIA_HTIC (QTOPIA_XMAX/150)
+#endif
+
+#endif /* TERM_PROTO */
+
+#ifdef TERM_BODY
+
+/*#include <winsock2.h>*/
+/* needs: ws2_32.lib */
+#ifndef _MSC_VER
+#include <sys/types.h>
+#include <sys/socket.h>
+#include <netinet/in.h>
+#include <arpa/inet.h>
+#endif
+
+#define QTOPIA_MAX_BUFFER		512
+#define QTOPIA_MAX_DELAY_COUNT	20	/* * 100 ms = 2 s */
+
+#ifdef _MSC_VER
+#define QTOPIA_BAD_SOCKET		INVALID_SOCKET		/* -1 */
+#define QTOPIA_BAD_CONNECT		SOCKET_ERROR
+#else
+#define QTOPIA_BAD_SOCKET		-1
+#define QTOPIA_BAD_CONNECT		-1
+#endif
+#define QTOPIA_PORT_NO			5050
+
+static int qtopia_client_socket = QTOPIA_BAD_SOCKET;
+static unsigned short qtopia_port_no = QTOPIA_PORT_NO;
+static char qtopia_host_name[QTOPIA_MAX_BUFFER+1] = { "localhost" };
+
+static int OpenClient __PROTO(( int test));
+static void CloseClient();
+
+static void MySleep( delay )
+int delay;
+{
+#ifdef _MSC_VER
+	Sleep( delay );
+#else
+	usleep( delay );
+#endif
+}
+
+static void InitSockets()
+{
+#ifdef _MSC_VER
+	WORD wVersionRequested;
+	WSADATA wsaData;
+	int err;
+
+	wVersionRequested = MAKEWORD( 2, 2 );
+
+	err = WSAStartup( wVersionRequested, &wsaData );
+#endif
+}
+
+static void ExitSockets()
+{
+#ifdef _MSC_VER
+	WSACleanup();
+#endif
+}
+
+static int CheckForQtplot( count )
+int count;
+{
+	/* test (via sockets) if qtplot is allready running */
+	if( !OpenClient( 1 ) )
+	{
+		/* give qtplot a litle bit time to start... */
+		if( count < QTOPIA_MAX_DELAY_COUNT )
+		{
+			if( count == 0 )
+			{
+#ifdef _MSC_VER
+				system( "start qtplot" );
+#else
+				system( "qtplot&" );
+#endif
+			}
+		
+			MySleep(100);
+
+			return CheckForQtplot( count+1 );
+		}
+		else
+		{
+			return 0;
+		}
+	}
+	else
+	{
+		CloseClient();
+
+		return 1;
+	}
+}
+
+static int OpenClient( test )
+int test;
+{
+    int len;
+    struct sockaddr_in address;
+    int result;
+
+	/*  Create a socket for the client.  */
+
+    qtopia_client_socket = socket(AF_INET, SOCK_STREAM, 0);
+
+	if( qtopia_client_socket != QTOPIA_BAD_SOCKET )
+	{
+		/*  Name the socket, as agreed with the server.  */
+
+		address.sin_family = AF_INET;
+		address.sin_addr.s_addr = inet_addr(/*qtopia_host_name*/"127.0.0.1");	/* localhost */
+		address.sin_port = htons(qtopia_port_no);
+		len = sizeof(address);
+
+		/*  Now connect our socket to the server's socket.  */
+
+		result = connect(qtopia_client_socket, (struct sockaddr *)&address, len);
+		
+		if( result == QTOPIA_BAD_SOCKET )
+		{
+			/* mark this socket as bad */
+
+			close( qtopia_client_socket );
+
+			qtopia_client_socket = QTOPIA_BAD_SOCKET;
+
+			if( !test )
+			{
+				fprintf( gpoutfile, "error connecting to server !\n" );
+			}
+			return 0;	/* something went wrong */
+		}
+	}
+	else
+	{
+		if( !test )
+		{
+			fprintf( gpoutfile, "error creating socket !\n" );
+		}
+		return 0;	/* something went wrong */
+	}
+
+	return 1;	/* everything ist ok ! */
+}
+
+static void CloseClient()
+{
+    close( qtopia_client_socket );
+}
+
+static int IsClientOk()
+{
+	return qtopia_client_socket != QTOPIA_BAD_SOCKET;
+}
+
+static void SendDataToSocket( sLine )
+const char * sLine;
+{
+	if( IsClientOk() )
+	{
+		int send_count;
+
+		send_count = send( qtopia_client_socket, sLine, strlen( sLine ), 0 );
+
+		if( send_count <= 0 )
+		{
+			fprintf( gpoutfile, "error writing to socket str=%s!\n", sLine );
+		}
+		/*
+		else
+		{
+			fprintf( gpoutfile, "wrote %d bytes\n", send_count );
+		}
+		*/
+	}
+	else
+	{
+		/* for testing... */
+		/*fprintf( gpoutfile, sLine );*/
+	}
+}
+
+/* ************************************************** */
+
+enum QTOPIA_id { QTOPIA_PORT, QTOPIA_HOST, QTOPIA_OTHER };
+
+static struct gen_table QTOPIA_opts[] =
+{
+    { "po$rt", QTOPIA_PORT },
+    { "ho$st", QTOPIA_HOST },
+    { NULL, QTOPIA_OTHER }
+};
+
+TERM_PUBLIC void
+QTOPIA_options()
+{
+    /* this is not for the qtopia terminal ! */
+	/*SendDataToSocket( "qtd options\n" );*/
+
+    int x, y;
+    struct value a;
+
+    while (!END_OF_COMMAND) 
+	{
+		switch(lookup_table(&QTOPIA_opts[0],c_token)) 
+		{
+			case QTOPIA_PORT:
+				c_token++;
+				if (END_OF_COMMAND)
+					int_error(c_token, "expecting port number");
+				qtopia_port_no = (int) real(const_express(&a));
+				break;
+			case QTOPIA_HOST:
+				c_token++;
+				if (END_OF_COMMAND)
+					int_error(c_token, "expecting host name");
+				if (isstring(c_token))
+					quote_str( qtopia_host_name, c_token, sizeof(qtopia_host_name) );
+				else
+ 					copy_str( qtopia_host_name, c_token, sizeof(qtopia_host_name) );
+				c_token++;
+				break;
+			case QTOPIA_OTHER:
+			default:
+				break;
+		}
+    }
+
+    sprintf(term_options, "host=%s port=%d",qtopia_host_name,qtopia_port_no);
+}
+
+
+TERM_PUBLIC void
+QTOPIA_init()
+{
+	/* initialize lib (if necassary) */
+	InitSockets();
+	CheckForQtplot( 0 );
+	OpenClient( 0 ); 
+
+	SendDataToSocket( "qtd init\n" );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_graphics()
+{
+	SendDataToSocket( "qtd graphics\n" );
+}
+
+TERM_PUBLIC void
+QTOPIA_text()
+{
+	SendDataToSocket( "qtd text\n" );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_reset()
+{
+	SendDataToSocket( "qtd reset\n" );
+
+	/* give the qtplot a litle bit time to shutdown */
+	MySleep(100);
+
+	CloseClient();
+	ExitSockets();
+}
+
+
+TERM_PUBLIC void
+QTOPIA_linetype(linetype)
+int linetype;
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd linetype type=%d\n",linetype );
+
+	SendDataToSocket( sBuffer );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_move(x, y)
+unsigned int x, y;
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd move x=%d y=%d\n",x,y );
+
+	SendDataToSocket( sBuffer );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_point(x, y, point)
+unsigned int x, y;
+int point;
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd point x=%d y=%d point=%d\n",x,y,point );
+
+	SendDataToSocket( sBuffer );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_vector(_x, _y)
+unsigned int _x, _y;
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd vector x=%d y=%d\n",_x,_y );
+
+	SendDataToSocket( sBuffer );
+}
+
+
+TERM_PUBLIC void
+QTOPIA_put_text(x, y, str)
+unsigned int x, y;
+const char *str;
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd put_text x=%d y=%d str=%s\n",x,y,str );
+
+	SendDataToSocket( sBuffer );
+}
+
+/* not suported yet ! */
+TERM_PUBLIC void
+QTOPIA_arrow(sx, sy, ex, ey, head)
+    unsigned int sx, sy, ex, ey;
+    int head;		/* ignored */
+{
+	char sBuffer[QTOPIA_MAX_BUFFER];
+
+	sprintf( sBuffer, "qtd arrow sx=%d sy=%d ex=%d ey=%d head=%d\n",sx,sy,ex,ey,head );
+
+	SendDataToSocket( sBuffer );
+}
+
+
+#endif /* TERM_BODY */
+
+#ifdef TERM_TABLE
+TERM_TABLE_START(qtopia_driver)
+    "qtopia", "qtopia or Qt",
+    QTOPIA_XMAX, QTOPIA_YMAX, QTOPIA_VCHAR, QTOPIA_HCHAR,
+    QTOPIA_VTIC, QTOPIA_HTIC, QTOPIA_options, QTOPIA_init, QTOPIA_reset,
+    QTOPIA_text, null_scale, QTOPIA_graphics, QTOPIA_move, QTOPIA_vector,
+    QTOPIA_linetype, QTOPIA_put_text, null_text_angle,
+    null_justify_text, QTOPIA_point, /*QTOPIA_arrow*/0, set_font_null,
+    0,				/* pointsize */
+    TERM_CAN_MULTIPLOT,
+    NULL, NULL, NULL, NULL
+#ifdef USE_MOUSE
+    , NULL, NULL, NULL, NULL, NULL
+#endif
+#ifdef PM3D
+    , NULL, NULL, NULL, NULL
+#endif
+TERM_TABLE_END(qtopia_driver)
+
+#undef LAST_TERM
+#define LAST_TERM qtopia_driver
+
+#endif /* TERM_TABLE */
+
+#ifdef TERM_HELP
+START_HELP(qtopia)
+"1 qtopia",
+"?commands set terminal qtopia",
+"?set terminal qtopia",
+"?set term qtopia",
+"?terminal qtopia",
+"?term qtopia",
+"?qtopia",
+" The `qtopia` terminal driver has no additional options.",
+"",
+" Syntax:",
+"       set terminal qtopia",
+""
+END_HELP(qtopia)
+#endif /* TERM_HELP */
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
new file mode 100644
index 0000000..d922afc
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb
@@ -0,0 +1,16 @@
+require gnuplot.inc
+
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${PN}-${PV}.tar.gz;name=archive \
+   http://www.mneuroth.de/privat/zaurus/qtplot-0.2.tar.gz;name=qtplot \
+   file://subdirs.patch \
+   file://gnuplot.desktop \
+   file://gnuplot.png \
+   file://automake-1.12.x.patch \
+"
+
+SRC_URI[archive.md5sum] = "97a43328e81e57ebed7f135ca0c07e82"
+SRC_URI[archive.sha256sum] = "d228599d08d5f87bcb79af8af8bb432c77d942802b1643f920c7baaeaf1ddbfd"
+SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
+SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
-- 
1.7.8.6



