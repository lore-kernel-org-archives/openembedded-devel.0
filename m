Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A14CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10954.1760433671589382690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H/seEBTQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433671; x=1791969671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U/IYi7hAKhQKWoEZOqY6QCVE6LH7ZzHvuY5YRRlukKw=;
  b=H/seEBTQGopqTYScgJ3TbZs/b44uamzxDWIAfumFO3Rh/CCKcLySmcbs
   m430EZut/KI5qvTQFQCf5LVnsf5I+xKH/P02j0pjBg/NAn3XalYjoE+Xf
   C+Kl2vJr8F+QUNQ5QLRjbGbCxCOPCIzPJSwde7r+vIafCVYPfn0+Jgi6Q
   AkdZpEtSePbsehfpDXovrUVjyzh3LIYwvIkOmgNz0zqZ/xP6LwTWDq8wn
   gLv0h1aAt+wgNHnuN2MJDmAYknDbxZ/ykcwJkOlsktFVGYjovR02Px8aX
   xOw3z5nnEK+7HTOD1EXC+4tfkQfbDARoBHw71FTA89J+Ljr0Br5Cjn//T
   w==;
X-CSE-ConnectionGUID: 7EjXyirdSHCCfqIQirDMMw==
X-CSE-MsgGUID: eVc/LXsfS/6cJ9hP1L7Ncw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194722701"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194722701"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 15F78100034D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C5DB518009E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3E03A101BB78;
	Tue, 14 Oct 2025 09:21:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/44] python3-tomli: upgrade 2.2.1 -> 2.3.0
Date: Tue, 14 Oct 2025 17:19:21 +0800
Message-ID: <20251014091927.493-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120595

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Binary wheels for Python 3.14 (also free-threaded)
- Reduced import time

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tomli_2.2.1.bb => python3-tomli_2.3.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli_2.2.1.bb => python3-tomli_2.3.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb b/meta-python/recipes-devtools/python/python3-tomli_2.3.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-tomli_2.3.0.bb
index a3af5302ed..c810b17ff4 100644
--- a/meta-python/recipes-devtools/python/python3-tomli_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli_2.3.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "cd45e1dc79c835ce60f7404ec8119f2eb06d38b1deba146f07ced3bbc44505ff"
+SRC_URI[sha256sum] = "64be704a875d2a59753d80ee8a533c3fe183e3f06807ff7dc2232938ccb01549"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


