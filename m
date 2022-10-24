Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D068FC3A59D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:38:25 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.16252.1666593501847166046
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O57rU402;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666593500; i=@fujitsu.com;
	bh=1olntGHP4gUvZXjwiDVKPXQILeN0l6+D4rMJ3saa1Ko=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O57rU402duz7wTZA3qDa5Nta38lrx1C3Fo+9DgHUadg898MrJ2se5T4WANsIw/b7X
	 oQIfAZyOqpsjSItY7s/uihdgvAmCVmMQrV/6ozPS+Wm+ZTbuJnhi1nryC6DsG+WMuO
	 wdq7s6nHIrF7BjoJVLNfPjZmmr1NeAA1qwOFhkJTsM9Puqg7eF8pGNkTSt7pimsqG6
	 f/srpQst05aRQxR3tKkDRvEbHto9/ktxkqNYGFfB4uUTlLyTBTGTK8T61aNcPaSAfg
	 /zARRoblelnHMLQhPjJX07R23RgZt+EfwA4TvId4Ns1lQEsoHkiyYwx6JpdDmBbrG/
	 X9OvqovqhtbWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWfe2UVi
  ywY4jKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8atCY4FFwQrnjfNYmxgPMnfxcjFISTwgFHi
  XUcXG4RzmUni2cL7UM4eRoln346zdDFycrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0sYC9xes09RhCbRUBV4vqpW0wgNq+Ak8TqL7fAaiQEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuml1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYiinF7AU7GGcu+6N3
  iFGSg0lJlJdBPCxZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRvjRZQTrAoNT21Ii0zBxgXMGkJD
  h4lEd5nhkBp3uKCxNzizHSI1ClGV46rV67sZeaYOvvffmaO5WBy5te2A8wcm/Z1HWAWYsnLz0
  uVEueNAmkWAGnOKM2DGw2L6UuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlnGwBN4cnMK4G
  74BXQcUxAx11aEQRyXEkiQkqqgWnCj2kdT4LD8lee75okX/3xiMicFdsrLZrtF/7gby5s02/c
  Jy52fMvWj/a9+19lxM+rfF18h0FEhq3BgdM7P9GCl123wbnh58ZHHene+xYHVGzu3JbRnH+iS
  fT9tHsRfQvOpWl/eCIpH1tdqjGNZWbwV43fAt5vJX9sDP5l7/89Ytpjy5z125XCYzz3Wa6pNa
  hLnnjt3xeDvxNO/e0S3zF75tfqX3fkJ/W/17cKNnSY+XKq7Oe48xlV26RYDpdHOrKdFLz/g+f
  GDWGnEF8ls0OHDHniNcxmdpxcXrfO48zkAPUur4WF8ZNUUw3kD27InJM5NcMpconRyndrDU4X
  PhXWLf61e1dPu3XBkUeO/kosxRmJhlrMRcWJAByycXlkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-585.messagelabs.com!1666593499!199463!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18554 invoked from network); 24 Oct 2022 06:38:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-6.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:38:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3A7C67B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:38:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2DE0C73
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:38:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:38:17 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.8.4 -> 3.8.5
Date: Mon, 24 Oct 2022 14:37:58 +0800
Message-ID: <1666593480-28643-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99271

From: Wang Mingyu <wangmy@fujitsu.com>

setuptools.patch
removed since it's included in 3.8.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/sanlock/setuptools.patch           | 18 ------------------
 .../{sanlock_3.8.4.bb => sanlock_3.8.5.bb}     |  3 +--
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.4.bb => sanlock_3.8.5.bb} (95%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch b/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
deleted file mode 100644
index c375e10f75..0000000000
--- a/meta-oe/recipes-extended/sanlock/sanlock/setuptools.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Switch to setuptools as distutils is deprecated.
-
-Upstream-Status: Backport [https://pagure.io/sanlock/c/75758fc10db2354dda397d3aba63c7b72a420982]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/python/setup.py b/python/setup.py
-index b3bfaf1..dfbaf21 100644
---- a/python/setup.py
-+++ b/python/setup.py
-@@ -4,7 +4,7 @@
- # modify, copy, or redistribute it subject to the terms and conditions
- # of the GNU General Public License v.2.
- 
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- sanlocklib = ['sanlock']
- sanlock = Extension(name='sanlock',
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
similarity index 95%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
index 3b4ae318c6..c2a17d06b9 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.4.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
@@ -15,10 +15,9 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
-           file://setuptools.patch \
            file://0001-add-missing-system-header-string.h.patch \
           "
-SRCREV = "a181e951376d49a82eef17920c8ebedec80b4823"
+SRCREV = "b820c63093c4ae85d7da4f719cf3026d7fca5d09"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


