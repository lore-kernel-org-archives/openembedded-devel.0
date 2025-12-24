Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C41E75440
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117309.1766567663905381390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LMnobvZm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567664; x=1798103664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uSIkPtoOTEGfiGhSJEhzW4Zr4RL7qHJ3umQYeAOlXMI=;
  b=LMnobvZmVSlL61zrqrNslEOLH/jVaxx8R4PXgFVNrb/8A6iRZQaZLi6M
   Qps/WhnzmSdssIIQ1YHjKUhRd+RnVA5RfFUyJnwe9bJRkjFOzbCgT6ppn
   LrgOe0eIedNplyzudbPUN6ot11H6ROEko18yT3R4EwRRt/cx3gMfVR6Fu
   qsEtB3u3Jh7WTSdZqnZDbCIrl8SKUBnXKn6JS/LN4WFA5abNqtNGZxYh2
   fcR9uR5Z8aL4CaZues6dDXfS2q5H6VVJgREO03JUnszGQVyxKl/xIcV+o
   d+lmYBmDoFY53HSh4gi+qdTKqh8PtOcXLPQyrPxOWgnF+tEKfplnbslVC
   g==;
X-CSE-ConnectionGUID: vi42oIjjTOm9H9+FMx9mEA==
X-CSE-MsgGUID: eu5kiN5FTI+lfwg6vP4+bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="211214147"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="211214147"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:22 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 576341002B82
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:22 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 11E71C0075A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 498D82000763;
	Wed, 24 Dec 2025 09:14:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/28] python3-filelock: upgrade 3.20.0 -> 3.20.1
Date: Wed, 24 Dec 2025 17:12:51 +0800
Message-ID: <20251224091304.974-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 CVE-2025-68146: Fix TOCTOU symlink vulnerability in lock file creation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.20.0.bb => python3-filelock_3.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.0.bb => python3-filelock_3.20.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb b/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
index 4ce89a853e..a499b79c07 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.20.0.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.20.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://py-filelock.readthedocs.io/"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=911690f51af322440237a253d695d19f"
 
-SRC_URI[sha256sum] = "711e943b4ec6be42e1d4e6690b48dc175c822967466bb31c0c293f34334c13f4"
+SRC_URI[sha256sum] = "b8360948b351b80f420878d8516519a2204b07aefcdcfd24912a5d33127f188c"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


