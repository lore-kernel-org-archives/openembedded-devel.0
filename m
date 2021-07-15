Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.4944.1626335530317737347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 00:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rNfb9GpP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626335528; i=@fujitsu.com;
	bh=qdpMsmLUmYKlWWwPnEMTVH7VQ07LGBUbBPwiA2U7qSY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=rNfb9GpPsWgH8NRQq1wIFjhSuTKTYM4FVhtX8wiM/qrp+1ikqN5qLK/sCO8paB2xN
	 +h8uEvVjARWbaVRUR7yy66/uMITuibfhA7iaYfwtzw6ej0XRomWM4Kj/+ACRaxVe+N
	 Gq/OTPReBezOMovR0ljxugorUH/EW3/vkfsRy/I9e4fxgTFKxNKG5WlR0M9IcpFnaC
	 aDxKYT7oPpnSmbQRa5dygewluKkaxmIrgr/ORNBRz8+aqtuHI2FcuRTwqYg5Hts1/2
	 9pUntxd4kP20BUR4byT7M9Yiu1Mbvf7OEJ53ebyCce3e11K0jiAxFvVx+y+HA1vZlA
	 mOK+f9GDT1tfw==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 43/58-07839-829EFE06; Thu, 15 Jul 2021 07:52:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8MxVVfj5fs
  Eg+WbGS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyXbxezF0zmqDi7/jNbA+N+9i5GLg4hgW1M
  EreedbNCOCcZJd6fuw7kcHKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw9QNweHsIC/xP07L
  iBhFgFViadXboCV8Ao4Sfx42wJmSwgoSEx5+B4qLihxcuYTFogxEhIHX7yAqlGUmH25mQVkpI
  RApcSNx6kTGHlnIemYhaRjASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLIDYx0Uus0k3USy3
  VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDK6UggMTdjDuf/1B7xCjJAeTkijvptb3CUJ8Sfkp
  lRmJxRnxRaU5qcWHGGU4OJQkeL8/A8oJFqWmp1akZeYAAx0mLcHBoyTCy/kCKM1bXJCYW5yZD
  pE6xRjO8WbtkkXMHG/BZNu9u0CyHUzOXHBwNTPHLDB5v/0QkHwAIoVY8vLzUqXEeY88BxonAD
  IuozQPbhkski8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZdBXIUT2ZeCdxNr4DOZQI6V3v
  NW5BzSxIRUlINTHa35/1avuhtGXPnC9doCbYNrn+PlFbt6V2pLepS2PiGM0RrZenehGzZh18u
  xUQfuiHe6BvAI+3t+ab7rsN0jftxMmwvy5N97PhZDQM3RPfPm2h56aPQivdbXoiuFAn93Faoc
  /33WxWDn/5bbv7p79n6M+H0mvLsTxOPCbFeV368/OuKv8rqrOdSOq0UP3RfFn8Ve0ny4Z27UQ
  7uE7oeb2M79nChwa2rLntSu45Pmnox1Mqbb9MExsP3V3YZ29Z+bNt/Xv5S9Ezp44Ku0d9+hO3
  VPfbmzduTJa7Jz7qWetzmVJi1cILkxt1+4akGv2YpfYzIy+Qq2VMc9846omPPxjcnG6r4biu1
  R/OfOVRQtEyJpTgj0VCLuag4EQBBhvyaXwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-271.messagelabs.com!1626335527!218857!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8528 invoked from network); 15 Jul 2021 07:52:07 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jul 2021 07:52:07 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16F7q435003387
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 08:52:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 15 Jul 2021 08:52:03 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20210627.0 -> 5.9.20210711.0
Date: Thu, 15 Jul 2021 15:51:50 +0800
Message-ID: <1626335510-25374-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20210627.0.bb => ctags_5.9.20210711.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20210627.0.bb => ctags_5.9.20210711.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb
index 7d01bba697..4be634b38f 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210627.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210711.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c436bca61f1fb92d2c6d5767ae4b307efab678f3"
+SRCREV = "c81079788bfe650190db8ac9df80d63d2bc160aa"
 SRC_URI = "git://github.com/universal-ctags/ctags"
 
 S = "${WORKDIR}/git"
-- 
2.25.1

