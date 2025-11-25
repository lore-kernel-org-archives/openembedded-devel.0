Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50053CFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13259.1764062243925098467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hZJTHhEY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062245; x=1795598245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HQ1hsAGLJFqAQYdKZnjOzUJIm1qMykW0poenoAH+/U0=;
  b=hZJTHhEYTlINDsNdPYivZIqHmXhCtpycpLh7SfFvFG8+To9tfvs2GuwJ
   Ei89TYPaSZfw+CKZBwq4YB7KOUhvHainH5B4swv/o8vE2i3by/V9TU1wr
   +ZmRQVeNTgwfv/U5y58jh7SxQpiKjfggdZi1PYucTnmqZR3HR0A+j2g9u
   13fghXM3k8mpY7srgybtbwmskG9t61anXwVaT/ESm+kaPdlnASSgEIUL0
   HdvYO2g7GoKbLSVgsP1rRtWbJTDXDT3HSpMFAo4Tf03BdoMDczVVSz/Zl
   w5PBd7uPXp8LHk33cchCtCdXC5PKSC5J71rZMEUbW1zKese0Cqs2y75lv
   A==;
X-CSE-ConnectionGUID: iTADm/sVTG+P5t/QpoxE0g==
X-CSE-MsgGUID: qIq1zC2vTxSrRYLuAyOpIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199294190"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199294190"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 83B0C42A31A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 368351C002F8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EC9E7101A420;
	Tue, 25 Nov 2025 09:17:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/26] python3-gpt-image: upgrade 0.9.0 -> 0.9.1
Date: Tue, 25 Nov 2025 17:17:06 +0800
Message-ID: <20251125091714.1420-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Partition commit offset calculation

License-Update: file type changed to "ASCII text"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-gpt-image_0.9.0.bb => python3-gpt-image_0.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python3-gpt-image/{python3-gpt-image_0.9.0.bb => python3-gpt-image_0.9.1.bb} (78%)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
similarity index 78%
rename from meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
rename to meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
index 90b77cdfea..33bb3deca8 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.1.bb
@@ -3,14 +3,14 @@ on local disks. Written in pure Python gpt-image allows GPT disk images to \
 be built on a local filesystem and exported to a destination device."
 SUMMARY = "GPT Image (pure python)"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=db5f8de88d13d0917db21293d0e82e1d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d91d608dc8f12334a889700389229b7b"
 
 DEPENDS += "python3-pip"
 
 PYPI_PACKAGE = "gpt_image"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
+SRC_URI[sha256sum] = "07363562ec1cf5b50319ad0389486b576ed43c4682a16a8286822af9fd1f4594"
 
 inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


