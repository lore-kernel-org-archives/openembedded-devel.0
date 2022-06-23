Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE93DC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:10:06 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.4648.1655968199186550733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uBDyY5L6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968197; i=@fujitsu.com;
	bh=yTFUy2P/KGfFvwBa5wMivBCzcaOFu0DI/7QMcmu4DOc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uBDyY5L6WGEbmwI03/2NyLj0s8RzDxuA/wCTMkJnrf7eXoU5TTGnie9iSq/r6KkOu
	 U5GpVM3nfcaIr56+LplRUghiYDDZFF32gnzV5qYSUbLeArB+EPWWxWA5Sy2dEQ71Kj
	 2RHh5JvjP63xNCLy1yGRjnQKEP7m3P3F1ymKqtF9VLlptBiiWDrbUO3IKGnIAqoA53
	 13IcGlSUEzFGC6ySXhf+4ze5O1268UW4hGv+OP28qEjNzQjZe50HbeWjnDvAFhO9Qh
	 4c/HlCOrD9YKo4FtAZLUe3xRrmTTuGmFd56RpB4rY+gCICieL+Oa1Q+VWLsVbcC8i0
	 Eld9h95m8s9Eg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWfeo4JY
  kg3/LGS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owHZ06yFXzirLi+8zJrA2MTZxcjF4eQwENG
  iR2zHrBDODeZJP49ewrlnGSU2L+hmaWLkZODTUBd4vHN14wgtoiAvsTS2XuYQWxmAVWJ7otr2
  EFsYQFPievH54DVswDF1769yQZi8wq4S1xY/hysV0JAQWLKw/dgvZwCHhJHNq1gBbGFQGqudD
  JC1AtKnJz5hAVivoTEwRcvmCF6lSROrPjIBGFXSLw+fAkqriZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo2VSUWZ6RkluYmaOrqGBga6hoamuia6lsV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJO
  il5easkmRmAQpxSzxO5g3Nr3U+8QoyQHk5Io7zPeLUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hgv8QPlBItS01Mr0jJzgBEFk5bg4FES4Z0DkuYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  hvAxtQkQBIUUZpHtwIWHRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wuyiiczrwRu0yu
  gI5iAjniyfAPIESWJCCmpBiblqcyz3u/snrPs4bYpnm/z+kplcz4z3lCJrnu54+aWdXmvNyb2
  5Yre3ph8QZeb6ZuX0+zvf7b3r9hvGGI8tSF6o26yd2yd8ZsI88hLUlsXTrItndv55P2rHzNFh
  U/vetqo+kyjvoAt8tHRMJ/Hh4p+WLf/CDn2drFOZcGN70VzeebO32e04unjNyZGSwV2TLnVcu
  tZ3CEu9ob1eqV2O80CxLe9v+sgcJFNc5t7xkX1aXGv17ix/zvW/cDpnWW08dSDLNEdN7awz5m
  +b3LgZp6vmn5Tj4nFyr3u3rJe7cN1jdNv9fxsbFaV/GbOcjGoFZ6a3aJwIV0l/lvegy23Hs8N
  nJXp0Dr3/xRds8v37bYlKbEUZyQaajEXFScCAPVjEzdpAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1655968196!41502!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23198 invoked from network); 23 Jun 2022 07:09:57 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:57 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 94CB6153
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8842973
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:56 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:54 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.3.1 -> 4.3.3
Date: Thu, 23 Jun 2022 15:09:37 +0800
Message-ID: <1655968177-15916-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:10:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97583

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    Fix Lock crash, and versioning 4.3.3 (#2210)
    Async cluster: improve docs (#2208)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-redis_4.3.1.bb => python3-redis_4.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.3.1.bb => python3-redis_4.3.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.3.1.bb b/meta-python/recipes-devtools/python/python3-redis_4.3.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-redis_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.3.3.bb
index c0d9c0064..66051d420 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.3.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "94b617b4cd296e94991146f66fc5559756fbefe9493604f0312e4d3298ac63e9"
+SRC_URI[sha256sum] = "2f7a57cf4af15cd543c4394bcbe2b9148db2606a37edba755368836e3a1d053e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


