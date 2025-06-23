Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C58BC7EE32
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13874.1750662712468065205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hE+aLFB6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662714; x=1782198714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Q7sy+aQhM9BBFt/NQ2qmEK8acyDd4+ujZQidkulQ0E=;
  b=hE+aLFB6GnBl3gj7tGSZW8jfilJh7YbnbmAhA/M23r5o1qBc2ZS3aewG
   Wb6n1g9kjpC8ocKxSzsLnRz5K4DBVgFprqOBstdysLMA29V4Rw5bbLikE
   ZkRDIyJPtCtgHxJOn5orgaygBUzY2XdzLfFYm6IDSiSv5vf+ioPr1oxL6
   ndhBoE2h/IMoqm0zEimkQJL4Jt190mGn29s3gvDvGR+oHU+Lhj/DHvu5L
   xZoHJXOIBR4PXBRsZKW46JgoeTKt5Xgh4gv3yepHoCIQ2r9Efyr6njX5U
   uDnyxX5FLuQACNyT7RlLkJ0FJv7LmQNSTox03Dtb2dDjVhSRtBVfuQ+0t
   Q==;
X-CSE-ConnectionGUID: ZZywx3WcSvyxiem+K5Tcng==
X-CSE-MsgGUID: 8byKQIvQT32gC0iY8Qdqow==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192069983"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192069983"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7266DC9987
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E2E5D8AC3
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A74481A0071;
	Mon, 23 Jun 2025 15:11:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/30] python3-elementpath: upgrade 5.0.1 -> 5.0.2
Date: Mon, 23 Jun 2025 15:11:21 +0800
Message-ID: <20250623071138.402-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Fix for XPath 2.0 fn:node-name
- Workaround for processing arguments with multiple occurrences for external functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.0.1.bb => python3-elementpath_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.1.bb => python3-elementpath_5.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
index 71ccec5719..f766ed002b 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "d3e4807b7e38e190e382eefef93f35ce6f71adf63b33e3f01d0e11f22e5d5cc7"
+SRC_URI[sha256sum] = "26224a33ad9edc82bfa5b26a767a640c8407fbbf9e019b1c369f718dd21823fb"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


