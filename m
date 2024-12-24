Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A862E77190
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:42 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.30371.1735032452880739708
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P9L+xV3W;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032452; x=1766568452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=voKigwSoM50rlLGjFBakJ8Yr4X1e3KMaDjk9BQj2DuU=;
  b=P9L+xV3WLJPqLvAD+T3+R/EibhHxOJ2pjPMUjyYydbJg789+cM+iS1kx
   uGS6oi9K9pzQ8OJ8LnEj9XZDJFHVaZiolwbh+0h5FaIGB3qF1RWYisRL8
   cXCDMOTDNU5g/1xN++Zr00TtL1oQqFdN7fLpB4gr2dyxV9CChAICdWkad
   J+SoEYR1nVVcMLgaKJYcOM4rqDYI61BmA73htaz5pyUi4sfpPviL0muv+
   VAewCsmtJfsV7djNURjqvgRTUo6K6wfXfTIGltf4C+hmNCpv1JOaH0Xqy
   6DVHlo7k6EWoCZiqBYQAZtknizAuhXGT4og+K5fDL2g9aQh4TJgxxVW4M
   Q==;
X-CSE-ConnectionGUID: ll+3emNNRRCnA6mwoegNvg==
X-CSE-MsgGUID: kI8P2ikBR6mXBOeRIyKCgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003204"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003204"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ABDBD69D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72988D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFF6620071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A0FE1A006C;
	Tue, 24 Dec 2024 17:27:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 60/67] python3-types-setuptools: upgrade 73.0.0.20240822 -> 75.5.0.20241120
Date: Tue, 24 Dec 2024 17:26:54 +0800
Message-Id: <1735032421-13513-60-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-2.463800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy6avPqv3X7/XOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8Krd5zznF1D9Scc0PU9Ep/4NiYV7lCMc1j95/mJTgcNz/dByMqKnQUyyKiLB
	pmEaCwC0BdBGXrwSUBZdFX766peN2I02TgtAdXlB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114535

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....20240822.bb => python3-types-setuptools_75.5.0.20241120.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_73.0.0.20240822.bb => python3-types-setuptools_75.5.0.20241120.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
index 2eaa2d136e..b9f35406bd 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_75.5.0.20241120.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "3a060681098eb3fbc2fea0a86f7f6af6aa1ca71906039d88d891ea2cecdd4dbf"
+SRC_URI[sha256sum] = "d3c7e95b0598bf87fede29b3b57b19f5cdcd62a85b9298a7b30f8343f6f21c4f"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


