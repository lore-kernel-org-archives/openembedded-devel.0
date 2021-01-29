Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.7409.1611913172287751953
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 01:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 10T9dFQi018612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 01:39:25 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 29 Jan 2021 01:39:09 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 29 Jan 2021 01:39:09 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] net-snmp: improve reproducibility
Date: Fri, 29 Jan 2021 01:39:09 -0800
Message-ID: <20210129093909.95809-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add a patch to fix the gap between 32bit and 64bit system when
the configure option "--with-openssl=${STAGING_EXECPREFIXDIR}"
passed in.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ath.m4-keep-consistent-between-32bit.patch | 39 +++++++++++++++++++
 .../net-snmp/net-snmp_5.9.bb                  |  7 +++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
new file mode 100644
index 000000000..4cd729044
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch
@@ -0,0 +1,39 @@
+From 6f8ea2e841ad45eed193310b599d3f3b410ae91d Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 29 Jan 2021 08:49:15 +0000
+Subject: [PATCH] ac_add_search_path.m4: keep consistent between 32bit and 64bit
+
+With configure option "--with-openssl=${STAGING_EXECPREFIXDIR}", it behaves
+differently between 32bit and 64bit system as the openssl lib resides under
+/build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/usr/lib64
+for 64bit system, but resides under [1] for 32bit system.
+
+So add the patch to fix the gap between 32bit and 64bit system.
+
+[1] /build/tmp/work/corei7-64-wrs-linux/net-snmp/5.9-r0/recipe-sysroot/usr/lib
+
+Upstream-Status: Inappropriate [configuration specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ m4/ac_add_search_path.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/m4/ac_add_search_path.m4 b/m4/ac_add_search_path.m4
+index 8e0a819..961f587 100644
+--- a/m4/ac_add_search_path.m4
++++ b/m4/ac_add_search_path.m4
+@@ -3,8 +3,8 @@ dnl Add a search path to the LIBS and CPPFLAGS variables
+ dnl
+ AC_DEFUN([AC_ADD_SEARCH_PATH],[
+   if test "x$1" != x -a -d $1; then
+-     if test -d $1/lib; then
+-       LDFLAGS="-L$1/lib $LDFLAGS"
++     if test -d $1/${libdir:5}; then
++       LDFLAGS="-L$1/${libdir:5} $LDFLAGS"
+      fi
+      if test -d $1/include; then
+ 	CPPFLAGS="-I$1/include $CPPFLAGS"
+-- 
+2.29.2
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
index bee83c4d1..ac78ed2d5 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
            file://reproducibility-have-printcap.patch \
+           file://0001-ac_add_search_path.m4-keep-consistent-between-32bit.patch \
            "
 SRC_URI[sha256sum] = "04303a66f85d6d8b16d3cc53bde50428877c82ab524e17591dfceaeb94df6071"
 
@@ -128,10 +129,12 @@ do_install_append() {
         -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
         -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
-        -e 's@-L${STAGING_DIR_HOST}${libdir}@@g' \
-        -e 's@-I${STAGING_DIR_HOST}${includedir}@@g' \
+        -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/net-snmp-config
 
+    sed -e 's@${STAGING_DIR_HOST}@@g' \
+        -i ${D}${libdir}/pkgconfig/{netsnmp-agent.pc,netsnmp.pc}
+
     if [ "${HAS_PERL}" = "1" ]; then
         sed -e "s@^NSC_INCLUDEDIR=.*@NSC_INCLUDEDIR=\$\{includedir\}@g" \
             -e "s@^NSC_LIBDIR=-L.*@NSC_LIBDIR=-L\$\{libdir\}@g" \
-- 
2.17.1

