Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.10305.1624466307519911126
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 09:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Ds+q2lyH;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624466307;
  x=1656002307;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AGXEb45QEP1SbVzUEOIBxZu+5oxzGzU9AOwPW95pyaA=;
  b=Ds+q2lyHtZndPBgefipuc5jjvTwEFzqyfHQgeT5ZllF9Pmfkau7cAbHd
   dQOEQtdsKo4EbGpeohGhigJxX7RGS6iTqkn5eOc89cd122upO1rzQJ/RZ
   LdeNFxTChEvBoUkOZ376qr29x7PzImrs/coOH1b8UFOhIrgHbahwQ1yTH
   GGHJDXvxKSdqif9cvxZsT73XYFRj29ypoBvGqjxjjkQ2dXYgcmJ8ZFPHa
   QnJZU5ib+AxSJmvBlAfbznBOWVhptL+cxBdas0BKJnO7GTLFmxiJGUhOI
   jaIOPaQWEBh+16uoyon+9UOsaJ7b/gcGKkIAyqK4LBWny+q6+r3nBdI5H
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][hardknott][PATCH 1/2] net-snmp: A little clean up
Date: Wed, 23 Jun 2021 18:38:22 +0200
Message-ID: <20210623163823.20596-1-pkj@axis.com>
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
 .../net-snmp/net-snmp_5.9.bb                  | 35 +++++++++----------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index d9040c164..f577fd1c1 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
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
         -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
@@ -232,8 +231,6 @@ INITSCRIPT_PACKAGES = "${PN}-server-snmpd"
 INITSCRIPT_NAME_${PN}-server-snmpd = "snmpd"
 INITSCRIPT_PARAMS_${PN}-server-snmpd = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
-
 SYSTEMD_PACKAGES = "${PN}-server-snmpd \
                     ${PN}-server-snmptrapd"
 
