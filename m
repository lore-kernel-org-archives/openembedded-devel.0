Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 485CFC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:44:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.7949.1676879048060531602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CdwUisSU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676879046; i=@fujitsu.com;
	bh=/2iDv/srT3r3KVbkw2jPgG6l8gu7da5+NNtxNE63E5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CdwUisSUv8iOWFalm50PhLQoLdSTMtGFYluBgFzaBL7VLOYtDSqYTpW/q/h/iCXS4
	 XToWkoiVRKElIcsfcMhCtjFLAh1Z3L1NsRV1trsEXA1mmEVyZJlCCOJPaIKIVhO0dg
	 fLbJETbTQt+27l/zAtL69bj6mpEHdeH1lwHPOrfRBx5ldpe1G6Ou7MdCBgieDJjrV4
	 fxdXlIC2velSsgTMbUeV8viGomhMsQxwA1SEPPG65TeHueK+xD2e1e8WEjPHANpmTk
	 ruNjaguT3OW97PaxsV+AHgqfl84tBc+a2aS8+dQw/3zzJAArueXRg/j+vIOMwixx89
	 ++voH/uv05jOw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqHtM5XO
  ywdW9TBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8alcz/YClbKVCxftZelgfGaZBcjJ4eQwBNG
  if6p6l2MXED2DSaJE8taWSGcvYwSR77sYAOpYhOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAXuJg0ctQcIsAqoSz7p/sILYvAJOEtsOtjCC2BICChJTHr4Ha+UUcJaYs+QZC8QRTh
  KHm+9B1QtKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdI1NNNLKspMzyjJTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlGJ19x2MR/r+6h1ilORgUhLl3ST8OVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  G+VIlBOsCg1PbUiLTMHGEcwaQkOHiURXmlpoDRvcUFibnFmOkTqFKMxx9UrV/Yyc2za13WAWY
  glLz8vVUqcV0EZqFQApDSjNA9uECy+LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5j0Ocg9
  PZl4J3L5XQKcwAZ3i/uMDyCkliQgpqQamwKt/v2zr0by7pHTDHsPpe5evyfaY8ujV6z23Avb5
  q26qMZdTeewgftZsp2fo/JUxm8tOPHokVPm3nMXi0cxpTN+3+U1+38l8N1F0Unz/zhNBBdoay
  19mS+xp1VtyIK7N9Eu0R5dTcYd7aumlMr6ziqcunOrOtv145mVeidi90q835k5QLJpoo7CKq8
  yQdbuB+KEch0RB+/2/DJdGTtkt8OikYM9GafXnq1d/vK4ot3GB6ddZ25tlskXvzZ9hfLmH+dd
  38bnmrywqGGdWace9ixLeuSBL6WnhfI51J766uS9/y6J79d+mN0yZ56oin/vuSWPVnv1I2VBA
  dmnvCT9TVd1pu8VO7xBSdXLOWJFkrcRSnJFoqMVcVJwIACUCEFFqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1676879045!187806!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31491 invoked from network); 20 Feb 2023 07:44:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:44:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BAA2E100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AE4D7100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:44:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: upgrade 0.13 -> 0.13.1
Date: Mon, 20 Feb 2023 15:43:49 +0800
Message-ID: <1676879030-15591-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676879030-15591-1-git-send-email-wangmy@fujitsu.com>
References: <1676879030-15591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101165

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch
removed since it's included in 0.13.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d-race-related-to-utils-mermaid.html.patch | 38 -------------------
 .../{uftrace_0.13.bb => uftrace_0.13.1.bb}    |  6 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.13.bb => uftrace_0.13.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch
deleted file mode 100644
index 2cb4f26fb..000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1fa61d77fa7173744dd6dc9d3c4bb0aa783f5222 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 Jan 2023 10:35:46 -0800
-Subject: [PATCH] build: Fix a build race related to utils/mermaid.html.cstr
-
-Sometimes build fails like below
-
-| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c: In function 'dump_mermaid_footer':
-| /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/git/cmds/dump.c:1347:10: fatal error: utils/mermaid.html.cstr: No such file or directory
-|  1347 | #include "utils/mermaid.html.cstr" /* This file is a converted of mermaid.html to one string literal in build-time */
-|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~
-| compilation terminated.
-| make[1]: *** [Makefile:310: /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/uftrace/0.13-r0/build/cmds/dump.o] Error 1
-
-Create a dependency on c-str-conversion for dump.o
-
-Upstream-Status: Submitted [https://github.com/namhyung/uftrace/pull/1622]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Makefile b/Makefile
-index 70dc12f0..bb2ac669 100644
---- a/Makefile
-+++ b/Makefile
-@@ -304,6 +304,8 @@ $(objdir)/misc/dbginfo.o: $(srcdir)/misc/dbginfo.c $(objdir)/version.h $(COMMON_
- $(objdir)/misc/bench.o: $(srcdir)/misc/bench.c
- 	$(QUIET_CC)$(CC) $(BENCH_CFLAGS) -c -o $@ $<
- 
-+$(objdir)/cmds/dump.o: c-str-conversion
-+
- $(UFTRACE_OBJS_VERSION): $(objdir)/version.h
- 
- $(filter-out $(objdir)/uftrace.o, $(UFTRACE_OBJS)): $(objdir)/%.o: $(srcdir)/%.c $(COMMON_DEPS)
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
index 130242098..4e1edc6ce 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.1.bb
@@ -10,10 +10,8 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "53ec12d40701cf73ddcf5db8cff63b54736d0eda"
-SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
-           file://0001-build-Fix-a-build-race-related-to-utils-mermaid.html.patch \
-           "
+SRCREV = "be3f46f7656bd9243b1835337b5350247b030b02"
+SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 LDFLAGS:append:libc-musl = " -largp"
-- 
2.34.1


