Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E131CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=U2fUo6XL;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628666; x=1790164666;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lgNunmlrimhOW5oeFQQmWuYeuSyYqp1fpi2hh+kJbY8=;
  b=U2fUo6XL3/Zgc5EUZpozWoaKD3BqOlxp0wv3EtjV+AHqkqA127J7R44Y
   Str287PzyVhhFNZag4b2armTB9U/ztdWuaFAkD+8aSjacHG58wFzsPAJO
   c+AfkpbtTtcEQq/nAIEoUZWF9kOkia9bZchTr5YWpHMd/3zJ5KqDpFonI
   fft1xiqAcQ3lAK8uTIOquuPVPzrBa81s7HHUjjqfx/3K7UnTcPmjSlk7p
   WxXZCjITgbuSoys3rmXl6vT0AgULmWyO6sSG5ViXyIDpGrxVfwV0D5Cki
   FqJ4vTFZPN/byH30q3j3UOJCYHmQiJtrUelMFUwA75xbdwC9liyKzn71f
   g==;
X-CSE-ConnectionGUID: nJXpCJS8Qk6aUAwbNpO+2w==
X-CSE-MsgGUID: bkiuLtusRdWocAot7ZZvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821778"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821778"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:46 -0700
X-CSE-ConnectionGUID: 8ebPkiwqTv2CEALwU1r6VQ==
X-CSE-MsgGUID: 2a1jdbNAQguhZClrc2AwUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875127"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 03/24] nodejs: fix build with gcc-15 on host
Date: Tue, 23 Sep 2025 19:57:06 +0800
Message-ID: <db93848ead8c679acd6f778029aa66ecfeb16071.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119692

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-src-fix-build-with-GCC-15.patch      | 33 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.18.2.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..9d09f4f482
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-src-fix-build-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From bade7a1866618b9e46358b839fe5fdf16b1db2be Mon Sep 17 00:00:00 2001
+From: tjuhaszrh <tjuhasz@redhat.com>
+Date: Sat, 25 Jan 2025 10:34:54 +0100
+Subject: [PATCH] src: fix build with GCC 15
+
+Added cstdint to worker_inspector as on more recent version of gcc
+the build was failing due to changes to libstdc++ and the removal
+of transitive includes.
+
+PR-URL: https://github.com/nodejs/node/pull/56740
+Fixes: https://github.com/nodejs/node/issues/56731
+Reviewed-By: Antoine du Hamel <duhamelantoine1995@gmail.com>
+Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
+Reviewed-By: Richard Lau <rlau@redhat.com>
+Reviewed-By: James M Snell <jasnell@gmail.com>
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/bade7a1866618b9e46358b839fe5fdf16b1db2be]
+---
+ src/inspector/worker_inspector.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/inspector/worker_inspector.h b/src/inspector/worker_inspector.h
+index d3254d5aa0ebe4..24403bb1704c40 100644
+--- a/src/inspector/worker_inspector.h
++++ b/src/inspector/worker_inspector.h
+@@ -5,6 +5,7 @@
+ #error("This header can only be used when inspector is enabled")
+ #endif
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <unordered_map>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index bef62f88eb..8af90e782a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://libatomic.patch \
            file://182d9c05e78.patch \
            file://zlib-fix-pointer-alignment.patch \
+           file://0001-src-fix-build-with-GCC-15.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

