Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD67C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9716.1788344959447375356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LHRLXmkK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344959; x=1819880959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PbfbvPDgatMPbXPwGsiYI3kR7yupHmPDlzruzSpJgcA=;
  b=LHRLXmkKMUKR85TTc2r8h4KsRupw8+0ARZZgzoLfb+9BtOPRCqdhObeZ
   QsL0Lg+0dCiworDpZJTA8yggu6AGNugvZR6P5wA1eeNIgaMF2j6tbI59J
   Aft1v2NRrAc2tUuggQcVt55V3LbYNpNF1AcyJJvjKD9sUJx4ZBH1IA1Ry
   IbQdaPppQJkyER0Kx32u0TBkS8Hy/PUSGoexXw7xP5nWVYsNwk9CqJg52
   h6Jsl8VIZF/l77moA+8Qo1IB/7J3E+uptY5OuGc49Hvpagd5+rLi25dAX
   DKHMjWIVkdWfCTbh+/7BjUKvDnwhjT7D3Id8iQ70gVQS7G/1muzcG1Zhl
   g==;
X-CSE-ConnectionGUID: PE3ETggeShuUUlT9qWPvxw==
X-CSE-MsgGUID: Cyfze7obTHeDQbuGqGHiRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241060674"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241060674"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D1B1AC00213
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:17 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8339DC0054A
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 82BB32000224;
	Wed,  2 Sep 2026 10:29:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/34] libvpx: upgrade 1.16.0 -> 1.17.0
Date: Wed,  2 Sep 2026 18:28:33 +0800
Message-ID: <20260902102900.1296-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129666

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.16.0.bb => libvpx_1.17.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.16.0.bb => libvpx_1.17.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.17.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.17.0.bb
index c81dde000c..8bb92351c4 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.17.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "1024874c5919305883187e2953de8fcb4c3d7fa6"
+SRCREV = "6df3ec34557879fff673706f4a1d9fbd0f3a6f0e"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main;tag=v${PV} \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.43.0


