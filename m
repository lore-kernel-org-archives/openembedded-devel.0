Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83846CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76247.1781001003126934637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HOsh43m9;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001003; x=1812537003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=scvg/b3U7tc4AmqHsogGRNewkFM1Xpz2bPU6Iv0L9+c=;
  b=HOsh43m98DdGuwpH63bQP+mFrbK3l5PitmEl02+iVf9mHI7CgGr+ML9j
   l+f8Y3NTQoUHRg3s27sAsBaVvwvGaUPz5qD3NW+zxvu5RdqZGUeGkWuW2
   eW4K6+m4wrWcVNVziVal1yNoHJ3fiabnMiWwVT+FGqxrn05zTzxV9bKV0
   9Nrhwb27KIMV67dljh6cDj75B1JQkxfLFhgPRLzEdKU1CKOs2zGoI/QCP
   M4obCRIk7xOrE0C1Kix+Px9cOdGQN8zvVhmQNm5dpl4BNHz+5aE/4JDxn
   v+hhutMc0KYiCfp0CajG970E4r/HtIx8B7V6Ip/Hdt5g9lZ/lCFWpstGq
   w==;
X-CSE-ConnectionGUID: N0tSHRmkRBedeVpNn8KcfQ==
X-CSE-MsgGUID: XgYBjcgQQ9ijKaTbnQl4LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="221210057"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="221210057"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:01 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 64963C000BF
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1FC5C968455
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3D22B10003D2;
	Tue,  9 Jun 2026 10:29:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-filelock: upgrade 3.29.0 -> 3.29.1
Date: Tue,  9 Jun 2026 18:29:01 +0800
Message-ID: <20260609102913.2204-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127472

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- docs: fix API docs of release()
- docs: clarify per-thread scope of FileLock configuration
- chore: improve filelock maintenance path
- fix(soft): refuse to follow symlinks when reading the lock file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.29.0.bb => python3-filelock_3.29.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.29.0.bb => python3-filelock_3.29.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb
index 9957fa224f..6a45c80fdd 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.29.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "69974355e960702e789734cb4871f884ea6fe50bd8404051a3530bc07809cf90"
+SRC_URI[sha256sum] = "d97e6b1b9757569626c58caa07dc4beb1613f4a2938b1e8cc81afca398906c9e"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


