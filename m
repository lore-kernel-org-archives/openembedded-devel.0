Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FE7C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:32:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.40282.1681115550709838299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XPSM6ZUK;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681115549; i=@fujitsu.com;
	bh=njhs/+Lcx7QfH4lPwEqnurDz6MDkEHy7yC3nUZ40PiI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XPSM6ZUK36oiLU83Abw1RjWeJpzUQx8yzBdOaqRDjgw3FR/1bNJO3imXQ/jEofnMZ
	 9Su3rYESE3OmcdK1vO6X0H5k/yoQJ520K0WMFr45n9mANh82qOLg5npJCY/sB3a68K
	 uuwVMfMnS782h6ALa9Iu8z77EjTELhR0rVwRr8V2P8JIQjstApmDy9bZcYVGbQGTqs
	 GlSah4vrG+p5ONvDBwWdyxPf3HKplSEOBgjVYaE6WBrAQ/ptZTXikUHieKiJTze7ce
	 MQHPZh8YQ3G2G4i6Z4h4zpyQl3+sS58qqTvB4L1oo8ytBnQWUuom2XhchgAmqlxrt8
	 /805ES49lra3w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpDvnpHG
  KwYmNChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bbl50sBf1cFXMOXGVtYFzJ2cXIxSEk8JBR
  4vi838wQzhUmiefLJzBCOHsYJWYsnsXexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgJ+EvMmnmECsVkEVCX2n/kCFucVcJKY8v8vWL2EgILElIfvwWxOAWeJXUc2gM0UAqpZ9P
  sJI0S9oMTJmU9YIOZLSBx88QKqV1Fi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXXO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDgTSlmereDcXnfX71DjJIcTEqivF1cxilCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgXH
  gDKCRalpqdWpGXmACMJJi3BwaMkwltxDCjNW1yQmFucmQ6ROsWoKCXO23oCKCEAksgozYNrg0
  XvJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNsOA03hycwrgZv+CmgxE9BiLhcDkMUliQg
  pqQam4iYhu+DnfckOpTr9vhZcN+TWTryZFPxd3n/OJ8+/X/ffP659mnvZvvTeIh6lpDurVeSa
  fjW0fa1eJei0fNsJnyMaj/e92t6eIsd+MTNlc/PmO9p8jLMaStbuYp47fVV0ycmj8r7rz4umG
  f/2WKIZxXRh3ew/VbKX9nO+sTz+xC45zdp131/eF67xu1s2PToxbUZbE+Op1hnicUmVK6+927
  N7hZ+oA9M2+Tkbj6rGCN5duWHJljkmy+fvZVFUu+B9LoEzzSRr5cWm8MuHQk7UG75+byNgP/l
  OpwczY9MinnlpMyVfOs3teCK+xiu/S9d0lbPrA4cDW73iHc4cmuboJz2j3WSPauyXEsXcrz86
  lViKMxINtZiLihMB+z/aSFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1681115548!192024!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5561 invoked from network); 10 Apr 2023 08:32:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:32:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 275D31C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:32:28 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1C6121CD
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 09:32:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:32:26 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.47.4 -> 0.55.0
Date: Mon, 10 Apr 2023 16:32:09 +0800
Message-ID: <1681115532-24518-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
References: <1681115532-24518-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 08:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102025

From: Wang Mingyu <wangmy@fujitsu.com>

Feature
=======
    Improve performance of processing incoming records 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.47.4.bb => python3-zeroconf_0.55.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.47.4.bb => python3-zeroconf_0.55.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
index dcbf8c32c..83027e5fb 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.47.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.55.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "d535fcadd45a3e8f1d27502750965f8d664e66a4c17e27508ef7d8d1b027f90d"
+SRC_URI[sha256sum] = "f919c0a1989af87c1c4a8786a3bcd8e78243856237cef27dcb762a7e69e4b32a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


