Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF34C28B22
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2298.1740525897826058160
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mCcgWZ1m;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525904; x=1772061904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VlW3jXgOcVzxdkn5lsrXL1qOFOc0i5inqbw5N8ronXI=;
  b=mCcgWZ1mIuFg/s52xsEXpy5O/KPi0ykpNhcfkAVz2f8yuWml39WWaYDL
   nesOIecYRYNFEkvYUkyGGTsio5LIy0yEBDGucPSpxgst6j4TvYRnazTl+
   Hldgiljd53tRA6S0vK1mx5AmFE+bqxVMcdl8GKH7ixmKhUjF7v/3Oe0jQ
   0T8SVrclgIePhqTZQqcAhGNBWzlswI08H+0BiLvsiwKTcnCshvlMQM2j1
   pRLOzJVTv6Mg5fbHUjRhQKE7Vp8v7Uh8Fglv6COXDb1SWD3DieTiRT1ZV
   oE1uEjzTIE9vQdW7MdtjHizvO2iiQBkIpDNvCiJxdxdIMt1y9KAEXNTKj
   g==;
X-CSE-ConnectionGUID: HFtW8TIWSVqEeG/1avovuA==
X-CSE-MsgGUID: ETx4BrQMQC2yDMrpQj8YwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="178507192"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="178507192"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DEC9E445A
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0618C8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A49DB1A0073;
	Wed, 26 Feb 2025 07:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/51] python3-snagboot: upgrade 2.1 -> 2.2
Date: Wed, 26 Feb 2025 07:24:32 +0800
Message-Id: <1740525881-21103-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115639

From: Wang Mingyu <wangmy@fujitsu.com>

docs:
provide some performance indicators for Snagfactory

snagflash:
add a Fastboot command to flash Android Sparse Image files

snagrecover:
add support for AM62Lx platforms

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_2.1.bb => python3-snagboot_2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.1.bb => python3-snagboot_2.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.1.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.1.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
index db9bb82054..07b9a5208c 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "cfd5e80db6010768d129eb123c4de6a8f3661fac353e20cc6e103e731d13c8d8"
+SRC_URI[sha256sum] = "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7cd5d5dcd875d2c333e8b08"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


