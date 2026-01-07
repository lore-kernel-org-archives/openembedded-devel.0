Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D37CCD5839
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3067.1767781780233658194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RvYzLQdw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781780; x=1799317780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U3ybsYsrUVYOl5+GAY/nVjz/rv5whrQRwC3rIBEopfw=;
  b=RvYzLQdwvZEdTpZ834m3WVATjZO37n/ioCeIcz/7Qa6iFthgRbbmNYvA
   2IdBnWP0GG8sBcr6fMW9cyl1MjB8EDBMEVMalSyzovXiPH5r7ZrWaecpE
   6/inphAxDE4GSGbm8eL3HbnPeZJWqc4uuCpe4pMKVHJDzX+DMGPKkSfK2
   +8qSZr831odHPEff22hAeZO6fjEzstHwL0IPmnK/Ub78hzFxHrNvDS4+V
   9SHOsmKlga/ObyP7p4HF3o6ogFezWSxJS/wCgQLxxW0A+byhUM2VdZNpv
   ikw5QWYnKmnD72mtf7gBoHgeb4ByS7utgjqZrqx69Hb3tZK4KDJRNFgeu
   g==;
X-CSE-ConnectionGUID: Dk0aBk3tSt+nzjjEsa1nQg==
X-CSE-MsgGUID: jVzMqaFoTuOMt38oAdj+ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045532"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045532"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C3D4A820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7D1401400108
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id A1B0882173E;
	Wed,  7 Jan 2026 10:29:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/24] python3-nocaselist: upgrade 2.1.0 -> 2.2.0
Date: Wed,  7 Jan 2026 18:28:49 +0800
Message-ID: <20260107102855.228-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123216

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://nocaselist.readthedocs.io/en/2.2.0/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocaselist_2.1.0.bb => python3-nocaselist_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocaselist_2.1.0.bb => python3-nocaselist_2.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
index ba148cbfa8..744c8312be 100644
--- a/meta-python/recipes-devtools/python/python3-nocaselist_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fb7306f5a3e045534e737ab7ecbeee039ba5e9bafbc5b5f231f616d7e9211b65"
+SRC_URI[sha256sum] = "b06b3d6fec1abc05c607aa8e813599388727a08e18c223431d7469cf6eb0c06a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


