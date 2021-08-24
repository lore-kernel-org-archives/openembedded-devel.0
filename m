Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.4450.1629836813578238141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Aug 2021 13:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=KKOgwb57;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629836813;
  x=1661372813;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=n/0L6j+nSWOg5Qr6ZvA5en26JP4JnKk0FIB6WeUxKVM=;
  b=KKOgwb57cBXuuygX1lEXCK1XwUq6fN5WB2hzlrquD+tQdrmG0/Xrkq6C
   NLDd1Kmc1FMQsNSVFU3Z9igJ41GLU/+WSyCWlSbcYA4Y0KvOUe0v+/5Oi
   jpRAOsTk6umXphzAtCpu84sYE5Zqjd7X0HrRMz2w+Cv2yDqprDY83Lfwk
   fadRKKMtYpySkUAAP+HTe0IHaMQbqaImhEO4o+eAQ0JqBM6TMF8H35+ZQ
   qxNxfS+4D/tR2GfkQsHwHom09oPDLVoAM+ESIoMWCnncsnJ0IFE2VuN4F
   6K9u9d6cMfrgIGQ8KcxsXmEp0wOlcZlumdpzRLsawynrOtvDMurI+qdNh
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] gpsd: Let scons install the udev and systemd files
Date: Tue, 24 Aug 2021 22:26:47 +0200
Message-ID: <20210824202648.22554-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With the update to 3.23 (commit 87f3070f), the recipe was changed to
incorrectly install the gpsd.rules.in file instead of gpsd.rules. It
also missed that a new template string (@RUNDIR@) was introduced in the
systemd files, making them unusable.

Instead of trying to keep up with upstream changes, let scons do the job
and install the udev and systemd files by using the "udev-install"
production instead of "install".

In addition to the correct files being installed,
"/etc/udev/rules.d/gpsd.rules" is now "/lib/udev/rules.d/25-gpsd.rules".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb | 45 ++++++++------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
index 1d031ee95..350eaaf12 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.bb
@@ -35,11 +35,13 @@ EXTRA_OESCONS = " \
     nostrip='true' \
     systemd='${SYSTEMD_OESCONS}' \
     libdir='${libdir}' \
+    udevdir='${nonarch_base_libdir}/udev' \
+    unitdir='${systemd_system_unitdir}' \
     manbuild='false' \
     LINK='${CC}' \
     ${PACKAGECONFIG_CONFARGS} \
 "
-# this cannot be used, because then chrpath is not found and only static lib is built
+# This cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
 
 do_compile:prepend() {
@@ -58,34 +60,24 @@ do_install() {
     export LINKFLAGS="${LDFLAGS}"
 
     export DESTDIR="${D}"
-    # prefix is used for RPATH and DESTDIR/prefix for instalation
-    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} python_libdir=${libdir} install ${EXTRA_OESCONS} || \
+    # prefix is used for RPATH and DESTDIR/prefix for installation
+    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} python_libdir=${libdir} udev-install ${EXTRA_OESCONS} || \
       bbfatal "scons install execution failed."
 }
 
 do_install:append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gpsd.init ${D}/${sysconfdir}/init.d/gpsd
-    install -d ${D}/${sysconfdir}/default
-    install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}/${sysconfdir}/default/gpsd.default
-
-    #support for udev
-    install -d ${D}/${sysconfdir}/udev/rules.d
-    install -m 0644 ${S}/gpsd.rules.in ${D}/${sysconfdir}/udev/rules.d/
-    install -d ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-
-    #support for python
-    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${BPN}.service.in ${D}${systemd_unitdir}/system/${BPN}.service
-    sed -i -e 's,@SBINDIR@,/usr/sbin,g' ${D}${systemd_unitdir}/system/${BPN}.service
-    install -m 0644 ${S}/systemd/${BPN}ctl@.service.in ${D}${systemd_unitdir}/system/${BPN}ctl@.service
-    sed -i -e 's,@SBINDIR@,/usr/sbin,g' ${D}${systemd_unitdir}/system/${BPN}ctl@.service
-    install -m 0644 ${S}/systemd/${BPN}.socket.in ${D}${systemd_unitdir}/system/${BPN}.socket
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/gpsd.init ${D}${sysconfdir}/init.d/gpsd
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 ${S}/packaging/deb/etc_default_gpsd ${D}${sysconfdir}/default/gpsd.default
+
+    # Support for udev
+    install -d ${D}${nonarch_base_libdir}/udev
+    install -m 0755 ${S}/gpsd.hotplug ${D}${nonarch_base_libdir}/udev
+
+    # Support for python
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}/gps
+    install -m 755 ${S}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
 }
 
 PACKAGES =+ "libgps libgpsd python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
@@ -99,7 +91,7 @@ RDEPENDS:${PN} = "gpsd-gpsctl"
 RRECOMMENDS:${PN} = "gpsd-conf gpsd-udev gpsd-machine-conf"
 
 SUMMARY:gpsd-udev = "udev relevant files to use gpsd hotplugging"
-FILES:gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
+FILES:gpsd-udev = "${nonarch_base_libdir}/udev"
 RDEPENDS:gpsd-udev += "udev gpsd-conf"
 
 SUMMARY:libgpsd = "C service library used for communicating with gpsd"
@@ -135,7 +127,6 @@ RREPLACES:${PN} += "${PN}-systemd"
 RCONFLICTS:${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE:${PN} = "${BPN}.socket ${BPN}ctl@.service"
 
-
 ALTERNATIVE:${PN} = "gpsd-defaults"
 ALTERNATIVE_LINK_NAME[gpsd-defaults] = "${sysconfdir}/default/gpsd"
 ALTERNATIVE_TARGET[gpsd-defaults] = "${sysconfdir}/default/gpsd.default"
