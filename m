Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D25CAC5B3
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=YWcSfKiE;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628690; x=1790164690;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rl2mo0wZ+K6kPTxjV7n6YEXBtGUgsFRw2gFqW/rdKxQ=;
  b=YWcSfKiE8u/uUJGKeWoj7aQ+qDle9zICATJJMCMnxQc2NO+HK1WRu9bN
   davz/tVO4/Q0CovWYrwnsu5w6EWAhIGCJftHYXcikBjgoOY1Oax7xYZF1
   7pdBR70UhZtQqn5GhgXddio2DK+qnwmUrDJ67qis6wC5o7OJKfNOxHXgh
   fGUnCbTIOBCmKKQ5zXeyacA449vQaqKPtgS2Adssitx3gNdfOpD5Aos7x
   arS6tYwHHhVd87ihZZQNzz2hR5/gPn8zJJuAYoccUzTUP+DuxdB2p6hHv
   Wj8YdzpQWplXfQAYrnYtSy6rPFRkRK6dkOdjdL1gOpEPlp4gFRic8mcjf
   g==;
X-CSE-ConnectionGUID: 2joB6v/rSEKbycv+CgJghA==
X-CSE-MsgGUID: w1W0Ym49R1C9NEpPCVDFoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821814"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:10 -0700
X-CSE-ConnectionGUID: fQ4ovqhSTA29NOmUXqd2GQ==
X-CSE-MsgGUID: cvJ60P2kRtyvr4u5jkCVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875240"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:09 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 19/24] gtkwave: Add libtirpc to depends
Date: Tue, 23 Sep 2025 19:57:22 +0800
Message-ID: <c5e3b885f26869c6c38b0c7d5e893a9643270337.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119708

From: Khem Raj <raj.khem@gmail.com>

It was missing as the recipe is using --with-tirpc

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Adapted for Walnascar
Signed-off-by: Gyorgy Sarvari <gyorgy.sarvari@gmail.com>
(cherry picked from commit 8832aa3ca83d6a2f705d4aa48496f8bd12c9cc15)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
index 0b1b054041..1b16a22a44 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.119.bb
@@ -13,6 +13,7 @@ DEPENDS = " \
     gperf-native \
     gtk+3 \
     gdk-pixbuf \
+    libtirpc \
     tcl \
     tk \
     bzip2 \

