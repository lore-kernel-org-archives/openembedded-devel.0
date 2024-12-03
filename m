Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1944EE69EBD
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8205.1733185017914802578
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k9wA4DFv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185025; x=1764721025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dOk8y4Xz5WEUNt79tusbDMwMES+M4/NwOOe9dFWfvk0=;
  b=k9wA4DFvmVND7nZLo5Xo8BUd7PkxYJkTVvKNvG4g3RITvIF/8CF3M0CZ
   C0oTr1v6TdcBtYOsL4vrXoJnbhSpzHuPQ7qPGiHuVuUXe1/fYan7iN86q
   xEsS6pc9pMIHFOmh4J6FzOtXt96ojIPZN8+C2fZsHADnIRNqWCoiVciAy
   nbSEAj210xvntD0r/U9WuWKQELEJzq2YsqHQOh/opNYYtNdPXV0iOA2a7
   6fyBwWYKiS/Xx/LuE5zkrii/5qmLXPYtXIb3a4gG8rhoghgDMHt3uzX8z
   v2BntMA0OMTCsX3kh7e+0Ig9lBBKrB+t67MbQvgaUoJ0LtIukC8MDmo1o
   Q==;
X-CSE-ConnectionGUID: X2L2ykXWTJGD8ThItm49+A==
X-CSE-MsgGUID: wYKdAIJAQ1mkAXUukqUzCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="170725150"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="170725150"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:04 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B705C226A
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14F7DD4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A146E20071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4102D1A0003;
	Tue,  3 Dec 2024 08:17:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/34] python3-snagboot: upgrade 1.3 -> 2.0
Date: Tue,  3 Dec 2024 08:16:32 +0800
Message-Id: <1733184999-27041-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--2.968800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbbMZ
	slvSE9qBkjISQZdTp98Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2VWQ
	+RQOTw2suNA8kjcVufAhBeNJICtc+eBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNWLMt3UJjPQv+FzDhNW40WWDvQQfpYiRL15zQ3RI7FmvhhMN2ZY/lf1saLDdsitxLNTgK
	USgOFVunkLJPRSA5Nf7Rt+kiS5o6aoEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114169

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
treewide:
add Windows support for all SoC families except AM335x
introduce the new Snagfactory flashing tool

snagflash:
add interactive mode with advanced compound commands

AM6x:
broaden AM62x support to include AM64x SoCs

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-snagboot_1.3.bb => python3-snagboot_2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_1.3.bb => python3-snagboot_2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_1.3.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_1.3.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.0.bb
index 5ed5169ae5..f22c53c6c3 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "b9d781bdc79d92d940e27d89d3025eab6dc459087dad126766e2bf76dc9dddee"
+SRC_URI[sha256sum] = "bc220722231b7f498a7b5df0bab8552ef9115e9ee1ad675079efe79da299fa9a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


