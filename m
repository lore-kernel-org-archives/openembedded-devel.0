Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CDFCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11102.1760433615330039716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jZAmXkyC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433620; x=1791969620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V/hXQhDrq/baS1Ww5KhzTGia6eK6GSS6/8njy7vKk80=;
  b=jZAmXkyCMDC+2teh3Vonpu2nL0nevDEmdVhHMI25O02oDTgTW2Pb7uBk
   m8vuvmehUvNdM4twk95eT2iPe8LY6EdkBZNv+l+rp9Z6S3/PfmH+3Rf2/
   vqoo4K9TENFOMgo4teX5BrQ6Gxw+K7fSb8f6z7zMj2eLAfBsUAA39R4r/
   x8tIYicj8Gv2ik5OPyiK3lwFqCQpSdS9mITkplmwbquMo0EyuMoEi4IRr
   f5lBOtXedZfnP5qyLqJdlQEbCUEDLYlD6L2qJ23qIjRPOcoAC2az73E1g
   8Z5bvongMsBIxFzwKwZT1wYgXL0z4qKDfoc8cSF1X/PFienHN8L4uawNW
   w==;
X-CSE-ConnectionGUID: fzSqf3UBT4ydkrDJxbm/Ow==
X-CSE-MsgGUID: 9eWiuhxQQU6VKjKRpyZGYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275704"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275704"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CBF2A383
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 83D2A1C0015D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0E941101BB7B;
	Tue, 14 Oct 2025 09:20:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/44] python3-isort: upgrade 6.0.1 -> 7.0.0
Date: Tue, 14 Oct 2025 17:19:09 +0800
Message-ID: <20251014091927.493-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120583

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-isort_6.0.1.bb => python3-isort_7.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-isort_6.0.1.bb => python3-isort_7.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_6.0.1.bb b/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-isort_6.0.1.bb
rename to meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
index cf04452102..86ad769b1d 100644
--- a/meta-python/recipes-devtools/python/python3-isort_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_7.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "1cb5df28dfbc742e490c5e41bad6da41b805b0a8be7bc93cd0fb2a8a890ac450"
+SRC_URI[sha256sum] = "5513527951aadb3ac4292a41a16cbc50dd1642432f5e8c20057d414bdafb4187"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


