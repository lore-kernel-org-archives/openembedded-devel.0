Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF3CC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3364.1787132206296940856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZTer+Laf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132210; x=1818668210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nuc5TPU1DF+y+NRAmyLaaUWY4OCVOi4dmZzv7wqjMsA=;
  b=ZTer+LafyC2jt100bBltM5SyliPUDSBQNyWn0g5q3xdCyBV3ONsy5SIg
   AAE0fDcj+Cuk690NACwoZo4yBAfCzBbVUYgj4AxzVHpvO+pTXJqrxiAdM
   39WYMOT4BtcJ5MoVGO5FVi7GTuCYvWLLI8CaGdfOC697Utb4G3J+Q7ZMP
   GYiQjm2wi+MKDuiGqBdpa1g/zy3zkOP2cmxXs3LYO0dYkjVFzNhyzVQo2
   ZMWmY5+sD8pdVo4SNNJBUGALxFPBaeUis1YaTga+ILE7tXQ590z64y+1Q
   4FdG/oBcbJKQTG06rJW4qXvT1BhyGLRYSdruPR91O1G2mIUIKfbvbPiYw
   w==;
X-CSE-ConnectionGUID: QJDw56wZS4u6SmBu7/pEUg==
X-CSE-MsgGUID: W6jvyVvPS0et3atGzkkRlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357104"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357104"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A30731002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5F405181AEA8
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 688461801C0A;
	Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/70] python3-pyee: upgrade 13.0.1 -> 14.0.0
Date: Wed, 19 Aug 2026 17:34:52 +0800
Message-ID: <20260819093514.1101-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129318

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use uv instead of pip-tools
- Move dev extras to dev dependency group
- Drop support for Python 3.8, 3.9, 3.10 and 3.11
- BUGFIX: Remove all listeners only for specified event

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyee_13.0.1.bb => python3-pyee_14.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyee_13.0.1.bb => python3-pyee_14.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb b/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
index 917e414742..8c89a7e212 100644
--- a/meta-python/recipes-devtools/python/python3-pyee_13.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyee_14.0.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2b1cc8797dff32cec5d783148fceab5"
 
 DEPENDS = "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "0b931f7c14535667ed4c7e0d531716368715e860b988770fc7eb8578d1f67fc8"
+SRC_URI[sha256sum] = "76dd0f4314ecd27f02dc73589dea7fd3853f9b6176d8ef9b122860657e3602de"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


