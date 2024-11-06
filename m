Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7E4D29F80
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.40028.1730874678229447641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V8poBS3U;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874678; x=1762410678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VmCdxPjU1QQRSa148ajzhDI2Jq8D/3RjD1VS6ZXx/Hw=;
  b=V8poBS3U4tbt61+KopspBfh6bu7gXPkfbB1Yn2S/WVfQqbznaH7qg3a/
   WuMYMDAiPw1Y7jV+vYWP0WcZzA7IR/+sFtZ+zYSPusrRo63fBYTyMP2Lt
   C2Iub1UsojSYUVM4NM6FmHDbyAvEgFF9zJqUP+5sRcvcWOQUaAD0NNQGF
   L1OWPbBQncQhxnUw2V1CU0oIS9b6AJRLS1o8Jcq7AS8v4l83kAyKl3Rbl
   D6L/i+ElsHm4nHOuxV3mkjTW6WYpqg7+kpRlnzJzrQK1Al/L9PHhDjPn2
   6Avk3CC6QFY7TSH+VoyuIVDiOgZIHCQRPRk7d5PwDwB/Fa0WDN6TaP8MY
   g==;
X-CSE-ConnectionGUID: +O8HI5HyRpO4sh+1os/YZw==
X-CSE-MsgGUID: WK+z61nQQcWMS92JseQU9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158275403"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158275403"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D70D5C2147
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EC9ED8B31
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A9B4420071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 594C51A000A;
	Wed,  6 Nov 2024 14:31:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/46] osinfo-db-tools: upgrade 1.11.0 -> 1.12.0
Date: Wed,  6 Nov 2024 14:30:28 +0800
Message-Id: <1730874660-2364-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--2.103900-10.000000
X-TMASE-MatchedRID: 19A9OAtP7iyjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhPUt
	SCGaNXOrONQPzQMMcIZPab0w6fO9xmJZXQNDzktSuce7gFxhKa2XBPRemiwRNb5/tqn0MloN7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0ZgmFGHqyx6x+KaaVwAG43Ed+K6O5Nt51Nki
	lSsOwUdCKtQOod2Izn1NTj7+mkLH4bhrdZetdNaZJEUO2qIzlLvykBikB9a0BySYZtwNAWH60oi
	zSv2CClSpAFNe4DUJ7yCZGzF+DOCeUOexubVvUfOwpfLMeBwRuCjFOVaqYalQs5GlXF672zo8WM
	kQWv6iXBcIE78YqRWvcUt5lc1lLgkU6UkIr/V+2dkr0DWdZu90hvx0B0aP+tCaAWZ50f1KhLK2e
	ctj72i6mw+3AwSrqiYkhNLdgilV7CtXUXixGUTrzTJIv5paTA5ExtBDW4VDYTt/dr0EHZzv6/2/
	nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113699

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Make-xmlError-structs-constant.patch
removed since it's included in 1.12.0

Changelog:
==========
- Fix some memory leaks
- Fix runtime warnings on osinfo-db-export
- Adapt to libxml2 changes
- Several CI improvements
- Several translation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Make-xmlError-structs-constant.patch | 56 -------------------
 ...ls_1.11.0.bb => osinfo-db-tools_1.12.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
 rename meta-oe/recipes-support/libosinfo/{osinfo-db-tools_1.11.0.bb => osinfo-db-tools_1.12.0.bb} (78%)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch b/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
deleted file mode 100644
index edff5732c..000000000
--- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools/0001-Make-xmlError-structs-constant.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport [https://gitlab.com/libosinfo/osinfo-db-tools/-/commit/34378a4]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 34378a4ac257f2f5fcf364786d1634a8c36b304f Mon Sep 17 00:00:00 2001
-From: Michal Privoznik <mprivozn@redhat.com>
-Date: Mon, 27 Nov 2023 15:04:43 +0100
-Subject: [PATCH] Make xmlError structs constant
-
-In libxml2 commits v2.12.0~14 and v2.12.0~77 the API changed so
-that:
-
-1) xmlGetLastError() returns pointer to a constant xmlError
-   struct, and
-
-2) xmlSetStructuredErrorFunc() changed the signature of callback
-   (validate_structured_error_nop()), it too is passed pointer to
-   a constant xmlError struct.
-
-But of course, older libxml2 expects different callback
-signature. Therefore, we need to typecast it anyway.
-
-Also, drop obviously incorrect @error annotation in
-validate_structured_error_nop; the variable is used.
-
-Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
----
- tools/osinfo-db-validate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/tools/osinfo-db-validate.c b/tools/osinfo-db-validate.c
-index a721b4d..b1434a6 100644
---- a/tools/osinfo-db-validate.c
-+++ b/tools/osinfo-db-validate.c
-@@ -35,7 +35,7 @@ static void validate_generic_error_nop(void *userData G_GNUC_UNUSED,
- }
- 
- static void validate_structured_error_nop(void *userData G_GNUC_UNUSED,
--                                          xmlErrorPtr error G_GNUC_UNUSED)
-+                                          const xmlError *error)
- {
-     if (error->file)
-         g_printerr("%s:%d %s", error->file, error->line, error->message);
-@@ -173,7 +173,8 @@ static gboolean validate_files(GFile *schema, gsize nfiles, GFile **files, GErro
-     g_autofree gchar *schemapath = NULL;
- 
-     xmlSetGenericErrorFunc(NULL, validate_generic_error_nop);
--    xmlSetStructuredErrorFunc(NULL, validate_structured_error_nop);
-+    /* Drop this typecast when >=libxml2-2.12.0 is required */
-+    xmlSetStructuredErrorFunc(NULL, (xmlStructuredErrorFunc) validate_structured_error_nop);
- 
-     schemapath = g_file_get_path(schema);
-     rngParser = xmlRelaxNGNewParserCtxt(schemapath);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
similarity index 78%
rename from meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb
rename to meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
index 0584bee15..4434a851e 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.11.0.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "glib-2.0 json-glib libarchive libsoup-2.4"
 
 SRC_URI = "git://gitlab.com/libosinfo/osinfo-db-tools.git;branch=main;protocol=https \
-           file://0001-Make-xmlError-structs-constant.patch \
            "
-SRCREV = "85a1788c6977419b6facad11dbfbf823e739eb3b"
+SRCREV = "e5564be303bfac49cc3490bd0fada342cd65566f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


