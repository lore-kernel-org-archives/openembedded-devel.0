Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.2606.1623982571124029932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xSy691+7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982569; i=@fujitsu.com;
	bh=9A/YmpSi1dYxQkC6LI+s3EPf1cDs5A2un2+cpENgMSY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xSy691+7crGPGgBYY6ZTQrWNxQW4RXpsVHgjHMtdHCFKecDcmegkjt8QAmGIJPZwj
	 Ms/UQHwy4FE0mH1tYViCQG8ezqdhZqBbiud9WrR1HtzIlc3vdRihrpz63l4hNfOBge
	 kEr7+Yi7Yi3Zs5fRfyezGhFQztAmoAxdiAg1B4+Ihv9LT/zI4j71pRPtbIEeTK1gK+
	 zDv8vshPDB9u2xTfAqMvz9CJqRZHq76qiuFtPphmMFJFvrjzd54Sp7aeSaqmdZBaFc
	 ivLiCj3hEYjrsg4+qg90OopDX/Jx6BLBt0aQ5hoXH3Y+YfrIJ3EXMj2cL98BqbpV7g
	 JgPytCPOHfTeQ==
Received: from [100.112.199.60] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id E6/57-36719-8E10CC06; Fri, 18 Jun 2021 02:16:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYovuC8Uy
  Cwe4jIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aK7XuZC2ZyVEzc3sHawHiUvYuRi0NIYDaT
  xPPzH1khnBOMEsdvdrN1MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC3hLHLrxkqmLkYODRUBVY
  tssbZAwr4CbxO5dPWCtEgIKElMevmeGiAtKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0jMmL
  GNbQIjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmma2RoopdYpZukl1qqW55
  aXKJrqJdYXqxXXJmbnJOil5dasokRGEYpBUeu7WA88PqD3iFGSQ4mJVFeq5enE4T4kvJTKjMS
  izPii0pzUosPMcpwcChJ8Kr8B8oJFqWmp1akZeYAQxomLcHBoyTC+4bhTIIQb3FBYm5xZjpE6
  hSjopQ470eQhABIIqM0D64NFkeXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzpoFM4cnMK4
  Gb/gpoMRPQ4jahUyCLSxIRUlINTM59+1h1T/dmB/5Ze0q999HNqMuKcq3LzTy/87w9Mrv5vOC
  6JZd38S+Ze6Jhg6j0Nvb/bF3rnXaX6W3ay7JDYEb/dUtWgYuunk1HOAK5w7cxxysfV2NIffpz
  2r5kl/oqfgX13/pCDwuVxE8fmGcj+l6/vtPd1O2Mpjm/3yvl8xuOOj6/JaP1OGDKuc35doGro
  3xbfrbO3t1ss3DZjRzBdy8WyDe/kFymr13G77X5idtdbtWooxfW3VKdPVVK8+6/mXfbDrVe7H
  3YNmVRPpfmCybPa5/kt5nUaTB7uE1s5peUc5ZR9HxUNMfkTmGay2m5ia9XffGZ93eh7pqcJSX
  FSqKe/UsmSzJkii9OCc5apsRSnJFoqMVcVJwIAEpBBAEeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-291.messagelabs.com!1623982568!70475!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3138 invoked from network); 18 Jun 2021 02:16:08 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:16:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2G72r005457
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:16:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:16:06 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210606.0 -> 20210613.0
Date: Fri, 18 Jun 2021 22:15:58 +0800
Message-ID: <1624025758-7350-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210606.0.bb => ctags_5.9.20210613.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210606.0.bb => ctags_5.9.20210613.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb
index 471b8edce0..f0ac4f615c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210606.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210613.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "92b49e2ef6961d6b39890f430a56478ec9e5e82f"
+SRCREV = "f3ac807427e07f04b3b9225d61c339b3e8b4925f"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

