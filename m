Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928E1C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10314.1785820772627004869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OjqGFj8+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820775; x=1817356775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wzog2Qg22Z1JW9G/2Dao5qMmWfsxh81a1dUuBxDc5zo=;
  b=OjqGFj8+71aEMbs1PBEOUGukuhEI1ubi0X/gaSNn/8T9MV+Hes9vc8bW
   Dnxam1NhsrtJa3ljq5vnncIWA7X/xvYZQSZei6otJ+l2eNi4sngkP37/U
   6ouGb9QEdagsW3o9kkvaSGOUdVrpxUI+E+nNbj1KeJ9mWlog+KBMjNm9N
   tMJyWmlzktsdlLvOCTckSOm+JymnS9HoIUFwomOfFJFtxw/3r71l3h/Ce
   cDY9eBnpUdTARmU8k0sZcWNQr4VoRTz1LNnWmigxxFjl8R74t7JVkwM/h
   G3NOFNhnz5KwbQJeQK6e+eVMVWROaH5aj2qly4pqdkkCGf3bSCIA0YpDS
   Q==;
X-CSE-ConnectionGUID: uyikuFHpSWeo583WCm/I+A==
X-CSE-MsgGUID: js1XOpsjTOKo6VMLHy5fWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="227335494"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="227335494"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:34 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0F27A8204D2
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:31 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BAB0BC0119D
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BC64F1800131;
	Tue,  4 Aug 2026 05:19:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/28] python3-twine: upgrade 6.2.0 -> 7.0.0
Date: Tue,  4 Aug 2026 13:17:22 +0800
Message-ID: <20260804051726.1489-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128729

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_6.2.0.bb => python3-twine_7.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_6.2.0.bb => python3-twine_7.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_6.2.0.bb b/meta-python/recipes-devtools/python/python3-twine_7.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_6.2.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_7.0.0.bb
index 3e4898eddc..58c4ae434a 100644
--- a/meta-python/recipes-devtools/python/python3-twine_6.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_7.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "e5ed0d2fd70c9959770dce51c8f39c8945c574e18173a7b81802dab51b4b75cf"
+SRC_URI[sha256sum] = "85cdb29c518efef867360ae4acd4b0dfd61c8654a22fca08e6f8539f05022177"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


