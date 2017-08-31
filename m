Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3D56B78468
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 23:27:01 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id g13so3101530pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 16:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7KAC/aOqJRgAbVuPQ0OkLKMrVvu77g8N/fvDZoDEFUY=;
	b=D51zFWxLxPZ9Cx48hZSZcjpxyxlrn4GOzIjjXIisrnlUsU1XEF6kY7jhzBJ52dPE9v
	hdm9jK77p2MqvFmpOY1TvrlBReTCgazgvEiEfe6Yd6i3A+9EuRwzq4pzEPj2efUX8RLP
	iKEnxVUVJtxSqAWG64q7I7ZqCYjdJ6TTp+9Jll3nykivhA8TBl070H7z5VzPbe9TMBRd
	GSgPix/zsjGj3Nx7cygO+V/vwAQ9wgv1lpJ6Rxzp9BPB5Q4OWy7m9wLRq/9OxGfnEkoC
	frcyuqBiySnGlUAmTcdD9X0UoL6Mys4YA2RQ/GBfXzkE2zZaXhJdndbCouF2xi/c/1MT
	5bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7KAC/aOqJRgAbVuPQ0OkLKMrVvu77g8N/fvDZoDEFUY=;
	b=CVDmJzwEL1ouVxxRlFueBUeYCmw+uO5dGqW85zn5l/bfjYdMpj8h7hNIzJ9+06w5eT
	rh4zeeNVdGZWpuo9xILfCsO2st6e2O1JEQjzr3+xd0YYsLbRm+l09+vpDpmT/tHmizuq
	galq8VhzERrcSpZIarv01Die6cJRTxABOqKHmREBLSlRy3eetBFRraxpRJrQL6eWRN8u
	KUkSg4oRB2bwRHi3o3j6A5xVxXOQiaDRcwzlcTdbi2KlOwyGTbdB2x7mprCpK69cR048
	SpG0uPh/olNyI1sdDZmsDEgDNeZUuBmH/4ug4jK3r7gZCx8jJSiGTui0Mp1wyHOgyRs8
	iKYw==
X-Gm-Message-State: AHPjjUipWWb9et3ugot2TxEYEwGeaflPPZBtgM28mu+LZnEFYkFE3nbC
	f50n2HgPxBy6hjW9
X-Google-Smtp-Source: ADKCNb5qzx1ZtP4kP3fOvWF0QlmgeU8uIegeAIK/cnu+Ofr4DWRshEaMGzTd8y0TwTsNoLjwUSgmFQ==
X-Received: by 10.98.204.27 with SMTP id a27mr148068pfg.58.1504222022965;
	Thu, 31 Aug 2017 16:27:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id 16sm888569pge.33.2017.08.31.16.27.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 16:27:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 16:26:43 -0700
Message-Id: <20170831232645.6125-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831232645.6125-1-raj.khem@gmail.com>
References: <20170831232645.6125-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 2/4] ntop: Fix build with musl
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
X-List-Received-Date: Thu, 31 Aug 2017 23:27:02 -0000

move away from .inc file, when its included in single recipe
helps with devtool workflow too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ntop/ntop.inc      | 131 --------------------
 .../ntop/ntop/0001-nDPI-Include-sys-types.h.patch  |  26 ++++
 .../recipes-support/ntop/ntop/support-arm64.patch  |  28 -----
 meta-networking/recipes-support/ntop/ntop_5.0.1.bb | 135 ++++++++++++++++++++-
 4 files changed, 160 insertions(+), 160 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntop/ntop.inc
 create mode 100644 meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
 delete mode 100644 meta-networking/recipes-support/ntop/ntop/support-arm64.patch

diff --git a/meta-networking/recipes-support/ntop/ntop.inc b/meta-networking/recipes-support/ntop/ntop.inc
deleted file mode 100644
index b96433425..000000000
--- a/meta-networking/recipes-support/ntop/ntop.inc
+++ /dev/null
@@ -1,131 +0,0 @@
-SUMMARY = "ntop is network top"
-DESCRIPTION = "ntop is a network traffic probe that shows the network usage, \
-similar to what the popular top Unix command does."
-
-SECTION = "console/network"
-
-LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE-OpenSSL.txt;md5=a409f902e447ddd889cffa0c70e7c7c2 \
-                   "
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
-           file://ntop_configure_in.patch \
-           file://ntop_init.patch \
-           file://ntop_webInterface.patch \
-           file://ntop_configure_in_net_snmp_config_exist.patch \
-           file://ntop.service \
-           file://use-static-inline.patch \
-           file://support-arm64.patch \
-          "
-
-inherit autotools-brokensep useradd pythonnative pkgconfig systemd
-
-DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
-
-PACKAGECONFIG ??= "openssl snmp plugins"
-PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
-PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config, \
---disable-snmp,net-snmp,"
-PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
-
-EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
-
-do_configure() {
-    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
-    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
-    cp 3rd_party/* ./
-
-    # config nDPI
-    cd nDPI
-    ./configure ${CONFIGUREOPTS} --with-pic
-    cd ..
-
-    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:' ${S}/configure.in
-
-    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
-    sed -i \
-        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
-        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
-        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":' \
-        ${S}/configure.in
-
-    # replace the DISTRO RELEASE in configure.in which are host's
-    # with our release, although those doesn't affect functionality
-    sed -i -e \
-        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
-        ${S}/configure.in
-
-    # osName in original configure.in should be ${TARGET_SYS}
-    # which will show in ntop's "show configuration"
-    sed -i -e \
-        's:^osName=.*:osName=${TARGET_SYS}:' \
-        ${S}/configure.in
-
-    # rename configureextra to configureextra_rename to avoid
-    # configure.in to guess host OS and pull in more configure, non needed
-    # which will cause some cross-compiling failure on specific host
-    # e.g. SUSE(SLED...)
-    test ! -f configureextra || mv -f configureextra configureextra_rename
-
-    # make sure configure finds python includdirs/libs with these envs
-    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR}
-
-    autotools_do_configure
-}
-
-do_compile_prepend() {
-    cd nDPI
-    oe_runmake
-    cd ..
-}
-
-do_install_append() {
-    # remove the empty dirs
-    rm -rf ${D}${libdir}/plugins
-
-    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
-        ${D}${sysconfdir}/init.d/ntop
-    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
-        ${D}${sysconfdir}/ntop.conf
-
-    # change ntop dir in ntop.conf
-    # don't use the -P as the ntop.init didn't support it
-    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path /var/lib/ntop:" \
-        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
-        ${D}${sysconfdir}/ntop.conf
-
-    # For systemd
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0755 ${S}/packages/RedHat/ntop.init ${D}${libexecdir}/ntop-helper
-        install -D -m 0644 ${WORKDIR}/ntop.service ${D}${systemd_system_unitdir}/ntop.service
-        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
-            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-            ${D}${systemd_system_unitdir}/ntop.service
-    fi
-
-    # Fix host-user-contaminated issue
-    chown -R root:root ${D}
-
-    chown -R ntop.ntop ${D}${datadir}/ntop
-    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
-}
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
--s /usr/sbin/nologin -c 'ntop' ntop"
-GROUPADD_PARAM_${PN} = "-r ntop"
-
-SYSTEMD_SERVICE_${PN} = "ntop.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
-                      ${libdir}/libntopreport-*.so ${libdir}/lib*-${PV}.so"
-FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
-                   ${libdir}/libntopreport.so \
-                   ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin.so \
-                   ${libdir}/librrdPlugin.so \
-                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
-
diff --git a/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
new file mode 100644
index 000000000..81ffeec21
--- /dev/null
+++ b/meta-networking/recipes-support/ntop/ntop/0001-nDPI-Include-sys-types.h.patch
@@ -0,0 +1,26 @@
+From 6543f3e2d5fe214e2fc6c050289bf1ae73b18724 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 13:56:24 -0700
+Subject: [PATCH] nDPI: Include sys/types.h
+
+Needed for uint_t types
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ nDPI/src/include/ipq_api.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: ntop-5.0.1/nDPI/src/include/ipq_api.h
+===================================================================
+--- ntop-5.0.1.orig/nDPI/src/include/ipq_api.h
++++ ntop-5.0.1/nDPI/src/include/ipq_api.h
+@@ -24,6 +24,7 @@
+ #ifndef __IPOQUE_API_INCLUDE_FILE__
+ #define __IPOQUE_API_INCLUDE_FILE__
+ 
++#include <sys/types.h>
+ 
+ #if defined(HAVE_NTOP) && defined(WIN32)
+ #include <winsock2.h>
diff --git a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch b/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
deleted file mode 100644
index 0b1e8afbc..000000000
--- a/meta-networking/recipes-support/ntop/ntop/support-arm64.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Add support for arm64
-
-Upstream-Status: Inappropriate [no longer maintained]
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-
-diff --git a/nDPI/config.sub.old b/nDPI/config.sub
-index c2d1257..e4347ac 100755
---- a/nDPI/config.sub.old
-+++ b/nDPI/config.sub
-@@ -249,7 +249,7 @@ case $basic_machine in
- 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
- 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
- 	| am33_2.0 \
--	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 \
-+	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr | avr32 | aarch64 \
- 	| bfin \
- 	| c4x | clipper \
- 	| d10v | d30v | dlx | dsp16xx \
-@@ -331,7 +331,7 @@ case $basic_machine in
- 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
- 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
- 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
--	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
-+	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* | aarch64-* \
- 	| avr-* | avr32-* \
- 	| bfin-* | bs2000-* \
- 	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
diff --git a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
index 77b5e436f..298fbec61 100644
--- a/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
+++ b/meta-networking/recipes-support/ntop/ntop_5.0.1.bb
@@ -1,4 +1,137 @@
-include ntop.inc
+SUMMARY = "ntop is network top"
+DESCRIPTION = "ntop is a network traffic probe that shows the network usage, \
+similar to what the popular top Unix command does."
 
+SECTION = "console/network"
+
+LICENSE = "GPLv2+ & GPLv3 & OpenSSL"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LICENSE-OpenSSL.txt;md5=a409f902e447ddd889cffa0c70e7c7c2 \
+                   "
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ntop/ntop-${PV}.tar.gz \
+           file://ntop_configure_in.patch \
+           file://ntop_init.patch \
+           file://ntop_webInterface.patch \
+           file://ntop_configure_in_net_snmp_config_exist.patch \
+           file://ntop.service \
+           file://use-static-inline.patch \
+           file://0001-nDPI-Include-sys-types.h.patch \
+          "
 SRC_URI[md5sum] = "01710b6925a8a5ffe1a41b8b512ebd69"
 SRC_URI[sha256sum] = "7e8e84cb14d2173beaca4d4cb991a14d84a4bef84ec37b2276bc363f45c52ef8"
+
+inherit autotools-brokensep useradd pythonnative pkgconfig systemd
+
+DEPENDS = "geoip rrdtool python zlib libpcap gdbm"
+
+PACKAGECONFIG ??= "openssl snmp plugins"
+PACKAGECONFIG[openssl] = "--with-ssl, --without-ssl, openssl, openssl"
+PACKAGECONFIG[snmp] = "--enable-snmp=yes NETSNMP=${STAGING_BINDIR_CROSS}/net-snmp-config, \
+--disable-snmp,net-snmp,"
+PACKAGECONFIG[plugins] = "--enable-plugins=yes, --disable-plugins, ,"
+
+EXTRA_OECONF += "ac_cv_file_aclocal_m4=yes ac_cv_file_depcomp=no"
+
+do_configure() {
+    cp ${STAGING_DATADIR_NATIVE}/aclocal/libtool.m4 libtool.m4.in
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/nDPI
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/nDPI
+    cat acinclude.m4.in acinclude.m4.ntop libtool.m4.in > acinclude.m4
+    cp 3rd_party/* ./
+
+    # config nDPI
+    cd nDPI
+    ./configure ${CONFIGUREOPTS} --with-pic
+    cd ..
+
+    sed -i -e 's:^CFG_DBFILE_DIR=$localstatedir/ntop:CFG_DBFILE_DIR=$localstatedir/lib/ntop:' ${S}/configure.in
+
+    # fix the CFLAGS, CPPFLAGS, LDFLAGS, remove the host include
+    sed -i \
+        -e 's:\(^CFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
+        -e 's:\(^CPPFLAGS="\$.*\) -I/usr/local/include -I/opt/local/include":\1":' \
+        -e 's:\(^LDFLAGS="\$.*\) -L/usr/local/lib -L/opt/local/lib":\1":' \
+        ${S}/configure.in
+
+    # replace the DISTRO RELEASE in configure.in which are host's
+    # with our release, although those doesn't affect functionality
+    sed -i -e \
+        '/DEFINEOS="LINUX"/{N;s/DISTRO=.*/DISTRO="${DISTRO}"/;N;s/RELEASE=.*/RELEASE="${DISTRO_VERSION}"/;}' \
+        ${S}/configure.in
+
+    # osName in original configure.in should be ${TARGET_SYS}
+    # which will show in ntop's "show configuration"
+    sed -i -e \
+        's:^osName=.*:osName=${TARGET_SYS}:' \
+        ${S}/configure.in
+
+    # rename configureextra to configureextra_rename to avoid
+    # configure.in to guess host OS and pull in more configure, non needed
+    # which will cause some cross-compiling failure on specific host
+    # e.g. SUSE(SLED...)
+    test ! -f configureextra || mv -f configureextra configureextra_rename
+
+    # make sure configure finds python includdirs/libs with these envs
+    export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR}
+
+    autotools_do_configure
+}
+
+do_compile_prepend() {
+    cd nDPI
+    oe_runmake
+    cd ..
+}
+
+do_install_append() {
+    # remove the empty dirs
+    rm -rf ${D}${libdir}/plugins
+
+    install -D -m 0755 ${S}/packages/RedHat/ntop.init \
+        ${D}${sysconfdir}/init.d/ntop
+    install -D -m 0644 ${S}/packages/RedHat/ntop.conf.sample \
+        ${D}${sysconfdir}/ntop.conf
+
+    # change ntop dir in ntop.conf
+    # don't use the -P as the ntop.init didn't support it
+    sed -i -e "s:^--db-file-path /usr/share/ntop:--db-file-path /var/lib/ntop:" \
+        -e "s:^#? -P /var/ntop:#? -P /var/lib/ntop:" \
+        ${D}${sysconfdir}/ntop.conf
+
+    # For systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0755 ${S}/packages/RedHat/ntop.init ${D}${libexecdir}/ntop-helper
+        install -D -m 0644 ${WORKDIR}/ntop.service ${D}${systemd_system_unitdir}/ntop.service
+        sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
+            -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_system_unitdir}/ntop.service
+    fi
+
+    # Fix host-user-contaminated issue
+    chown -R root:root ${D}
+
+    chown -R ntop.ntop ${D}${datadir}/ntop
+    chown -R ntop:ntop ${D}${localstatedir}/lib/ntop
+}
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "-M -g ntop -r -d ${localstatedir}/lib/ntop \
+-s /usr/sbin/nologin -c 'ntop' ntop"
+GROUPADD_PARAM_${PN} = "-r ntop"
+
+SYSTEMD_SERVICE_${PN} = "ntop.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN}_append = "${libdir}/ntop/plugins ${libdir}/libntop-*.so \
+                      ${libdir}/libntopreport-*.so ${libdir}/lib*-${PV}.so"
+FILES_${PN}-dev = "${includedir} ${libdir}/libntop.so \
+                   ${libdir}/libntopreport.so \
+                   ${libdir}/libnetflowPlugin.so ${libdir}/libsflowPlugin.so \
+                   ${libdir}/librrdPlugin.so \
+                   ${libdir}/*.a ${libdir}/libntopreport.a ${libdir}/*.la"
+
-- 
2.14.1


