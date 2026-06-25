Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75565CDE00B
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7015.1782378132562250259
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=coJwxWV7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378132; x=1813914132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GK56N3abQ4H6/EUKKiJOAtEbGuz9i06ML4+HTTiVmHM=;
  b=coJwxWV78ikxobj9EAi5PUMyXW4Ko+rPzXU5BPy1qWEts2oPSeRRJKZC
   Rspftg3V5a2Oc0jYUGqUG2P9RlsQZecq9jprMUgamQU26WCC1HanCk00a
   CTUiycl7rS2FXO6zz7bb0QlIu74Q5H1XU0Atuusd5ZxBx2dy2tuBPqrnM
   b4Dc8dnZsnRMTu9SQWvqDCo+tagt3ZwPi9B5I041N7GVSev3GwHadlLaV
   smQOyF/O/Uv4Vj8jK8kAVdxszqDNOsXiJ847YDEQdwDJvFYBWkuDPMtOo
   MUFv8AtpMR8izcs1nXu0dd49e7s1+OKT7Drbb8kBhUgIw89tYF+4x4qIr
   w==;
X-CSE-ConnectionGUID: xkYlHEGoTbqTKI2TrrI0bg==
X-CSE-MsgGUID: 1neEVcnvTYqhNK6eTadKvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245300871"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245300871"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E41E0100016B
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9848A1C2FB95
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B15081017328;
	Thu, 25 Jun 2026 09:02:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/47] python3-inline-snapshot: upgrade 0.34.1 -> 0.34.2
Date: Thu, 25 Jun 2026 17:01:05 +0800
Message-ID: <20260625090127.1563-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127757

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed snapshot updates when pytest reuses stale assertion-rewrite cache files
  after a test folder is moved, which could leave cached code objects pointing at
  the old source path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.34.1.bb => python3-inline-snapshot_0.34.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.34.1.bb => python3-inline-snapshot_0.34.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb
index de3c84aaaa..6dfb1f1ca7 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.34.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "f8af37876c42069b7c0ed73f64357ace482955c3225ebcd27f243197ecfbcb65"
+SRC_URI[sha256sum] = "d160cb6059e00916c2e846abc014ead6f01fb24479f13696fb8670d7a7937f67"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


