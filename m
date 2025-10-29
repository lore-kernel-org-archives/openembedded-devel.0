Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B272ECCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.24200.1761696969551781095
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ivCe1OSF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696969; x=1793232969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xRviuYhvF6GHsUJ3BKH5IM5bKMk/WtlrX0gj4CSBZQ=;
  b=ivCe1OSF0S78TlkUCCr33tzSZAUsUx2q/QxWJnC8kJUWMlMnPj/xrOmM
   qKACT18TFpx9icoqqhWES+c23e1Nxn4Mx/0IHWK+TEu1gq8sFdj78VOXz
   CYC5abc/uVdn2IVK5qnd2uvevwmOo+iAP2/W9DJw4Vu9xh8uacxU8hN74
   7O2Ym6GlKx812DX+kKWAZWcaipN7Pkq80YZI/6E1VGyr4flwxpcYEahbl
   xQvMwJxHGt/J7T1vS08+MGqaErGXrjSoA5joXxVY0JG1M3om5rj5Qrz9K
   eedqfBwCtV5ttx+HMTD5vHr2OhLiGDG8+OHaQr2iDTjc1YG+XtGswgaRY
   Q==;
X-CSE-ConnectionGUID: PRxo2k1nRiWyJet+lA2iAQ==
X-CSE-MsgGUID: t/kQvNvKSziFmQMqMov0wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205360985"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="205360985"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D0EB71C1C726
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:07 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8995BC00766
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8F38A82C0FC;
	Wed, 29 Oct 2025 00:16:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/32] python3-requests-file: upgrade 3.0.0 -> 3.0.1
Date: Wed, 29 Oct 2025 08:14:59 +0800
Message-ID: <20251029001505.528-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121132

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add missing type annotations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-requests-file_3.0.0.bb => python3-requests-file_3.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-requests-file_3.0.0.bb => python3-requests-file_3.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
index a9b10c919e..f796c8ef78 100644
--- a/meta-python/recipes-devtools/python/python3-requests-file_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-file_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dashea/requests-file"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9cc728d6087e43796227b0a31422de6b"
 
-SRC_URI[sha256sum] = "68789589cfde7098e8933fe3e69bbd864f7f0c22f118937b424d94d0e1b7760f"
+SRC_URI[sha256sum] = "f14243d7796c588f3521bd423c5dea2ee4cc730e54a3cac9574d78aca1272576"
 
 PYPI_PACKAGE = "requests_file"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


