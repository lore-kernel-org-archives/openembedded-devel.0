Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5AAC4167B
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.4355.1652940226538726545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SojuQmfq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940224; i=@fujitsu.com;
	bh=nHTClIVkToMIakvueOBEaqMuSJnBkjS4JgiAOy5Hur0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SojuQmfqonHM1driR9OYzFPNHcoqYIj6RGVduWSzvsf+iXJO0zz5p+N5VfFTTIzWk
	 WpuInU2tA+nCDTBTmfvlgyUrWxRU5yX5lDYe17SoYE7cTKRLdawc2jN/t7l07c8qy0
	 w3M6kX2pQrBIFgz28IbWQvzN9k4F3ibJOH7DjOBNDaplPa1n1ARPjbgkfi7kDUdSPx
	 aTDxCWUUOeTHd8QtXQHeRT+Wbe6KhZrnopenWdSzWJSbH0hCvE4v0OqtvyxV2aD12u
	 dGZluNFpkELokMnQ60rDBx2s8SGTPueMOb6caIVHnI3TjbaYG8uktAS81ejHJIszyg
	 /1UOML9YRRQaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  SwfszEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avzgnMBZu5Klb82MfUwHiEs4uRk0NI4Amj
  xLMpAV2MXED2BSaJv02TGSGck4wSE2YeYAWpYhNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1ggQGLC/xtgcRag+JGbE8HivAJuEq+vngaLSwgoSEx5+B7M5hRwl1i64zcjxBVuEvevPm
  eDqBeUODnzCQvEfAmJgy9eQPUqSZxY8ZEJwq6QeH34ElRcTeLquU3MExgFZyFpn4WkfQEj0yp
  Gu6SizPSMktzEzBxdQwMDXUNDU11zQ11DY2O9xCrdRL3UUt3k1LySokSgtF5iebFeanGxXnFl
  bnJOil5easkmRmAwpxS7t+5gvNz3U+8QoyQHk5Ior/uR1iQhvqT8lMqMxOKM+KLSnNTiQ4wyH
  BxKEryfbwDlBItS01Mr0jJzgJEFk5bg4FES4W3ZBZTmLS5IzC3OTIdInWJUlBLnTbgDlBAASW
  SU5sG1waL5EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3lSQKTyZeSVw018BLWYCWnxLGWx
  xSSJCSqqByfpT018TXn59vwcJOzb/+bHCpKYu6URI0A6f69YVod9+avPuznpz98sT5tb/6xVf
  GK9YdKHvP2urivi+V9M9M3l37Xl7LOb1Rf87a7zPbF4nsWPVh33hT/nWtsZe0fJZ3/nN7vPun
  kwJV0Gjn7zZJz/vbfFNOTjx3SXBA673uy8EMrhWfA34oLdP0ZVXTY73kX3C5os1JoY5L+I/iy
  5xUFH9JPL87eqlIfLdPyL/GMXbfl977H5A0YfHMbmpcopm81RYVU4WfWavXzuHqfGtYOqTfyu
  D/csPPLp8ZsPVyMywBfVbf21pln2/0G8hj8ah2avPNbor+rZ/stRLdM/j7HL2ermXm/FQnaWr
  8LXnC5VYijMSDbWYi4oTAY+BOwBhAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-528.messagelabs.com!1652940224!24048!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6172 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DEB4110019F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C3F2B100193
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:29 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.5.10 ->
 1.5.12
Date: Thu, 19 May 2022 14:03:06 +0800
Message-ID: <1652940188-8005-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97175

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    feat(measurements): Add experimental set_measurement api on transaction
    fix: Remove incorrect usage from flask helper example

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-sentry-sdk_1.5.10.bb => python3-sentry-sdk_1.5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.10.bb => python3-sentry-sdk_1.5.12.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb
index 7076e1903..36e48f97a 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "0a9eb20a84f4c17c08c57488d59fdad18669db71ebecb28fb0721423a33535f9"
+SRC_URI[sha256sum] = "259535ba66933eacf85ab46524188c84dcb4c39f40348455ce15e2c0aca68863"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


