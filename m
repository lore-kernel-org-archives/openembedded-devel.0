Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA664CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=gjryEPlv;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628694; x=1790164694;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K3j6Wc2s5E8DS0ZR8EMg6m1VDPfk1OUx5VBPWnBjnmE=;
  b=gjryEPlvuAi38Tg/azY0sOa47lgsQr3bVNJSx4qZwOqjmEs8VoXohEsx
   MEATR3etZn0ypR440o4etnlodMxjOmwU7/olbxrPNHonT2qLOFMcIwh12
   SkjZEV29zHRtrHuVDZt3xeBwyKMd/RLkwqSIYDANsW3vFOWacMjX0jcxg
   YpurLs0s3UbSFEx17z3kXxv9XeU12BHSfMaSayL3oB9ULpcgHUAEWCMkt
   zzYr/JvBVDuVEnsWxx5TXHiE5vCChgcCQ+wWQDO+sefZgBXAkV1BwLxKo
   KiHRup4imQsajeAwmHQdcKhRUuvsG9aBZolMlLFJn+UhJ2sW/Qi6ZsQ4C
   w==;
X-CSE-ConnectionGUID: 3+3Rjj6cTv695msPiDge8w==
X-CSE-MsgGUID: woLrsY86Q76QNWJ+EYUvTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821833"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821833"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:14 -0700
X-CSE-ConnectionGUID: qz5vyjgiTuGOs0czTS/wyw==
X-CSE-MsgGUID: dmklhUG8TrOVvpz2so1kDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875254"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 22/24] rp-pppoe: update SRC_URI
Date: Tue, 23 Sep 2025 19:57:25 +0800
Message-ID: <9a3078e6fe4ef072b6b6e97328b8e435111d58ad.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119711

From: Wang Mingyu <wangmy@fujitsu.com>

Upstream repository url changed.

Fixes unsuccessful fetch warning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c400aca52a19d74bcc05873eaad8265ecd024d9b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index 4dfdb8fc21..1bfa4d1e2c 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 
-SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/OLD/rp-pppoe-${PV}.tar.gz \
+SRC_URI = "https://downloads.uls.co.za/rp-pppoe/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://update-config.patch \

