Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACF9C83F17
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.55571.1751879240459711701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RTq/iNHO;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879240; x=1783415240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ME1qeXXiTRHmC/VaMRkR48nJLUqcyk9Foatq6KUo4Gc=;
  b=RTq/iNHOwJ2VJc9ZAutaBGV7lHYY9mUMZnOQOgHtfgW/VFb7CTf2nSkt
   +01VbwFsJR6QnFEPEACHRsWA6ydZkuv3ppjWmyZ2tDI2npUsG2ih37GhO
   0ATI7lFeiJXikf6APBP4wLN8e9fvkfMgrjF01ntk4Z5bFUjnUI7tfd80F
   2dystknbSLBWYIT2Nw4MWqyV4SWd+vpsiN9+vGJBC9EPq7T+h5ArHDXfU
   32cXe4ZW563kf16B6hi4UVB6zeJnHL5xP8PX4D17KFV2IegOJti1v8dsS
   24w6V5rdPmvBonh5DxY8h93+abpAy3OVTZxzozYHU8kevGiiRWjnastAk
   w==;
X-CSE-ConnectionGUID: G7kGclnnRaCjuscN3vgeKw==
X-CSE-MsgGUID: XxtSe2l5QMGfhz5uM8iYqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="184424243"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="184424243"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id EBAAC1000352
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 6CA48C00230
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BE6DBD4F40
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:17 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5F8B21A0071;
	Mon,  7 Jul 2025 17:07:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/35] python3-pillow: upgrade 11.2.1 -> 11.3.0
Date: Mon,  7 Jul 2025 17:06:47 +0800
Message-ID: <20250707090656.1216-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118274

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_11.2.1.bb => python3-pillow_11.3.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_11.2.1.bb => python3-pillow_11.3.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb b/meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb
index b9b7a74e6e..de88160e25 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_11.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_11.3.0.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT-CMU"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "339bc5db93bd95decf65a59fab273f300db6594d"
+SRCREV = "89f1f4626a2aaf5f3d5ca6437f41def2998fbe09"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


