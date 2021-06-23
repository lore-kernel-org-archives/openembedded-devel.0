Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.10332.1624466291672334704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 09:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=m2AwheSz;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624466291;
  x=1656002291;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JKVW0oxAANlV0S3pBXDfzz1ZDyUoMvTE2vFAjI7jhgE=;
  b=m2AwheSzco8UMtMJ2+a7OLkCTFNHYYpaSGaDpmbBzCw+6HeOdtnVKAxc
   9m/GAwZKW+TYdwRvStKJmGQE8YPDvUbYfSt677AXZ1oofpRj/UlaCmtYk
   s/axy0gdvbETmQN+Wzmj5UuqAo2TvqwCJOZaKMEeL4qTrPwFjNeyI1jqI
   z2tBjPn+izMSxawg1SRlItEynCQbhgk6rvjnx62+Zmh9SVhUFHMsOvMqU
   xGmLP0oXBfatYeXrR0dfPkxaL+DAiS/OZaJTMI0ZGtWM1BExAokij/dg/
   Mz7+uS3m5y3t6/Vly31AMNhw43h+hjgs4x6gW+mPVFzJDEpZy9JlaUgP3
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][master][PATCH 1/2] net-snmp: A little clean up
Date: Wed, 23 Jun 2021 18:38:04 +0200
Message-ID: <20210623163805.20459-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Remove the explicit dependency on libnl as the libnl PACKAGECONFIG
  depends on it as necessary.
* Add a PACKAGECONFIG for systemd to replace modifying EXTRA_OECONF
  directly.
* Sort the PACKAGECONFIGs.
* Some whitespace clean up.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../net-snmp/net-snmp_5.9.1.bb                | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index 1d48a8598..c96ada80d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD & MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
-DEPENDS = "openssl libnl pciutils"
+DEPENDS = "openssl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://init \
@@ -41,24 +41,23 @@ CCACHE = ""
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} des smux"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} des smux"
+PACKAGECONFIG[des] = "--enable-des, --disable-des"
 PACKAGECONFIG[elfutils] = "--with-elf, --without-elf, elfutils"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
 PACKAGECONFIG[libnl] = "--with-nl, --without-nl, libnl"
-
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
-
-PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no,\
-                       perl,"
-PACKAGECONFIG[des] = "--enable-des,--disable-des"
+PACKAGECONFIG[perl] = "--enable-embedded-perl --with-perl-modules=yes, --disable-embedded-perl --with-perl-modules=no, perl"
 PACKAGECONFIG[smux] = ""
-
-EXTRA_OECONF = "--enable-shared \
-                --disable-manuals \
-                --with-defaults \
-                --with-install-prefix=${D} \
-                --with-persistent-directory=${localstatedir}/lib/net-snmp \
-                ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
-                --with-mib-modules='${MIB_MODULES}' \
+PACKAGECONFIG[systemd] = "--with-systemd, --without-systemd"
+
+EXTRA_OECONF = " \
+    --enable-shared \
+    --disable-manuals \
+    --with-defaults \
+    --with-install-prefix=${D} \
+    --with-persistent-directory=${localstatedir}/lib/net-snmp \
+    --with-endianness=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+    --with-mib-modules='${MIB_MODULES}' \
 "
 
 MIB_MODULES = ""
@@ -117,7 +116,7 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
-    sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+    sed -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
         -e 's@[^ ]*-ffile-prefix-map=[^ "]*@@g' \
@@ -234,8 +233,6 @@ INITSCRIPT_PACKAGES = "${PN}-server-snmpd"
 INITSCRIPT_NAME_${PN}-server-snmpd = "snmpd"
 INITSCRIPT_PARAMS_${PN}-server-snmpd = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
-
 SYSTEMD_PACKAGES = "${PN}-server-snmpd \
                     ${PN}-server-snmptrapd"
 
