Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CDBC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 07:40:27 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.9827.1642491626421580305
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 23:40:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eH/Qhg0E;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642491624; i=@fujitsu.com;
	bh=2NJ3ajvDi29z0P2BegL24/z4K5nEYAb/4R9f9vlwE14=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eH/Qhg0EXzKCCjXeO3bv7vDQl4AAO4iPJru75PHwh1mUU2ah+mWUNiAOW+NJZt1Sm
	 LBM4cK/4CseE1OAQqSklSkJPUMpuHX74XiIWEYgTjaVKAzhx2OfbIT8k0lMMHk+2k+
	 mA3sijgGSI9E54/y1e/DdHJeKLvSTKMt/MtSqsApGXcIWu3cfJs5TUbCW57wmPorhy
	 21m+0tOfbf6EWMZfZIlziH2jzl3LDg8xSqcXD7XRLvLd+FerLFcpx0yniVd/a/50FR
	 5VrnuqOVsVs5G8NbtH4AsDi65AcoBBlm9fxppLH0gPazwznE8Iwr14js4S/Dgnfl3V
	 Uize0o6wttAgA==
Received: from [100.115.7.63] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id BD/78-02997-8EE66E16;
 Tue, 18 Jan 2022 07:40:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsViZ8MRovs871m
  iweOL5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bl5f1sBTu5K16/3sfYwLiMq4uRk0NIYCaT
  xLHnxV2MXED2XkaJXT1/2EESbAIaErunXmYGsUUE9CWWzt4DZjMLqEkcffkTyObgEBZwlnjwv
  RQkzCKgKnHg8TomEJtXwEVi0YOzLCC2hICCxJSH78FaOQVcJX5um8UO0ioEVLN6iTJEuaDEyZ
  lPWCCmS0gcfPGCGaJVSeLtpT2MEHaFxKxZbUwTGPlnIWmZhaRlASPTKkarpKLM9IyS3MTMHF1
  DAwNdQ0NTXVNdIyNzvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwHBMKWZ9
  vINxTd9PvUOMkhxMSqK8SqeeJgrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4NXPeZYoJFiUmp5ak
  ZaZA4wNmLQEB4+SCG94NlCat7ggMbc4Mx0idYoxluPy9XmLmDnerF0CJN+CybZ7d4FkO5icue
  DgamaOWWDyfvshIPkARAqx5OXnpUqJ8zLnAg0VABmaUZoHtxKWBi4xykoJ8zIyMDAI8RSkFuV
  mlqDKv2IU52BUEuYNApnCk5lXAnfZK6CjmYCOXvXxEcjRJYkIKakGppT8vIkzLB4k3tnFu+WX
  kvTDzQYh2x6dWfTjbHTwQuXgy0UXNPYXyoXZ3fAM/Cz9/MmMxrB/6lPzvD4sq7piW7FhzSXLI
  KmbK7f/Dn1XambrUPGk6s/GG+tsJLsPsu1dcpg3Prcopnr3YQkvs7jGTDFzs3eKktMNTnPsU+
  felLqB4YdlxGer7OMCjGJM/uVnKtjDe+IPn619+GZBT9DrUplY58PiR2W9fPz+vBTmnLK7wX7
  2M+0Sl7Q3D31n5RvsOWwTd6b4h+wsw0frPkwy2N3yyTpFUtDZ7Avb+4l8xf+v7/n6JXyaXLT9
  rE9KkyrOyHi6x967Hm5ds6yIq1LMM2SuqoJ4crdLRlXEiYtLlViKMxINtZiLihMB5LHmNH4DA
  AA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-13.tower-585.messagelabs.com!1642491623!69980!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24287 invoked from network); 18 Jan 2022 07:40:23 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-13.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Jan 2022 07:40:23 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20I7eG6s014537
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 07:40:23 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 18 Jan 2022 07:40:17 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 2/2] xorg-xrdp: Upgraded from 0.2.5 to 0.2.18.
Date: Wed, 19 Jan 2022 00:40:04 +0800
Message-ID: <1642524004-3612-3-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642524004-3612-1-git-send-email-leimaohui@fujitsu.com>
References: <1642524004-3612-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 07:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94909

- Upgraded 0.2.5 to 0.2.18
- Deleted xorg-xrdp from PNBLACKLIST, because build error with openssl
3.0 of xrdp has beed fixed.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../xorg-xrdp/{xorgxrdp_0.2.5.bb => xorgxrdp_0.2.18.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/xorg-xrdp/{xorgxrdp_0.2.5.bb => xorgxrdp_0.2.18.bb} (62%)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb
similarity index 62%
rename from meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
rename to meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb
index f5b90ecd9..eadf8c1b0 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.18.bb
@@ -10,16 +10,14 @@ DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11 pam"
 
-SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git;branch=devel;protocol=https"
 
-SRCREV = "c122544f184d4031bbae1ad80fbab554c34a9427"
+SRCREV = "752b7659773a11ca6d4600645547c06fdb8a23d9"
 
-PV = "0.2.5"
+PV = "0.2.18"
 
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${libdir}/xorg/modules/*"
 
 INSANE_SKIP:${PN} += "xorg-driver-abi"
-
-PNBLACKLIST[xorgxrdp] ?= "Depends on xrdp which needs porting to openssl 3.x"
-- 
2.25.1


