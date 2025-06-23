Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC76C7EE31
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.13872.1750662711571477883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MoodDScZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662715; x=1782198715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ReEQzTHN/oVrYO3WklRBll7d8lV70oDWR1r+nhSi0Cs=;
  b=MoodDScZi4/evGTMON0UHCmTDYOhSeFceR0Af2nMG5VP100Vi1zo2cUY
   rQUedK3n+nCbdOP1DbZPfyKIoSrgkaDJIFRwaw1JbFNYZryqHySlqJ+qj
   zxOnDnnzgqqWVG22RMvCSBDvguARpro2ANUWKNrgDmKvxcDeHbTma5D0I
   Y80RC0lvpnm9EqPxSYJyrGr5zsIDfKVLDgsQJWuvAacIDbPdL5wXBPFlz
   3n3Fz2/OD0+ok1bIl7N3EZLLyUx/KrzMCcO8cAEj34CzZxAUQ+5J8aoxG
   gi3pVrwL+RF0MLwMqMV7WKe0yvvSNu0Z+WpvBPXsu/WFSq8f1IdJ5eIVu
   g==;
X-CSE-ConnectionGUID: XseWuax0S8Ky6CMF1El/Mg==
X-CSE-MsgGUID: PlICob90QeSUWW1i5+JtPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="206742766"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="206742766"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CE3B8C68A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D00BD4FB5
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B0DF1A0073;
	Mon, 23 Jun 2025 15:11:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-imgtool: upgrade 2.1.0 -> 2.2.0
Date: Mon, 23 Jun 2025 15:11:22 +0800
Message-ID: <20250623071138.402-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118043

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imgtool_2.1.0.bb => python3-imgtool_2.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imgtool_2.1.0.bb => python3-imgtool_2.2.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb b/meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb
index aafcf38272..192c8e895a 100644
--- a/meta-python/recipes-devtools/python/python3-imgtool_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imgtool_2.2.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "MCUboot's image signing and key management tool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://imgtool/main.py;beginline=3;endline=18;md5=0645fb61e2f961a110302fbfdb227446"
 
-SRC_URI[sha256sum] = "4f7fbcdf53c44eaaa6226504510ccb52f7ef00c997503cf94934b330c9607b60"
+SRC_URI[sha256sum] = "5c873a11895e36d0eb99e8366a43a3ae2270cc4f419e36b693428918255164cf"
 
 inherit pypi setuptools3
 
-- 
2.43.0


