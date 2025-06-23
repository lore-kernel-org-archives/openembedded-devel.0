Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A9AC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13712.1750662716556235409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XrGjcc3u;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662717; x=1782198717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LIvPFgMTsrm+6YfabeGZgu08e/wkXC5j0Ha9q1p9I0U=;
  b=XrGjcc3uEdr6Vw1Dh4f+SjKaZT0bU2G0xV+lqAWuz7cvoFDj9B31lU0W
   LGy/9aJAgcZdgHJhp94BEM7MXyAS1VH4tMVvJ2p62tmVCKYZtXo5pMrdN
   D+T0uluARdLcKk0DzKtvMCzOT0OZRYsUDHZ1djmhsePQRUtzXjIcJgnRV
   BmTorfKO0Z/mNHTK0ueqGkjmEXf3uFf/qXcPo6tBNzEyp8D9ZdY9oYd30
   CjY2G+7shki1sIiYDnOqw3jR2XqBdD/pu6a6XVb9KVmYJ3TuhoBz+fPrB
   4gHaJN/tb5V1wL9xyToeTJvIJG9UNJpu8UyNEgDfT69lcdeB6Lxy2ZpK6
   A==;
X-CSE-ConnectionGUID: 1LDM19TIRNGwfN1PsZFNzg==
X-CSE-MsgGUID: 7Md2GdKPR0ygRtWIxt0C5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182501869"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182501869"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 234E1D8E1D
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF263D6172
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F2091A0073;
	Mon, 23 Jun 2025 15:11:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-pycares: upgrade 4.8.0 -> 4.9.0
Date: Mon, 23 Jun 2025 15:11:26 +0800
Message-ID: <20250623071138.402-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Create dependabot configuration
- build(deps): bump pypa/cibuildwheel from 2.22.0 to 2.23.3
- Pin Python version to 3.13.3 to avoid Windows build error
- Fix shutdown race
- Add support for windows arm64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.8.0.bb => python3-pycares_4.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.8.0.bb => python3-pycares_4.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb
index 29f4132d67..a8b9ba96ea 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.9.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "2fc2ebfab960f654b3e3cf08a732486950da99393a657f8b44618ad3ed2d39c1"
+SRC_URI[sha256sum] = "8ee484ddb23dbec4d88d14ed5b6d592c1960d2e93c385d5e52b6fad564d82395"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


