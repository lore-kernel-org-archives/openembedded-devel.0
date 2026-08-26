Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D691DC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7616.1787731782787071634
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fUMTkj6S;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731783; x=1819267783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mVbt/sstA0UaT71iZGYMzbVXDDaF2v2cNuDFezhnLjw=;
  b=fUMTkj6S9oEm3HzXkFUZ6quIbcwn0FN/93CZHxn7oUC/jvKH2JGDprI3
   CRxl75sg1MXHobxa8M5VRnEDt4rbfUBBCVeaVZRbrzRta3bFZ5DTYGGsk
   2mQdlqYw7KRslLF8snKeSa+fcKwNDYM97Z9onWxfb7hlTO+Be6SDeyls8
   Ipgy7Fhs2fSjCiYjk/WhCygN2oOH1FHmZQGx4UOn1pr5ocKF2IJ4++/da
   +TpmC9s7qLCGFlVN9arYn9Yrwi/Bt3Ecqid6v23U0BeAbdNfNV4H2W8n6
   NhpDmu2HQz07/nFtNm60pZ4CgteIzRc4ajmUEwmt+K9rVN8XeKNE5VgLe
   g==;
X-CSE-ConnectionGUID: AItNub9QQyyDnIqLJ/C7yQ==
X-CSE-MsgGUID: 1K2cSQ5NRaeSM47TuEIkeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252688654"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252688654"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:41 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DA41C1C1C701
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:40 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 966D9180A311
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B47581404AFF;
	Wed, 26 Aug 2026 08:09:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/23] libmxml: upgrade 4.0.4 -> 4.0.5
Date: Wed, 26 Aug 2026 16:09:09 +0800
Message-ID: <20260826080926.989-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129498

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb} (92%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
similarity index 92%
rename from meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
index d692774f08..01142f6f0d 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.5.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
-SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
-SRCREV = "0d5afc4278d7a336d554602b951c2979c3f8f296"
+SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "18d5c7dd9c71ebc1d3f21fe1e0614300babdda84"
 
 # Package does not support out of tree builds.
 inherit autotools-brokensep
-- 
2.43.0


