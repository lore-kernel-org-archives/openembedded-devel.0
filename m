Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1D1CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.24193.1761696956390770229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aJNTd5S/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696957; x=1793232957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=90TF/Oy4IdFQ99rLW2+tyNkTjCL8v7Ztdx2JIA0oTjs=;
  b=aJNTd5S/GPqPm6jEXlPFR8XGJOWVFBBNg0ZY1F1FmVatzvVnadIiJDbf
   Yd4+LcQsskDNObBidwu9jQ3MgakfFe5xcgb51VdCioK+fhrK5JWg5YgvB
   1xi36XozmikqHTtpFOOyLf1w5+vAhWXz4+6Y1hX/fh0xQNdTqjjPx6eWO
   f7wVUUYOM2qnWcJz9QAJjgMzsmN+UTOEWmeZW+shbRYW3R+Oz3j3A7d4C
   peYM9oO+TuA77tPC79cgHhDNWF2PNXgyPz8ihd5k4kL0hPnOzZrAIrCFO
   QQdA28YGRsys5SmOBRA+DJvaNEaMbSTER7R5Rp9Dh2n4zohj9jq2nuMt5
   Q==;
X-CSE-ConnectionGUID: bi3UVJyjTLyMyQMRB9RVMQ==
X-CSE-MsgGUID: wwtyWu01Qx66zuGH2LlSRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217403010"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217403010"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:56 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id D78D0407559
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 951EBC012A6
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0098382C0FC;
	Wed, 29 Oct 2025 00:15:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/32] python3-inline-snapshot: upgrade 0.30.0 -> 0.30.1
Date: Wed, 29 Oct 2025 08:14:53 +0800
Message-ID: <20251029001505.528-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121126

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Disable ensure ascii in json.dump to support non-ASCII characters in external files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.30.0.bb => python3-inline-snapshot_0.30.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.30.0.bb => python3-inline-snapshot_0.30.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb
index 6608b34f64..ea1f15a5bd 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.30.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "486e996ef133d4d91bacf78c8b712f76668709e7ffde6d9d925148d36c7c8fbd"
+SRC_URI[sha256sum] = "77c2e94a40f2da02909b39e3386c9fc23f532c92af45558e2d7bbabb5fd0cbc1"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


