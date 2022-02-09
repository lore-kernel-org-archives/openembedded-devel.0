Return-Path: <kartikey.rameshbhai.parmar@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E43C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 12:22:09 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.25766.1644409327630150306
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 04:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=auAk7tn9;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: kartikey.rameshbhai.parmar@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644409327; x=1675945327;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jVvG95c+rWI3TXqz8V13lekSVFRn+3HTPCJiXUH4kEA=;
  b=auAk7tn9BEC9fl46Mj2l/e3VYcJH1iUXOAPpffwcdkSETWatuSaZO8cN
   AooSUyDRtt6b4AvKoIZKuLzeqPqjUp0TFeI/7xSykjvW1PG/u/FWI2krl
   9qK1T0vJO58MVZZUJIrMMSpaIlZA1gAFkdq/K/zWqTR3zA68bD2E7LYlM
   NjD0KdMZercHm0Kn1bEWxUZh0eAoU3kkKRSPlXJuQMqgQLfieB7/JRDYZ
   br++hT280deW1tqvY5SuQn5pFRBn3Td9qjHykkzQ9eKpLlFbgYzW51HeZ
   5tikYkAyKF/UoGAj3at+duCQSi3yer+A0YOSMHz3xnBTWmAMgQtw6Z1Nl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246775402"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="246775402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 04:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600";
   d="scan'208";a="678558537"
Received: from ubuntu161tb.png.intel.com ([10.88.227.41])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2022 04:22:06 -0800
From: kartikey.rameshbhai.parmar@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH] imagemagick: update SRC_URI branch to
 main
Date: Wed,  9 Feb 2022 12:21:56 +0000
Message-Id: <20220209122156.4914-1-kartikey.rameshbhai.parmar@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Feb 2022 12:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95276

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

master branch on the repository has been renamed in upstream to main.

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index f5ab795fd..985f3949b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,7 +11,7 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "_25"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
 SRCREV = "8b4e00829eb84d4e7b4da11acf1f98f1e8166e5b"
 
 S = "${WORKDIR}/git"
-- 
2.35.1


