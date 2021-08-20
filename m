Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.85])
 by mx.groups.io with SMTP id smtpd.web11.80090.1629439777048295500
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MRnADnl9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.85, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629439774; i=@fujitsu.com;
	bh=kjxkjqGidCTeMU/frFxpMwZtIxCdGBrvQBL1SfK7s7k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MRnADnl9uJw4H7kvWwdcaVx1hpPI8QgV7+sSmNdP0/AI/X1QRw03jEScJ/iY5Ba1u
	 wuXaHSKXIQJq43/g47+6/8Tw5nY5MyxKx6zr+HqdnKEANDphtb+8fbp3vN7Y0sinXv
	 ebiJpOk1JlGAeYMAR4VevqBu4MoFTtQgxFpHvL7W6ZhzAwvZ842T49yx1MKRZLNrsO
	 JFavCj25XZmD4Kksi0KptqB9O18+j50Xf/TMMaWWW4aExWvqDfiYHcFD0k0VI6hREw
	 /kYuyjLoXJxVv77pbRF4gQYPLTC2YrL9HpZaa9k+pXWs/WHree8NVPbjPAD0j6zO2d
	 p/OYCE6OJ3I6w==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 87/EF-31512-E174F116; Fri, 20 Aug 2021 06:09:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqivrLp9
  ocHubssXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHl7RKWgkdcFcsfvGVtYDzF2cXIySEkMJtJ
  4vbE8C5GLiD7BKPEy54OdpAEm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373gNUICzhLNPVeB
  YuzCKhKXNhwCayeV8BJYuecCWC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRYnZl5tZIO
  wKiVmz2pgmMPLOQtIyC0nLAkamVYwWSUWZ6RkluYmZObqGBga6hoZGuoaW5rpGJpZ6iVW6SXq
  ppbrlqcUluoZ6ieXFesWVuck5KXp5qSWbGIHhlVJw9OcOxoevP+gdYpTkYFIS5VU1k08U4kvK
  T6nMSCzOiC8qzUktPsQow8GhJMEb5QqUEyxKTU+tSMvMAYY6TFqCg0dJhLfYGSjNW1yQmFucm
  Q6ROsWoy3Fl1ZJFzEIsefl5qVLivLxuQEUCIEUZpXlwI2Bxd4lRVkqYl5GBgUGIpyC1KDezBF
  X+FaM4B6OSMO9akCk8mXklcJteAR3BBHSEkKosyBEliQgpqQammV6ODhYCvqazAieyLdUqcz6
  foR/3QOPm9ZnH5U6yeBxP+djDqyP/tf3Hxr33KzQmfP/u5bMig+H9h9iTM9JlIkrM1/0J0biQ
  bL05ZWtHIavq12X7qnVr+D7XfGeZ+vW6SLzmNt0Zl79MuyH6tXnWYd9lP7LibxoIHnmUFKPML
  MNUYP70/c2Pej41jlK/uLIXqEQcNzzn8+npvInsReudxM7uenjK/sXmRpM+t32vy1RYyiNO/y
  4I7Qi+LiLNVBB09MmN+NtVGW9Kfize+opvE2Prjd1/919dc/BdaMy6rIlv1ew+irjxR+yIO8i
  fdlDs/77tTCGh1RO5e/zObOpVO7xEIczS/CgP7/rD6zf5KrEUZyQaajEXFScCAEdWiM42AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-285.messagelabs.com!1629439773!352536!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26479 invoked from network); 20 Aug 2021 06:09:33 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:09:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K69RXo001418
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:09:33 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:09:25 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] c-ares: upgrade 1.17.1 -> 1.17.2
Date: Fri, 20 Aug 2021 14:09:10 +0800
Message-ID: <1629439750-46207-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb}   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} (64%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
similarity index 64%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
index f9575a3fce..53cc1b68f0 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
@@ -5,14 +5,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.17.1"
-
-SRC_URI = "\
-    git://github.com/c-ares/c-ares.git \
-    file://cmake-install-libcares.pc.patch \
-    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
-"
-SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
+SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
+           file://cmake-install-libcares.pc.patch \
+           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
+           "
+SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.25.1

