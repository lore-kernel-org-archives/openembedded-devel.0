Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E87CAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gSeMz1F+;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628687; x=1790164687;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uW2u31tXLLOHwNClHLjWZL6WVsjIhoxPNrGyEI4Y1OM=;
  b=gSeMz1F+D887RJBZYS0ZgT9KLG3hp/c7Oc4cguUdOMuf9WNeY5bef007
   UfTObCouBaVWhu6dhfcB1UD8ByL4/uRaXxcCaam7x6QhPZfIppG85ahYi
   BjhmiezVIgr3qS4Ns/ztXFeMEJ0vMNHiNxq06+TbhI9TCOLpqqwTXxIPA
   kFBRTvsNVUwCafhj3SjxNtXG4LoEr9w4NfN024CUk2UyxAjCh1ap7G90S
   Wq9EwKzfhO73he/dB+H01f+KwdjSvWEbw+msTPgyDdioJa82YfDlkV/qs
   VwwTaIZ7VyWFxx+Q4TAC0CWFWGUX4CrIxw98RP+EZZGuf6gvPpO8qi5lJ
   w==;
X-CSE-ConnectionGUID: qqIFsxaHR4SqavTS4G+gyA==
X-CSE-MsgGUID: wMQIG8ngT0unvCwCzlNNSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821809"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821809"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:07 -0700
X-CSE-ConnectionGUID: +KqkvoYaQ5CwRNSIQGvvSA==
X-CSE-MsgGUID: 5WeYSQluT5WxoXp+mytVkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875232"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:06 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 17/24] lcov: Add missing RDEPENDS for nativesdk
Date: Tue, 23 Sep 2025 19:57:20 +0800
Message-ID: <fd29867987066fc047482b90796bbcd5fdf1a481.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119706

From: Jef Driesen <jefdriesen@telenet.be>

When building an SDK with lcov included, gcov isn't included in the SDK
by default. Running lcov to generate coverage fails, because it tries to
use the gcov binary from the host system instead and that cause problems
if the gcc versions do not match.

Signed-off-by: Jef Driesen <jefdriesen@telenet.be>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 0cd6283a4174453ac8d927d917268ba0c3161a02)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index 81b80790fe..6b8c105d3e 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -50,6 +50,12 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov \
     gcov-symlinks \
 "
+
+RDEPENDS:${PN}:append:class-nativesdk = " \
+    nativesdk-gcov \
+    nativesdk-gcov-symlinks \
+"
+
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
 SRC_URI[md5sum] = "bfee0cef50d7b7bd1df03bfadf68dcef"
 SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"

