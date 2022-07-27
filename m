Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AB3C19F29
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:10:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.18123.1658916624459844487
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DO+LxO2d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658916622; i=@fujitsu.com;
	bh=jDml1HOJOEPTCc/U0AyXhI4ObHvQzgISVgZZiyZMJ30=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DO+LxO2dRbcv9mM2vkzd/tY6iZccg9lFV7aPt8+0E5cAgYwrsSL1AK4gh535jeOWd
	 o7mPiUYLDX2aK2mqUOWh0s4hk0gBQ2SJPxbme/16w0shddrDtN9ee2zEE9nAvQNrNt
	 VAFI+qmCAoP+8KRnrv1GCxC0zCFv4Iu4y+miZDGQ8JaRMKCt0qvywOvCWAgU4ZX7mY
	 J+lDxaOm5AFcT0S1Qw4aLgbTwWv88YlWZsjtkKAmcUdNmI11vBuQaqEfnX0vtjr0Es
	 76KfbB0/mzx5bWsVhMGgSRiiROK4Nvo0kTlJaYKn1u3lN3Q/XAOrLl1BaiU90J9RdE
	 4e+II326IVARQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWZeX/2G
  SwbNj5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a8fcUFfXwVLZOSGhif8XQxcnEICTxklGib
  vYEVwrnCJNH17BgzhHOSUeLI3t3sXYycHGwC6hKPb75mBLFFBPQlls7ewwxiMwuoSnRfXANWI
  yzgK/Fk4nkWEJsFKH75cwuYzSvgJrH66UGwegkBBYkpD98D2RwcnALuEls2ioKEhYBKWg9sYY
  IoF5Q4OfMJC8R4CYmDL15AtSpJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGAVnIWmfhaR9ASPTKkb
  bpKLM9IyS3MTMHF1DAwNdQ0NTIG2sa2hirpdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYxinF6ZN3MF7a90vvEKMkB5OSKK/72wdJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR493I8TBISLEpNT61Iy8wBxhRMWoKDR0mEN5kXKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/L
  xUKXHedJAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZjXAWQKT2ZeCdy
  mV0BHMAEdsUXhAcgRJYkIKakGJgtRPYPnfudV9pTL6py9u+eDtuZBro0TBKQ5VRj38bLeixR2
  3eAR97nn4Pk9Wx+9eHeAMTer4npR9Z9nusY77il++/Pl17Rkoe0L5jYFfHsmKMJf1eRiN4+Bo
  z5t1bb1t7Z6cx/cO3EvN29VgPxflYqV87YFSueu0E1vuVR39J6Z4YMdpu83ZQeFf9LPjdh/K5
  31y1LdlgU3pH8qfmmbFz2XfdOLfZeTJ+uofty3rPgCy6L9D90Xc9u6e1zae6pGuPtYYb6tTGs
  0M0Mek/6LwmB/mXMfm7fO8eeb7SnT3SBffEVezU/5o55FrHX9uqsPeg7NWB657dJjk0lnU99b
  lmr88zmfvKHmwLbYYm2lGCWW4oxEQy3mouJEAFxuQB9qAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-732.messagelabs.com!1658916621!221161!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22635 invoked from network); 27 Jul 2022 10:10:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:10:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5449A151
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 47D3B155
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:10:21 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:10:19 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyaudio: upgrade 0.2.11 -> 0.2.12
Date: Wed, 27 Jul 2022 18:10:05 +0800
Message-ID: <1658916605-9446-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1658916605-9446-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:10:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98007

From: Xu Huan <xuhuan.fnst@fujitsu.com>

License-Update: license check file changed to LICENSE.txt

Changelog:
==========
modernizing the Microsoft Windows build process
the use paFramesPerBufferUnspecified as the default frames per buffer
the patch that uses the system's preferred encoding
the patches that skip unit tests that require audio hardware
fixes and suggestions to the documentation
fixes to the website documentation

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.12.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyaudio_0.2.11.bb => python3-pyaudio_0.2.12.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
rename to meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
index 802ca35100..ae5fcae4ac 100644
--- a/meta-python/recipes-devtools/python/python3-pyaudio_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-pyaudio_0.2.12.bb
@@ -1,12 +1,11 @@
 SUMMARY = "PyAudio provides Python bindings for PortAudio, the cross-platform audio I/O library"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;md5=288793c2b9b05bd67abbd2a8f5d144f7"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7c3152b432b96d6dc4a1cb35397da9ec"
 
 PYPI_PACKAGE = "PyAudio"
 
-SRC_URI[md5sum] = "7e4c88139284033f67b4336c74eda3b8"
-SRC_URI[sha256sum] = "93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74"
+SRC_URI[sha256sum] = "55ddf5db72bc537bba5f5dbca3ab9f0222ee5b842bda83978eab0b7b8f60fb9e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


