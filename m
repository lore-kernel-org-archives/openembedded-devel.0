Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B42C64ED6
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:39:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7777.1676702376868661686
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a0CbWR7t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702374; i=@fujitsu.com;
	bh=uvDEot8mnK3Nhx9ehYuyHqnMtNxW3PQnV5VyqHhq9SM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a0CbWR7tNDkCWloGYIKoHXE2tVpd5By1202R2wzMR0fsqd1tX/tBYpEj/LbNsHmnK
	 g4vorFcHfMBgTsCMDRhBsp1hjd5hOGqBR/TfEhM8krcJf+30WZ5XdWXstY1/LOP9aO
	 NZtPsQ2A0Nmo6SvzSrIrbBxczHrig6929/e9F1qvZjQ/REanV/xFrVy+opJYmbkN4v
	 AYmCT28Vt0KLuVOpp0DSrTbogGc1XhHACVJbQh4zB/Bvas59hvuLJYT1WwrmrgJaxX
	 qcP5s3eImoxlXTO2XrUsHbW/bL9oLZ/mVRTie5vgGuCSInDDFUob2vSJsh2FCN79EB
	 BmHndOcPUKkaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWXdp0Yd
  kg3ePpC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozdPQfYCiYKVfzbsYitgXG6QBcjF4eQwANG
  iddN61ghnCtMEvePH2CDcPYySvy5sYGpi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBV4mHJ9+wgNgsAqoSHV2/wWp4BZwkNp59xAhiSwgoSEx5+B4szingLLHs8WqwmUJANd
  uOnGGFqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSrR++AVlq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFacWlSWWqRrqJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkgGUSiwv1kstLtYrrsxNzknR
  y0st2cQIDN+U4sTbOxiX9/7VO8QoycGkJMr7edv7ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  D8LPiQLCRalpqdWpGXmAGMJJi3BwaMkwns6HSjNW1yQmFucmQ6ROsWoKCXOy5AKlBAASWSU5s
  G1weL3EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3qUg23ky80rgpr8CWswEtHgB81uQxSW
  JCCmpBqaglTtMPvhM3XJpsu2UYum1p00ruy8H2CkdNl7Eu2jdqu3Faxnft19ftr927+wNCZNr
  J4refrNmxbrbDbbbtZ7MMo2+/ujpb7vi3ZxFpUZ3VyrMYC9gZFzo316Y9fHui4jr8c6v0tatV
  i8Oi7WqfH58/mxBlw23BL7yZ4g90D3iHzX113yeUyuf+U/M3NBkn/Rom0kI+3KXm3riflKhk9
  slo7pPuwdfu+xXUsu7J8Ddw6EpOPfK6lmWIjEMzz9vWdEb6Gh5cdKSaOFXK/Zo8+e062ZJrGE
  7scRSRVLy8Ua+RZrxQRU/r/M8EVVaE7prVtqd+7MTPTxWcfRsPX9/ptCTjEUbPm+zKmNx3l8w
  N3WCEktxRqKhFnNRcSIAj2iSn1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1676702373!1266400!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26307 invoked from network); 18 Feb 2023 06:39:33 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:39:33 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DEEE97C
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:32 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D33D073
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:39:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libusb-compat: upgrade 0.1.7 -> 0.1.8
Date: Sat, 18 Feb 2023 14:39:02 +0800
Message-ID: <1676702342-30766-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
References: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101137

From: Wang Mingyu <wangmy@fujitsu.com>

0001-usb.h-Include-sys-types.h.patch
refreshed for new version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-usb.h-Include-sys-types.h.patch           | 14 ++++++++------
 ...busb-compat_0.1.7.bb => libusb-compat_0.1.8.bb} |  2 +-
 2 files changed, 9 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/libusb/{libusb-compat_0.1.7.bb => libusb-compat_0.1.8.bb} (96%)

diff --git a/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
index f4f759c85..7df44737a 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
+++ b/meta-oe/recipes-support/libusb/libusb-compat/0001-usb.h-Include-sys-types.h.patch
@@ -8,21 +8,23 @@ We need the definitions for things like u_intX_t
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  libusb/usb.h | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/libusb/usb.h b/libusb/usb.h
-index fa0e6c6..4e88eb8 100644
+index ea62543..18b610a 100644
 --- a/libusb/usb.h
 +++ b/libusb/usb.h
-@@ -45,6 +45,8 @@ typedef unsigned __int32  uint32_t;
+@@ -46,6 +46,8 @@ typedef unsigned __int32  uint32_t;
  #include <stdint.h>
  #endif
  
 +#include <sys/types.h>
 +
- /*
-  * USB spec information
-  *
+ /* On linux PATH_MAX is defined in linux/limits.h. */
+ #if defined(__linux__)
+ #include <linux/limits.h>
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb b/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
similarity index 96%
rename from meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
rename to meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
index 5ab08f6e5..869e98fe5 100644
--- a/meta-oe/recipes-support/libusb/libusb-compat_0.1.7.bb
+++ b/meta-oe/recipes-support/libusb/libusb-compat_0.1.8.bb
@@ -22,7 +22,7 @@ SRC_URI = " \
     git://github.com/libusb/libusb-compat-0.1.git;protocol=https;branch=master \
     file://0001-usb.h-Include-sys-types.h.patch \
 "
-SRCREV = "4a27760ec5954ec8605e052a3207afbe0979eeef"
+SRCREV = "88740f0fe497b473c8ef40093ab7daeebfb40eb6"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb-compat-0.1/releases"
-- 
2.34.1


