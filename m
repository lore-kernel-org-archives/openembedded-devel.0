Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1043.1588155355142971419
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Apr 2020 03:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jTjks-0001jb-6m; Wed, 29 Apr 2020 13:15:51 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] lirc: upgrade 0.9.4d -> 0.10.1
Date: Wed, 29 Apr 2020 13:15:43 +0300
Message-Id: <20200429101543.19632-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=0.6
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade Linux Infrared Remote Control (LIRC) to the latest version
0.10.1. Remove redundant old patches. Apply a new patch from Arch
Linux FS#57792 that fixes build errors. Create tar.gz archive
(PYTHON_TARBALL) which LIRC needs for install-nodist_pkgdataDATA.
Replace path to python3 in scripts based on a similar approach
as in the recipe for blueman.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch |  40 -------
 .../lirc/lirc/fix_build_errors.patch          |  30 ++++++
 .../lirc/lirc/pollfd.patch                    | 101 ------------------
 .../lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb}   |  28 ++++-
 4 files changed, 53 insertions(+), 146 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/{lirc_0.9.4d.bb => lirc_0.10.1.bb} (74%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
deleted file mode 100644
index 0e38f7d8e..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 50a48a7bd8d65a165ce2aac4ba0c1e02bded04aa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Nov 2019 12:21:31 -0800
-Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
-
-time element is deprecated on new input_event structure in kernel's
-input.h [1]
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/devinput.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/plugins/devinput.c b/plugins/devinput.c
-index d4d733a..feb4a61 100644
---- a/plugins/devinput.c
-+++ b/plugins/devinput.c
-@@ -34,6 +34,11 @@
- #include <linux/uinput.h>
- #include <sys/stat.h>
- 
-+#ifndef input_event_sec
-+#define input_event_sec time.tv_sec
-+#define input_event_usec time.tv_usec
-+#endif
-+
- #ifndef EV_SYN
- /* previous name */
- #define EV_SYN EV_RST
-@@ -459,7 +464,7 @@ char* devinput_rec(struct ir_remote* remotes)
- 		return 0;
- 	}
- 
--	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.time.tv_sec, event.time.tv_usec, event.type,
-+	log_trace("time %ld.%06ld  type %d  code %d  value %d", event.input_event_sec, event.input_event_usec, event.type,
- 		  event.code, event.value);
- 
- 	value = (unsigned)event.value;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
new file mode 100644
index 000000000..41353dbbd
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/fix_build_errors.patch
@@ -0,0 +1,30 @@
+diff --git a/configure.ac b/configure.ac
+index 58347d8..8c7fca2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -77,15 +77,10 @@ AC_TYPE_UINT64_T
+ 
+ dnl AC_TYPE_GETGROUPS seems broken on recent MacOS, so:
+ AC_MSG_CHECKING([Figure out if getgrouplist() needs gid_t or int])
+-oldcflags="$CFLAGS"
+-export CFLAGS=-Werror
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include <unistd.h>
+-#include <grp.h>
+-  ]], [[
+-gid_t groups[32]; int ngroups; const char* user = "root";
+-getgrouplist(user, 1, groups, &ngroups);
+-  ]])],[
++int getgroups(int gidsetsize, gid_t grouplist[]);
++  ]], [[  ]])],[
+     AC_MSG_RESULT(gid_t)
+     AC_DEFINE(GETGROUPS_T,[gid_t])
+   ],[
+@@ -93,7 +88,6 @@ getgrouplist(user, 1, groups, &ngroups);
+     AC_DEFINE(GETGROUPS_T,[int])
+   ]
+ )
+-export CFLAGS="$oldcflags"
+ 
+ dnl Checks for library functions.
+ AC_CHECK_FUNCS(gethostname gettimeofday mkfifo select socket strdup \
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
deleted file mode 100644
index 4feea8034..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc/pollfd.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Index: lirc-0.9.4d/daemons/lircrcd.cpp
-===================================================================
---- lirc-0.9.4d.orig/daemons/lircrcd.cpp
-+++ lirc-0.9.4d/daemons/lircrcd.cpp
-@@ -29,10 +29,12 @@
- #include <sys/un.h>
- #include <sys/stat.h>
- #include <sys/types.h>
-+#include <poll.h>
- #include <syslog.h>
- 
- #include "lirc_client.h"
- #include "lirc/lirc_log.h"
-+#include "lirc/curl_poll.h"
- 
- #define MAX_CLIENTS 100
- #define WHITE_SPACE " \t"
-Index: lirc-0.9.4d/lib/curl_poll.c
-===================================================================
---- lirc-0.9.4d.orig/lib/curl_poll.c
-+++ lirc-0.9.4d/lib/curl_poll.c
-@@ -36,6 +36,7 @@
- #include <stdlib.h>
- #include <sys/time.h>
- #include <sys/types.h>
-+#include <sys/poll.h>
- 
- #include "lirc_log.h"
- #include "curl_poll.h"
-@@ -67,7 +68,7 @@ static const logchannel_t logchannel = L
- 
- #ifdef HAVE_POLL_FINE
- 
--int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
-+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
- {
- 	return poll(ufds, nfds, timeout_ms);
- }
-@@ -112,7 +113,7 @@ static int verify_sock(int s)
- }
- 
- 
--int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms)
-+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms)
- {
- 	struct timeval pending_tv;
- 	struct timeval* ptimeout;
-Index: lirc-0.9.4d/lib/curl_poll.h
-===================================================================
---- lirc-0.9.4d.orig/lib/curl_poll.h
-+++ lirc-0.9.4d/lib/curl_poll.h
-@@ -1,5 +1,5 @@
--#ifndef _POLL_H
--#define _POLL_H
-+#ifndef _LIB_CURL_POLL_H
-+#define _LIB_CURL_POLL_H
- /***************************************************************************
-  *                                  _   _ ____  _
-  *  Project                     ___| | | |  _ \| |
-@@ -29,13 +29,9 @@
- extern "C" {
- #endif
- 
--#ifdef HAVE_SYS_POLL_H
--#include <sys/poll.h>
--#else
- #include <poll.h>
--#endif
- 
--int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
-+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
- 
- #ifdef __cplusplus
- }
-Index: lirc-0.9.4d/lib/lirc/curl_poll.h
-===================================================================
---- lirc-0.9.4d.orig/lib/lirc/curl_poll.h
-+++ lirc-0.9.4d/lib/lirc/curl_poll.h
-@@ -1,5 +1,5 @@
--#ifndef _POLL_H
--#define _POLL_H
-+#ifndef _LIRC_CURL_POLL_H
-+#define _LIRC_CURL_POLL_H
- /***************************************************************************
-  *                                  _   _ ____  _
-  *  Project                     ___| | | |  _ \| |
-@@ -29,13 +29,9 @@
- extern "C" {
- #endif
- 
--#ifdef HAVE_SYS_POLL_H
--#include <sys/poll.h>
--#else
- #include <poll.h>
--#endif
- 
--int curl_poll(struct pollfd ufds[], unsigned int nfds, int timeout_ms);
-+int curl_poll(struct pollfd *ufds, unsigned int nfds, int timeout_ms);
- 
- #ifdef __cplusplus
- }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
similarity index 74%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
index f59969673..7ae122d56 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.9.4d.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.1.bb
@@ -6,13 +6,12 @@ DESCRIPTION_append_lirc-nslu2example = " This package contains a working config
 HOMEPAGE = "http://www.lirc.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml"
+DEPENDS = "libxslt-native alsa-lib libftdi libusb1 libusb-compat jack portaudio-v19 python3-pyyaml python3-setuptools-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
-    file://pollfd.patch \
-    file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
+    file://fix_build_errors.patch \
     file://lircd.service \
     file://lircd.init \
     file://lircexec.init \
@@ -20,8 +19,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/lirc/lirc-${PV}.tar.bz2 \
     file://lirc_options.conf \
     file://lirc.tmpfiles \
 "
-SRC_URI[md5sum] = "0d11679cbdd94a5a6da00a8e7231b4bf"
-SRC_URI[sha256sum] = "c68f18c35b489b865c0a741d119b136e8702191538cd3551b977a7af6c4e41ab"
+SRC_URI[md5sum] = "86c3f8e4efaba10571addb8313d1e040"
+SRC_URI[sha256sum] = "8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2"
 
 SYSTEMD_PACKAGES = "lirc lirc-exec"
 SYSTEMD_SERVICE_${PN} = "lircd.service lircmd.service lircd-setup.service lircd-uinput.service"
@@ -41,7 +40,26 @@ PACKAGECONFIG ?= " \
 CACHED_CONFIGUREVARS = "HAVE_WORKING_POLL=yes"
 
 #EXTRA_OEMAKE = 'SUBDIRS="lib daemons tools"'
+
+# Create PYTHON_TARBALL which LIRC needs for install-nodist_pkgdataDATA
+do_install_prepend() {
+    rm -rf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
+    mkdir ${WORKDIR}/${PN}-${PV}/python-pkg/dist/
+    tar --exclude='${WORKDIR}/${PN}-${PV}/python-pkg/*' -czf ${WORKDIR}/${PN}-${PV}/python-pkg/dist/${PN}-${PV}.tar.gz ${S}
+}
+
+# In code, path to python is a variable that is replaced with path to native version of it
+# during the configure stage, e.g ../recipe-sysroot-native/usr/bin/python3-native/python3.
+# Replace it with #!/usr/bin/env python3
 do_install_append() {
+    sed -i '1c#!/usr/bin/env python3' ${D}${bindir}/lirc-setup \
+                                      ${D}${PYTHON_SITEPACKAGES_DIR}/lirc-setup/lirc-setup \
+                                      ${D}${bindir}/irtext2udp \
+                                      ${D}${bindir}/lirc-init-db \
+                                      ${D}${bindir}/irdb-get \
+                                      ${D}${bindir}/pronto2lirc \
+                                      ${D}${sbindir}/lircd-setup
+
     install -m 0755 -d ${D}${sysconfdir}
     install -m 0755 -d ${D}${sysconfdir}/lirc
     install -m 0755 -d ${D}${systemd_unitdir}/system
-- 
2.17.1

