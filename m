Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6D9C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9388.1788344972222737257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UdMJ6+ns;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344976; x=1819880976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ADYoctn7T3sdCjSQvqgrAzQZ2ur4J9wUbRwv7wYeDTc=;
  b=UdMJ6+nsHUIY81rdSRvEjiGHfe72RzgpfFE+IVDG/eOjqNiKPI+XpqDQ
   LFV4R1+s87+i/gqcKS8WJbp7mwo1MpF51wgd8babBY4iGtQlodpyNntpE
   a1S1Ny1AQ29GiJIfRBDFnkHwRdYH842lBdArnsBEE99PgHGL30UPWAMoW
   cneGhEyVceJeASVTCn6eKaUhlJM0GgEqEgMyMG+b2bATS32utHohUDYEG
   d3BOS2VH0ZJfmpmFrU3wUSWeQXJaeNnqfgvXo0aNV5CUXKOQ/5hG0I6Zj
   vFDoXkuFzVp8KpmPTQ0C2sscDvDsrKKBk0Dc3xFRS6LfpVfU82ZEc0ZFj
   Q==;
X-CSE-ConnectionGUID: YlzerkVqRQ6KxljLD1rDNA==
X-CSE-MsgGUID: OMPsRGSPS9i7DtFlDLHTiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="232471212"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="232471212"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:34 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8F03C42A309
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 41B8EC012BF
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5A9902000770;
	Wed,  2 Sep 2026 10:29:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/34] python3-engineio: upgrade 4.13.5 -> 4.14.0
Date: Wed,  2 Sep 2026 18:28:39 +0800
Message-ID: <20260902102900.1296-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129672

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.13.5.bb => python3-engineio_4.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.13.5.bb => python3-engineio_4.14.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
index c31972041e..25940cea6c 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.13.5.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.14.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "b5764d62243e3ffbc4c76dda3d7897c329dc52294c80c27105f9faa054e76897"
+SRC_URI[sha256sum] = "eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d"
-- 
2.43.0


