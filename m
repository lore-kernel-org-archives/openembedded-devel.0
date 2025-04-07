Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50FDC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.42477.1744017446472197366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lfVXuShU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017448; x=1775553448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cnFSomGqLteoKF9QY6gULs9XYbnaUPmSELsZ5ini3NQ=;
  b=lfVXuShUflzRhGNC7ZaPdAiQEy7DBk0ROgEY3uTUboeKDRL37B0D2Gf2
   ph7uufV0CJWRTeMecsGp166C1B7A4aaQpF0/EyaJGeRhWlRMdWOo0E7Ee
   QGkCfHpO0QFtSO2yalyRSuykrBDg64z+qrGioK0ik2hjHKwYQMpDwVCo+
   hH9I3MbJSl8WD2O+cYgP0f6mjkwrVMAAIbVu10AiJx+mdIlZe1Q/875u7
   UM8F/I8o4MJ7ecbUAxmgSzG144QASyrIcK/Sm4n2PAyOm9bf1F/W3CSwX
   cYL9ALanrFvoIIKw5GJ0sesXimsepjjKq103c29dEfMp2tgR0PfmRtlvH
   w==;
X-CSE-ConnectionGUID: OPpAr5r/RG2Rb4PhyRF/ow==
X-CSE-MsgGUID: /2ecX453T4i6W/yhviVSDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="198434355"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="198434355"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 99252E9A71
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B9FAD88D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DFA2B1A0071;
	Mon,  7 Apr 2025 17:17:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/30] python3-bitarray: upgrade 3.2.0 -> 3.3.1
Date: Mon,  7 Apr 2025 17:16:51 +0800
Message-Id: <1744017431-22217-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116633

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: License changed from PSF to PSF-2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.2.0.bb => python3-bitarray_3.3.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.2.0.bb => python3-bitarray_3.3.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb
index 86767dd6b2..ccb0238382 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.3.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "efficient arrays of booleans -- C extension"
 DESCRIPTION = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "f766d1c6a5cbb1f87cb8ce0ff46cefda681cc2f9bef971908f914b2862409922"
+SRC_URI[sha256sum] = "8c89219a672d0a15ab70f8a6f41bc8355296ec26becef89a127c1a32bb2e6345"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


