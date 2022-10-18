Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08544C4332F
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:08:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.1838.1666055294522626776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pPAnyqKi;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055292; i=@fujitsu.com;
	bh=AzYUPIYaRaHRDTnzF7BWUXQSXgt5ftv6zKAafunTx4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pPAnyqKiTIxOHIIMlfo6BERuITuSvCyWe32hcnsydo38Uu0EzSJuvY02BOWbf2k5A
	 4EUKozQU1JmcDDcvwkDWpLtU6bw7AXrbKgdkMRqfPmeWL6yKfkLB1LXeG4jxdFkgG3
	 pRhwKDdsRrpk7QVFskY/6o3zR4caPMXNx8tJrL+DPcfGgPCxyUB0/HWtXx5X/Nv0as
	 hJJgC64VFEHXJBbHvKgBgAMhcZHPTCtBi1uw4ub978cx4d7M9enxdBBqOKyMS/GZgJ
	 J/FQMVsqyz6LsWSEoBUicbEKWeABeHyIeJGAPjLK5eSxCd9Y7hP+mBgY2GlOjmcC1U
	 1x9lq3HTXw9Tw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqFvzxzf
  Z4Nc5HouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPu42OMBce4Kn5d/8ncwPiBs4uRi0NI4Amj
  xL4DR1kgnOtMEleOrWaCcPYwShydt4Wxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBP4kV07eC2SwCqhJP5j4FquHg4BVwlJhwwgAkLCGgIDHl4XuwVl4BQYmTM5+wQIyRkD
  j44gUzRI2ixOzLzSwQdoXErFltTBC2msTVc5uYJzDyz0LSPgtJ+wJGplWMpsWpRWWpRbqmekl
  FmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZhSzFi2g7F7
  2R+9Q4ySHExKorwdM3yThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwdvwAygkWpaanVqRl5gDjA
  iYtwcGjJMIbdQYozVtckJhbnJkOkTrFaM8xdfa//cwcy8HkzK9tB5g5mv//PsAsxJKXn5cqJc
  57+jdQmwBIW0ZpHtxQWBxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMm/oLaApPZl4J3O5
  XQGcxAZ2Vsd8L5KySRISUVAOTpVYun2iPi1Dji+XOQiyv+6MM/UOVLnPtUPkr4LnStc7zWQnb
  E83WiVtyBSw3x2wRMb1/UuZnTZVI27TqqEkS4feYJ4Z5X/vi5LbLRGrp1Jj97qVBu+SuTzGd7
  KgnksDJ3hnM9eGXhe0X16sLJMTOlvKpndcIPaEtIvTjlFwgqxSvfN7lHX3n+l7Zxc9f9P3K73
  iDjLri7GyFDXx7utgUZfVmGosXZe1z3PPo2t83e784irz4tmqf1/1YlnPs8us3yrz99LJjaWL
  9uowCo6ynP00fM7XeSi38+c0vRKFx75w97BNF/kbIzH13Y29ddrXX1+O/3F2T82dtfngr/pS9
  zbv/s096Bd6fH2O7T02JpTgj0VCLuag4EQAiUIfKXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1666055292!278382!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3709 invoked from network); 18 Oct 2022 01:08:12 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:08:12 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D14F110018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C5D8E100043
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:08:11 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:08:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gst-editing-services: upgrade 1.20.3 -> 1.20.4
Date: Tue, 18 Oct 2022 09:07:52 +0800
Message-ID: <1666055276-8042-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:08:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99212

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...diting-services_1.20.3.bb => gst-editing-services_1.20.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/gst-editing-services/{gst-editing-services_1.20.3.bb => gst-editing-services_1.20.4.bb} (92%)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
similarity index 92%
rename from meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb
rename to meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
index d14869b06b..37f7746846 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.3.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.20.4.bb
@@ -18,7 +18,7 @@ inherit meson pkgconfig upstream-version-is-even gobject-introspection features_
 EXTRA_OEMESON = "-Dvalidate=disabled"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-editing-services/gst-editing-services-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5fd896de69fbe24421eb6b0ff8d2f8b4c3cba3f3025ceacd302172f39a8abaa2"
+SRC_URI[sha256sum] = "aa03e983af5d79c1befffe3575b034e60960619a96bf877447cb73c28016fc41"
 
 PACKAGES += "gst-validate-launcher libges"
 
-- 
2.25.1


