Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9848FC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:10:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.3753.1675843807440737690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NTohTVIV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843805; i=@fujitsu.com;
	bh=Aita/i81vwSjmDKN2yF5JuVGR4tdXiedDQTChc+Ah0M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NTohTVIVm1e66RUxcezn46QTsnR53n/6Atzf8X+GzemYKQkKNiq1Xq/vgBktGy1j/
	 QuGlRBwYvyZ2waf7q5EYLIw4mKvmnr/H4NoNspsos2DJKpVJn7Qhg6YPzRJId7kNhz
	 ektobHSxtRmDtRhPnlaifOvgmnkgiLftWAuOuwOpJVlse66rQar3hjXEsjH8kVDswe
	 QfNX5N4kehKg0opitR8QnnFxR1GH5oMzawtQvo+Vo7gX+fFfhvHxQOW0z+UOGBg5jE
	 SHn8WecgdJnFGaXnUQ/tK8u15Ayagi1E9nB/OJ95D5WhY6gWkOVmlZKvFbl3QgvNjZ
	 PeF7s8zJrD9ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORpHs34nG
  ywbwTbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcNZ8YCw5wVazbr9rAeIazi5GLQ0jgIaPE
  ic2zmCCcq0wSM2b9Zeti5ARy9jBKrOwNBLHZBKQkbtz/DxYXEdCXWDp7DzOIzSygIvHidw87i
  C0s4CdxetdGoBoODhag+I+t4SBhXgEniYNP/4KVSAgoSEx5+J4ZIi4ocXLmExaIMRISB1+8YI
  aoUZSYfbmZBcKulGj98AvKVpO4em4T8wRG/llI2mchaV/AyLSK0bQ4tagstUjXTC+pKDM9oyQ
  3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMAxTihlu7GCc0/dX7xCj
  JAeTkiivp9jjZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvBHhQDnBotT01Iq0zBxgTMCkJTh4l
  ER4I0OB0rzFBYm5xZnpEKlTjIpS4rxXQfoEQBIZpXlwbbA4vMQoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmDcgDGgKT2ZeCdz0V0CLmYAWh6g+BFlckoiQkmpgmho/qWXGPGaJt3o2Vx44Hn5
  RqxVaed/psmTR3/Ovv/Jc71QNmNkRvn363a1ppw6/9RNx4wvPi3VMi86+821h9l+XnDwBJsZ5
  MaramlU8mdesy7bFvey+1iDx6OLr8i+uQlXu5XrpH18vnSV/Kjc/4H5fte/8HRmBZ6JPTtfKk
  CyLS2L9lilhK+VxVXb9GRFnz2NP5QP3S58NTd0Q0bpaOq5Umfeby979/3d5f6sUrled+svUeU
  1C8jfbG3c/xXqbnQ16vFP246a7Ww8Kn1i7YLWg+Fxjr52vri9jO7RhudWaawGGayIZte/M5//
  KcNtgdUDT3VdvQhe5LXm+p6ODl3nB0n1/Fba7XPHYH5B+UomlOCPRUIu5qDgRAMUN7QA+AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1675843804!175246!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5049 invoked from network); 8 Feb 2023 08:10:05 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:10:05 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B1A5A1AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A5FCD1AE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:10:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 38.0.1 -> 38.0.2
Date: Wed, 8 Feb 2023 16:09:50 +0800
Message-ID: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100973

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 fix: use repr() when adding values to plot
 Allow cantools.tester to work with multiplexed signals
 Relaxed an PDU assert for ARXML format

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_38.0.1.bb => python3-cantools_38.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_38.0.1.bb => python3-cantools_38.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
index c11606351..003573583 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_38.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "be391520a43c8041ba99839a00a0a61b7afa929387def6c6348a9626b99f24d7"
+SRC_URI[sha256sum] = "93bfe6f4bd652f369763ea9162b027a62f424a8400f2423d41137918ce68c68e"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


