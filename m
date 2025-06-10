Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CFFC7113C
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.78444.1749526438107357170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=REjI4qGh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526438; x=1781062438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hDJj52AykJCu+nwgBoTnaM+0sQRUsiE54PDjcjmqtFs=;
  b=REjI4qGhgHT1IyplxD1DAdD+/cuFhJe1yncLaaORHwV1nilck3UTW0Qs
   wwmelC9CxM3ProEn7x3cp6v7aRCVcba6DjSRXovh4dtfzwZ7jPM2W61In
   lnGGsuB1YOYEjL3tLq4RaFd4GxqlDhsS5MpJfj4mUnXBU8J/DEuTP0dI5
   YT9/clYi5ZDoZj62UD+tamkg1Avc3wEMKDso+Km8n70uu3Ta7I1RU48Uu
   6wlT8KdhPmbC935L9/IHgtG9l+BKDNAU0NiBVZoSZANnyu637jovioqzV
   +OKg+lFpexKoA+987NabIHhOD/ift6XqI+UTuSUM0h/v1/3K7Ev+VZ9M6
   w==;
X-CSE-ConnectionGUID: sgJonxLMRVyIlB9w9qQYXw==
X-CSE-MsgGUID: NXo8Z335RdKdeY+DAlBiIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181714994"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181714994"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:52 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D582D8E64
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1345CBF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A69D1A0071;
	Tue, 10 Jun 2025 11:33:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/64] python3-joblib: upgrade 1.5.0 -> 1.5.1
Date: Tue, 10 Jun 2025 11:33:09 +0800
Message-ID: <20250610033330.924-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117845

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix backend hints causing errors when no multiprocessing is present
- Vendor loky3.5.5 fixing the resource_tracker clean up with earlier Python versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.5.0.bb => python3-joblib_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.5.0.bb => python3-joblib_1.5.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb b/meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb
index 5dc5d02f3f..a678f881b8 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "d8757f955389a3dd7a23152e43bc297c2e0c2d3060056dad0feefc88a06939b5"
+SRC_URI[sha256sum] = "f4f86e351f39fe3d0d32a9f2c3d8af1ee4cec285aafcb27003dda5205576b444"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.43.0


