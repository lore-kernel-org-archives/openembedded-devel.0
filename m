Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E3FEC35294
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.1621.1650385723324684438
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 09:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=OAUV3OLZ;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650385723; x=1681921723;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MJnrI+q7h0tpJMV/ZpSertHOroCC7A0LM5jC1mVFmHY=;
  b=OAUV3OLZmmoZXqR/xxTIkM5Zj3O+u7y5kiwD8zegfz3+8vO2/QlIAYbk
   I5X6SWo68S8UXKk8Sz/kkHMxZFA5nD2E/7EkKEa8mK6Rb81xy3KQjIFdD
   GEUGelEbVMuxXkLFUAy9rfrzxSTjXHyePyqJfEzfYA//JBxBRTvlh5/LG
   ZMurNmwq9ae7PnNG+9clPg3wMMVYp116Kzsk+vUO9d1OUEMyYsgBhWKKc
   QYaDjFK1+1Z/REUhA447a/A8R/QUXTTbe//RGB0ak8AIgByN3fz4jTf1T
   oLrtnp76VW0oo6tKLWVezh/E8/s8b5S+6L2JUO/7nn6wUTtu5QVlFkAjA
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263270410"
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400";
   d="scan'208";a="263270410"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 09:28:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,273,1643702400";
   d="scan'208";a="529380303"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by orsmga006.jf.intel.com with ESMTP; 19 Apr 2022 09:28:41 -0700
From: preeti.sachan@intel.com
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gnuplot: inherit pkgconfig
Date: Tue, 19 Apr 2022 12:28:25 -0400
Message-Id: <20220419162825.2202995-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96697

From: Preeti Sachan <preeti.sachan@intel.com>

Inherited pkgconfig to fix pngcairo terminal compilation enabled
by default with pkgconfig option PACKAGECONFIG[cairo]

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index 7343a08c7..fe5e5c067 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "gnuplot"
 LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
 DEPENDS = "${BPN}-native virtual/libx11 gd readline"
 
-inherit autotools features_check
+inherit autotools features_check pkgconfig
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.25.1


