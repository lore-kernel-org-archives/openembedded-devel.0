Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CECF9CAC5B6
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=XPHJuN3v;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628693; x=1790164693;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/0878+JDE6e1T+Bp/6J4i38TA8s7jW+pZQsgTOvdJLU=;
  b=XPHJuN3v14/5dO3UK4ybIbaPO/UZT2sbfsDKDXXCL2mj65MPdVrjkYzY
   sJ1SQQYYp/YvXD4qjx/lGen+sdBiqcl+BJqMCkrBdejdqNUnBfw5WJQAj
   I07LFBPsj+GGrb09pcMKOSMzkVNVU8oNqnacyHNDE84j4Bllj31WMazii
   waptqyzyiX3b2ILIuXRhtWu9b6N1ftbPVNXnzRPua56AIMID2WwPCMRs+
   p4enGoai4J6Ec3phVl1YUPhFWnBlCKbl85DBiBPGhBeq5SrM+RkSPffjd
   lwt9L3Kvn1yZOYySXE3bW+NYclgRIiSnPO+oodODZabPa7hVWAx+s8/NO
   Q==;
X-CSE-ConnectionGUID: eCkkQ7HLQ1+9DuS6o04YDw==
X-CSE-MsgGUID: 1yL8Tk0GSeS30p08z1Ixyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821826"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821826"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:13 -0700
X-CSE-ConnectionGUID: IegQVqv+RW+tl5gQG3m+ww==
X-CSE-MsgGUID: 3styo79jRQqe/GsX+NuiNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875248"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 21/24] nng: Rename default branch of github.com:nanomsg/nng.git
Date: Tue, 23 Sep 2025 19:57:24 +0800
Message-ID: <429e7401a2c4b412e26d4bd78bb507adf4b9a9ca.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119710

From: Jeroen Knoops <jeroen.knoops@philips.com>

Default branch is renamed from `master` to `main`. Commitshas are the
same.

Signed-off-by: Jeroen Knoops <jeroen.knoops@philips.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 58679b6a515b51d28c480836ad598fca6f0cc655)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
index a6556249b7..9ae3b89371 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
@@ -5,7 +5,7 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
 SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
 
 S = "${WORKDIR}/git"

