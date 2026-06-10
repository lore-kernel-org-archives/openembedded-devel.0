Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460C7CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 03:48:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12586.1781063299263600373
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 20:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dOdxJWBz;
 spf=pass (domain: intel.com, ip: 198.175.65.16, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781063300; x=1812599300;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U++VL7v/JqWcxc5s+YF+FDBVtjikhMBRnke8zG9BlNE=;
  b=dOdxJWBz5mKAECNWrVCFLqgWa34NipfZHFuRcxQYytfxFfu6fvFfsqWu
   pTEyoJyYdKHbxc+0oMZiJfE1plywKAUr19Q0PAZe07Cq/fzW2IDwuoPP8
   GIGrNXY/DX7FIvgPJYOXOqYFPEpapk4yEU7ZlqZcwGtvq0CbLnvH6kkqE
   zigJ296pCkizXVXjkXwDwChR+Vo0CJU2KrNqvJ7zBC/pTvBdGzawJ+EDk
   D1Kctucmv5Pamx5CxJnCNhVIDzgYmO2i2r9TdSzwuT2woHfcejX/gq9qH
   K8kSER9Kw9dleYfuz/IueQd9WOvl8A2j4v2p9fU4FjRYHes52BU7MOMez
   A==;
X-CSE-ConnectionGUID: D8YOuuRtTdmX7E5TBxA6Ww==
X-CSE-MsgGUID: f1ewEEeLQPS/R3nGvlzIWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="82039493"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82039493"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:48:19 -0700
X-CSE-ConnectionGUID: 6LkmiCCaRLard2o9sbWwNA==
X-CSE-MsgGUID: HgSsb5dYRvGNVJ1lOxnsmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="244909556"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 20:48:18 -0700
From: yogesh.tyagi@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] xdotool: avoid running host ldconfig during do_install
Date: Wed, 10 Jun 2026 10:32:22 +0800
Message-Id: <20260610023222.2044906-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 03:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127505

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

The upstream Makefile invokes ldconfig at install time, which runs the
host ldconfig against the target sysroot (${D}) and is both unnecessary
and non-deterministic for cross builds. Pass LDCONFIG=true to make the
install step a no-op for ldconfig, matching the WITHOUT_RPATH_FIX
handling already used here.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
index 75fa636838..e2792ed0b0 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
@@ -18,5 +18,5 @@ UPSTREAM_CHECK_URI = "https://github.com/jordansissel/xdotool/tags"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+\.\d{8}\.\d+)"
 
 do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix} LDCONFIG=true
 }
-- 
2.37.3


