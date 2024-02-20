Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC60C54764
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9335.1708419301795006605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lpobn+84;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419302; x=1739955302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vp1x92yXGdP/SMme8GR8bxzAstU+FZ+XZiy//eCalfE=;
  b=Lpobn+84NIf0sUJSzOkCT0ha7eAvw/w3kIimERYsh0xhfv699QVQsAWe
   ffTya4mbbRo7cCHb6CeyF0NqqbGA315lol4zha0Fb8jF10jnc9wi7hKMP
   8xCdL3CmPF0m4sBxAecpiruH/MwltCtufGRzwB0XS4BTOHrjfG9LXaCpX
   UPiNf0elcuOXb8RGAacVhktrcOnHjUHv1xLOBDkPzM9hdQ+6dNIMfanSa
   htwmPBO6epOIuzCYQjO1OKGIhBKvf4Se92ONV4QH43GEdZWxdWTOJBHe5
   UJWCHyzI66sdppeBdx8w6vagjvO147wghJOHeAwFTSTXR2GWvJtpxv9ZH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149905940"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149905940"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60484F256B
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60475D52EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E6CAE2009954D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 920D81A00A0;
	Tue, 20 Feb 2024 16:54:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/26] python3-pymisp: upgrade 2.4.184 -> 2.4.185
Date: Tue, 20 Feb 2024 16:54:30 +0800
Message-Id: <1708419281-26047-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-1.376400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuDqZCRNemCuwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAkNqgGKrP2U3Lxhutq6yQbCMb
	nH1azH54U+38jAoLuEHfLI3VlO5m2iE/ZC+WM9NKxiZDaSh8JQ5qOMyCi40AyhuuXWy6JmGex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108937

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.184.bb => python3-pymisp_2.4.185.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.184.bb => python3-pymisp_2.4.185.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb
index b0e62bae2..d17ce7496 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.184.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "fbd9089c867a63144562932862474910696ab57f4786a4b7c1a0b28ba204c0ae"
+SRC_URI[sha256sum] = "3ccdc6ee48d26d82c77ba3f5d8fd41a79eaaef0ad5619f37a65b060e92f6da4c"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


