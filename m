Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C9C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:05:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.66331.1680516351149236886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:05:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gYuTnSvB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516349; i=@fujitsu.com;
	bh=8RA38Au/67iLiRp0Iyw1hikBnjMWTXxLF2MNEOAFgU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gYuTnSvB8phts9K2vgeIMCQHZuxdwZvDR/qIz+VzjXmpd5VIWm9Z7lXSMxo4UOm01
	 lyJj/oyjZCL/Ui5N1Hhsp7CdkHa7BwjF356Iuwx0AUV7UMrIpSHkRva/wmLLElBKpi
	 VtYLern5B93GaZiEuCSQDTtCF0spaex6uzy2ONS0YBW2SdiMeIcWQ0noR/xSDzT1Mu
	 XSVRfCf9J+drjCrdwbCx+0qCGwUr7HOyaBO5h1aw8GpS1dkzCqnSeijWaIrckHoXTu
	 EAR8yKAlcr/MTewAz2wfSurmCx+XBHZt60Zs2QtVQic8zwdLJrElV09GLw13wGoERh
	 yjK7K4xoKcYwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSffPEq0
  Ug0N3LCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyz0xayFhzkrljeeoC9gXELVxcjF4eQwBNG
  iRPrOtm7GDmBnOtMEru+JEMkdjNKvLg9gw0kwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi989Y
  M3CAkEShxZ1g9WwAMVPH5wKFOfg4BVwkpg7IRQkLCGgIDHl4XuwVk4BZ4lju5pZIPY6SXRcaQ
  UbwysgKHFy5hMWiPESEgdfvGCG6FWUmH0Zol5CoEKicfohJghbTeLquU3MExgFZyFpn4WkfQE
  j0ypGs+LUorLUIl1LvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwNBNKU4+u4PxaN9fvUOMkhxMSqK8gvVaKUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQke
  OctAsoJFqWmp1akZeYA4wgmLcHBoyTCq7gAKM1bXJCYW5yZDpE6xagoJc57ZzFQQgAkkVGaB9
  cGi91LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5xUCm8GTmlcBNfwW0mAlocWuUBsjikkS
  ElFQDk0X/AtemBKeD5Ttal57ny2ZZVfXlcsDZEI+sWbkTn5Uuzsj4+/eb+wvjYwlRsZfXcmsX
  tjt+1nl19OaO862ZL4r6Jd43cLNla18LWy90kOPwFNODpo6LnOO4ty235lzL4CkS3sO5mmHuc
  qXWI9tKGgQVj3fxBR7S3VwjN4994kw/Xj6zVwXbeq7H6ugzPBROOBi5bcqd2gnGvzIZDCofrl
  AXuza1xFu1c8O31i1Lq828Wg0Nzmq/97mxqvaIWhfrueCWJz7ZO2VX6Z47O89i435x43krnjA
  vmnhgmYDbwVNuXgxr17H6XJzXzicz3dX+ylv/jafNT0hujXzGsfMnz6QNd0Lqrr1vEbhfN8XY
  T4mlOCPRUIu5qDgRACOlzO9YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1680516348!736500!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16014 invoked from network); 3 Apr 2023 10:05:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:05:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 58D111009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:48 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4C3481009B2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:05:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.4 -> 13.0.6
Date: Mon, 3 Apr 2023 18:05:24 +0800
Message-ID: <1680516324-30996-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
References: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101923

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix socket leak (#718)
    Don't call launch callback on error (#715)
    Wait for response when stopping app (#714)
    Simplify request callback handling (#712)
    Make sure handler is unregistered after quickplay (#713)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.4.bb => python3-pychromecast_13.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.4.bb => python3-pychromecast_13.0.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb
index 49680c343..2d9efa390 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "792fba3f31e4968a5e99c19c771774083a2aa7e897ebf6f5e218e308e33a461f"
+SRC_URI[sha256sum] = "149dad28cbed2296b5074c326662d9cb0093b834b417cb9ee05828e97b282e73"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


