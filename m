Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADA3C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:21:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.111513.1669616490642528904
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AkNshIBc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616488; i=@fujitsu.com;
	bh=ZI9MSLD0R3SOdEeChwAWZIlSVyvEeekrMgND060V9E0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AkNshIBcrNGfe8+sGCZ9YgaMfiA0KSd1kKASJSWE73gLykSWQp/IRuvMxJCmZoBYS
	 GDK2FE1tDoR5HOI9slVXBTKfZrqxtCMu5YIoSVt5rxfwhNQ5TkOvz10Ap4GT0Mg85b
	 Qmzh9KbZ+1+qWOxuHMDtSVR+lbJqNj1gHFjN0GwPRJtmx+IKcMmVQuS4OueaiPNpAK
	 wHLtfQ/vKVTW4/eMULmNxDyZiUzcho9LJva0ij1AgO1G59Jw24wzgxDWJP4gdt+CsQ
	 fqsSgiq6oRVHVcG4dDz65QlkYmOoQEZfXfAAo7yKZNsaBcklQTKaZ3LBBds47PTY1K
	 LAzhhVJgKfKYA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpJse3JJ
  s8PS7nsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtH87jVjwTHOipnHd7M0ML7n6GLk4hASeMgo
  sen4fxYI5zKTxKTjr9khnD2MEk8OfmbqYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1ggSGLS3C4wm0VAVaLj8Rawel4BJ4lVc+6AxSUEFCSmPHwP1ssp4Cyx/c9EFhBbCKjm9c
  pOJoh6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM5sWpRWWpRbpGBnpJRZnpGSW5iZk5eolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIEBnFKclLiDsW/ZH71DjJIcTEqivB8DW5KF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fDOBckJFqWmp1akZeYAowkmLcHBoyTCu9geKM1bXJCYW5yZDpE6xagoJc4bAtInAJLIKM2Da4
  NF8CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryXQabwZOaVwE1/BbSYCWjxJsUmkMUliQg
  pqQam8HMV5nXSBhUTDpXUCH7/L9uT/qO2ULQv/W/hg4qDq1/mbTp2vmxvn5mXR3P4hS1MwvfP
  lW5a4jv79NMdPoV/PhhKGO7jzjogUOx11agmNn8Dn5yJ01qZD82WOctcnr67x6Cg3KOXcS9JY
  2pTzm6GfSsOSEQ+U1Hrc1EyNP5aztw0p73C48wL7z9y9tv0FG8G8DKwZFZu8IhxceZxSNqwe9
  u2X//EdmbJL19uEjDVbcv95XnKE6w2ntFQLJ0b1Z19Tmjv26dtqzTvLp962ixzrtRjn+2cjYs
  nVZRXXvty62HyjX85Dkq8kxZ1Lt2z89gFwaW3bubtvypVLDJHYML5dw2776dpip4WOXZzmscp
  JZbijERDLeai4kQAFMGNp1sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-732.messagelabs.com!1669616487!129797!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9603 invoked from network); 28 Nov 2022 06:21:27 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:21:27 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 41B0A1AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 36E3F7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:21:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 12.1.4 -> 13.0.1
Date: Mon, 28 Nov 2022 14:20:43 +0800
Message-ID: <1669616444-13316-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
References: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99814

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_12.1.4.bb => python3-pychromecast_13.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_12.1.4.bb => python3-pychromecast_13.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb
index 69372060b..59f1bfdfc 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "9e57dc985a4a05db5bdcd5da219cbf6ced25548ca093f8d74bc107b3c554ec00"
+SRC_URI[sha256sum] = "203aaf037afbaca12763a3a911929dd25b0a8a7b1ee00d010d3439bd31a98252"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


