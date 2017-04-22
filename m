Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id D94AE77C22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Apr 2017 00:00:24 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 193so1042126itm.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Apr 2017 17:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aSEMl1Tsu2pLDMZmXtMMdaT/lJFRLuoRgcKArTmIbAg=;
	b=l/ayZ4wFUwWU9CyLxaY/MVNvm4SkzWxQUZO+Dg+iIhPFOKF2+Cv+1Tp9GZicVKPlTr
	CFvSlvdwtu+DdNJNKotEzMuYQuh/1LUZq3Z5rFeK+/vIrGesgwIGgJxSGSfPEKPqR72W
	F8U+rInoF8SZRAiYDf+B9U0CrsVF8s+in03dLMsDV2/F0bKEJJMuq/4UiTq18s+du0Xz
	Pbcg7//1/YWeTW7WURQomP/dlgHQt5oTsVjBbmdUhPnnwA97QeBquaLxiFzdVvZMO9Iq
	8jGFy8qelx/RilWvADdnuZtme9S8BLOQV8TJB2Tss0/UbJb1XITyRZ0xvkGeN5Car5zF
	Gz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aSEMl1Tsu2pLDMZmXtMMdaT/lJFRLuoRgcKArTmIbAg=;
	b=DTrePGRj7tb9YjEErcWoRerhtoIhhdcXCa1sWWQg5d3A3QLv2cqcF2dV4nk3DJCyzz
	ARZFWDGhejM+J8SzEpN8AxzGszoTSiW1HPjvaxhVS0BFUU4Yw68KxrRP7VuV9cj6vNU9
	zbpCUO6+wdXjcz//tH+TRWCvMdr3tZN8wXU3jBxdpb2/C6wy8zo4UJJJZ9QzxfjZI84e
	34f7IKoOlpsMs8Nn34W+KIfKKgx1mN190mc5CQTng/gjFgjuQ+HPsflXvCwP8SDUT9zf
	B8wp0x+31p9NhTeoQSTOF3PgaiwRe02AlzQgvgH5YH4yzqzDIGfkzM3RlgDGS6QY5WD5
	qxVg==
X-Gm-Message-State: AN3rC/6TtkiPDpqvMvD7o3EbWZh3OtkIZcfenWNz0i0sLloiACvYgcUQ
	7O4N9yQHnY2+FA==
X-Received: by 10.84.148.203 with SMTP id y11mr19100150plg.10.1492819226214;
	Fri, 21 Apr 2017 17:00:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c64sm17920377pfa.110.2017.04.21.17.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 17:00:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Apr 2017 17:00:15 -0700
Message-Id: <20170422000015.27420-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170422000015.27420-1-raj.khem@gmail.com>
References: <20170422000015.27420-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 2/2] lirc: update to 0.9.4d
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
X-List-Received-Date: Sat, 22 Apr 2017 00:00:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Merge lirc.inc
- Package extra systemd service files
- Correct perms for contrib/ dir
- Set security flags to not have pie flags

 meta-oe/recipes-connectivity/lirc/lirc.inc         |  13 ---
 ...crcd-Mark-local-inline-funtions-as-static.patch |  49 ----------
 .../recipes-connectivity/lirc/lirc/pollfd.patch    | 101 +++++++++++++++++++++
 .../lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb}         |  35 +++++--
 4 files changed, 126 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/lirc/lirc.inc
 delete mode 100644 meta-oe/recipes-connectivity/lirc/lirc/0001-lircrcd-Mark-local-inline-funtions-as-static.patch
 create mode 100644 meta-oe/recipes-connectivity/lirc/lirc/pollfd.patch
 rename meta-oe/recipes-connectivity/lirc/{lirc_0.9.2.bb => lirc_0.9.4d.bb} (60%)

diff --git a/meta-oe/recipes-connectivity/lirc/lirc.inc b/meta-oe/recipes-connectivity/lirc/lirc.inc
deleted file mode 100644
index 6ff8e0160..000000000
--- a/meta-oe/recipes-connectivity/lirc/lirc.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls."
-DESCRIPTION_append_lirc = " This package contains the lirc daemon, libraries and tools."
-DESCRIPTION_append_lirc-exec = " This package contains a daemon that runs programs on IR signals."
-DESCRIPTION_append_lirc-remotes = " This package contains some config files for remotes."
-DESCRIPTION_append_lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
-HOMEPAGE = "http://www.lirc.org"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-DEPENDS = "alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
-
-SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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
similarity index 60%
rename from meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
rename to meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
index 17261921f..b13163deb 100644
--- a/meta-oe/recipes-connectivity/lirc/lirc_0.9.2.bb
+++ b/meta-oe/recipes-connectivity/lirc/lirc_0.9.4d.bb
@@ -1,7 +1,18 @@
-require lirc.inc
+DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls."
+DESCRIPTION_append_lirc = " This package contains the lirc daemon, libraries and tools."
+DESCRIPTION_append_lirc-exec = " This package contains a daemon that runs programs on IR signals."
+DESCRIPTION_append_lirc-remotes = " This package contains some config files for remotes."
+DESCRIPTION_append_lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
+HOMEPAGE = "http://www.lirc.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19"
 
-SRC_URI += " \
-    file://0001-lircrcd-Mark-local-inline-funtions-as-static.patch \
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
+    file://pollfd.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
@@ -9,14 +20,14 @@ SRC_URI += " \
     file://lirc_options.conf \
     file://lirc.tmpfiles \
 "
-#file://0001-Adaptation-for-STM-configuration.patch \
-#
-SRC_URI[md5sum] = "3afc84e79c0839823cc20e7a710dd06d"
-SRC_URI[sha256sum] = "4e3f948fcdee6dce009171143f0cb7cd7be48593dd58138db4101a41f651a1dd"
+SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
+SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab"
 
-SYSTEMD_PACKAGES = "lirc"
-SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service"
+SYSTEMD_PACKAGES = "lirc lirc-exec"
+SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
+SYSTEMD_SERVICE_${PN}-exec = "irexec.service"
 SYSTEMD_AUTO_ENABLE_lirc = "enable"
+SYSTEMD_AUTO_ENABLE_lirc-exec = "enable"
 
 inherit autotools pkgconfig systemd python3native
 
@@ -27,6 +38,7 @@ PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' systemd', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' x11', '', d)} \
 "
+CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
 do_install_append() {
@@ -41,6 +53,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/lirc.tmpfiles ${D}${libdir}/tmpfiles.d/lirc.conf
     rm -rf ${D}${libdir}/lirc/plugins/*.la
     rmdir ${D}/var/run/lirc ${D}/var/run
+    chown -R root:root ${D}${datadir}/lirc/contrib
 }
 
 PACKAGES =+ "${PN}-contrib ${PN}-exec ${PN}-plugins ${PN}-python"
@@ -53,7 +66,7 @@ RRECOMMENDS_lirc = "${PN}-exec ${PN}-plugins"
 
 FILES_${PN}-plugins = "${libdir}/lirc/plugins/*.so ${datadir}/lirc/configs"
 FILES_${PN}-contrib = "${datadir}/lirc/contrib"
-FILES_${PN}-exec = "${bindir}/irexec ${sysconfdir}/lircexec"
+FILES_${PN}-exec = "${bindir}/irexec ${sysconfdir}/lircexec ${systemd_unitdir}/system/irexec.service"
 FILES_${PN} += "${systemd_unitdir}/system/lircexec.init"
 FILES_${PN} += "${systemd_unitdir}/system/lircd.service"
 FILES_${PN} += "${systemd_unitdir}/system/lircd.socket"
@@ -70,3 +83,5 @@ INITSCRIPT_PARAMS_lirc-exec = "defaults 21"
 pkg_postinst_${PN}_append() {
     if [ ! -c $D/dev/lirc -a ! -f /sbin/udevd ]; then mknod $D/dev/lirc c 61 0; fi
 }
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.12.2


