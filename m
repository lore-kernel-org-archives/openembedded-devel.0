Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA48C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:50:25 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.167.1648054224454332944
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=my6Nk8RX;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648054224; x=1679590224;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xzubsvpHdpU+G4M1AqaV3uUNDCaLC2QCYqjjpaIURhQ=;
  b=my6Nk8RX8JUYNVrrKSvGyDzH79Hd3GIYSWk8puUHLJOHF01mfgeuZbIq
   FWSy6rUQxT3qu6IieWOeeTTvFIk3bEEOcxeAwKsEI+HyLl9F1N9oWENa3
   4/Dxe6/UNTG9Zx2HIAbpkNvhxjt7HavGj/LrvU70n4BkOwPt5VlLECxAu
   Gknp8QxNuiUS70Ubz6nIRGISwpA1eCSfbVaCXgMaN1PLm/Qv2lsrN9k8s
   UDa+2ivZ/2OwioMyrbn/NsSbrwgv0brlXj6ZXI/wKwzV1nNxpFjU71jH/
   qgMSP/92hs9YnritHKyjd/BCNPREG6m9PaAVWUoQZnIJXU1sMSQGswKAM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="257880592"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400";
   d="scan'208";a="257880592"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 09:50:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400";
   d="scan'208";a="544274508"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2022 09:50:22 -0700
From: preeti.sachan@intel.com
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] live555: Fix rdepends of live555-dev
Date: Wed, 23 Mar 2022 12:49:42 -0400
Message-Id: <20220323164942.1478597-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 16:50:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96162

From: Preeti Sachan <preeti.sachan@intel.com>

This resolve issue nothing provides live555 needed by live555-dev.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-multimedia/live555/live555_20210824.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
index 0e0229779..a899049b7 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -55,6 +55,7 @@ do_install() {
     install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
 }
 
+RDEPENDS:${PN}-dev = ""
 PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
 FILES:live555-openrtsp = "${bindir}/openRTSP"
 FILES:live555-playsip = "${bindir}/playSIP"
-- 
2.25.1


