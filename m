Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5691A7311B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:38 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o123so164757pga.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eiPU2q+W32MdmtlqTo59LKaCAO4HNFuOA3/dY5u0E9A=;
	b=etD5NJ5tq0qaHlxc7XnM8MP6jjHZyGJsYTcF/T+uEdITMTEWZbcVAkRyCpSOiWFqft
	IWnUGJxudjpQwU9hIYXga+Pex571XfdBQdXpMuRo/4MOu7DHav51jxjDVckOJPtGeq4H
	eOdVy8V1EZ01DtuF8PskA7mrrKRSrKeuhqI388+Fv8akSqT5Q3Z4VD92C6J7eTEazegZ
	jP7m+3Te6IJYVpagd3Lazlk5n62mV0LetGYbGdHk4sm4crqcUbiFcV4O0MyIMIQsU8Qf
	NJhEuFGonNEkr6lwniAzCwU/CvI0IN7QizAuK+NGtdW7xBHMsvpJ5vMblnIkD9Ou/cCE
	XUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eiPU2q+W32MdmtlqTo59LKaCAO4HNFuOA3/dY5u0E9A=;
	b=NTscF0FvMkVosoglKZ+7kieDlVr7CT3IXi0H0mEJUeJfRI+bMYx6WG7bRdtZo+STCz
	0LBqvIpbgWmUTMEnBJZr+jPx9LTPa3wgI+wME4+mHtMeV9kKlrfIv7ToSectnJdZL55E
	tyqsI4mTTXVOe6EN/vFSHFLG2PBPAnx+ei4wec6Iq25ljyjV9Lofm7g07FBpo2LR5K2I
	Dxm9rjQRde6zDWB0ZIokjwfgOsM5EhNz8fRhttiAAg+89KghAXKBF2xa8Qg3u0yWA82C
	uKUHvgX178c2XcMt3qUueV5Rq/LQUC8HM/Hf82Y/cVEOWUIqBx1PX6RpYg1T3hgexSF0
	wp1g==
X-Gm-Message-State: AN3rC/4Qq/eZAFNPkTHRuSGdGnE60HJUOeEW4CvrKixC7mJrhsehdFnK
	1/hYZRAqwYLPXg==
X-Received: by 10.99.143.11 with SMTP id n11mr5124437pgd.232.1492539759919;
	Tue, 18 Apr 2017 11:22:39 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:40 -0700
Message-Id: <20170418182142.27253-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 30/32] lirc: update to 0.9.4d
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Apr 2017 18:22:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/lirc/lirc.inc         |   2 +-
 ...crcd-Mark-local-inline-funtions-as-static.patch |  49 ----------
 .../recipes-connectivity/lirc/lirc/pollfd.patch    | 101 +++++++++++++++++++++
 .../lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb}         |   7 +-
 4 files changed, 106 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
 rename meta-oe/recipes-connectivity/lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
index 6ff8e0160..ef79885a0 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc.inc
+++ b/meta-oe/recipes-connectivity/lirc/lirc.inc
@@ -6,7 +6,7 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
+DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch b/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
deleted file mode 100644
index e19d27671..000000000
--- a/meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c2be4543e4777c9e3d74b30326ba37b01917b0a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 25 Aug 2016 03:02:37 +0000
-Subject: [PATCH] lircrcd: Mark local inline funtions as static
-
-These functions are not used anywhere outside
-this file, so they should be converted into static
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- daemons/lircrcd.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/daemons/lircrcd.c b/daemons/lircrcd.c
-index 55777cd..5ddc94d 100644
---- a/daemons/lircrcd.c
-+++ b/daemons/lircrcd.c
-@@ -153,7 +153,7 @@ char *s;
- /* A safer write(), since sockets might not write all but only some of the
-    bytes requested */
- 
--inline int write_socket(int fd, char *buf, int len)
-+static inline int write_socket(int fd, char *buf, int len)
- {
- 	int done, todo = len;
- 
-@@ -167,7 +167,7 @@ inline int write_socket(int fd, char *buf, int len)
- 	return (len);
- }
- 
--inline int write_socket_len(int fd, char *buf)
-+static inline int write_socket_len(int fd, char *buf)
- {
- 	int len;
- 
-@@ -177,7 +177,7 @@ inline int write_socket_len(int fd, char *buf)
- 	return (1);
- }
- 
--inline int read_timeout(int fd, char *buf, int len, int timeout)
-+static inline int read_timeout(int fd, char *buf, int len, int timeout)
- {
- 	fd_set fds;
- 	struct timeval tv;
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch b/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
new file mode 100644
index 000000000..4feea8034
--- /dev/null
+++ b/meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
@@ -0,0 +1,101 @@
+Index: lirc-0.9.4d/daemons/lircrcd.cpp
+===================================================================
+--- lirc-0.9.4d.orig/daemons/lircrcd.cpp
++++ lirc-0.9.4d/daemons/lircrcd.cpp
+@@ -29,10 +29,12 @@
+ #include <sys/un.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
++#include <poll.h>
+ #include <syslog.h>
+ 
+ #include "lirc_client.h"
+ #include "lirc/lirc_log.h"
++#include "lirc/curl_poll.h"
+ 
+ #define MAX_CLIENTS 100
+ #define WHITE_SPACE " \t"
+Index: lirc-0.9.4d/lib/curl_poll.c
+===================================================================
+--- lirc-0.9.4d.orig/lib/curl_poll.c
++++ lirc-0.9.4d/lib/curl_poll.c
+@@ -36,6 +36,7 @@
+ #include <stdlib.h>
+ #include <sys/time.h>
+ #include <sys/types.h>
++#include <sys/poll.h>
+ 
+ #include "lirc_log.h"
+ #include "curl_poll.h"
+@@ -67,7 +68,7 @@ static const logchannel_t logchannel = L
+ 
+ #ifdef HAVE_POLL_FINE
+ 
+-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
+ {
+ 	return poll(ufds, nfds, timeout_ms);
+ }
+@@ -112,7 +113,7 @@ static int verify_sock(int s)
+ }
+ 
+ 
+-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
+ {
+ 	struct timeval pending_tv;
+ 	struct timeval* ptimeout;
+Index: lirc-0.9.4d/lib/curl_poll.h
+===================================================================
+--- lirc-0.9.4d.orig/lib/curl_poll.h
++++ lirc-0.9.4d/lib/curl_poll.h
+@@ -1,5 +1,5 @@
+-#ifndef _POLL_H
+-#define _POLL_H
++#ifndef _LIB_CURL_POLL_H
++#define _LIB_CURL_POLL_H
+ /***************************************************************************
+  *                                  _   _ ____  _
+  *  Project                     ___| | | |  _ \| |
+@@ -29,13 +29,9 @@
+ extern "C" {
+ #endif
+ 
+-#ifdef HAVE_SYS_POLL_H
+-#include <sys/poll.h>
+-#else
+ #include <poll.h>
+-#endif
+ 
+-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
+ 
+ #ifdef __cplusplus
+ }
+Index: lirc-0.9.4d/lib/lirc/curl_poll.h
+===================================================================
+--- lirc-0.9.4d.orig/lib/lirc/curl_poll.h
++++ lirc-0.9.4d/lib/lirc/curl_poll.h
+@@ -1,5 +1,5 @@
+-#ifndef _POLL_H
+-#define _POLL_H
++#ifndef _LIRC_CURL_POLL_H
++#define _LIRC_CURL_POLL_H
+ /***************************************************************************
+  *                                  _   _ ____  _
+  *  Project                     ___| | | |  _ \| |
+@@ -29,13 +29,9 @@
+ extern "C" {
+ #endif
+ 
+-#ifdef HAVE_SYS_POLL_H
+-#include <sys/poll.h>
+-#else
+ #include <poll.h>
+-#endif
+ 
+-int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
++int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
+ 
+ #ifdef __cplusplus
+ }
diff --git a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
rename to meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
index 17261921f..a9bcb760c 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
@@ -1,7 +1,7 @@
 require lirc.inc
 
 SRC_URI += " \
-    file://0001-lircrcd-Mark-local-inline-funtions-as-static.patch \
+    file://pollfd.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
@@ -11,8 +11,8 @@ SRC_URI += " \
 "
 #file://0001-Adaptation-for-STM-configuration.patch \
 #
-SRC_URI[md5sum] = "3afc84e79c0839823cc20e7a710dd06d"
-SRC_URI[sha256sum] = "4e3f948fcdee6dce009171143f0cb7cd7be48593dd58138db4101a41f651a1dd"
+SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
+SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab"
 
 SYSTEMD_PACKAGES = "lirc"
 SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service"
@@ -27,6 +27,7 @@ PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
 "
+CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 do_install_append() {
-- 
2.12.2


