Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17F8C6FA82
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:16:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.3119.1663064170631619366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ldplgcpo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064169; i=@fujitsu.com;
	bh=LeBE51epQLjuYGNepTMj5nvQK503m55mmlX8BiQLWAM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LdplgcpoJy3xT9wl2c3XyyTwJag/5geSFrqoklr+co/aQumrB+bTa71QaOHEVzVTG
	 DdmZYPi2A/MLZjTLudNZaoaWj9XkBKSe8YcOLfAlI2HL0TNyCe0bNsoccFLJQ/jmMS
	 1iAqeSnAhHj132EGk4hBOxj3RUTUnod5P8MN8nUFrSSqBR/Bk4YXnT93r+tSgMBfbc
	 ymzrLaGcnq7afk69AoEk9LXzrYE+hZbyFYEGkjotw/dhePCjyFSS+SI19qNMfpabar
	 l/4G5kmz1hbAk7izte7ojh6BjM3vDRwfmTB5M05XH8Ryt2NdYAwEArOpW8RVtA6b2p
	 q6udew5ewev9Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqJsRoZB
  s8OmFssXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGms4u94DZPxcQNN9kbGM9wdzFycQgJPGGU
  uNu1mR3Cuc4kcerVYaYuRk4gZw+jxLkpiSA2m4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373s
  IPYwgJBEm+WzWYBsVkEVCXOz30EVsMr4Chx+PZisLiEgILElIfvweKcAk4Sm/vusELscpR4fR
  emXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjPUnAqJxumHmCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YrZKKMtMzSnITM3N0DQ0MdA0NTXXNdA3NLPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQKDOKWYbeUOxpV9P/UOMUpyMCmJ8kZ6KSQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uCNDwHKCRalpqdWpGXmACMKJi3BwaMkwssTDJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqp
  Q470xvoCIBkKKM0jy4EbDovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFciDGgKT2ZeCdy
  mV0BHMAEdYWQtD3JESSJCSqqBqe8XV8vKsN62xw45E3znr1DqbmgJq/Xg5FD5Fn64np/psE24
  QWWRmd7CM+mbdk5fdjJpaV3IZDHjR6aF2k9vXObmvxz5r+h4qVTAlgftpxonKXvYbXh6c/tE7
  ZDy81U/BFmu/Tq//3O3SpTk39Wczzu7J1ZklZil8gaUBqtZVPn9y3JucKp363WsV7F9z3OccZ
  XDBM/3Xbfc39TWzWxIXqvEqjTjQ8DLen+/c6ttMn+niB4vPX83g2X9T9vr4ZnitkcSQ56LJh6
  ZyFLGv3Su+h0Hu72CzosmZz/iOn5zS+xywYNJLhG+y42iz8TZLJrSmTI1ekXOlkvWpj8nlt3m
  z5Qs/bb0cABLwh+u0NlKLMUZiYZazEXFiQAV70AoaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1663064168!144190!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25790 invoked from network); 13 Sep 2022 10:16:08 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:16:08 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 35B77100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:16:08 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 29843100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:16:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:16:06 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-antlr4-runtime: upgrade 4.10 ->
 4.11.1
Date: Tue, 13 Sep 2022 18:15:43 +0800
Message-ID: <1663064143-3176-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
References: <1663064143-3176-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98766

License-Update:
-Metadata-Version updated to 2.1
-Python updated from 2.7.12 to 3
-Version updated to 4.11.1
-Description and Platform removed

Changelog:
===========
 a major rebuild of the Go target
 huge internal refractoring of testing and various target speed improvements
 Getting all targets to run on all operating systems using github actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ntlr4-runtime_4.10.bb => python3-antlr4-runtime_4.11.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-antlr4-runtime_4.10.bb => python3-antlr4-runtime_4.11.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
rename to meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb
index 01f17207c6..535dc022da 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.10.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.11.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ANTLR runtime for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6e514123aedb5d9fb133d1bc6c598d46"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9a0a1d20e667cf7ab7c59357cf8b4812"
 
-SRC_URI[sha256sum] = "061a49bc72ae05a35d9b61c0ba0ac36c0397708819f02fbfb20a80e47d287a1b"
+SRC_URI[sha256sum] = "a53de701312f9bdacc5258a6872cd6c62b90d3a90ae25e494026f76267333b60"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-- 
2.25.1


