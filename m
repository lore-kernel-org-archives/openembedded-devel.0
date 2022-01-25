Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D0EC433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:13:30 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.6775.1643116408985084530
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yxQoD/c6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116407; i=@fujitsu.com;
	bh=U3vJTMIKL9cFMkoF+mxmceHZc+DH0FSOzCNBVK5HvAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=yxQoD/c6qNJPjUKDMt71792b4jtLg7GnCZSahfqZzS5yW3zbz4IQiUWctENgrtX1Y
	 PPBJc9nb5X+tB3Q2ZweQT0PiFlfuQE+wsHixwhr0SKhRPJb+acuj+otEwGHFzK6Lsr
	 Dt95BMFu8Tac2WPFY9jl98WKlREI9YwVauRDh/iURt2+vVDBQyUeuBQ0f0G68LNvix
	 Uw7bQP41VI3wO65gQCu5G7SZkT/PBbNne3pKSZVAW2+Ac2IaYl7AQ1N7LEvOpGSl9l
	 2MOUVcueg7F8OQLCodAcC8+OQbVsJhYB1PHuaBTHzRFmw11/RH9g/9gp5cBkJkT+AE
	 Sqdo0R6fwOVyg==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 64/7F-30582-677FFE16; Tue, 25 Jan 2022 13:13:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqFv2/X2
  iQdtbFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePxk9vMBWuVKl6e38/WwNgh28XIxSEk8IRR
  YtOO5UwQzgUmiZkP9wE5nEDOCUaJ9jfRIDabgJrE9Fs3WEFsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAjYSG/v3g/WyCKhKfNvxnQXE5hVwlPi/ahVYr4SAgsSUh+/BejkFnCSu9WxmhNjlKNH5YC
  EbRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKka7pKLM9IyS3MTMHF1DAwNdQ0NTXTMzXUNTU73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFe
  cWVuck6KXl5qySZGYDCnFDvN3sG4o++n3iFGSQ4mJVHexHXvE4X4kvJTKjMSizPii0pzUosPM
  cpwcChJ8L76BJQTLEpNT61Iy8wBRhZMWoKDR0mEV/kbUJq3uCAxtzgzHSJ1ilGX43XLzx3MQi
  x5+XmpUuK8wiBFAiBFGaV5cCNgUX6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDv969AU3g
  y80rgNr0COoIJ6Ijf59+BHFGSiJCSamCSEfVlvT5B1OPLEtubl8W+yX7jb7wRsj1ZvELf5gnj
  2+nKxza+3XNixryU76su8XcE316m+jcpcZO9fH4ih5hi0aVt3W33mvVi9gsuFZQ2XL1Z6GfnC
  senjs82Bp95sTDjYFRq/7XWM57G9sFH0gPfaP/6rLhj4hztvvT90v3+IYJzdsYdnxz/TDz6Zv
  MR6bj4G/OW29372ZFRcfLtv7D7+75NOd+4MCxK3eTm84yLU86XlATyHZiT/+5A0Ot9h6+ZTZ5
  zfmJvRJls6Yyqe3tqupYp6NxYmCfjyPj6sfjdoiNF3ibpblU2TUrz9c1P7Q5RF47/lqp/xkpZ
  dPPmlnU7DasUts9k/fe9q2ZWdIyJEktxRqKhFnNRcSIAYC+kOW0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-25.tower-528.messagelabs.com!1643116406!18974!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15268 invoked from network); 25 Jan 2022 13:13:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-25.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:13:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id EFD2410019F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DBE5F1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:13:14 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cgdb: upgrade 0.7.1 -> 0.8.0
Date: Tue, 25 Jan 2022 21:12:47 +0800
Message-ID: <1643116367-7352-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
References: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95059

0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
removed since it is inappropriate in 0.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...se-of-mips-which-is-reserved-on-mips.patch | 67 -------------------
 .../cgdb/{cgdb_0.7.1.bb => cgdb_0.8.0.bb}     |  7 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
 rename meta-oe/recipes-devtools/cgdb/{cgdb_0.7.1.bb => cgdb_0.8.0.bb} (68%)

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch b/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
deleted file mode 100644
index daf90ad44..000000000
--- a/meta-oe/recipes-devtools/cgdb/cgdb/0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a3eba0fcee5e96ef47a6d3fac7196a1074f0dc17 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Wed, 30 Oct 2019 11:07:23 +0200
-Subject: Avoid use of "mips" which is reserved on mips
-
-Upstream-Status: Submitted [https://github.com/brasko/gdbwire/pull/9]
-
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
-
-diff --git a/src/gdbwire_mi_parser.c b/src/gdbwire_mi_parser.c
-index 3f6b563..24aa0cf 100644
---- a/lib/tgdb/gdbwire.c
-+++ b/lib/tgdb/gdbwire.c
-@@ -40,7 +40,7 @@ struct gdbwire_mi_parser {
-     /* The GDB/MI lexer state */
-     yyscan_t mils;
-     /* The GDB/MI push parser state */
--    gdbwire_mi_pstate *mips;
-+    gdbwire_mi_pstate *mipst;
-     /* The client parser callbacks */
-     struct gdbwire_mi_parser_callbacks callbacks;
- };
-@@ -71,8 +71,8 @@ gdbwire_mi_parser_create(struct gdbwire_mi_parser_callbacks callbacks)
-     }
- 
-     /* Create a new push parser state instance */
--    parser->mips = gdbwire_mi_pstate_new();
--    if (!parser->mips) {
-+    parser->mipst = gdbwire_mi_pstate_new();
-+    if (!parser->mipst) {
-         gdbwire_mi_lex_destroy(parser->mils);
-         gdbwire_string_destroy(parser->buffer);
-         free(parser);
-@@ -81,7 +81,7 @@ gdbwire_mi_parser_create(struct gdbwire_mi_parser_callbacks callbacks)
- 
-     /* Ensure that the callbacks are non null */
-     if (!callbacks.gdbwire_mi_output_callback) {
--        gdbwire_mi_pstate_delete(parser->mips);
-+        gdbwire_mi_pstate_delete(parser->mipst);
-         gdbwire_mi_lex_destroy(parser->mils);
-         gdbwire_string_destroy(parser->buffer);
-         free(parser);
-@@ -109,9 +109,9 @@ void gdbwire_mi_parser_destroy(struct gdbwire_mi_parser *parser)
-         }
- 
-         /* Free the push parser instance */
--        if (parser->mips) {
--            gdbwire_mi_pstate_delete(parser->mips);
--            parser->mips = NULL;
-+        if (parser->mipst) {
-+            gdbwire_mi_pstate_delete(parser->mipst);
-+            parser->mipst = NULL;
-         }
- 
-         free(parser);
-@@ -162,7 +162,7 @@ gdbwire_mi_parser_parse_line(struct gdbwire_mi_parser *parser,
-         pattern = gdbwire_mi_lex(parser->mils);
-         if (pattern == 0)
-             break;
--        mi_status = gdbwire_mi_push_parse(parser->mips, pattern, NULL,
-+        mi_status = gdbwire_mi_push_parse(parser->mipst, pattern, NULL,
-             parser->mils, &output);
-     } while (mi_status == YYPUSH_MORE);
- 
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
similarity index 68%
rename from meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
rename to meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
index a48e32af2..99e09bfc6 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
@@ -9,11 +9,8 @@ DEPENDS = "flex-native readline ncurses"
 
 inherit autotools texinfo
 
-SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
-           file://0001-Avoid-use-of-mips-which-is-reserved-on-mips.patch \
-"
-SRC_URI[md5sum] = "a104862ffd3145b076303992e9a3af26"
-SRC_URI[sha256sum] = "bb723be58ec68cb59a598b8e24a31d10ef31e0e9c277a4de07b2f457fe7de198"
+SRC_URI = "http://cgdb.me/files/${BP}.tar.gz"
+SRC_URI[sha256sum] = "0d38b524d377257b106bad6d856d8ae3304140e1ee24085343e6ddf1b65811f1"
 
 CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2 ac_cv_file__proc_self_status=yes"
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} \
-- 
2.25.1


