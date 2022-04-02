Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1363DC49EA4
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.2669.1649137162853127705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lcrkdHTL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137161; i=@fujitsu.com;
	bh=Ye+oE56kO64wDl6ouZFGwS7nWiW4HVrTlvS/h/7UvL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lcrkdHTLaJDgef2G4PCLGGDd8Mh49Quxf4lYcVPJI6uXAncd5WebxO90nGJJ7L3DB
	 Vl8eNdoZo5Yqf7gKepQfYO47QhmC1Mwh2LvibkHxqTm5b4OrvO+XeOdZ8PDwABATg7
	 SNycFfz4IFOIOh8bmhjbV0+kxMqSdWO/ekvpdNQhnW479k0C3eDdlsmy7HstFazxHO
	 4sKq3yHcrcVhoaJ9gm92Xl3fyVCSiRbvA6wnyFPmvUXmUegbt45l/iAb9iymsbOwhX
	 /3XUwCc+qVkIE3QTfMm0IB4WD4jqdssiAiFM2gklh/Ty2WTVkS1VjFYFVd2r6frgwP
	 Y70xDQxlktMjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqMtxzTv
  J4OYkeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqzm+sBb85Kpa0zGBtYFzC0cXIxSEk8IRR
  Ys3XSWwQzgUmif61C5ggnN2MEi0LTzJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBD4mDzGxYQmwUo/nXtJqBBHBy8Ak4SvTuTQcISAgoSUx6+B2vlFHCWaG9vYAOxhYBKJj
  9ewwhi8woISpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01QWSpiZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSzDBrB+Osvp96hxglOZiURHnPuHonCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgPXkWKCdYlJqeWpGWmQOMKJi0BAePkgjvkYtAad7igsTc4sx0iNQpRkUpcd6bV4ASAi
  CJjNI8uDZYFF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzLAzKFJzOvBG76K6DFTECL353
  xBFlckoiQkmpgUtj5QtPWa17H95LaZpk5bPNYcjZIyWY+Tjv+Q6psZ/5D53mhL+QPRbdY9LY9
  FLz6wPvVNraAv9rX2ned32IucebQGs4DB1iUpt9d286csi/x+jsvPqkreTcfhsk8/at/PKN4O
  d+UeSFfLNINt6nk/H5qxJjWmvc4xjK7plqopOTz1oPLVHeddOu6dDRn3uSqA+s0H3xb8sTZ/Y
  bXSUPW32fEko799+2tuXtA/ecErbldJ7ZEbvNlzP/KcvrJlcMXMvPKkn7tCbEUe+D/qOFSl/i
  0pAVZc37e2Omv3/sq93j/3m5L4birclJ75aYlGpxm3fKMkbOvRtd8K3cZ86mFDIcTDri2fnu1
  fc6FuMdrdimxFGckGmoxFxUnAgCvtW8zXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-585.messagelabs.com!1649137160!342583!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3494 invoked from network); 5 Apr 2022 05:39:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:39:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F3DC71001A0
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:39:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D596D10019E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:39:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:39:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cppy: upgrade 1.2.0 -> 1.2.1
Date: Sat, 2 Apr 2022 20:35:07 +0800
Message-ID: <1648902907-19815-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
References: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96406

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cppy_1.2.0.bb => python3-cppy_1.2.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
index f86f571938..b84b46164c 100644
--- a/meta-python/recipes-devtools/python/python3-cppy_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cppy_1.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://cppy.readthedocs.io/en/latest/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0bfb3e39b13587f0028f17baf0e42371"
 
-SRC_URI[sha256sum] = "95e8862e4f826c3f2a6b7b658333b162f80cbe9f943aa0d0a7a6b2ef850aeffc"
+SRC_URI[sha256sum] = "83b43bf17b1085ac15c5debdb42154f138b928234b21447358981f69d0d6fe1b"
 
 RDEPENDS:${PN} += "python3-setuptools python3-distutils"
 
-- 
2.25.1


