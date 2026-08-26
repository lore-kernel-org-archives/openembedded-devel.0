Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97296C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7662.1787731805332347600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lan544ht;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731809; x=1819267809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=td2h3pOlJ5/WZgCepF/QvQWcPEVWKOiCAJWaPNTeHUI=;
  b=Lan544ht4iDuOpctDX1EvsAWXjLfZGyZA9k9Dv0hvorUpLAVoo8Xxc41
   H7vJlW6qsUNOrbe7OS2x1NuiDvr1INGhalBCuQekD9cu1p6JIiaWakhk6
   j2qzuV3EBoZkVLf+WuGsAYhn417RIx1PToWkr0eDT9feOJpNVtEHifyGU
   YflFRqYhim1i/2casI/Q/fKOeUiz/JA9cXIJ1ql3n/GRuu94M+eNxgZBW
   xWLGR/oWu6mgpkox7gpFADC3dLTcVStS7CoqQeu0ZpfNRFw28ZXMjbNgL
   yNDJiUUghe0ticl+NEEUpj//or4p9uZtq1eaSPED/asxi6PHbHBHre48V
   g==;
X-CSE-ConnectionGUID: tPOHzu/ETP69kaYBCtVM9w==
X-CSE-MsgGUID: HF0xnW8lRcKjRMJPw77clA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="231590054"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="231590054"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:10:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9854B820C1E
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 52FA71401272
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7603614000B3;
	Wed, 26 Aug 2026 08:10:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/23] python3-stevedore: upgrade 5.9.0 -> 5.9.1
Date: Wed, 26 Aug 2026 16:09:23 +0800
Message-ID: <20260826080926.989-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129512

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_5.9.0.bb => python3-stevedore_5.9.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.9.0.bb => python3-stevedore_5.9.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb
index 225e36dd9f..7355edc349 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "abbd0af7a38a8bbb1d6adea2e35b17609cf004eaac323e88a8d8963640dd2b3c"
+SRC_URI[sha256sum] = "e97a2667923efda926e8713fde6a73616df68210a3cbc6f02b48967b676fd8bf"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.43.0


