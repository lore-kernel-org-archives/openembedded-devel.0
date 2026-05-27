Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B792CD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16950.1779875352642429238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UDF/i/wa;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875355; x=1811411355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yQf57vjh0rKS5dAbPG4RDWym4IQtOzS/JugHmEIUqas=;
  b=UDF/i/waRfDwspXI7uUS6LkyfQ+mvm2du3R7mpH1riS7fT1R0Dg1MNZD
   lG5X3ptrNf4CfAPsrflTCoyOfRKoXfNVsbIUI/avUOlG7iZRUSt/lw2hx
   GwHEq+xDvrEDPyLNpTQUn4vGERzeqjhBbTuj4189MXDkg4t1ILJBdA+qd
   Sfxy74fAg6b4rhGofcLIWoORak33lscY9SNUuMpUgDJ9h31y5YmtyEhRE
   WLmYh1WSUWD4XU4COKEbD2eLAwusHc+T+ZBI8HEEkvLOa7Hep6KHJ5OYC
   kC7UWuj2Ycm36LMpKvT0+v2VL6tiC3MpXPU3r7MyUJPDYm1RtNmSGFnmZ
   Q==;
X-CSE-ConnectionGUID: pTV/4zUYReGGM/aTvE3BHg==
X-CSE-MsgGUID: ah64/+eaSQe2ephpMd+qTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241434792"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241434792"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 74DFC8203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2C3748D65CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2815282A2CC;
	Wed, 27 May 2026 09:49:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/56] python3-pyjwt: upgrade 2.12.1 -> 2.13.0
Date: Wed, 27 May 2026 17:47:43 +0800
Message-ID: <20260527094805.2039-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127241

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyjwt_2.12.1.bb => python3-pyjwt_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.12.1.bb => python3-pyjwt_2.13.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
index eb445f9c91..140d3bf3e4 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b"
+SRC_URI[sha256sum] = "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
 
 PYPI_PACKAGE = "pyjwt"
 CVE_PRODUCT = "pyjwt"
-- 
2.43.0


