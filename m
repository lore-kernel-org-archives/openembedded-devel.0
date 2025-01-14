Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0655AE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.40591.1736843360066953744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m87IyP9P;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843359; x=1768379359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=C5TNHWU1/5/uEH/qmuKiipDGESFfbfTrESM7FRdfkOU=;
  b=m87IyP9POZUroFqaJo6IxKEbBjb+Uz2iffCWy52IwceDbC0Jx/4jI40Y
   ZiLaTp5NKjN9Lonbuc7HH3llDCX1vxSX9ei3gMN+TsU9/8l7pGC0lNvUF
   T52ZB0dYBmi/I3F43hQZ+9zBzmcFKmxwpPbUwY2NvVTSy6ZT1TAK/QB7A
   4QZNDSMc9MYnu7Je0JDmqr5oGxmEWDKh7gtacPx7L2CaLAs7qcoCZFuIJ
   FIwhSoqfje/ZW2QOADxaD1AOotPjqHdZjt85lyLNINJcj2H/TWwlnan1v
   /YlIYI1USlCxwnalTaM7U4quygqX28OIFd+Wb/PByUsBKjr89fJ35OQtm
   g==;
X-CSE-ConnectionGUID: SRBsmByaQDC3T1gJTrj1Cg==
X-CSE-MsgGUID: Joxmz6cmToWS7SWoaLdxDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="188950556"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="188950556"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A6ACCD6EA7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E752D5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B72A6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BCC111A000B;
	Tue, 14 Jan 2025 16:29:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 27/30] ser2net: upgrade 4.6.2 -> 4.6.3
Date: Tue, 14 Jan 2025 16:28:46 +0800
Message-Id: <1736843329-4131-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10-7.416300-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwk5p7o69tnZcLewwAa76fIbyXNwz2gvsQhNjZQYyI3Jsoi2XrUn/J8m+
	hzBStanvIM9mETCO703nN0DN7HnFmSraxO2lHnv774vQ11uROQnph+d5aIVmU+9sHYZozzjTBMj
	dqd/vn/hFFrqpyvOD6zjhYDIwTGUjTfq96nnj7PEDLpaIGBnF6
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114876

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.2.bb => ser2net_4.6.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.2.bb => ser2net_4.6.3.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb
index f23692816c..52497a211a 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.2.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "63bafcd65bb9270a93b7d5cdde58ccf4d279603ff6d044ac4b484a257cda82ce"
+SRC_URI[sha256sum] = "9c23a3d82c3d36507cdb58e8a0eb33487b600fa491c05f7dcf1aaf8b70566051"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.43.0


