Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E26CC4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44789.1784715850986097337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FUmh+Ku1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715853; x=1816251853;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T7Utsdtx2fD3rWvb0mZF/23Xs41MrZqsDFM8nhdgxnY=;
  b=FUmh+Ku16DoKmXCODpflNhzuid/YOAEh5+vgp01azAOKt0sGilzUZsII
   aieNRRpvPYDkEWOSfLzYHJyXdIndDrP012TnGgoYZNsrSR3DGv0XuXFF2
   3SeQICO4DgR8yHj4e0LGlCuW8wLnbEgQvtfV8iJMMNrbUAKhaNVxG0AWT
   n8H38Sx0FSJvOdNixF9Syoj03f6cjKNx0lWPJHl1Gp+knvI5twnpTdzij
   P9Ku76kXSpHskJjUIlxAJAfAtaHW6Ea7XRsmvydy9/d3AHBX79OZT/NOA
   INzEbucevK2q6edIo7nlaDvciozGL+fSyZgjfcXT/BheOufYCkNErSLd3
   Q==;
X-CSE-ConnectionGUID: aKtrCkcnT3KHI3VIc3NPDA==
X-CSE-MsgGUID: iQY4MRBiS7uEYgW5RL6FrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248149612"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248149612"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:12 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 28F6C100034B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:09 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CDCA41C00153
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D10BD402679;
	Wed, 22 Jul 2026 10:24:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/37] python3-colorlog: upgrade 6.10.1 -> 6.11.0
Date: Wed, 22 Jul 2026 18:22:59 +0800
Message-ID: <20260722102320.1019-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128386

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update README and examples to reflect current API

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-colorlog_6.10.1.bb => python3-colorlog_6.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.10.1.bb => python3-colorlog_6.11.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb
index 5e5a6174f2..c2da569d32 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.11.0.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "eb4ae5cb65fe7fec7773c2306061a8e63e02efc2c72eba9d27b0fa23c94f1321"
+SRC_URI[sha256sum] = "9d90fb53fa906c8970c18fbe46506bae1fb5f86b513b8f867db37e4ace9be7ae"
 
 RDEPENDS:${PN} += "python3-logging"
 
-- 
2.43.0


