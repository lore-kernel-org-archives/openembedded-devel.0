Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10336.1624466308339875940
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 09:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ifkM/vLD;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1624466308;
  x=1656002308;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pF1uP2sxU1tI9nhrwA78l+1r5QdIYrDlzANB4M22u5s=;
  b=ifkM/vLDsgqqBOh+wls7JUEUBct9mMaJNn3GMmM7OruCH+LkKYUWYw6h
   thzY9rZTLyIVgxlO/UAVoxlV4J6Me0BtRJ+O4ko7247W9rsLPzvP+ySXk
   pF91th4LSAK9978ycCuzPf0Bbh9BKW78hDaO5jnZ7foT3uDuh/F8XAArd
   SQhmYIIZmgRV0FOSEywE8pTpd9L4GTXRK5Klbw2jDPab3ScEM44ycBF+/
   mFUkqvvVTdksifROpnn1aCuUVGzk8ai7MDKsPy+6LfaGRUxQpElIRmE4f
   JP8/rQ41ASm5RQ3wCgB++SxY6KVfFu9a1B7z3j/2ScX9pYl/op2f3SfG2
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][hardknott][PATCH 2/2] net-snmp: Support building for native
Date: Wed, 23 Jun 2021 18:38:23 +0200
Message-ID: <20210623163823.20596-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210623163823.20596-1-pkj@axis.com>
References: <20210623163823.20596-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Due to the sed commands in do_install_append() that removed
${STAGING_DIR_HOST} and it being empty when building for native, it was
impossible to add support for building this as native using a bbappend.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.9.bb | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index f577fd1c1..2159342fc 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
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
 
@@ -126,11 +129,14 @@ do_install_append() {
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
@@ -270,3 +276,5 @@ RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
 LEAD_SONAME = "libnetsnmp.so"
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/net-snmp-config"
+
+BBCLASSEXTEND = "native"
