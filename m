Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2806DC27C6D
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.9833.1717664824369862873
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VkCYKiEO;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664824; x=1749200824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fjZd+xNuCv3EHtMIANH67bWtAH11XRrxYDPbyoHzgXM=;
  b=VkCYKiEOqXt2mUhvT+1kJ8v334VL/UULO4xsommzTte2mM/k8TNeyfV0
   ICAvUq0tbrjRGDg0YN3MEK/BxWh9JM5Bbx0jfA317FIBRpu2h2Ypvp2lv
   5hj3XA6BG3tRa+WMm95zDUbP0TMUA15OrseIpGWD7zByIS496Gb27N4QL
   d0smF5Glcr4+/2yS3uoOeeNaNQ2djb1n1eI7ao5okk2oUOAPbr3YLxNn4
   j+kO0yjoovFNuAHRcpMXzBKzPycKIloqO6JfmCniTQ9C4fPDhtBv62nqr
   irfL/SrCxhvSjgnbF9sZSIS4o8sz1agvikvxAsLqaVDCWxzBdbD40d0tT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141239190"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141239190"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20064D4F59
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EBFDD9731
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 043BE401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A20161A000A;
	Thu,  6 Jun 2024 17:06:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 22/36] libio-compress-perl: upgrade 2.206 -> 2.212
Date: Thu,  6 Jun 2024 17:06:21 +0800
Message-Id: <1717664795-13902-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.646700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yXg2y0j5vXZGK2GKtdiFmTnaNMi+l9LVfxQr
	bjPnytRT4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedduZ
	RuRKwoPYdA8XPYQyAUNfOKCnopUTU6WZ8G/zxUhOeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNWGCGZ0is/hFP8z4ho0t3i35gVZTY5E7aEqEbfyDt5b8oiC6GEuY2PWl1qyzBiTR6xu9K
	L1lCBEDD7ivLNMGhq/8LLAaOR8TAw3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110730

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright year updated to 2024.
 add feedback ktest

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...io-compress-perl_2.206.bb => libio-compress-perl_2.212.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.206.bb => libio-compress-perl_2.212.bb} (84%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
similarity index 84%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
index c58e3fa30..bb4013ae5 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.206.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.212.bb
@@ -14,11 +14,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8e78b88f9c8ac08ae03e8ea81195ca45"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=254a3b5756814db98ee483c8974736c6"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "7d3062b9a494f757e8d0614f220d83f22731bbda1aeb5f7cff0e72a83f433d35"
+SRC_URI[sha256sum] = "687490dbf9c4be42c22a945c4601812be5f4d38a9836018148915ba9e0ea65b1"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
-- 
2.34.1


