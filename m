Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 088106BD26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:22:25 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so6667513wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 00:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GLkcOJAN7wG+l+G/DlcF4YPO6fKbkrHFszItEKZtu7s=;
	b=WX1aK4xqjuJ3BAVWUdxpu0/bXTCUmXLHkWrw30U0dCtQJ09RpLZrmIzIdjTVcc21uG
	ZfGzde7Zw2EwlrZmeehqsdHQJrv2GpaI7fNhUAWrN3StdkN3KMJ6TP+VC0KP9KwMyYLp
	DrgH2gOEy5NRURm06oavmhHxVA0DsqMYnJ5u/zZJ2FXoPPnlQpbLA6b7ycbkNFOKtDq9
	4Kd9x0HpFoWmWJv5cvT6IKw2H6RaiRvF8O0M0G2iNY3j4k2MpUFLwfWGlhH3iY3zWvLI
	I1TvRwA0l62Lg+z6aWjZ9cDq0eDo/HljavyKGNC0hKZMcvt4C+HO497rekN2BVeVOW31
	QmqQ==
X-Gm-Message-State: ALoCoQkLijClXtk7o+rSxWWqs4RNcRBI07aQ3fUTVRcL5bq6vOGSmPfdLbo6zUd7UNOR7zHzRmHQ
X-Received: by 10.180.106.1 with SMTP id gq1mr33667068wib.45.1402989745975;
	Tue, 17 Jun 2014 00:22:25 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id f6sm18549858wiy.19.2014.06.17.00.22.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 00:22:25 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 09:22:17 +0200
Message-Id: <1402989737-32720-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-webserver][PATCH] apache2(-native): use pkg-config for pcre detection
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 07:22:26 -0000

Also fixup apache2-native recipe to use autotools and SEPB.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../recipes-httpd/apache2/apache2-native_2.4.9.bb  | 23 +++++-----
 .../recipes-httpd/apache2/apache2_2.4.9.bb         |  1 +
 ...nfigure-use-pkg-config-for-PCRE-detection.patch | 52 ++++++++++++++++++++++
 3 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
index aaa7e60..e50f2b8 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
@@ -6,9 +6,11 @@ DEPENDS = "expat-native pcre-native apr-native apr-util-native"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
-inherit native
+inherit autotools native
 
-SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2"
+SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
+           file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
+          "
 
 S = "${WORKDIR}/httpd-${PV}"
 
@@ -16,11 +18,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
 SRC_URI[md5sum] = "2ef4e65353497606b24fa9bb3e5a3c40"
 SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2847603"
 
-do_configure () {
-    ./configure --with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
-        --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
-        --prefix=${prefix} --datadir=${datadir}/apache2
-}
+EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
+                --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
+                --prefix=${prefix} --datadir=${datadir}/apache2 \
+               "
 
 do_install () {
     install -d ${D}${bindir} ${D}${libdir}
@@ -28,13 +29,15 @@ do_install () {
     install -m 755 support/apxs ${D}${bindir}/
     install -m 755 httpd ${D}${bindir}/
     install -d ${D}${datadir}/apache2/build
+    cp ${S}/build/*.mk ${D}${datadir}/apache2/build
     cp build/*.mk ${D}${datadir}/apache2/build
-    cp build/instdso.sh ${D}${datadir}/apache2/build
+    cp ${S}/build/instdso.sh ${D}${datadir}/apache2/build
 
     install -d ${D}${includedir}/apache2
+    cp ${S}/include/* ${D}${includedir}/apache2
     cp include/* ${D}${includedir}/apache2
-    cp os/unix/os.h ${D}${includedir}/apache2
-    cp os/unix/unixd.h ${D}${includedir}/apache2
+    cp ${S}/os/unix/os.h ${D}${includedir}/apache2
+    cp ${S}/os/unix/unixd.h ${D}${includedir}/apache2
 
     cp support/envvars-std ${D}${bindir}/envvars
     chmod 755 ${D}${bindir}/envvars
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
index 33e197a..4788110 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://apache-ssl-ltmain-rpath.patch \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://npn-patch-2.4.7.patch \
+           file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
            file://init \
            file://apache2-volatile.conf"
 
diff --git a/meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch
new file mode 100644
index 0000000..63096db
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -0,0 +1,52 @@
+From d8837756f2a48adcfe5d645c39cf163d96eac76c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Tue, 17 Jun 2014 09:10:57 +0200
+Subject: [PATCH] configure: use pkg-config for PCRE detection
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+Upstream-Status: pending
+---
+ configure.in | 27 +++++----------------------
+ 1 file changed, 5 insertions(+), 22 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 864d7c7..da4138e 100644
+--- a/configure.in
++++ b/configure.in
+@@ -215,28 +215,11 @@ fi
+ AC_ARG_WITH(pcre,
+ APACHE_HELP_STRING(--with-pcre=PATH,Use external PCRE library))
+ 
+-AC_PATH_PROG(PCRE_CONFIG, pcre-config, false)
+-if test -d "$with_pcre" && test -x "$with_pcre/bin/pcre-config"; then
+-   PCRE_CONFIG=$with_pcre/bin/pcre-config
+-elif test -x "$with_pcre"; then
+-   PCRE_CONFIG=$with_pcre
+-fi
+-
+-if test "$PCRE_CONFIG" != "false"; then
+-  if $PCRE_CONFIG --version >/dev/null 2>&1; then :; else
+-    AC_MSG_ERROR([Did not find pcre-config script at $PCRE_CONFIG])
+-  fi
+-  case `$PCRE_CONFIG --version` in
+-  [[1-5].*])
+-    AC_MSG_ERROR([Need at least pcre version 6.0])
+-    ;;
+-  esac
+-  AC_MSG_NOTICE([Using external PCRE library from $PCRE_CONFIG])
+-  APR_ADDTO(PCRE_INCLUDES, [`$PCRE_CONFIG --cflags`])
+-  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs`])
+-else
+-  AC_MSG_ERROR([pcre-config for libpcre not found. PCRE is required and available from http://pcre.org/])
+-fi
++PKG_CHECK_MODULES([PCRE], [libpcre], [
++  AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
++], [
++  AC_MSG_ERROR([$PCRE_PKG_ERRORS])
++])
+ APACHE_SUBST(PCRE_LIBS)
+ 
+ AC_MSG_NOTICE([])
+-- 
+1.9.3
+
-- 
1.9.3


