Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.10543.1624466292209817302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 09:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=D22/BwfP;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624466292;
  x=1656002292;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+NDFq8to4kkVQgIsCkH6kgK3ZzoJGN2ZBR+lk7Zq2yw=;
  b=D22/BwfPm0flklUm6s9cjf8PCmDSvWZskuOUFQ/zG+GKiYQTco1yfgjB
   G/mH7E2DLjcQIqGWooCVFkHW1yZ/3YoYbjWY65tOFPaW47x3gY5wQKeyl
   RT6f6dgNJXM0Kl1K8sA1B6E4dQSGHGcL4Pge6t+WUIxAjJkhxi8RPJGfz
   p5oYzUlQrV2QckxeGd1XpR/1xsL4TwJ55lOfQy29tZFQ74VdgzMOa3OUU
   67OQUt56gA8eTjkCxrX69rK4iy4bp+hahzXWRmApVdyi2SRxiH3Ypk9Fy
   U/mf4+SLvtLruSp5AlBP2idwpEi0L3ev1oOUHqSbXFanVsSGFSROtm5FJ
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][master][PATCH 2/2] net-snmp: Support building for native
Date: Wed, 23 Jun 2021 18:38:05 +0200
Message-ID: <20210623163805.20459-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210623163805.20459-1-pkj@axis.com>
References: <20210623163805.20459-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to the sed commands in do_install_append() that removed
${STAGING_DIR_HOST} and it being empty when building for native, it was
impossible to add support for building this as native using a bbappend.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../net-snmp/net-snmp_5.9.1.bb                 | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
index c96ada80d..ed7f8428b 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.1.bb
@@ -5,7 +5,8 @@ LICENSE = "BSD & MIT"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9d100a395a38584f2ec18a8275261687"
 
-DEPENDS = "openssl pciutils"
+DEPENDS = "openssl"
+DEPENDS_append_class-target = " pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://init \
@@ -72,8 +73,10 @@ CACHED_CONFIGUREVARS = " \
     ac_cv_file__etc_printcap=no \
     NETSNMP_CONFIGURE_OPTIONS= \
 "
-export PERLPROG="${bindir}/env perl"
+PERLPROG = "${bindir}/env perl"
+PERLPROG_class-native = "${bindir_native}/env perl"
 PERLPROG_append = "${@bb.utils.contains('PACKAGECONFIG', 'perl', ' -I${WORKDIR}', '', d)}"
+export PERLPROG
 
 HAS_PERL = "${@bb.utils.contains('PACKAGECONFIG', 'perl', '1', '0', d)}"
 
@@ -127,11 +130,14 @@ do_install_append() {
         -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
-        -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/net-snmp-config
 
-    sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${libdir}/pkgconfig/netsnmp*.pc
+    # ${STAGING_DIR_HOST} is empty for native builds, and the sed command below
+    # will result in errors if run for native.
+    if [ "${STAGING_DIR_HOST}" ]; then
+        sed -e 's@${STAGING_DIR_HOST}@@g' \
+            -i ${D}${bindir}/net-snmp-config ${D}${libdir}/pkgconfig/netsnmp*.pc
+    fi
 
     sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
         -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
@@ -272,3 +278,5 @@ RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 LEAD_SONAME = "libnetsnmp.so"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/net-snmp-config"
+
+BBCLASSEXTEND = "native"
