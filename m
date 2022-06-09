Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E07C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 08:51:31 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.8273.1654764686129857365
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 01:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2598pE4g007642
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 9 Jun 2022 01:51:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2598p9WC014376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 9 Jun 2022 01:51:14 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Jun 2022 01:51:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Jun 2022 01:51:08 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] kronosnet: Fix build with gcc-12
Date: Thu, 9 Jun 2022 16:51:08 +0800
Message-ID: <20220609085108.4173615-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 08:51:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97462

From: Mingli Yu <mingli.yu@windriver.com>

Fix the build failure when debug build is enabled.
Add DEBUG_BUILD = "1" in conf/local.conf.
 $ bitbake kronosnet
  | /build/tmp-glibc/work/corei7-64-wrs-linux/kronosnet/1.22-r0/recipe-sysroot/usr/include/bits/string_fortified.h:59:10: error: 'link' may be used uninitialized [-Werror=maybe-uninitialized]
  |    59 |   return __builtin___memset_chk (__dest, __ch, __len,
  |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  |    60 |                                  __glibc_objsize0 (__dest));
  |       |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  | ../../git/libknet/links.c: In function 'knet_link_set_config':
  | ../../git/libknet/links.c:108:27: note: 'link' was declared here
  |   108 |         struct knet_link *link;
  |       |                           ^~~~
  | cc1: all warnings being treated as errors

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-links.c-Fix-build-with-gcc-12.patch  | 40 +++++++++++++++++++
 .../kronosnet/kronosnet_1.22.bb               |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
new file mode 100644
index 000000000..e59501cc4
--- /dev/null
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet/0001-links.c-Fix-build-with-gcc-12.patch
@@ -0,0 +1,40 @@
+From a8aac8f3fd8b07fde8f5dc0aa9ece54a46d24425 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 9 Jun 2022 16:03:06 +0800
+Subject: [PATCH] links.c: Fix build with gcc-12
+
+Fixes:
+  | /build/tmp-glibc/work/corei7-64-wrs-linux/kronosnet/1.22-r0/recipe-sysroot/usr/include/bits/string_fortified.h:59:10: error: 'link' may be used uninitialized [-Werror=maybe-uninitialized]
+  |    59 |   return __builtin___memset_chk (__dest, __ch, __len,
+  |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  |    60 |                                  __glibc_objsize0 (__dest));
+  |       |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | ../../git/libknet/links.c: In function 'knet_link_set_config':
+  | ../../git/libknet/links.c:108:27: note: 'link' was declared here
+  |   108 |         struct knet_link *link;
+  |       |                           ^~~~
+  | cc1: all warnings being treated as errors
+
+Upstream-Status: Submitted[https://github.com/kronosnet/kronosnet/pull/382]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ libknet/links.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libknet/links.c b/libknet/links.c
+index 8cb1621b..0ef42b79 100644
+--- a/libknet/links.c
++++ b/libknet/links.c
+@@ -105,7 +105,7 @@ int knet_link_set_config(knet_handle_t knet_h, knet_node_id_t host_id, uint8_t l
+ {
+ 	int savederrno = 0, err = 0, i, wipelink = 0, link_idx;
+ 	struct knet_host *host, *tmp_host;
+-	struct knet_link *link;
++	struct knet_link *link = NULL;
+ 
+ 	if (!_is_valid_handle(knet_h)) {
+ 		return -1;
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
index ad0a00e78..0b0bc2945 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.22.bb
@@ -14,6 +14,7 @@ DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl
 SRCREV = "0123ecebce0ad6aba3cdb320027192e15fd71e23"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1 \
            file://0001-libknet-tests-Correct-include-path-for-poll.h.patch \
+           file://0001-links.c-Fix-build-with-gcc-12.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/kronosnet/kronosnet/releases"
-- 
2.25.1


