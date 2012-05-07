Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRTPy-0001j1-A2
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 21:16:22 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4416002wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 May 2012 12:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=oMQL/n71aA1AM5OXiGGg5fOA0AHEMkYDdM4cpAs2H/s=;
	b=sMvM+bEVnY0FJ0RJyBhJRLdtAik9bKI7C65i+U0Wr40iRH8mtsgMzBIVZ1tVUkemnn
	VxRAeBXIDOqW8A/9Z2XJkTINsYv3RgLaPSS0I9Qye0Q2mHtu0Qmo3PplOu7o/dgqZ5Tn
	MwDSU7Oc5zzdJEf8qMwLxNHQ5N9qlGwYHEPIpLiWguAmB7pH7m6LU248ojkpR4gGMy+s
	xOekjMEXCqDh05KxLtHxZN1sOqlM5C1oHeo2BYIOQucUm4srbv79RDeeej5g/1ILSDgS
	/KTVBG4lDii1pYVx0kU2ioHTCSDYPkaritB4Ee5yzJ3YppjLKks7iyZSCP0bHW0SnSF/
	Cfeg==
Received: by 10.216.143.147 with SMTP id l19mr1210385wej.45.1336417593946;
	Mon, 07 May 2012 12:06:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j3sm36952293wiw.1.2012.05.07.12.06.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 12:06:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 21:05:47 +0200
Message-Id: <ac3f69755e0e6a0d9c1ebd49594cca2140e02c5b.1336417488.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1336417488.git.Martin.Jansa@gmail.com>
References: <cover.1336417488.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gpe][PATCH 5/5] gpe-scap: migrate to use libsoup-2.4 instead of libsoup-2.2 API
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
X-List-Received-Date: Mon, 07 May 2012 19:16:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpe-scap/gpe-scap/use.libsoup-2.4.patch        |   42 ++++++++++++++++++++
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |    8 ++-
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch

diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
new file mode 100644
index 0000000..3cfe5d7
--- /dev/null
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap/use.libsoup-2.4.patch
@@ -0,0 +1,42 @@
+diff -uNr gpe-scap-1.4.orig/configure.ac gpe-scap-1.4/configure.ac
+--- gpe-scap-1.4.orig/configure.ac	2009-03-05 18:53:53.000000000 +0100
++++ gpe-scap-1.4/configure.ac	2012-05-06 10:18:29.348308322 +0200
+@@ -24,7 +24,7 @@
+ AC_SUBST(LDFLAGS)
+ 
+ dnl libraries
+-GTK_MODULES="gtk+-2.0 >= 2.6.0 gthread-2.0 libsoup-2.2"
++GTK_MODULES="gtk+-2.0 >= 2.6.0 gthread-2.0 libsoup-2.4"
+ PKG_CHECK_MODULES(GTK, $GTK_MODULES)
+ AC_SUBST(GTK_CFLAGS)
+ AC_SUBST(GTK_LIBS)
+diff -uNr gpe-scap-1.4.orig/src/scr-shot-common.c gpe-scap-1.4/src/scr-shot-common.c
+--- gpe-scap-1.4.orig/src/scr-shot-common.c	2009-03-05 12:13:20.000000000 +0100
++++ gpe-scap-1.4/src/scr-shot-common.c	2012-05-06 10:30:52.299371576 +0200
+@@ -182,12 +182,12 @@
+   /* create session and message */
+   session = soup_session_sync_new ();
+   message = soup_message_new ("POST", url);
+-  soup_message_add_header (message->request_headers, "User-Agent", "gpe-scap/" VERSION);
+-  soup_message_add_header (message->request_headers, "Accept",
++  soup_message_headers_append (message->request_headers, "User-Agent", "gpe-scap/" VERSION);
++  soup_message_headers_append (message->request_headers, "Accept",
+ 			   "text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5");
+-/*  soup_message_add_header (message->request_headers, "Accept-Charset", "Accept-Charset=ISO-8859-1,utf-8;q=0.7,*;q=0.7");
+-  soup_message_add_header (message->request_headers, "Keep-Alive", "100");
+-  soup_message_add_header (message->request_headers, "Connection", "keep-alive");
++/*  soup_message_headers_append (message->request_headers, "Accept-Charset", "Accept-Charset=ISO-8859-1,utf-8;q=0.7,*;q=0.7");
++  soup_message_headers_append (message->request_headers, "Keep-Alive", "100");
++  soup_message_headers_append (message->request_headers, "Connection", "keep-alive");
+   soup_message_wire	add_header (message->request_headers, "Accept-Encoding", "gzip,deflate");
+ */
+   /* build message body */
+@@ -207,7 +207,7 @@
+   memcpy (body + strlen (cmd) + len, tail, strlen (tail));
+ 
+   soup_message_set_request (message, "multipart/form-data; boundary="SEP,
+-                            SOUP_BUFFER_SYSTEM_OWNED, body, content_len);
++                            SOUP_MEMORY_TAKE, body, content_len);
+ 
+   soup_session_send_message (session, message);
+ 
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index 9577f2f..c416ff5 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -4,9 +4,9 @@ SECTION = "gpe"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup"
+DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup-2.4"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI[md5sum] = "eaf545561b0ad981c9d01833f30fcf95"
 SRC_URI[sha256sum] = "762778421fae7c62d5ec6a9d27986166c0dbbe2ff51fc10bb9b8baff5c367534"
@@ -15,7 +15,9 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit gpe autotools
 
-SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch"
+SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch \
+  file://use.libsoup-2.4.patch \
+"
 
 RREPLACES_${PN} = "gpe-screenshot"
 
-- 
1.7.8.6



