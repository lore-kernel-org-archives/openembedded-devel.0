Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30AC671A88
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2018 15:15:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8SFEuRr027161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 08:15:06 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 08:14:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 28 Sep 2018 23:24:40 +0800
Message-ID: <1538148280-6992-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] net-snmp: improve reproducibility
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
X-List-Received-Date: Fri, 28 Sep 2018 15:15:32 -0000
Content-Type: text/plain

- Remoe prefix ${RECIPE_SYSROOT} from net-snmp-config

- Remove configure options from versioninfo

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...remove-configure-options-from-versioninfo.patch | 42 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     |  7 ++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
new file mode 100644
index 0000000..2d54096
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-remove-configure-options-from-versioninfo.patch
@@ -0,0 +1,42 @@
+From f592398b1c659f84168f5c84f63af3b71454b8f5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 28 Sep 2018 22:59:23 +0800
+Subject: [PATCH] remove configure options from versioninfo
+
+Configure options contains host build paths which breaks
+binary reproducibility.
+
+It is no harm to remove it from version info.
+
+Upstream-Status: Inappropriate [cross compile specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ agent/mibgroup/ucd-snmp/versioninfo.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/agent/mibgroup/ucd-snmp/versioninfo.c b/agent/mibgroup/ucd-snmp/versioninfo.c
+index a5151c1..1160382 100644
+--- a/agent/mibgroup/ucd-snmp/versioninfo.c
++++ b/agent/mibgroup/ucd-snmp/versioninfo.c
+@@ -92,7 +92,7 @@ var_extensible_version(struct variable *vp,
+     static char     errmsg[300];
+     char           *cptr;
+     time_t          curtime;
+-#ifdef NETSNMP_CONFIGURE_OPTIONS
++#if 0
+     static char     config_opts[] = NETSNMP_CONFIGURE_OPTIONS;
+ #endif
+ 
+@@ -126,7 +126,7 @@ var_extensible_version(struct variable *vp,
+         *var_len = strlen(errmsg);
+         return ((u_char *) errmsg);
+     case VERCONFIG:
+-#ifdef NETSNMP_CONFIGURE_OPTIONS
++#if 0
+         *var_len = strlen(config_opts);
+         if (*var_len > 1024)
+             *var_len = 1024;    /* mib imposed restriction */
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index a32d09d..d47f9e4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0004-configure-fix-incorrect-variable.patch \
            file://net-snmp-5.7.2-fix-engineBoots-value-on-SIGHUP.patch \
            file://net-snmp-fix-for-disable-des.patch \
+           file://0001-remove-configure-options-from-versioninfo.patch \
            "
 SRC_URI[md5sum] = "6aae5948df7efde626613d6a4b3cd9d4"
 SRC_URI[sha256sum] = "c6291385b8ed84f05890fe4197005daf7e7ee7b082c2e390fa114a9477a56042"
@@ -168,6 +169,12 @@ net_snmp_sysroot_preprocess () {
     fi
 }
 
+PACKAGE_PREPROCESS_FUNCS += "net_snmp_package_preprocess"
+net_snmp_package_preprocess () {
+    sed -e 's@${RECIPE_SYSROOT}@@g' \
+       -i ${PKGD}${bindir}/net-snmp-config
+}
+
 PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
              ${PN}-server-snmpd ${PN}-server-snmptrapd \
              ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
-- 
2.7.4


