Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB53DCDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7245.1782378159813597629
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uF5ZxUpY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378160; x=1813914160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tf3S/QEgcw//p3vm44tvUm7PSP+ymeiPcS+tEx2KJFI=;
  b=uF5ZxUpYXqekztEksyZ8GlHckkPE2KU9fAGtyQs3hAThIfE1PN+6p5qG
   l44DT3iDuImmnnS4hXVrIHoBma9M89axhgL5dDlpYcNr6+yQcgkM4u0cQ
   vCvRpVd26pKoZqbWDw5Yz/ZG/3cHnhCaGNXuFxBYED3rcUXMqcJCk8Oe8
   gbQFai3orE8MnyD1amOQQdBn+4ZL/HSJs2sPv5BFgGl7mYG5spHLPxgNg
   ixPVNtYFJN1mLGurvMxwaob+bDb3GccTPgwW4ZD+6dAWeCd2Rl0/O+kia
   +/fMIZRJftnymVjDsQ21jH5u9RNLqWm2lV+xlQMHIbFS5GSpJYSuIM2xa
   g==;
X-CSE-ConnectionGUID: fGdgk3lmSky5K/vx7lKF2g==
X-CSE-MsgGUID: bo8BItbgTUOqEQGR3CFBWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="222999932"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="222999932"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 48070C00214
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:38 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 01184186CC51
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 049CF1017325;
	Thu, 25 Jun 2026 09:02:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/47] python3-txaio: upgrade 25.12.2 -> 26.6.1
Date: Thu, 25 Jun 2026 17:01:22 +0800
Message-ID: <20260625090127.1563-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127774

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-txaio_25.12.2.bb => python3-txaio_26.6.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_25.12.2.bb => python3-txaio_26.6.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb b/meta-python/recipes-devtools/python/python3-txaio_26.6.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb
rename to meta-python/recipes-devtools/python/python3-txaio_26.6.1.bb
index 6621df4016..68d660577f 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_26.6.1.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3b6f0e9bfce02a086e4ddfbc8504e33"
 
-SRC_URI[sha256sum] = "9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78"
+SRC_URI[sha256sum] = "3ee900b2331c93457530fddbccc1a320c4e2d7ac8f9073d01c3fbe87762ccb35"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


