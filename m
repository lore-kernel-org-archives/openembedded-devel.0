Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60354E77194
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:31:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.58984.1735543850219644490
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E+lbtxSH;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543850; x=1767079850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Qu4Spb/tFrbwm8NGAaohJZQtjAaAbE+BG/j2SuEPMtY=;
  b=E+lbtxSHYNTQU368imxkwqjz9IEzddbOK+xX0bcsK3FsegnaPXj/qCGo
   xhaFXoZKLBKm5EwroE3CTM91MBwS/stCQEy7R0pRU7MYJMLqIA1anCm9y
   XAvN+oTt4+rT6D0suzBphJ/Z/1R2cpp+Jp6D+jMLOZjSEEqIewgyQA6Iq
   GjxAvDEiscb4D3SAt3woVOFujHHjCxdp77VXhed3X7t54AO71Xw6oC7+C
   md+S3jv/ux/ANcefvf7yXu58KVyjViWwCEQWkLNfofP0YKW1VCzL7cj4Y
   bLfdoFMeoOrT/gcpczoVdZHTFX1sifo7yW71A1mPOXrxhYlPgUGd+S0pa
   w==;
X-CSE-ConnectionGUID: Ralc+QKDTXSrjHrOq7CLag==
X-CSE-MsgGUID: D3xZhZEuQqy4GLzbHUCq8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="164169802"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="164169802"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F3C3E8520
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0612BCFAB2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 924CD6CB1B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D05B1A0003;
	Mon, 30 Dec 2024 15:30:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/18] python3-pyppmd: upgrade 1.1.0 -> 1.1.1
Date: Mon, 30 Dec 2024 15:30:34 +0800
Message-Id: <1735543836-2512-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUqAb99krij1ULz2eKqim8urO+n0LbqGd8nX99sucqotj1WmxrRgSrJRmIMlq24wF51o7
	Tk4SLAkErnOVgiH/6sz/SrooxfRWgEOVjMf4VojFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114595

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyppmd_1.1.0.bb => python3-pyppmd_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyppmd_1.1.0.bb => python3-pyppmd_1.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb
index cec21007a2..753ca4be40 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1d38ce2e4b7eb84b53bc8a52380b94f66ba6c39328b8800b30c2b5bf31693973"
+SRC_URI[sha256sum] = "f1a812f1e7628f4c26d05de340b91b72165d7b62778c27d322b82ce2e8ff00cb"
 
 DEPENDS += " \
     python3-setuptools-scm-native \
-- 
2.43.0


