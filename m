Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71CAC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 16:30:17 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.12214.1647966617097054917
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 09:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FOdxxzF0;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647966617; x=1679502617;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A/8gXfelA976jrcZwmRknyrQYYWNzcHAzc2dmn6p40c=;
  b=FOdxxzF04eYP7WCnI7T64x0+kdtAP6VPKlXeNh3c5i+A8z5zSBqAHy/r
   FHB2NtqKfXmASSjluMOCl64tkAW5mKWPz58agD7EnhyVoJYMQyWm7cues
   8Io6QG7ju+idLQoVzZgX68ZKz4udxLrm4gjrqP20OHXMtN0ItAZOxpmqS
   CBMmtNty0LpYfvioij1ThOELDeOJGIbZN3HcIMI2q0abC/Zb9k3NtqVvQ
   M13wNauk/Lzvg/4TO3uR8IIz6oSlBS/aZw2W3eIBOgDwMD8s0S7B5m6M1
   0XEibmfiQZHF3Fs1MAlHjdAS0SmvVdxJ/yERtUZMXex3/JMTTc/TgIhUA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="256688310"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400";
   d="scan'208";a="256688310"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 09:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400";
   d="scan'208";a="647094262"
Received: from preeti-ilbpg12.png.intel.com ([10.88.227.75])
  by fmsmga002.fm.intel.com with ESMTP; 22 Mar 2022 09:30:15 -0700
From: preeti.sachan@intel.com
To: Openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] live555: Allow output package if it is empty
Date: Tue, 22 Mar 2022 12:29:13 -0400
Message-Id: <20220322162913.1150789-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 16:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96145

From: Preeti Sachan <preeti.sachan@intel.com>

Allow to create package for empty live555 as needed by
live555-dev.

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-multimedia/live555/live555_20210824.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210824.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
index 0e0229779..2061173bc 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210824.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -55,6 +55,7 @@ do_install() {
     install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
 }
 
+ALLOW_EMPTY:${PN} = "1"
 PACKAGES =+ "live555-openrtsp live555-playsip live555-mediaserver live555-examples"
 FILES:live555-openrtsp = "${bindir}/openRTSP"
 FILES:live555-playsip = "${bindir}/playSIP"
-- 
2.25.1


