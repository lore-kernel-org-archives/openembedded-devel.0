Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B2EC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 04:04:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.23815.1683605090633784767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 21:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=RoaQT7dw;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683605090; x=1715141090;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Lc13aqpGTyjExiP1xkOM0s/MGYxJf99Lwz1HuwTd/vo=;
  b=RoaQT7dwkcHAk+DDL4mu3zQXoXLuj0AC/yWwBM9skoFYUTnrkkyeSvxS
   KAuuuyXtusaSpWxd3OVnzXb6XzFNSteH3vK3+D0XmxogFotu378YIE/EL
   KqCseuptxBGmENQi1JnjViNz9DcRFsPqjJSLpwE1tyYrBqupNBjjsTbkk
   X7RGsm5LW3W4R+NnSSUaYmunjYEjOZgfuuTbSvtcVCmzoafWsoptgzVVu
   PRwNiTYeHcVWw3o4nL7Fm9cKSbO0XAV0Y1UprAkuC4wTNpdcfE5hvSjaM
   /8nUlCWPXv5EtQiybx6KY9LVqkm/uGq+BtAjN47Q1WDIGMLd+x7x5H3iI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415369859"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="415369859"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729317053"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="729317053"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga008.jf.intel.com with ESMTP; 08 May 2023 21:04:48 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone 2/2] capnproto: upgrade to 0.9.2
Date: Tue,  9 May 2023 11:53:09 +0800
Message-Id: <20230509035309.3773590-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230509035309.3773590-1-chee.yang.lee@intel.com>
References: <20230509035309.3773590-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102460

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-46149

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../capnproto/{capnproto_0.9.1.bb => capnproto_0.9.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.9.1.bb => capnproto_0.9.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
index d14bd843ef..d114ad0c63 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
            "
-SRCREV = "b49431c48d40490ef979247d308af63345376cee"
+SRCREV = "0274bf17374df912ea834687c667bed33bd318db"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.37.3


