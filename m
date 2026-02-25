Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5123BEFD22C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:11 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42041.1772012284268859672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lDUAvrWS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012283; x=1803548283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Ohb7g6kPp300RxxOcwLY1pmcevttd6bwxvSU/3nIwI=;
  b=lDUAvrWSlZi64GCdWyrDPSrFnWni9FQNDs/LNUf6exSTSvgqoqIc9gWV
   boJa6y6BxF4xR5sMd4RuI3PZO+t7mt6axvg52G00AWrjMgYd5xAWE9LZ4
   QnVcLXDszFnvCavvikwEf4jI/DmE1s1Uo7laWUrUP2+whC4K7PFRZsj6E
   nhedCEQD5Ms++iMpqtUyF5KT5gIVUBvsbWyaF65MZqUVFlhsJX0iMlk19
   +VQOVeMAEysd4Uwy0LueYPhRIfOB+v2qFnu3UVrd9z95Fv2A4zirvNRib
   S1FzMLusz7yzjCH+KDUZHLTW+J0+4udgjeWeqDMpbYzOANWRrxqUAppfo
   w==;
X-CSE-ConnectionGUID: Ykk1hFQhTUqpbkE8BjpnHw==
X-CSE-MsgGUID: rSBj4+c9RrC1bWfE0XNoyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="235192627"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="235192627"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id D2FD21C000CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 75DCC18000BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 96653101BB42;
	Wed, 25 Feb 2026 09:37:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/33] libdnet: upgrade 1.18.0 -> 1.18.2
Date: Wed, 25 Feb 2026 17:37:08 +0800
Message-ID: <20260225093727.1284-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124626

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix copyright typo
- Fix encoding (iso-8859 -> utf-8) and add GL CI config
- config.h.in: Fix wrong return type
- Update master from devel branch
- Pull in latest development changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnet/{libdnet_1.18.0.bb => libdnet_1.18.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/libdnet/{libdnet_1.18.0.bb => libdnet_1.18.2.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.2.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
rename to meta-networking/recipes-connectivity/libdnet/libdnet_1.18.2.bb
index f79121b142..41745adbde 100644
--- a/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.0.bb
+++ b/meta-networking/recipes-connectivity/libdnet/libdnet_1.18.2.bb
@@ -4,9 +4,9 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0036c1b155f4e999f3e0a373490b5db9"
 
-SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https"
+SRC_URI = "git://github.com/ofalk/libdnet.git;nobranch=1;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "3dfbe889b1f65077efe579da34fc1d6819fcb7f3"
+SRCREV = "024ab07d88a2f70ab161cfc0a41f460cb046133f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libdnet-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


