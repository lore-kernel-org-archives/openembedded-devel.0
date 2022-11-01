Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C52FA3741
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:09:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.1636.1667268536184811231
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RgTVQbXD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268534; i=@fujitsu.com;
	bh=MDu0Z/UVIF1i3yhzUuC+eMgDWc07/1oiHymeu2hHRCs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RgTVQbXDt7NY8Qz6PRMG8W50jmW4pXo4VHubCHyY8FexMCKH6ZGAhI4Sx5GmR1IjI
	 3t5HyJpjhLgDGnaT9xLc/cU3N72OfYiY11+Ekaj6+/Kol4nSVCSILE3q/QJqpMqlxp
	 mDanbwUoJ3lyp7v6me1YVoiDDBGOGwJ4CSaC/pgUBGgIVa9ROC/0+SSpyzKh6rZMpc
	 /0/6SKQrSaLRGeWCUNv82kNKpJ/WJMEnVngdatFf/e3LwaAYH3r34SyOyybmbizEeu
	 HsZMJmurEfZJ/uchSUjFZH74mml+VDp2OBBwmLngmGHwhV/XbHg0mKS570XF1caPyf
	 xSc4+1BMEis8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSXdrfUK
  ywfsf2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aN5ccYC65xVqx/f5GlgfErRxcjF4eQwBNG
  iUuvpjJDONeZJD4cesYI4exmlGi8fpe1i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGGBcIm2x//AbBag+NLGa2A2r4CTRN/zKywgtoSAgsSUh+/BejkFnCU+fr/FBGILAdWcfH
  SOEaJeUOLkzCcsEPMlJA6+eMEM0asoMftyM9ScColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA0N9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECwzelmCV+B+PDZX/0DjFKcjApifL+l0hIFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBG
  1kDlBMsSk1PrUjLzAHGEkxagoNHSYT3VzVQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4r
  xOtUBFAiBFGaV5cCNgcX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvA8glPJl5JXCbXgE
  dwQR0BFt7HMgRJYkIKakGpqnzr+Z4dpkIHJYMeVxx65OkcnrXNWchDwFx5juXKpflrok1nWwg
  /65b2irjxInVOx9ymAit14gyTUx8sd2pYfm2z5LmFfcOVsvEvLcU2/2zJ/37iu2TGZLMNuouu
  v+k0Sm3Z0v0JYtFlXuy0mYsz1n75cstnTOTRX9ruT9WdDxz8cWMHgYPntnVi65c8z/9gTV15R
  m73gOcFcuqMkyYWpmWGAduvbGy0kZq2501XwUdQ6bveGuRsHcOv6BK5Jy/D/numx5cdf/z7Ac
  X3is6TXizesKhD3ZdhgsYfA2fxSzMYZyc9MnpxqdQrm1c86tKomXSA5S0D4UdzZcwYjLYL7md
  8+4cMUfHlpInVx5O1FFiKc5INNRiLipOBAAnFm3IZgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1667268533!63583!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26568 invoked from network); 1 Nov 2022 02:08:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:08:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 553941000DC
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 48ED41000D7
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:08:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-requests-toolbelt: upgrade 0.10.0 -> 0.10.1
Date: Tue, 1 Nov 2022 10:08:00 +0800
Message-ID: <1667268480-10004-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
References: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99391

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...s-toolbelt_0.10.0.bb => python3-requests-toolbelt_0.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-toolbelt_0.10.0.bb => python3-requests-toolbelt_0.10.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
index 77b99a78ed..b2678952cd 100644
--- a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.10.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6f14302a4b4099009ab38b4dde5f1075"
 SRC_URI = "file://run-ptest \
           "
 
-SRC_URI[sha256sum] = "f695d6207931200b46c8ef6addbc8a921fb5d77cc4cd209c2e7d39293fcd2b30"
+SRC_URI[sha256sum] = "62e09f7ff5ccbda92772a29f394a49c3ad6cb181d568b1337626b2abb628a63d"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


