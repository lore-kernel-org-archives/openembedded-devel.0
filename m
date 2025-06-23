Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC0BC83000
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.13710.1750662714697552044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=apoMQxo/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662717; x=1782198717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L5dtqhdXHJKTKKlOaoH5FiPJVCu6575IVOkF35nT90c=;
  b=apoMQxo/iFGjNiSGgA3khQnE9q3w/JjqOCEF/OUhuKA93iBp/EHcUQG/
   HQyYzq5BhxENFK+MSiDHo745p8OxnLcgspGywwrvBc0IMpVhCW19zZLaC
   XuAVZTPtyReQNFmLHXEGFcjkGHYAt/3O2aKTAhmlwnz3vL9HLTa0oybbg
   sdbyOWqhErIa4ZKOzDoZDJ9xtS+6/N5p/vKknYruh22vSsHek+DgKdsh0
   67ICW+3+5e9uaRxj3OM3TvSv/hc1OoEoQ1tR6+wSuVcA+cXM/Nf3z4x8U
   dJ1HNsPHJc0+F/oNn6PodG206ixDx5h6wrT3iIef4WiSbeRrXQeBNT0/E
   w==;
X-CSE-ConnectionGUID: 1dqJ00eTQd6RDttOgoiJ5g==
X-CSE-MsgGUID: 2kyJkGrHTdaM+taaGpI+dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="191003692"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="191003692"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EA24D8E65
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F22C74E4FA
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9B89E1A0071;
	Mon, 23 Jun 2025 15:11:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-pyflakes: upgrade 3.3.2 -> 3.4.0
Date: Mon, 23 Jun 2025 15:11:29 +0800
Message-ID: <20250623071138.402-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118050

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyflakes_3.3.2.bb => python3-pyflakes_3.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyflakes_3.3.2.bb => python3-pyflakes_3.4.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb b/meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb
index 68509a5073..a946a008c2 100644
--- a/meta-python/recipes-devtools/python/python3-pyflakes_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyflakes_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/PyCQA/pyflakes"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=690c2d09203dc9e07c4083fc45ea981f"
 
-SRC_URI[sha256sum] = "6dfd61d87b97fba5dcfaaf781171ac16be16453be6d816147989e7f6e6a9576b"
+SRC_URI[sha256sum] = "b24f96fafb7d2ab0ec5075b7350b3d2d2218eab42003821c06344973d3ea2f58"
 
 inherit pypi setuptools3
 
-- 
2.43.0


