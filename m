Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78491112257
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7069.1775096056335327423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hJ2Qq3gs;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096054; x=1806632054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y4B28FTrPMwBtvfnOn673kdP/Z9wc1Yrd8P+BjmVQgc=;
  b=hJ2Qq3gsE6OiEvzCUJgJR+NPB8liQGzu/rjPDNQ+xFd3f4MxGZymXehu
   UuVobGgpaaPxHZh5l2K4wuNn54QXKDSDMoN0FDn7uSIbFg4wrLLRBiGOY
   RqCmMgwWmFRkQRI7pG1PlRyCMIxdJuFPeasEGs4QnWDsJb5P7s8qbcCff
   /0clkejYfLr9aR25vejVgcR7ryUOHn5Hmckwt6CKSsQgEQeS5vsqoBAqa
   GAbViPl6F0sS0RskbJVAoaJYEuuxSfsoQgEpaH4ZSSfmovm/yEm4SR97w
   Lej1npVCWWYmr/JFiZ/UQmKjx0rmEczYZHKPUXQSv8vIKCWzeOgCmsYmE
   w==;
X-CSE-ConnectionGUID: y3zdZXz+RuWtlWL9Lw14Ew==
X-CSE-MsgGUID: JN+3b4A7QEuACVJ0v/pU3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="223429490"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="223429490"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:13 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9CB1C407569
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:14 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 47E381C2DF4A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C1B9B100008A;
	Thu,  2 Apr 2026 02:14:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/39] gedit: upgrade 49.0 -> 50.0
Date: Thu,  2 Apr 2026 10:13:21 +0800
Message-ID: <20260402021355.1324-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125921

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gedit/{gedit_49.0.bb => gedit_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_49.0.bb => gedit_50.0.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_49.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gedit/gedit_49.0.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
index 15b14b2c90..92685f085a 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_49.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_50.0.bb
@@ -24,7 +24,7 @@ def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
 SRC_URI = "git://gitlab.gnome.org/World/gedit/gedit.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "684abd8299139e1a3b87446da501ad034e78c840"
+SRCREV = "25d0bf0c3c40b0866fc23ec875f0af6c67f728ef"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.43.0


