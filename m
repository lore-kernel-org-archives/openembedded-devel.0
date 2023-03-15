Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AE8C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.9009.1678889348938816333
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xGQF7MTA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889347; i=@fujitsu.com;
	bh=FZJK7xzTCnulsy0zb/xSa1M1LdWgjRARXCVzgwLnqUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xGQF7MTAvj736hCtT4OLDnUGOI/OkCjyJf1+WiVuA9KKj/RGBLMODihgcC7FF0Pvd
	 kgWU6WjyjAiGPKhBiVorrPOB7cD7/xzOwrwEW7GEHjuvs6oiB7heQhsDYAb3p1Q1D0
	 EJifSgXhv6dr4FXTwByeRwY08IvhtJsaauNZAC8niAub7C80NJ4/HTNhAOoGvGJjpM
	 0HVVRj6BrCc8IPJcAkj7vEv9Owl7VbpQZP3wd29/aAXxFz74IXDUatoBbEyehYLVsA
	 VYbm7ZPF6n7c8+fnKIWxo6qUCbm8VNWkb9vyCUxoZxRiPS9xTjvzIi0zZRBqkKq2OL
	 bMB1i9G5YaN5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWbf5omC
  Kwa0dbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atXbsZCx5yVTx+u5m9gfExZxcjF4eQwANG
  iWe//zNDOJeZJC4e28UG4exhlNj85RdQhpODTUBK4sb9/2wgtoiAvsTS2XvA4swCKhIvfvewg
  9jCAt4SOzcdBrNZBFQlujfOAKvnFXCSuLRyLyuILSGgIDHl4XuwXk4BZ4lr15+zdDFyAC1zkj
  hwtw6iXFDi5MwnLBDjJSQOvnjBDNGqKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuobFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJO
  il5easkmRmDwphSrt+5g/Nn3V+8QoyQHk5Io7581AilCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hj/nRFMERIsSk1PrUjLzAFGEkxagoNHSYQ39TxQmre4IDG3ODMdInWKUVFKnPcvSEIAJJFRmg
  fXBoveS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeBbOfJzCuBm/4KaDET0GLeeQIgi0s
  SEVJSDUzWDQbpVxTyLBh/lp5atdTkW7Ks8Nu1hT5xjfMclx39tWyvSifLPZX1Gy/fKCpWkDuu
  uT5C8sjT12zZ6VuumG3PdBA602j66nGkTXFu0FuPrV2XNnaaFTny+YWsUVETczI7o8X56uETh
  8THH6ZH/9r9aPWvCbetCzouLli/sKGOb4+go/Xk3/M+2hj2r5gfljq/PcM93ba9c0WExevYlO
  wJX/IlV7PvPPJ/2aUT6f17ZotsU1yh8CT+hZPE97tHi8p52yYrWky71DZtUiBrZ3LGwXWKr9h
  PBE3u3yuRODngzmR+hb9M4a/2lxWvse/Pyew49qP3/b1ibW2XVfXsW+eyLs7on6vhZ90n/bq7
  O1uJpTgj0VCLuag4EQAGymEIWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1678889346!117189!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17777 invoked from network); 15 Mar 2023 14:09:07 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:09:07 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id CD1537C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:06 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C0BB273
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:09:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-smpplib: upgrade 2.2.1 -> 2.2.2
Date: Wed, 15 Mar 2023 22:08:35 +0800
Message-ID: <1678889317-20778-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
References: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101555

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Added python 3.10 tests to CircleCI
 fix socket recv error being silently ignored
 Refactored Client.read_pdu()
 Refactored Client.send_pdu()
 increment sequence of commands as spec (fixes #214)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-smpplib_2.2.1.bb => python3-smpplib_2.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.1.bb => python3-smpplib_2.2.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
index be0bafd33..5c635d6fb 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "c0b01947b47e404f42ccb59e906b6e4eb507963c971d59b44350db0f29c76166"
+SRC_URI[sha256sum] = "f2191e73b24dba94f2889bf2ea1a60aeef6bd43afd3ddbbc632d7e41d9f30e47"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


