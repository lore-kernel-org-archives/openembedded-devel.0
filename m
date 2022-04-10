Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3955BC46467
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.19125.1649610407460577117
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 10:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RrDf0un7;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649610407; x=1681146407;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ebf6wUyDSA1gJc8duJ3tgQi/zdK7tuRfafAjG2tQXIw=;
  b=RrDf0un7GpPQO7cPf5xxt5QuoBSUaI4Q0q4srJD+ix3bmGkNEJuk71Fb
   fFasWOiRZo5qdC/KsKEUrCTbJCuGqQESmlUcjUaRW2XcKxFW2l5jjR46o
   ZwUBaBrZYV617kNz0gpL2bW+H4ATn4fOeCoSbsMOn3G2/Tm32zgBztBuh
   bx4MPyruee8xa7hwlqE9FCJJQsI8SwG02hQzS2nHi3H9Hdp3kXlcDHlrG
   cvUukUvSlVOCbKMkQAeyCTA1EDpsvSzTWsOx+WpJKBTmiEzLmmM6bcalN
   p0AWqUzF9NZhdH1m/WcimksLYtZxvjcYkA8uXStOxMA9znbszVqRJ6v/d
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="242573761"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400";
   d="scan'208";a="242573761"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2022 10:06:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400";
   d="scan'208";a="801201570"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2022 10:06:45 -0700
From: preeti.sachan@intel.com
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wxwidgets: fix pkgconfig no_gui conflict with opengl
Date: Sun, 10 Apr 2022 13:06:33 -0400
Message-Id: <20220410170633.1399502-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96505

From: Preeti Sachan <preeti.sachan@intel.com>

PACKAGECONFIG can not have both 'no_gui' and 'opengl'.
This fixes parsing error: PACKAGECONFIG[no_gui] Conflict package
config 'opengl' set in PACKAGECONFIG.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index e82143040..c14179386 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -48,6 +48,7 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui'
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
 
+PACKAGECONFIG:remove:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'opengl', d)}"
 PACKAGECONFIG:remove:class-native = "opengl"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
-- 
2.25.1


