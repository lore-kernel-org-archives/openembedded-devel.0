Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C561C369A3
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.61531.1742893340436711089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J1vj+5mi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893341; x=1774429341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=133KG3fC17V/vqzIV3mSbUZqmX/e9xTifZei8LefIco=;
  b=J1vj+5minVud8U6csXFGiyQbpyA+cpdU3gDLJhP1fvjdPv8j4VookclV
   MZtOtAp1Xe0gGxnkUAAIKLRq0NozxBiGzshOWVFKSqIq1zjXzER33vnIt
   cVSn5pEa+ochxO0qyb2mnrSFkOw9RgXJeAFC5QwIbVyWHpW9WBixlOaxY
   Wm6SDGID9eiQPLPBse4o5wFoF25OJDiabI1YRjowbc3bpdip0OWDPiQWy
   NPb/xmqHbgDGItGzd1YKVi8V+ZLxtOJu7Mow9zXIbSd9i0rcR4JE+4yMm
   T6Dx/pxIFtifAxmYdU/UGboc1qfWyV/r0NgRFz4ytIBM+mzkYPLR9n3jv
   w==;
X-CSE-ConnectionGUID: mhfMuop/TGWgOYa6pwFyoQ==
X-CSE-MsgGUID: kSyD+ZrpTAikOn+32JJIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="196914914"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="196914914"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 320DCE0765
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F9FD50A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0E251A009A;
	Tue, 25 Mar 2025 17:02:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/45] python3-bitarray: upgrade 3.1.1 -> 3.2.0
Date: Tue, 25 Mar 2025 17:01:29 +0800
Message-Id: <1742893312-3809-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116250

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- add 'util.xor_indices()'
- add Hamming code example

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.1.1.bb => python3-bitarray_3.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.1.1.bb => python3-bitarray_3.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb
index c07c52af89..86767dd6b2 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.2.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "a3c1d74ac2c969bac33169286fe601f8a6f4ca0e8f26dbaa22ad61fbf8fcf259"
+SRC_URI[sha256sum] = "f766d1c6a5cbb1f87cb8ce0ff46cefda681cc2f9bef971908f914b2862409922"
 
 inherit setuptools3 pypi
 
-- 
2.43.0


