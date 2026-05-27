Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBADCD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16800.1779875362281806675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eD1NkqHN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875367; x=1811411367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ncy31ZDerVCkq408E9oCMTx1bLjBU5cbBi6IFGLgDno=;
  b=eD1NkqHNApID8dgkkj9ARLn1Y5OZKa7VRUKD6l55tY2C8AhqpXZ9AKV3
   6WT2FAb5rL0VRt4PH2apvYdrf6zP1FluZvH6Nmm5TMowJDqBJej/ImtfV
   aERexSQOr4WcwKu5KZrWUqBqd14n7QUdarPCYPT65UZbHiysTh0LkPIO6
   z7oUVATopEh1mPU7wV24yHyGjl75f2bV1d2knt3sYO5C2GJsbfzFh3lhi
   wM4hSc3DxQzTi2xvuAZYowo5pcmtQfhFTZUQA0YgqZtwGHfcUHCMu83tK
   H3Y14l2Yg/YtWVfpOFasNu+OicaCLZahfWUZtOnOzcZVDwd0ZC7qOcj+m
   Q==;
X-CSE-ConnectionGUID: a6sPXFC+Q0Sfilv3WhLFGQ==
X-CSE-MsgGUID: ajlPIPAoShmdtXXVg+tixQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264240"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264240"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:27 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3A0C0C00357
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:27 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E682FC0918A
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E745882A2C9;
	Wed, 27 May 2026 09:49:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/56] python3-soupsieve: upgrade 2.8.3 -> 2.8.4
Date: Wed, 27 May 2026 17:47:51 +0800
Message-ID: <20260527094805.2039-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127249

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- FIX: Fix another inefficient attribute pattern
- FIX: Limit total number of selectors processed in a pattern to prevent massive selector requests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.8.3.bb => python3-soupsieve_2.8.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.8.3.bb => python3-soupsieve_2.8.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
index 11a2b5e103..ec58d0985e 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.8.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349"
+SRC_URI[sha256sum] = "e121fd02e975c695e4e9e8774a5ee35d74714b59307868dcc5319ad2d9e3328e"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


