Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D291FC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:17:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.3054.1663064250002826212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=M9B46F/k;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064248; i=@fujitsu.com;
	bh=oCmwXeXx2fn458QPSWSsFshPJ5J9NDmlh11LZ6iQiDk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=M9B46F/kWY1Rd6JmHLbEOLL4YYDBNiv8V95iTokIKl5i6FVayKy7eNeRy8r+8vUi/
	 qLJRhDUSib3Fbxud8dUQ7ymmYev7uB4jlBZCBxGUBpo0YcsudUwl0VUSbhIcz0O/8i
	 T3/I7sbhE68EjWtwTklPXx3y7dRYzJzqGogxpoTpV2kXnnY3n0tFsErlGvRW1ZOPD4
	 wWVig39Z8QC60mEAJN8K1AryEyT5+LZdLTF8NpOGioBIaJxaIGbEZFnnOSddJpXWjO
	 4ru6d0C0zIaGz+bwJi2FTd2ftIzbjx+zHEtKR79TQ19M1BGE1slzOgQ7+cXEkwrwPF
	 VAmECwkv0BLUQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSXdHhEK
  ywcoPTBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8amdZ+YCm7xVSzeeo69gfEaTxcjF4eQwBNG
  idPPOxghnOtMEtM2TWWCcPYwStw/N5u1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYQFnie/PbrOA2CwCqhKXtv9iArF5BRwl2h8dBotLCChITHn4HqyXU8BJYv3zhWBxIaCahV
  v2MkPUC0qcnPmEBWK+hMTBFy+YIXoVJWZfboaaUyHROP0QE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjVVJRZnpGSW5iZo6uoYGBrqGhqa6xua6hpV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFl
  bnJOil5easkmRmAYpxSrCu9g7Fj5U+8QoyQHk5Iob6SXQrIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd74EKCcYFFqempFWmYOMKZg0hIcPEoivDzBQGne4oLE3OLMdIjUKUZdjplf2w4wC7Hk5e
  elSonzzvQGKhIAKcoozYMbAYvvS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSXCgKbwZOa
  VwG16BXQEE9ARRtbyIEeUJCKkpBqYZskks+pkPPEKYtAT+m86+7feRhv1vi+zJqZ9j9pVdywl
  /l9p+dFLF9W/pJnyJ4nGG0w4OedXY9YJm/hprzxf5qSdvZzxhlN8bVGFqoH1t8UdpzfOump33
  OvVtp93p3xnWZuXVDt3vlhYXXq1loO6esxGt0UWRrN3a4Tu3H7jAFvdsrnbpco5PU7Vn299+s
  bgq6DfFzfjG871V3qM3a9EKT1u/eA473WdqbbqJMFHLe/uB7zVap/kuWG1UN2H3SvupVqI/Lo
  l4aY9W1JsRoLi20Zn9+Q+P15D4dKV4be8tQ0s5u86HlSsqLlr75awe5O9Hz+cc3Lvkf4F3zIt
  Vvl7s3Q9n3++NJht5hbZj3eblFiKMxINtZiLihMBYIAmJWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1663064247!145587!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21223 invoked from network); 13 Sep 2022 10:17:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:17:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B5A791000EE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:27 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A809A1000CE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:17:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:17:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.08.0 -> 22.09.0
Date: Tue, 13 Sep 2022 18:17:11 +0800
Message-ID: <1663064233-3236-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
References: <1663064233-3236-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:17:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98770

Changelog:
==========
 core:
  * Splash: Do not truncate line dash patterns with more than 20 entries. Issue #1281
  * Various signature related improvements
  * Fix FormField::getFullyQualifiedName in some scenarios
  * Splash: Small optimization on dash pattern handling
  * JBIG2Stream::readHalftoneRegionSeg: Fix potential memory leak
  * Fix crashes on malformed files. Including CVE-2022-38784
  * Fix string formatting in error reporting

 glib:
  * Fix two potential memory leaks in poppler_document_create_dests_tree

 utils:
  * pdfsig: List signature field names when listing signature information
  * pdfsig: Add support for specifying signature by field name
  * pdfunite: Fix crashes on malformed files
  * pdfunite: Fix potential memory leak of docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.08.0.bb => poppler_22.09.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.08.0.bb => poppler_22.09.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.08.0.bb b/meta-oe/recipes-support/poppler/poppler_22.09.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.08.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.09.0.bb
index c75bf79e47..2cae897d7a 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.09.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "b493328721402f25cb7523f9cdc2f7d7c59f45ad999bde75c63c90604db0f20b"
+SRC_URI[sha256sum] = "d7a8f748211359cadb774ba3e18ecda6464b34027045c0648eb30d5852a41e2e"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


