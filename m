Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B092AEA3C4C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129144.1775730877786446764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B0Yf/qFk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730878; x=1807266878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6n8ZbcsWLvP5O1Sz67AeVB8XdIRAujr6tUV7O3ZZTcw=;
  b=B0Yf/qFk0VJjEpl7vQujD7VoXNKgTKSw5Y0Ay5RelZB9vfHtszhOdNXI
   CC/rK71ifm6ktYPyGfTLjTT0Xy+12x32h/n4X0WT7FpXN9DW9dUol9pOd
   jbU9E15XsAhbRQXbk1C5MybfK5J7x7L56LNYi2Zwdhw27jt/x9OBddkzu
   BVjd03F1XxEObAR7ell6VsliXs8CvGM5nQ4+L9rT5YKrLknHxGU0dvnp0
   r619+mfyuKDfIJDuTAHRqb0O7QvUvBUoqb6YKS2cmgfL3HviygigS7gbK
   GUCaiGlaoJWtgBZ1HdLH1XwhqiiAeHtKtVTes/QePAhw9xgNQzw3BHYO3
   w==;
X-CSE-ConnectionGUID: IrMI/dFJRTS1R9HrDhoETQ==
X-CSE-MsgGUID: 1KlN8Fn+T4arB4KzVTzfDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386548"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386548"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:36 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 48FCF1000158
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ED2C11C002CE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 5ADF1405EC0;
	Thu,  9 Apr 2026 10:34:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 36/37] swagger-ui: upgrade 5.32.1 -> 5.32.2
Date: Thu,  9 Apr 2026 18:32:22 +0800
Message-ID: <20260409103223.1574-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126185

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../swagger-ui/{swagger-ui_5.32.1.bb => swagger-ui_5.32.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.1.bb => swagger-ui_5.32.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
index bc9b414848..7684b1dccc 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "d361f5b3570b8ade67fb1c02cf7a676fcb441479"
+SRCREV = "d02a2df106961d8cb6bceb6b4b3aa8d9f6faaf4a"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
-- 
2.43.0


