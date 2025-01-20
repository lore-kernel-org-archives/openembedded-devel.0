Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F8EC02191
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.32748.1737360862571949079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TWH9fph0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j8UJD8pxE9Pp/wajDltOXe7eI48CPBExcTcAGrKyWH8=;
  b=TWH9fph09QWUltAwe1SlljFVe4+9gnQsvuXsY2YDBymhRBcT6HO2NPuw
   5QPtpB1DYQ1+JNX6T2jbmx9vMXofdCBZE1wCOSNBJO9SUHrq3hkIkjcHh
   TQ0FN9OwLfjVRl4HDry/UbnTtJSuuD+RepKiaoVYJxd72eablFEmnJmby
   8PoqaeMeY7pxu9ZFyawvNk6P2MaE7a1WgnHoSPJOD11B1gYrTmT/HAcHn
   A8pwtLiJCQZBZlyP+2qw5McLm16aypjg7CUEJB9OYIy+93HhQKhpH+tuJ
   PKaLyjzfHem5cI7t3dh8v/EyBOnE8CuWbHWW1XZsg0WwZ2T7lfqmU3909
   w==;
X-CSE-ConnectionGUID: hvlbEhnkSQaPAOFIgvO8Pg==
X-CSE-MsgGUID: 5sVxu9/ZTp6wIcni9Ei8uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175108133"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175108133"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B60AE076A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EF7FDCFBC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8275C20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 321981A0071;
	Mon, 20 Jan 2025 16:14:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/32] python3-responses: upgrade 0.25.5 -> 0.25.6
Date: Mon, 20 Jan 2025 16:13:58 +0800
Message-Id: <1737360846-4824-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDUMFsa+1wyh/PZ+53nfZhf9T2XmyYyOgME6o7VOLkRr7BqvGIrMwW0YtpPdN7sEKwwAun
	/0SkOf+aAFIUl6UNVFCY8j5KIEGTIYKfn6TPLh0h0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114986

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.25.5.bb => python3-responses_0.25.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.5.bb => python3-responses_0.25.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.5.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.5.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.25.6.bb
index ac5ec6eb84..ae34f300e4 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.5.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e53991613f76d17ba293c1e3cce8af107c5c7a6a513edf25195aafd89a870dd3"
+SRC_URI[sha256sum] = "eae7ce61a9603004e76c05691e7c389e59652d91e94b419623c12bbfb8e331d8"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


