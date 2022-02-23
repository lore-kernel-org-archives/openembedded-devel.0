Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809B5C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:51:34 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.4969.1645602692849803061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qTsqbb5l;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602691; i=@fujitsu.com;
	bh=qUzXlEZHx9ysdOAF0X5lbPBCwwbu+MUCXN+84Wsxxas=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qTsqbb5lLSdMrrKkmOTh4fswDBc3+L5kmWAPn67wMF8SP6RHZ5OhogvKRV0QcabuU
	 5M9jcKiex3FSjF+vLwk7KTj/x1T93ZrgWrSB9LyFmBQrmKQiiMBBQ26G5RLQeamUr4
	 v0VFXia1z0ow5D8eH05RyG+rojRomjj2j7gRQlm0/WRBEE51r1LzeXr37S2snj/dsv
	 6RQWQw/VU2lgBcnXpu9lgflUo1+/ZmG88YFl9wzNvkiZlsqR3fWw10X4d9JoVuBpVz
	 wQRQy/HvDh2mtQ8roSl1duGRy4CLnC80YD47Q3vl4gD/WDj5VkzBvLnlwsr9U+AAQ+
	 NhfbHDAtgW3pw==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 22/8B-24566-387E5126; Wed, 23 Feb 2022 07:51:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8ORqNv0XDT
  JYPllBYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFMsOC/5wV329vZGlgnMLZxcjFISTwhFFi
  0a69rBDOBSaJl43bmSCcE4wSny/MY+ti5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBAYtvUb2BxFgFViWO/D4D18go4SfzqnAdWIyGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKka7pKLM9IyS3MTMHF1DAwN
  dQ0NTXXNDXUNLA73EKt1EvdRS3eTUvJKiRKC0XmJ5sV5qcbFecWVuck6KXl5qySZGYHCmFLvv
  28H4ou+n3iFGSQ4mJVHewiOiSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkePueAOUEi1LTUyvSM
  nOAkQKTluDgURLhFQFJ8xYXJOYWZ6ZDpE4xKkqJ836/B5QQAElklObBtcGi8xKjrJQwLyMDA4
  MQT0FqUW5mCar8K0ZxDkYlYV6RZ0BTeDLzSuCmvwJazAS0eEqWEMjikkSElFQD08lJzEVLPx6
  aLCnVM+vmw3l7PxyML/g3M+8Vp8fVjrl7VZf1XnJvWM154T1b/XU+sbb4BxKMSl5XnTtCgjwv
  CgQ/Tzfm5yuwev953nIbYTlOz+orQf33OvecSZGuKOMJDfx4kkmU1Sn06PX2Xc9PXDh20t6NJ
  afTqKNS9JjiVdFJrJM/n156VrFhw1axTwrly8U/2K0//XjLxjQvP/k0Br/YTZxbvseXL2SYnr
  efP+mG4JfkvGVRwbK/Nn0XvGD28HfAlplTe2RYTC8npE+/aan44r1DwVK7YzaX+EOnvvTfrs3
  WdWnalY9ypTFCqlUblXk35bySW507r7bj+Bsf64ojp7YERZySSyoJkAr5qMRSnJFoqMVcVJwI
  AF2zcVtJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-528.messagelabs.com!1645602690!38380!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3105 invoked from network); 23 Feb 2022 07:51:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:51:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DA91C10019B
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CC35E10018A
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:51:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:51:18 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] spice-protocol: upgrade 0.14.3 ->
 0.14.4
Date: Wed, 23 Feb 2022 15:51:08 +0800
Message-ID: <1645602670-28373-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 07:51:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95470

Major changes in 0.14.4
=======================
* Fix enum deprecation warning for visual studio
* Fix documentation typos in stream-device.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{spice-protocol_1.14.3.bb => spice-protocol_0.14.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{spice-protocol_1.14.3.bb => spice-protocol_0.14.4.bb} (89%)

diff --git a/meta-networking/recipes-support/spice/spice-protocol_1.14.3.bb b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
similarity index 89%
rename from meta-networking/recipes-support/spice/spice-protocol_1.14.3.bb
rename to meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
index 1ea606bb6d..9ce019ed86 100644
--- a/meta-networking/recipes-support/spice/spice-protocol_1.14.3.bb
+++ b/meta-networking/recipes-support/spice/spice-protocol_0.14.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://spice-space.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b37311cb5604f3e5cc2fb0fd23527e95"
 
-SRCREV = "90b57dace404db564a8e034ad4427b9951071bcd"
+SRCREV = "6f453a775d87087c6ba59fc180c1a1e466631a47"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/spice-protocol.git;protocol=https;branch=master"
 
-- 
2.25.1


