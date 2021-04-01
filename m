Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.3506.1617256549746189336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 22:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TcpDALU+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617256547; i=@fujitsu.com;
	bh=t4SCSijCnl5ov9htpNUXgN8NEOCdAQnGbOkWHuV/FPo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TcpDALU+gy2YYTN0IozSGXwFR7//5nepCh35Otvz6foSHWGiAyusjhXdqePhTu8nQ
	 3lVISpXUM491YwR/rRMelAtPFUDOSJ++Cn6emmmBPKnNt8op+Jbw+b6xi24hHeykVG
	 zsEP/V+e4q0ivLC0v02AWZuct5paQB65PPLO35ORTIJY5wIIZ3tzlb9G8/NhuRKRmX
	 8cqfvOoKPmdMvLTPDPWDdlf2uhARjiPrHI10nMXH8JDVAuQ2o79RHg6Ac1Tzt8leyq
	 /p7J92i3FBXlFLHW87P3hUxjAC3Q77hL71Q3aAYA4uZwUv7ZCPE6rj2qMLEV6cg4kM
	 H9PaAXIDV63pA==
Received: from [100.113.7.82] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id D7/E1-44603-36065606; Thu, 01 Apr 2021 05:55:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRTc5ITX
  BYPoDEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNKfzd7wX6eioXHLzE2MK7g7mLk4hAS2Mok
  8XPrDyYI5zijxMLXb4AcTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBG4mVD/ewdjFycLAIqEj82
  FANEuYVcJNYtHArK4gtIaAgMeXhe2aIuKDEyZlPwMYwC0hIHHzxghmiRlFi+84zLBB2lcTZ2V
  +YJjDyzELSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGxrpmuhbmeolVukl6qaW6yal5JUW
  JQEm9xPJiveLK3OScFL281JJNjMAwSilkC9/BeOb1B71DjJIcTEqivFOmpSQI8SXlp1RmJBZn
  xBeV5qQWH2KU4eBQkuBNj01NEBIsSk1PrUjLzAGGNExagoNHSYSXASTNW1yQmFucmQ6ROsWoy
  3H5+rxFzEIsefl5qVLivDbxQEUCIEUZpXlwI2DxdYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6
  OSMK89yBSezLwSuE2vgI5gAjriyqNEkCNKEhFSUg1Mmjc33r742iDn+Drr43UHFlV6ah+/+2B
  Gkv3uhEbee0026pJhxg6Ta36Inz4YX9RW0/R5ctYq4Yi5Py8z3vKfxrRcSilTYrEjG8+S7VVN
  r+0OGa19c0XkO9O6EDZj+2OuszKP6S9Qe95VbLjqwrRPB6cvnsUuVpl79cR+1c6tXzyMj8b/O
  mm2Jkptrptc6fN1hu/Ev0TVPjx/0n5TYOtcFW7La8r8+zJzn6mtczxkERAcK1Q/o6HDwTfNw6
  uhtbyDuWb5X51oo3V9ST032kU7Mtp+aqaEztV+Wp2gUK8RnJcbPffA6fzHceL+9+dEXmH7xzo
  lKDY4QMpMVMDx2LH644/42qWNvy7anLhT+rwSS3FGoqEWc1FxIgDPYn0kKgMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-238.messagelabs.com!1617256546!406412!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26518 invoked from network); 1 Apr 2021 05:55:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-16.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 05:55:47 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1315tkTY030298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 06:55:46 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 06:55:45 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] xterm: upgrade 366 -> 367
Date: Fri, 2 Apr 2021 01:55:39 +0800
Message-ID: <1617299739-4528-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

-License-Update: Copyright year updated to 2021.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
index 969159bc5..e0d3dcec1 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
+SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1

