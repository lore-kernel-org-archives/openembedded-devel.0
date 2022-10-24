Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085C1C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:45:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.16540.1666593925827382850
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=msohYEjU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593924; i=@fujitsu.com;
	bh=0ldnPdd6mPgdNekk7IQ28SIBLQxEfqO2sHqxwLm+R64=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=msohYEjUoeQi0mcHE0T3SLpq7fLqzeq6wWHPwNLQAI7N/q4jhvakHrcbGBwf6Z2ld
	 K+cxLD+gN37wfjGAAxKvbfDqAVGel004K0zb/f/Yrgydloy7LUiFlfwtGDxuQVWPBA
	 pF+KxzhHsXEjQSXa9HNsW4wuud+hqhePCuSr8785pEy2gt+oBtzAlUko7UXRrY8IBx
	 4xmZul0OO7v83+4GWlsRZlvSiMRO16b2V4NR3X0pQp2ro3acW8A6C6crr94rtqIm8A
	 zXxCoBxVqwrH+oJeucb1KRrdQ6uBfNi4/tIaxNDEHfepnTDP0cpt88zxSYPbZUK2xv
	 pFe4r+8SbTcHg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWbfZJCz
  ZYNkyZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePfds2CnVwVS3fcZW5gfMTZxcjFISTwkFGi
  +fp6JgjnMpPE95arLBDOHkaJhrU/2boYOTnYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWiJNYfu0uC4jNIqAqcXfZWjCbV8BJYvmz62C9EgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNamOCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3StdBLKspMzyj
  JTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzFlGIm9x2MR5f90TvE
  KMnBpCTKyyAelizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgrdGCygnWJSanlqRlpkDjAuYtAQHj
  5II7ywjoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5TY2BigRAijJK8+BGwGL0EqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3tkGQFN4MvNK4Da9AjqCCeiISyuCQI4oSURISTUwqW7
  XWN5z/mv5L8lbU7dt8Xs/gSXI5a7cHSfNpc3zbtto+FxS3PuT7Xrq6u5z/8UuvPzq4Zp/2bS9
  temD1aSvG9clssZ+bInblnPm3PE3k3xWJ07/JDCTeXKa5IkLa8VNrRScL3yvVwo1vpM65eiuy
  x4zyliMtC5smv/e7fU5QffOjDcKM2QUC8z6/Jltqw9uf/pUQHbDV2fB2h+rzl16yqR55lvD9Q
  bRl4YLJ2ftPMfaoHpJot20qu2rzv71Cso/rzx2t9jn9EpQRlA758XCetvL+WXPenqZD//N4vd
  9c36d7uHKI0HsG0Rj7h/oqa+dbprfXfOn2nyVwoFHMh1HtzrnrgrrXbz+4dfY+T9kPyixFGck
  GmoxFxUnAgDHRWuaTAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1666593923!196141!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9060 invoked from network); 24 Oct 2022 06:45:23 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:45:23 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 36CF7150
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:45:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2A28073
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:45:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:45:21 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.64.0 -> 2.65.0
Date: Mon, 24 Oct 2022 14:45:05 +0800
Message-ID: <1666593905-28838-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99275

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.64.0.bb => python3-google-api-python-client_2.65.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.64.0.bb => python3-google-api-python-client_2.65.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
index af83c1704c..4246d461e9 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.64.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.65.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "0dc4c967a5c795e981af01340f1bd22173a986534de968b5456cb208ed6775a6"
+SRC_URI[sha256sum] = "b8a0ca8454ad57bc65199044717d3d214197ae1e2d666426bbcd4021b36762e0"
 
 inherit pypi setuptools3
 
-- 
2.25.1


