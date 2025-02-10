Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367CC021BE
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.46473.1739178129070096787
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AsKSrzSP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178129; x=1770714129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YGdzhfuE/5jNoVUmuLyzJFX3arRiHjM+j2yJkNihN2Y=;
  b=AsKSrzSPbbNIxk25zSBI10bvEtisYKpn0vrFMwO0claP/VlScwit3kpw
   NDj9lvSzDIQvj96cLBxBH8Oro9GrtyKa8mWYqFsAuDT4V33sgUiPy0VT6
   SIoeDJJ14liXE9gGw0mdOkDmgSYqy/4t4NPI74ngwi4auzwOMRPCOW/vA
   2qQ/RUQx6tvKWbRSukOUU5rRtfySlYnjGlMFolQm1goJfxRSWv3XdZ5gi
   ew+i2m9OpbYDUPE8jgnjbFpcEzi9xAeOXxixCFkrINlPL1g0rtbBGORHn
   39PWpEPTZNKC/oqVKoekxSBdsd0vp1vSc6ATOmk/Zq3n8MJc0pTF3no8+
   w==;
X-CSE-ConnectionGUID: 2U3rPGz8TjyMplu7kA2rGw==
X-CSE-MsgGUID: n1f2Do9vRQCiL/ZL8S45nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="188641310"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="188641310"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E9026D4807
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3867D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 584C31A006C;
	Mon, 10 Feb 2025 17:02:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/66] python3-paramiko: upgrade 3.5.0 -> 3.5.1
Date: Mon, 10 Feb 2025 17:01:20 +0800
Message-Id: <1739178095-26432-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115379

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Private key material is now explicitly 'unpadded' during
  decryption, removing a reliance on some lax OpenSSL behavior & making us
  compatible with future Cryptography releases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_3.5.0.bb => python3-paramiko_3.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.5.0.bb => python3-paramiko_3.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
index 8ccf939f7a..a69ed72804 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124"
+SRC_URI[sha256sum] = "b2c665bc45b2b215bd7d7f039901b14b067da00f3a11e6640995fd58f2664822"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.43.0


