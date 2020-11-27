Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.13681.1606442173253852651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2020 17:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101799850"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 09:55:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id BE6304CE5CDD
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 09:55:55 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 09:55:55 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] netplan: upgrade 0.99 -> 0.100
Date: Fri, 27 Nov 2020 09:55:54 +0800
Message-ID: <1606442154-116983-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: BE6304CE5CDD.A4A5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-src-parse.c-Initialize-key-to-NULL.patch
Removed since this is included in 0.100.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...1-src-parse.c-Initialize-key-to-NULL.patch | 32 -------------------
 .../{netplan_0.99.bb => netplan_0.100.bb}     |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
 rename meta-networking/recipes-connectivity/netplan/{netplan_0.99.bb => netplan_0.100.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch b/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
deleted file mode 100644
index a710b1e57..000000000
--- a/meta-networking/recipes-connectivity/netplan/netplan/0001-src-parse.c-Initialize-key-to-NULL.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 63de116c617a35ff3d54c785b3dfb5378bb07f46 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Aug 2020 22:39:17 -0700
-Subject: [PATCH] src/parse.c: Initialize key to NULL
-
-Fixes
-
-src/parse.c:810:22: note: 'key' was declared here
-cc1: all warnings being treated as errors
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/parse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/parse.c b/src/parse.c
-index 63a0863..c66277f 100644
---- a/src/parse.c
-+++ b/src/parse.c
-@@ -807,7 +807,7 @@ handle_addresses(yaml_document_t* doc, yaml_node_t* node, const void* _, GError*
-         char* prefix_len;
-         guint64 prefix_len_num;
-         yaml_node_t *entry = yaml_document_get_node(doc, *i);
--        yaml_node_t *key, *value = NULL;
-+        yaml_node_t *key = NULL, *value = NULL;
- 
-         if (entry->type != YAML_SCALAR_NODE && entry->type != YAML_MAPPING_NODE) {
-             return yaml_error(entry, error, "expected either scalar or mapping (check indentation)");
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
rename to meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
index 5546f300b..5039b277b 100644
--- a/meta-networking/recipes-connectivity/netplan/netplan_0.99.bb
+++ b/meta-networking/recipes-connectivity/netplan/netplan_0.100.bb
@@ -11,14 +11,13 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "85134d13eb1ee5a1a7d139cd74ffa10933d73677"
-PV = "0.99+git${SRCPV}"
+SRCREV = "b7d32aebc880f3161b8f97ee56b729c0c54dd0e4"
+PV = "0.100+git${SRCPV}"
 
 SRC_URI = " \
         git://github.com/CanonicalLtd/netplan.git \
         file://0001-dbus-Remove-unused-variabes.patch \
         file://0002-Makefile-Use-first-prerquisite-only-for-target-rule.patch \
-        file://0001-src-parse.c-Initialize-key-to-NULL.patch \
 "
 
 DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-- 
2.25.1



