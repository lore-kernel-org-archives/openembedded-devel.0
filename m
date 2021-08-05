Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web12.6301.1628152539816304867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 01:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZO4/2I9Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628152538; i=@fujitsu.com;
	bh=ntNie/vR+gE9+dzpdyvHuoOokzYAkri3UZngNNfBx5w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZO4/2I9ZRP+VZOf6opA7F0JtKXTnHp40QJQkp6CMzY3kDsFPV0nC0gsTYS9cxaLnZ
	 wxpJE30BgJ2TN8X1wRB8MuB8B6rZrBcVq97JhmAtj5/eq0jvcBLhWPpGFIk9cOJh2C
	 mU/PUEGEvTngQd1Eh1uP8pvFKTmYogW6tpgwT13waCUszPTzBCTa7ZS05vLwpnQ7Ss
	 JR/v8EJ1tlMC0nDnFmKejAt91l4bFN5CZD6UipFEJaE5t1cdJ3ZvqqjNrT76HjA9bc
	 Tk7ehBfxNFc+xl8OiNJEKGG5W2PXCuclnjUFYYR/M2TyWcuDq2p8LqxA+dRxQybnKc
	 Nnfsm8wIRLCWQ==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 3B/0C-07373-AD2AB016; Thu, 05 Aug 2021 08:35:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MRqntzEXe
  iwekNRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGjWfZC/p4K3p2X2BrYHzE3cXIxSEkMItJ
  4vCx/ewQzm5GiZtz7jJ1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLGAjMeHMRVYQm0VAReLk6
  j1sIDavgIfE9osbwOISAgoSUx6+Z4aIC0qcnPmEBcRmFpCQOPjiBVCcA6hGUWL2dHmI8gqJ14
  cvMU9g5JmFpGMWko4FjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS0tdY2MzPUSq3ST9FJLdct
  Ti0t0DfUSy4v1iitzk3NS9PJSSzYxAsMopeD44x2MK9580DvEKMnBpCTKq9/LnSjEl5SfUpmR
  WJwRX1Sak1p8iFGGg0NJgrdiAVBOsCg1PbUiLTMHGNIwaQkOHiURXmaQNG9xQWJucWY6ROoUY
  zjHm7VLFjFzvAWTbffuAsl2MDlzwcHVzByzwOT99kNA8gGIFGLJy89LlRLnVV0INE4AZFxGaR
  7cMljMXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzKsOMoUnM68E7qZXQOcyAZ17IZYT5Ny
  SRISUVAPToQQB7ykh8So9Mcf3RalNP1m5/H/ttSPXvVlOe9l07DDqidv4NbSKN5NbSzTrpqG0
  pdc3p0jxUIaY4+xS6QtCVlzd8DhynrbZg/fiUZM/5V+exL6pwa306FzuHL9+rfpE+2Z+eZlO6
  Z8xvydYFpy9t2Kj4q7gCC3BT1aplwzM33Vd6T6zWn6X+zSG9sAK90aPd2vag95Vn2yws/+wg6
  tXJjr98MXdGsd3vb/6Z8XBvcuY/z/4ETW7W7Cp8GST8y0F89bjZb86/VcK2Ki/u+/AHGWmy7T
  Lziv55my7OYzNRWbBh8wjgqYobmFwLj79p7F45ZcNBYbRefddCl+L/E/N9DmsMqEjZkmoyqXY
  i0osxRmJhlrMRcWJAGiY909UAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-291.messagelabs.com!1628152537!615213!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26782 invoked from network); 5 Aug 2021 08:35:37 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 08:35:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1758ZbNu024865
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 09:35:37 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 09:35:35 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] valijson: upgrade 0.4 -> 0.5
Date: Thu, 5 Aug 2021 16:35:28 +0800
Message-ID: <1628152528-23213-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

This is mostly a maintenance release.
It addresses a number of warnings that were produced when compiling
with warnings enabled (/W4) on MSVC.
In some cases, warnings have been suppressed on a per-file basis,
through the use of pragma statements.
This was done to minimise the potential impact of changes required
to exhaustively address these warnings.

Bundled versions of gtest and rapidjson have also been updated,
and several minor bug fixes have been included.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../valijson/{valijson_0.4.bb => valijson_0.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/{valijson_0.4.bb => valijson_0.5.bb} (96%)

diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb
similarity index 96%
rename from meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb
index a9302616b..9b6f19f58 100644
--- a/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.4.bb
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.5.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git"
-SRCREV = "9183462118f58a3ca4be82b8f656f18707229737"
+SRCREV = "c5487c39eb900b97535f8b3a38a17af098c784e3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

