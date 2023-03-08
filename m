Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A32FC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:21:01 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6591.1678281660285966581
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Njmx7yOJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281658; i=@fujitsu.com;
	bh=Iajr1uvN5MD5Oxy487HIJPX9f9QGx7gwPDPuNiE7dJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Njmx7yOJZmAhweNVLV/zg8/lmfJWUNVp4rAhdMbI3tkWGnRQBWq7PjWmh9jS83/Gz
	 Pj21LQUyCva/kUTZp/ocECDnt8gD7X2yW83Mt1UJVJ/lKQ0FSkpxmlmS+F+5rJY5WC
	 wgAcwnfkTE4N6LIk+mthm3udf/XdRYLhOgAAkG77Oy0zu1NVnwmUcGzF/1VZzBKREH
	 djo6QC3S+j3BTRI8UXMkEMyqD3Z+lE47uEJOykd3aolz+b1tCPso3ehDY/njJ7QSH7
	 NxFe8qeB6vxT6uVlMi6jV5zBSRbHXmzcPDL1vjfMtWrShSZYRIX/pdtkZC20CxpTXe
	 zDjkUmxgDh3rg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqLuzmyP
  FoLNFyOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzTg+6z9LQZtcRd+/vWwNjNekuhi5OIQEnjBK
  PPp3gB3CucEksXfXQlYIZw+jxKtl24AynBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N0DV
  iMs4CBxbt1hVhCbBSi+rW0zI4jNK+Ak0XunB6xXQkBBYsrD92C9nALOEhfXr2XqYuQAWuYkca
  zBC6JcUOLkzCcsEOMlJA6+eMEM0aooMftyMwuEXSnR+uEXlK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaN5cWpRWWqRrqG5XlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYPimFCfd2cG4s++v3iFGSQ4mJVFe1hiOFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  J+6gHKCRanpqRVpmTnAWIJJS3DwKInw3q0HSvMWFyTmFmemQ6ROMepybNrXdYBZiCUvPy9VSp
  x3A8gMAZCijNI8uBGwuL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3O8gUnsy8ErhNr4C
  OYAI64sJ+FpAjShIRUlINTFa5UbfDO1a+O90dOkcuK8RPUW0n+yctgXCzktpjX/r/Gs27JMcv
  qHbiS27J5KeXfvld4XzkwbnpS3DG1LJ5t2a/CanOcV/P1+Ov1qbTxzDN0dlhZp6Nsf3KYtFbc
  rudgu6XfN31MvDHzabw6TquK1YZzgs5zj45cRP/xmvyd8+JHNWcLxbJuvpUV7LjYT3OpXz+Te
  xbtmcd+cmeNU109xn/s3pH1JMvun0sFPEOnn7DuXH/YxZtsbffNNvbfkS9kQhWCro1W9VbXfe
  2O5PbBv9XpSmMBVZb7/Nf/6fkPeODbtUm3wqFYIHe6PadeyXvHNuasOLuh8tnFk1o3Bl7RbA+
  NsnkQRln0qKctTb+SizFGYmGWsxFxYkAGnxbTWYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1678281656!448296!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29644 invoked from network); 8 Mar 2023 13:20:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:20:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9AC821001A2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:56 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8E3D110019E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:20:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:20:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.9.0 -> 2.10.0
Date: Wed, 8 Mar 2023 21:20:39 +0800
Message-ID: <1678281642-25317-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
References: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101412

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-incompatible-function-pointer-types.patch
removed since it's included in 2.10.0

Changelog:
===========
Notewhorth changes:
-------------------
* Fix android build scripts, use CMake from SDK
* Fix connection negotiation with mstsc/msrdc #8426
* [ntlm]: use rfc5929 binding hash algorithm #8430
* [channels,printer] Fixed reference counting #8433
* Fix uwac pixman #8439
* Fix Rdp security #8457
* [client,x11] Detect key autorepeat #8522
* [build] add channel path to RPATH #8551
* Fix build with BUILTIN_CHANNELS=OFF #8560
* revert changes so that the osmajortype/osminortype is not overwritten #8571
* [uwac] do not use iso C functions #8604
* [winpr,sam] fix inalid NULL arguments #8605
* Fix incompatible function pointer types #8625

Fixed issues:
-------------
* Backported #8581: Ignore data PDUs for DVCs that were not opened successfully
* Backported #8498: [channel,urbdrc] fix type of usb hotplug callback
* Backported #8537: Extended info enforce limits
* Backported #8611: [core] add missing redirection fields

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-incompatible-function-pointer-types.patch | 32 -------------------
 .../{freerdp_2.9.0.bb => freerdp_2.10.0.bb}   |  7 ++--
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.9.0.bb => freerdp_2.10.0.bb} (94%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch
deleted file mode 100644
index ce230dbf2..000000000
--- a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-incompatible-function-pointer-types.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9c785ca0535d9c24e6699ee1243b427c1407acb5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 17 Jan 2023 19:31:17 -0800
-Subject: [PATCH] Fix incompatible function pointer types
-
-clang 16+ is flagging the function pointer prototype mismatches,
-therefore fix it.
-
-Fixes Issue #8487
-
-Upstream-Status: Submitted [https://github.com/FreeRDP/FreeRDP/pull/8622]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- client/X11/xf_disp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/X11/xf_disp.c b/client/X11/xf_disp.c
-index 32ddb626c..ef0cb93ff 100644
---- a/client/X11/xf_disp.c
-+++ b/client/X11/xf_disp.c
-@@ -248,7 +248,7 @@ static void xf_disp_OnTimer(void* context, TimerEventArgs* e)
- 	xf_disp_sendResize(xfDisp);
- }
- 
--static void xf_disp_OnWindowStateChange(void* context, const WindowStateChangeEventArgs* e)
-+static void xf_disp_OnWindowStateChange(void* context, WindowStateChangeEventArgs* e)
- {
- 	xfContext* xfc;
- 	xfDispContext* xfDisp;
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
similarity index 94%
rename from meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
index 3b8fee0f5..a1bf67ca1 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.9.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
@@ -13,11 +13,10 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "fa8e1b1c765a4466030ac52240f052c0b440a4d1"
+SRCREV = "7471ae383e7b7a613f275e19f7b54958a193c891"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
-    file://winpr-makecert-Build-with-install-RPATH.patch \
-    file://0001-Fix-incompatible-function-pointer-types.patch \
-"
+           file://winpr-makecert-Build-with-install-RPATH.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


