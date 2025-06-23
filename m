Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921B3C7115D
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.13715.1750662722173610984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K1utLAVo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662722; x=1782198722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TXycxw6JbgWcEePSlf3F/TpNKHDHVHFlWUieuLldARs=;
  b=K1utLAVonHJYMG4t/ugQdCQMZsiLWQ8GJYzUUXrZ7BWYhiB9MEwsaC23
   vxjFnHr8GpXX3Jguy8GcdFnG3DOiu2aqSJM1xuoAH7BGsBG1EKizihBtA
   35dVHr9Ql9w3abe5mEhcRjebochF9T6de56zU1y1oC+EvexCgxYvd9vtI
   XD4yLi52XoCJW+/wKMu5WdYm4QT0khzXguyAPf5qZdPmazHI2WIaIOZ7G
   Mn68hP/FHkBqyqR7+yRBiWM0ZWWNb1qqCt64nJ1DLV3nLEMbkAlzph/9s
   rbNK8RgH3NhaOSmpnJw7X5zet9RqjZCyERr44GusXwWK5gfz+IXni5uQF
   w==;
X-CSE-ConnectionGUID: RU7z6Cb1QP2mnf74xE3s3w==
X-CSE-MsgGUID: DvZXXI+8TSqrIQRR4pY3Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182501876"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182501876"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BDB1D6EE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42324D4FB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:57 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B2DA41A0071;
	Mon, 23 Jun 2025 15:11:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/30] tftpy: upgrade 0.8.5 -> 0.8.6
Date: Mon, 23 Jun 2025 15:11:37 +0800
Message-ID: <20250623071138.402-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118059

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/{tftpy_0.8.5.bb => tftpy_0.8.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{tftpy_0.8.5.bb => tftpy_0.8.6.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.5.bb b/meta-python/recipes-devtools/python/tftpy_0.8.6.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/tftpy_0.8.5.bb
rename to meta-python/recipes-devtools/python/tftpy_0.8.6.bb
index 3ff5f47d8a..74889c2841 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.6.bb
@@ -8,6 +8,6 @@ HOMEPAGE = "https://github.com/msoulier/tftpy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 
-SRC_URI[sha256sum] = "dd38e3744530d0c30fa1c715d7fa454319bc8d399bb40c05839cc771f05d0e6c"
+SRC_URI[sha256sum] = "f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


