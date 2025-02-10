Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3DDC021A5
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46627.1739178121940360202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L8KoLboC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178132; x=1770714132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=alcmI54hs4c0XYVJN03gV25O2h0YuUuCOZbMmlga1dY=;
  b=L8KoLboCLgP3dFOdg6DLSgCTof1aPmXN/1w0DkTCRaWQ8yaahjYaSgm7
   fm96c2K/+UtEuVjGF4xZlBCeaK3amiGaLGVnzuNcyXCS60M7CK7xmDCO1
   C8jnx9c6Jr0juLSWAc6Igq0lEvJu97yBVxiXeBYPd8xrpideLHhbDNUlw
   aGfJvchil/D7zB1DZEk/RjFBAxkHbIJw3xp5KTz0A883cCiHhhSwoSTHV
   ELu4X+S8VtjoItdgJbHGV2qW0Bv0Y95SegdjnClf4apVlg/8AuTbWDLPi
   pmMOkoKfex/ZdTUtocM2RIStQGBHqzm6RujC77kvw4v1kkGgImPTlosAs
   Q==;
X-CSE-ConnectionGUID: 3PK6RljoSMKm6MRkQk6tSg==
X-CSE-MsgGUID: du4EdC0XQsKPoYymyQcu/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490541"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490541"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78ED5D6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A87110361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 013AD1A000B;
	Mon, 10 Feb 2025 17:02:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 62/66] python3-tzdata: upgrade 2024.2 -> 2025.1
Date: Mon, 10 Feb 2025 17:01:31 +0800
Message-Id: <1739178095-26432-62-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://github.com/python/tzdata/releases/tag/2025.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2024.2.bb => python3-tzdata_2025.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2024.2.bb => python3-tzdata_2025.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb b/meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb
index 3d0166d20e..35246e8ec7 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2025.1.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7d85cc416e9382e69095b7bdf4afd9e3880418a2413feec7069d533d6b4e31cc"
+SRC_URI[sha256sum] = "24894909e88cdb28bd1636c6887801df64cb485bd593f2fd83ef29075a81d694"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


