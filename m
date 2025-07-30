Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9C4C87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.49376.1753918173228710763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iI7DjqYG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918173; x=1785454173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WjtfLd5K3Ca/6J1/eW+2k4KXx0g/yJT7um1FweQralQ=;
  b=iI7DjqYGI/nndEGif4InmJ9kSv9r3QN194xggJvZOMAu8a/hY18PKti+
   W2gdZU82YZ0oYAWgZSudxbdRUBy3/kAQsgF5pYaBroS6kvNpYOSXhv4Ty
   eri20iJy2ShLeh4A47DCWMC11bKeKWe6Z5tNW/7mWnozFEdL9Y6r++O5c
   okQfaMv2lMKq2kuDih+x0wi14aL/kr2udjpW13SHve/FV6kLrOwSAWvJZ
   gbLGyPToswWQKoVzgrWxBS5XdrPSLjZ/hQRjI6gt9dJDBvs9CgFW3rkEF
   Y1d9odD/+DQmysGxLLn/vEUwsSCXw+czw3Ic3jLalR0Rcke84dyACY7em
   Q==;
X-CSE-ConnectionGUID: bzCkI5qnTwqbBeg07IBRzA==
X-CSE-MsgGUID: V/qJBMU9QymBrddNbAgHQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="196424870"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="196424870"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:31 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 678F71C00093
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BD15D10003BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D4301A0074;
	Thu, 31 Jul 2025 07:29:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/40] python3-inline-snapshot: upgrade 0.24.0 -> 0.25.3
Date: Thu, 31 Jul 2025 07:29:12 +0800
Message-ID: <20250730232923.522-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118801

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
- New external() implementation with support for different data formats.
- Ability to declare custom external formats with @register_format.
- external() can now be used without snapshot(), such as assert
  "long text" == external() or inside snapshots like dirty-equals.
- You now have to declare format aliases if you used outsource()
  with a different suffix than .txt or .bin in the past.
- external_file() now follows the aliases defined by register_format_alias().
- Removed unnecessary uuid7 dependency introduced in 0.25.0
- improved performance by checking for "external" in the code string before
  parsing the code and checking the AST
- solved incompatibility with pytest_pretty
- Fix issue terminal with is preserved
- cleanup temporary path

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.24.0.bb => python3-inline-snapshot_0.25.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.24.0.bb => python3-inline-snapshot_0.25.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb
index f32eb2e212..4f7949bf41 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.25.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "6aa304f2904103a449f3213e059728da5f1c34757f943efca837b4669f290843"
+SRC_URI[sha256sum] = "99fc959d1362443b7551246d787f80c4c1d7cc69963ac018caeda3f0a0b3736f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


