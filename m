Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37AEC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.2211.1740525907056529365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fv0BfcOJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525907; x=1772061907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=v5vTxHuNI+Jk2oDqXrN36NvqT84V+m+Tqqk4v7JPGn0=;
  b=Fv0BfcOJlifVvm24BWVFSTb0iV3SwaSrgSiH8RTdYhfKRbAap1+6vkEJ
   Z2gm9G8Vu9LxVIsAIHbM/NG9mEEth2kWw95jlL3H7Jw9WU8/DP4IReg0C
   DQkQDQtwbd0FBpYYpxznwGkxCQME+lA0dqvfqiQb95LETZQW0Rn+IVuqs
   INSgtx8ZxQoq3a4GVyfrNPf1aASy/F0Vq75wcB/m57CC+olxgJP8F4m0m
   VLP16HjzXxbLMe8YywgGm2u+yx4TLswQTdD50fxqLzzU5kKnhsW/611tr
   6Wk8kOxW8FjB03YhdoyRAH6BYF96UIexMe0CjfQGp2pb9pKxoZRzuwK86
   w==;
X-CSE-ConnectionGUID: +dSMM+4vTkiOAVnQWr6Q3g==
X-CSE-MsgGUID: i4AYk6sBTo6wmx7kjZKBaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="190327596"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="190327596"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:05 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A56BD6EA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 613B7C8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 041231A0073;
	Wed, 26 Feb 2025 07:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 48/51] qpdf: upgrade 11.9.1 -> 11.10.1
Date: Wed, 26 Feb 2025 07:24:38 +0800
Message-Id: <1740525881-21103-48-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115649

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://qpdf.readthedocs.io/en/stable/release-notes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.9.1.bb => qpdf_11.10.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.9.1.bb => qpdf_11.10.1.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
index f8b398c325..2437d3bd20 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.9.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "c03ee7aa663c4361e23ca32b596adf6e8be0e8ac"
+SRCREV = "8a1d34bb74e6bae1b57076485386fc56e7c22aaa"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


