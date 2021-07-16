Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.1143.1626401446657567467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xewY3U1W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626401444; i=@fujitsu.com;
	bh=cg3CzsZc5uubBBbDkocYiLeiu9nb2jQX3cp6z4h+vb8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xewY3U1WdFbiOzaxXHd2PmYLP6U+POOj4KLxTseULJM6bUKL4eWvWMRwrJ26GJ3uI
	 DCorCXPkMKrHPlxo7h+8NSGD2wLguebsigpSdjwUID5lM7Axt4tBdY5bxzPLdqPi96
	 zkd2R4rhw+tPHSue6QbgH2FbIIW04IfRjEp5cUw5h6GNNzkTXdDBgp6PDcdTwt51Ap
	 gkMr0+jisW0GbZTLhiCQ366uOPtULexIaXY44oyAOZqIV9akp+JaOJJ8PWvrBfkgnN
	 y9yAKDT7puVIcLn7afKN6l9P/PH9ADKQCUGcPV36Yek/sWKrP3X5BWfVRYMnrDapQ8
	 b2XypQ6lUN9tQ==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.symcld.net id B6/29-31114-3AAE0F06; Fri, 16 Jul 2021 02:10:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MRorv41Yc
  Eg+ajghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aVGbkFn9krlqz8ydjAOJu9i5GLQ0hgG5PE
  tOe/WCCcvYwSC/9eZO5i5ORgE9CVOPd4LTuILSKgL7F09h6wuLCAk8TViUcYQWwWAVWJaR/Os
  YHYvAKeEr8nHQarlxBQkJjy8D0zRFxQ4uTMJywgNrOAhMTBFy+A4hxANYoSs6fLQ5RXSuyZ1c
  80gZFnFpKOWUg6FjAyrWI0TyrKTM8oyU3MzNE1NDDQNTQ00jW0NNI1MdFLrNJN1Est1S1PLS7
  RNdRLLC/WK67MTc5J0ctLLdnECAyhlIIDOjsYf776oHeIUZKDSUmUd/3lDwlCfEn5KZUZicUZ
  8UWlOanFhxhlODiUJHiVngHlBItS01Mr0jJzgOEMk5bg4FES4d18ByjNW1yQmFucmQ6ROsUYz
  vFm7ZJFzBxvwWTbvbtAsh1MzlxwcDUzxywweb/9EJB8ACKFWPLy81KlxHnFXgKNEwAZl1GaB7
  cMFq+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzMoNM4cnMK4G76RXQuUxA52qveQtybkk
  iQkqqgSnj7KXNVc9r9FS7TlQ91rz3oWPm1I+bGqNKCnULRMp+KPKyrSovSFK3mLDcfLrQ2Y+l
  k75umKhlNlevUN48dGruEu9vCTwfjH6Yh/9T2vm6peCV6bkdhsnpR3dMmHU0813kubc+YY+UX
  h0Per+ux/jzDParMroSkmrGXaZ2H1RqN6ZutZ63/urGiAnuYucKrsVM22fRudmy7HtWzhsJr8
  Vsdxjv9rOz3m+ueO3CvidztwTLmdWxTP77JvixrefmEmFex5/TenO+mssank7tI0/sK5I7LjK
  VhIoXMfp/tRB8MG2u8snfc1gSHb9vS78ZlmGi1f9wRWnn8xnzPf+76no4bQ2VmTjTV2Zvi5BQ
  jBJLcUaioRZzUXEiAHMfDXpSAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-271.messagelabs.com!1626401442!45570!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12740 invoked from network); 16 Jul 2021 02:10:43 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-7.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 02:10:43 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1SORo009272
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:28:24 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:28:21 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] span-lite: upgrade 0.9.2 -> 0.10.0
Date: Fri, 16 Jul 2021 09:28:18 +0800
Message-ID: <1626398898-103342-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../span-lite/{span-lite_0.9.2.bb => span-lite_0.10.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/span-lite/{span-lite_0.9.2.bb => span-lite_0.10.0.bb} (86%)

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb b/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
similarity index 86%
rename from meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
rename to meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
index 16b7c3e540..4cf0dee112 100644
--- a/meta-oe/recipes-support/span-lite/span-lite_0.9.2.bb
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI += "git://github.com/martinmoene/span-lite"
-SRCREV = "126453198fe2236b31ddfa7353e95d3a06c478ab"
+SRCREV = "2987dd8d3b8fe7c861e3c3f879234cc1c412f03f"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

