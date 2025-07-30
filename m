Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C0CC87FD8
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.31371.1753869307251550651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U5vmz+Ip;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869310; x=1785405310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4/98Ken4TttokSw9VEOOf4mtaLVBye+9SRcLjrYn/eY=;
  b=U5vmz+IpY40yI2gN4ZVzcC+dPGx0Q7x8A3q3JR3tU0jNeSDQZAqSa3ws
   PCjH7LBBQCQLOK0+gK1g9wK0r8e2AdlMlTGejsGjToA15IAPf1/0o5AgP
   uufTJMRtmxvFaXYcaeWTPeSlb8LqWCcsx9a6Jdvxkpeeisx1/V/2OmhHT
   r0qU2ut8CreIPC6mjlZrDLyD7qVi02ilu/YMCK9tnVXAcHGf/KzNs6To5
   DApS2fEyZrAKIz/jSnQ9JygggBhNCflba1aW3/QA2cxuA+udTzmxdreAR
   c7X/Wh3RtUpPixBHcbfTS+rlKCqPZ0g52c1wytme6Znf9dR8yelazHKXX
   A==;
X-CSE-ConnectionGUID: WSezqd+FRDiesG6YRgd+jw==
X-CSE-MsgGUID: IPfl2qqAQKiUKqsRMk/bdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186784566"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186784566"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C72251000341
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3623DC03416
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 983491A008D;
	Wed, 30 Jul 2025 17:55:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/40] nss: upgrade 3.112 -> 3.114
Date: Wed, 30 Jul 2025 17:54:33 +0800
Message-ID: <20250730095456.695-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118786

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.112.bb => nss_3.114.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.112.bb => nss_3.114.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.112.bb b/meta-oe/recipes-support/nss/nss_3.114.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.112.bb
rename to meta-oe/recipes-support/nss/nss_3.114.bb
index cb35539b04..14aa12c923 100644
--- a/meta-oe/recipes-support/nss/nss_3.112.bb
+++ b/meta-oe/recipes-support/nss/nss_3.114.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68"
+SRC_URI[sha256sum] = "cac3c0d67028804fb316e9695f81749fa4dc118e731d674b4c4c347bd849c2f1"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


