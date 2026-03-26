Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2445210A3D6D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46424.1774526260077735084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EPKEhaTD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526260; x=1806062260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eUy0uN5EexodR7jiSaR4mvkZqn7NKDC3pRo9EiBG0/s=;
  b=EPKEhaTDFqpQXtUji3DKmZ5LG+jghA8N/YCcn++dbhBXmF+zfFrKVhwi
   fmS2zXGKYU0Rw3TVrFFQKjylPC/DhRfaw1TbW1B3gOZHt5U9z/JLikp87
   pLZVIYIFAkWwScDWtUAbmmHSpcLzl7qYADSLNWMlGD9amcvIOl94Hs7dZ
   JuJT0lpXpN4oh/DW0nkZmSuc2YmDR7H+YIjyLHJtxAMLPZQNyW46a2C4R
   cvFt0svfnaN5QKsRwo7OgLB9WSsFqBnTIqmMVsi0vaVltKxUkSAhCXzD0
   sC7HyFc9rsM/1d3uANujZ210DpfbJDnA/scpnK4YXRLRAWPK3CTioJtpZ
   g==;
X-CSE-ConnectionGUID: q+VRgv0iQmqtWri4G6OG7g==
X-CSE-MsgGUID: RIAUW1XiTAqteIdv5jtMTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520841"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520841"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4DCFD1000343
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EE4611846195
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 76F79180714D;
	Thu, 26 Mar 2026 11:57:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/63] python3-imageio: upgrade 2.37.2 -> 2.37.3
Date: Thu, 26 Mar 2026 19:56:07 +0800
Message-ID: <20260326115634.1199-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125692

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.37.2.bb => python3-imageio_2.37.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.37.2.bb => python3-imageio_2.37.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb b/meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb
index 582cd348f9..b90f1ba863 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.37.2.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.37.3.bb
@@ -3,9 +3,9 @@ write a wide range of image data, including animated images, video, \
 volumetric data, and scientific formats."
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9da78aa88ef5e9acd41f7bb288286273"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6c492278d46e42af592aa26d7cab1e54"
 
-SRC_URI[sha256sum] = "0212ef2727ac9caa5ca4b2c75ae89454312f440a756fcfc8ef1993e718f50f8a"
+SRC_URI[sha256sum] = "bbb37efbfc4c400fcd534b367b91fcd66d5da639aaa138034431a1c5e0a41451"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


