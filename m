Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 8C17B6C4E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:52:27 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 6E14C1C0037;
	Wed, 21 Nov 2018 13:52:27 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 13:52:15 +1300
Message-Id: <20181121005220.22091-2-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121005220.22091-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
	<20181121005220.22091-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH v2 1/6] Revert "net-snmp: improve reproducibility"
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
X-List-Received-Date: Wed, 21 Nov 2018 00:52:28 -0000

This reverts commit 57d8e2c673d5f5686bbf411333f1d39c3e29690e.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ...e-configure-options-from-versioninfo.patch | 42 -------------------
 .../net-snmp/net-snmp_5.8.bb                  |  7 ----
 2 files changed, 49 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
deleted file mode 100644
index 2d540967e..000000000
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f592398b1c659f84168f5c84f63af3b71454b8f5 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 28 Sep 2018 22:59:23 +0800
-Subject: [PATCH] remove configure options from versioninfo
-
-Configure options contains host build paths which breaks
-binary reproducibility.
-
-It is no harm to remove it from version info.
-
-Upstream-Status: Inappropriate [cross compile specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- agent/mibgroup/ucd-snmp/versioninfo.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/agent/mibgroup/ucd-snmp/versioninfo.c b/agent/mibgroup/ucd-snmp/versioninfo.c
-index a5151c1..1160382 100644
---- a/agent/mibgroup/ucd-snmp/versioninfo.c
-+++ b/agent/mibgroup/ucd-snmp/versioninfo.c
-@@ -92,7 +92,7 @@ var_extensible_version(struct variable *vp,
-     static char     errmsg[300];
-     char           *cptr;
-     time_t          curtime;
--#ifdef NETSNMP_CONFIGURE_OPTIONS
-+#if 0
-     static char     config_opts[] = NETSNMP_CONFIGURE_OPTIONS;
- #endif
- 
-@@ -126,7 +126,7 @@ var_extensible_version(struct variable *vp,
-         *var_len = strlen(errmsg);
-         return ((u_char *) errmsg);
-     case VERCONFIG:
--#ifdef NETSNMP_CONFIGURE_OPTIONS
-+#if 0
-         *var_len = strlen(config_opts);
-         if (*var_len > 1024)
-             *var_len = 1024;    /* mib imposed restriction */
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index d47f9e4a3..a32d09d77 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -24,7 +24,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
-           file://0001-remove-configure-options-from-versioninfo.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
@@ -169,12 +168,6 @@ net_snmp_sysroot_preprocess () {
     fi
 }
 
-PACKAGE_PREPROCESS_FUNCS += "net_snmp_package_preprocess"
-net_snmp_package_preprocess () {
-    sed -e 's@${RECIPE_SYSROOT}@@g' \
-       -i ${PKGD}${bindir}/net-snmp-config
-}
-
 PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
              ${PN}-server-snmpd ${PN}-server-snmptrapd \
              ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
-- 
2.17.1


