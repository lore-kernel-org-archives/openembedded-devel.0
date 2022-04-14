Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4342C48BE6
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.7242.1649905128486532039
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: nicolas.marguet@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23E2wkDr011277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:58:47 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Apr 2022 19:58:46 -0700
Received: from ala-lpggp6.wrs.com (147.11.105.170) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 13 Apr 2022 19:58:46 -0700
From: Nicolas Marguet <nicolas.marguet@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Nicolas Marguet <nicolas.marguet@windriver.com>
Subject: [PATCH] openjpeg: fix CVE-2022-1122
Date: Wed, 13 Apr 2022 19:58:19 -0700
Message-ID: <20220414025819.1245989-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96641

CVE: CVE-2022-1122

The defect is undergoing reanalysis and there may be follow-up commits.

Ref:
* https://github.com/uclouvain/openjpeg/issues/1368

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 .../openjpeg/openjpeg/CVE-2022-1122.patch     | 31 +++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch
new file mode 100644
index 000000000..8aa9c15e3
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2022-1122.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/0afbdcf3e6d0d2bd2e16a0c4d513ee3cf86e460d]
+CVE: CVE-2022-1122
+
+While this patch improves things re-CVE-2022-1122, the defect is undergoing re-analysis and there may be follow-up commits.
+
+From 0afbdcf3e6d0d2bd2e16a0c4d513ee3cf86e460d Mon Sep 17 00:00:00 2001
+From: xiaoxiaoafeifei <lliangliang2007@163.com>
+Date: Wed, 14 Jul 2021 09:35:13 +0800
+Subject: [PATCH] Fix segfault in src/bin/jp2/opj_decompress.c due to
+ uninitialized pointer (fixes #1368) (#1369)
+
+---
+ src/bin/jp2/opj_decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bin/jp2/opj_decompress.c b/src/bin/jp2/opj_decompress.c
+index 0e028735..18ead672 100644
+--- a/src/bin/jp2/opj_decompress.c
++++ b/src/bin/jp2/opj_decompress.c
+@@ -1356,7 +1356,7 @@ int main(int argc, char **argv)
+         int it_image;
+         num_images = get_num_images(img_fol.imgdirpath);
+ 
+-        dirptr = (dircnt_t*)malloc(sizeof(dircnt_t));
++        dirptr = (dircnt_t*)calloc(1, sizeof(dircnt_t));
+         if (!dirptr) {
+             destroy_parameters(&parameters);
+             return EXIT_FAILURE;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index b41bb9eb8..f248619ec 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
     file://0001-This-patch-fixed-include-dir-to-usr-include-.-Obviou.patch \
     file://CVE-2021-29338.patch \
+    file://CVE-2022-1122.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.34.0


