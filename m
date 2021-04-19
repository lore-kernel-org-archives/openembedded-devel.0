Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.176.1618846609244975174
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 08:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jS3ywDli;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1618846609;
  x=1650382609;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=58zSz+z+Oajs2/jVEKsZNKkWt7X8Q561KwjMqgiwEMQ=;
  b=jS3ywDliQE2N8LfhDHp0mtx2zsMSI2jYNTUtvVciZ4HgjA+rCIUz/FFq
   RS+g5oPiaboXAU4BYv7gFNM+IXLuWK3/ZAYTzItgy2mzCiZ71zfKuzGRp
   jILov/Hh/qgsho/fP4v3kvua7QqhitbaQDVfDXGPCRnliqYd2q2Ul9My8
   CHxAh2wJlkiR20u/0C5mvVTSlDwFycdPfOx9xC0riXXPD6Z7rywYfuPFm
   cJtxQNq+sKDk5M7RYoPF+HHjReB3xAkmg3hMZ82UQPA+/pFEdZrn4Kded
   yGYdK+SB9qLBbOfTeg/bYjBTX7dczbWv/pw/bV+tYMJ6Uk2k5Jbso7I1o
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: Merge .bb and .inc
Date: Mon, 19 Apr 2021 17:36:42 +0200
Message-ID: <20210419153642.8427-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is only one version of the recipe, and a number of URLs were
unnecessarily duplicated in the .inc file and the .bb file.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-support/syslog-ng/syslog-ng.inc   | 138 ------------------
 .../syslog-ng/syslog-ng_3.31.2.bb             | 137 ++++++++++++++++-
 2 files changed, 132 insertions(+), 143 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng.inc

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
deleted file mode 100644
index 80c509973..000000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ /dev/null
@@ -1,138 +0,0 @@
-SUMMARY = "Alternative system logger daemon"
-DESCRIPTION = "syslog-ng, as the name shows, is a syslogd replacement, \
-but with new functionality for the new generation. The original syslogd \
-allows messages only to be sorted based on priority/facility pairs; \
-syslog-ng adds the possibility to filter based on message contents using \
-regular expressions. The new configuration scheme is intuitive and powerful. \
-Forwarding logs over TCP and remembering all forwarding hops makes it \
-ideal for firewalled environments. \
-"
-HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
-
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=189c3826d32deaf83ad8d0d538a10023"
-
-# util-linux added to get libuuid
-DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
-
-# We expect the recipe to add anything specific for that version to these defaults.
-#
-SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
-           file://syslog-ng.conf.systemd \
-           file://syslog-ng.conf.sysvinit \
-           file://initscript \
-           file://volatiles.03_syslog-ng \
-"
-
-UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
-
-inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
-
-EXTRA_OECONF = " \
-    --enable-dynamic-linking \
-    --disable-sub-streams \
-    --disable-pacct \
-    --localstatedir=${localstatedir}/lib/${BPN} \
-    --sysconfdir=${sysconfdir}/${BPN} \
-    --with-module-dir=${libdir}/${BPN} \
-    --with-sysroot=${STAGING_DIR_HOST} \
-    --without-mongoc --disable-mongodb \
-    --with-librabbitmq-client=no \
-    --disable-python \
-    --disable-java --disable-java-modules \
-    --with-pidfile-dir=${localstatedir}/run/${BPN} \
-"
-
-PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
-"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
-PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
-PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
-PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
-PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
-PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
-PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
-PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
-PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
-PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
-
-do_configure_prepend() {
-	olddir=$(pwd)
-	cd ${AUTOTOOLS_SCRIPT_PATH}
-
-	ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
-
-	cd $olddir
-}
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/${BPN}
-    install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
-
-    install -d ${D}${sysconfdir}/default/volatiles/
-    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
-    install -d ${D}${sysconfdir}/tmpfiles.d/
-    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
-
-    install -d ${D}${localstatedir}/lib/${BPN}
-    # Remove /var/run as it is created on startup
-    rm -rf ${D}${localstatedir}/run
-
-    # support for systemd
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
-
-        install -d ${D}${systemd_unitdir}/system/
-        install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
-        install -m 644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
-
-        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
-        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
-        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
-
-        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
-        ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
-    else
-        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
-    fi
-
-    oe_multilib_header syslog-ng/syslog-ng-config.h
-}
-
-FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
-RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
-
-FILES_${PN}-jconf += " \
-${datadir}/${BPN}/include/scl/cim \
-${datadir}/${BPN}/include/scl/elasticsearch \
-${datadir}/${BPN}/include/scl/ewmm \
-${datadir}/${BPN}/include/scl/graylog2 \
-${datadir}/${BPN}/include/scl/loggly \
-${datadir}/${BPN}/include/scl/logmatic \
-"
-
-# This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
-PACKAGES =+ "${PN}-jconf ${PN}-libs ${PN}-libs-dev"
-RPROVIDES_${PN}-dbg += "${PN}-libs-dbg"
-FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
-FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
-FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
-FILES_${PN} += "${systemd_unitdir}/system/*.service"
-INSANE_SKIP_${PN}-libs = "dev-so"
-RDEPENDS_${PN} += "${PN}-libs"
-
-CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
-
-RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
-RCONFLICTS_${PN}-libs = "busybox-syslog sysklogd rsyslog"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${BPN}@.service"
-
-INITSCRIPT_NAME = "syslog"
-INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
index 5d2b7f77e..ce1c41e35 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.31.2.bb
@@ -1,8 +1,21 @@
-require syslog-ng.inc
+SUMMARY = "Alternative system logger daemon"
+DESCRIPTION = "syslog-ng, as the name shows, is a syslogd replacement, \
+but with new functionality for the new generation. The original syslogd \
+allows messages only to be sorted based on priority/facility pairs; \
+syslog-ng adds the possibility to filter based on message contents using \
+regular expressions. The new configuration scheme is intuitive and powerful. \
+Forwarding logs over TCP and remembering all forwarding hops makes it \
+ideal for firewalled environments. \
+"
+HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
 
-# We only want to add stuff we need to the defaults provided in syslog-ng.inc.
-#
-SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=189c3826d32deaf83ad8d0d538a10023"
+
+# util-linux added to get libuuid
+DEPENDS = "libpcre flex glib-2.0 openssl util-linux bison-native"
+
+SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
            file://syslog-ng.conf.systemd \
            file://syslog-ng.conf.sysvinit \
            file://initscript \
@@ -11,6 +24,120 @@ SRC_URI += "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.t
            file://syslog-ng.service-the-syslog-ng-service.patch \
            file://0002-scl-fix-wrong-ownership-during-installation.patch \
            file://0005-.py-s-python-python3-exclude-tests.patch \
-           "
+"
+
 SRC_URI[md5sum] = "69ef4dc5628d5e603e9e4a1b937592f8"
 SRC_URI[sha256sum] = "2eeb8e0dbbcb556fdd4e50bc9f29bc8c66c9b153026f87caa7567bd3139c186a"
+
+UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
+
+inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
+
+EXTRA_OECONF = " \
+    --enable-dynamic-linking \
+    --disable-sub-streams \
+    --disable-pacct \
+    --localstatedir=${localstatedir}/lib/${BPN} \
+    --sysconfdir=${sysconfdir}/${BPN} \
+    --with-module-dir=${libdir}/${BPN} \
+    --with-sysroot=${STAGING_DIR_HOST} \
+    --without-mongoc --disable-mongodb \
+    --with-librabbitmq-client=no \
+    --disable-python \
+    --disable-java --disable-java-modules \
+    --with-pidfile-dir=${localstatedir}/run/${BPN} \
+"
+
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} \
+"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
+PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
+PACKAGECONFIG[spoof-source] = "--enable-spoof-source --with-libnet=${STAGING_BINDIR_CROSS},--disable-spoof-source,libnet,"
+PACKAGECONFIG[http] = "--enable-http,--disable-http,curl,"
+PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
+PACKAGECONFIG[json] = "--enable-json,--disable-json,json-c,"
+PACKAGECONFIG[tcp-wrapper] = "--enable-tcp-wrapper,--disable-tcp-wrapper,tcp-wrappers,"
+PACKAGECONFIG[geoip] = "--enable-geoip,--disable-geoip,geoip,"
+PACKAGECONFIG[native] = "--enable-native,--disable-native,,"
+
+do_configure_prepend() {
+	olddir=$(pwd)
+	cd ${AUTOTOOLS_SCRIPT_PATH}
+
+	ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} -I ${S}/m4 ${ACLOCALEXTRAPATH} || die "extra autoreconf execution failed."
+
+	cd $olddir
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/${BPN}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
+
+    install -d ${D}${sysconfdir}/default/volatiles/
+    install -m 644 ${WORKDIR}/volatiles.03_syslog-ng ${D}${sysconfdir}/default/volatiles/03_syslog-ng
+    install -d ${D}${sysconfdir}/tmpfiles.d/
+    install -m 644 ${WORKDIR}/syslog-ng-tmp.conf ${D}${sysconfdir}/tmpfiles.d/syslog-ng.conf
+
+    install -d ${D}${localstatedir}/lib/${BPN}
+    # Remove /var/run as it is created on startup
+    rm -rf ${D}${localstatedir}/run
+
+    # support for systemd
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
+
+        install -d ${D}${systemd_unitdir}/system/
+        install -m 644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
+        install -m 644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
+        sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
+        sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
+
+        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
+        ln -sf ../${BPN}@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/${BPN}@default.service
+    else
+        install -m 644 ${WORKDIR}/syslog-ng.conf.sysvinit ${D}${sysconfdir}/${BPN}/${BPN}.conf
+    fi
+
+    oe_multilib_header syslog-ng/syslog-ng-config.h
+}
+
+FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools ${systemd_unitdir}/system/multi-user.target.wants/*"
+RDEPENDS_${PN} += "gawk ${@bb.utils.contains('PACKAGECONFIG','json','${PN}-jconf','',d)}"
+
+FILES_${PN}-jconf += " \
+${datadir}/${BPN}/include/scl/cim \
+${datadir}/${BPN}/include/scl/elasticsearch \
+${datadir}/${BPN}/include/scl/ewmm \
+${datadir}/${BPN}/include/scl/graylog2 \
+${datadir}/${BPN}/include/scl/loggly \
+${datadir}/${BPN}/include/scl/logmatic \
+"
+
+# This overcomes the syslog-ng rdepends on syslog-ng-dev QA Error
+PACKAGES =+ "${PN}-jconf ${PN}-libs ${PN}-libs-dev"
+RPROVIDES_${PN}-dbg += "${PN}-libs-dbg"
+FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
+FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/libtest/*.a"
+FILES_${PN} += "${systemd_unitdir}/system/*.service"
+INSANE_SKIP_${PN}-libs = "dev-so"
+RDEPENDS_${PN} += "${PN}-libs"
+
+CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
+
+RCONFLICTS_${PN} = "busybox-syslog sysklogd rsyslog"
+RCONFLICTS_${PN}-libs = "busybox-syslog sysklogd rsyslog"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${BPN}@.service"
+
+INITSCRIPT_NAME = "syslog"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
