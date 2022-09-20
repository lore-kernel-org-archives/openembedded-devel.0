Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CACC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:10:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.7234.1663639809050675498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=d4FO1KDZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663639807; i=@fujitsu.com;
	bh=GArCcTGEW/oqM4orTz7H3DgbRSy9yo1iFTvWQ5RgA3c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=d4FO1KDZUfBZrzgLLNgeMf6kvM2rlHtizeZBt1LBhKyV/RsNdmup/FdOlYHKOhmkL
	 tfTDEoiD5ej8pahmzMlJWtmoRJ8+bt1P1cqRYuyJnal0FIEtx9O8+0SqbvzIO0vMdN
	 Aphvji1uhuRZU4wUHFOnMG1rmUIc7dTn9OScZ5ZcA8pFeWNXLA2DFpF2Q/Q0FPGlm8
	 9aNy7ATrYj8YTZYrcxyoo0Mw+Ac6WUMJlR/hoZJGxc+5L9IpjEsNUD07ZMls5UdJCZ
	 DwTpcJpN/k45U1x56jiczNl1XX4EHNNroyuTGcxI4C0t5fmDXwoD5K8thGRMbafpj5
	 U1cJjhvd4zUOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqPtPQTP
  ZYOkhSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaOl5zRrwQaOik9tNQ2Md9i7GLk4hASeMEo8
  WNLG3MXICeRcZ5LYe1gWwt7DKPFjmyiIzSagJjH91g1WEFtEQF9i6ew9YPXMAioSL373sIPYw
  gL+Eg+2HGcDsVkEVCXa790Hq+EVcJLYMu09WK+EgILElIfvoeKCEidnPmGBmCMhcfDFC2aIGk
  WJ2ZebWSDsConG6YeYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3QNDQx0DQ1
  NdY2NdA0tLPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQJDMqVYYe8Oxssr
  f+odYpTkYFIS5eWq00gW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrL6iZLCRYlJqeWpGWmQOMD
  5i0BAePkggvmxRQmre4IDG3ODMdInWK0ZJj6ux/+5k5loPJmV/bDjALseTl56VKifNekgNqEA
  BpyCjNgxsHi+FLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5w0Gm8GTmlcBtfQV0EBPQQTd
  U1EEOKklESEk1MMnsudV0YIXNJJllU8Of1IrESUec1F35O2RrX+J25v8X3aR0V1hla3Y33XPY
  JymUzzI/5XUc55RvrhO3y6zVujTLZ/eOG2uXTlJgr7/McmvHh9dVLwQZF8eznZ3w4+i21d0co
  irBJmdCOqbdfbb+zbEj8W05HLPcLDXfCSuscTm1Qem5xep3k+zt5B7qH+V8KF8for/0bFKFaS
  NL5ErfXYnuzm46c5OTDuvyiYW1lhZFs5+aXvDtoiybenJwqb9NzPz/6ksO2mtvNso+I++37VK
  s+Id1HX/3BAoVfXexMn99/piu8ru0tfpXHewyypSSyzLW7s/uvsqx/Z5p8mRP1x9VFgcLZQ7K
  yBqmHFvfq8RSnJFoqMVcVJwIAD7JsgpcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-565.messagelabs.com!1663639806!32394!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19955 invoked from network); 20 Sep 2022 02:10:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:10:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 24F38100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:10:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 18EC9100197
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:10:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:10:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220904.0 ->
 5.9.20220911.0
Date: Tue, 20 Sep 2022 10:09:52 +0800
Message-ID: <1663639792-26815-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98868

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220904.0.bb => ctags_5.9.20220911.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220904.0.bb => ctags_5.9.20220911.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb
index be50b36766..890e786320 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220911.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "096dc1c1337edeff41c3e6600553c3b43bdde131"
+SRCREV = "fe5a84edb2951734489be8aef29c2d0bb296649c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


