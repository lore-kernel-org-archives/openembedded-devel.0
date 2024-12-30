Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FADE77196
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:31:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.58744.1735543849848521874
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gs+tCJrB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543850; x=1767079850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ht0wYXlIBfyJVZMkRdW4GAMa69QwUL4Wj+rzl0DJOUQ=;
  b=Gs+tCJrBNz+s9k+ig5fzWxuPOz7ZhCTROqy+jT2+rqlgPaqvIob8N0i6
   rAyreUSy9f1Qr0CAX0nmhoL8YyjYE8ynFZ6KGbvyIxWJVt1v384uMzw2e
   IQimlo45j19qMsUdeuLan7rPQchYqBMN9Hjo3roWVhUr1amuly/0HkSHI
   W75KATJ+GJyOe7kiw4NauiTCHQ/r/b4v7MQsmOt5I9UrsNPQd/r6TsXy7
   K91zWiYPK2fwsqjvHZtse/NtiyqIssxjlILEvijrF0hohzGpSoFcEHHms
   7NyOsRURvx/FNpiUvck4yup0e8gtQ9nW93Ezobded2Kdoo3vdYQTIxWiX
   g==;
X-CSE-ConnectionGUID: sKlDRyZoRi+qXPJ7k+FT4Q==
X-CSE-MsgGUID: yzoqMevBRQKW4gqeNF6BIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185304169"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185304169"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E33EBDBB84
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5C8BD5016
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CF9E20074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC28A1A006C;
	Mon, 30 Dec 2024 15:30:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/18] python3-pybcj: upgrade 1.0.2 -> 1.0.3
Date: Mon, 30 Dec 2024 15:30:33 +0800
Message-Id: <1735543836-2512-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrXd6HFY7gwauyk3L7vxk8tzhCaySmwV5QoN1rYwvxNRgcZGA1zTK9xOtTV
	WTa5v9B+4j9otIZ/Fnv5cj79GM1we4+EhCVQgZ+R0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114594

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pybcj_1.0.2.bb => python3-pybcj_1.0.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.2.bb => python3-pybcj_1.0.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb b/meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb
index 8cb176f2b5..2b78e3a7b3 100644
--- a/meta-python/recipes-devtools/python/python3-pybcj_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pybcj_1.0.3.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "c7f5bef7f47723c53420e377bc64d2553843bee8bcac5f0ad076ab1524780018"
+SRC_URI[sha256sum] = "b8873637f0be00ceaa372d0fb81693604b4bbc8decdb2b1ae5f9b84d196788d9"
 
 inherit pypi python_setuptools_build_meta pypi
 
-- 
2.43.0


