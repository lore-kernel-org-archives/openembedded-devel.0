Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0590EE77197
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.58740.1735543846399626492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R9+9a3yc;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543848; x=1767079848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ruF3/uX6+yw+giKGVZfw9YaxMNrHhSCCjRJ1zBGXQfs=;
  b=R9+9a3ycooJBbwBxMQoD+wzBDTYNksQ2YmgOOtfli/S3vUuFsRJ1ilt6
   90E7aABLLjLMxuAvwBqeWsLeB1/SEo2e1hogW0SerEZ/ODDi8+9+BsRFN
   zYW6ysey7ln0g83Bfs41DifbXCu1EV6waYStS7tQvsbYHRYvdm70/yXeq
   cK5iZY4nRqr07y1G/dvv47NT2hIC6DGS0IIpWRF0D0P3HhzDaQDmjo0OC
   gmrHWwzmm7O5pKvJ4tbfC6aW4oovmKF301a43hNbCtORat2URz4w1Ohp9
   6IUbFGvuYYk0H1dl0g7zBAReOI49VmQd6Yw45xkmoRTyfbvZ2/eHjHR8z
   g==;
X-CSE-ConnectionGUID: Z5SauxnWQAGdSWbonFtoNw==
X-CSE-MsgGUID: RVRXIwMXRP+BEEcYw7L8fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="173278783"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="173278783"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:46 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7403ED4C36
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 494FCD753E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCDE220074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 790E51A0003;
	Mon, 30 Dec 2024 15:30:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/18] python3-astroid: upgrade 3.3.7 -> 3.3.8
Date: Mon, 30 Dec 2024 15:30:27 +0800
Message-Id: <1735543836-2512-9-git-send-email-wangmy@fujitsu.com>
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
	STRncWKuOhzOa6g8KrbXuTpjijT+o64o7DRy/8YOFmDlEwWXDYrX/aEvJhB4vT6C/zdUhKU6t8D
	Hm1dlY6TC1+YLvBE/KXZ/vRVp6WQLsVb02ba5lKB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114588

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.3.7.bb => python3-astroid_3.3.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.3.7.bb => python3-astroid_3.3.8.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb b/meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb
index 783bf1d7f5..528cc158dc 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.3.8.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "29fe1df7ef64dc17a54dbfad67b40b445340fcdba7c4012e7ecc9270c9b2f5b6"
+SRC_URI[sha256sum] = "a88c7994f914a4ea8572fac479459f4955eeccc877be3f2d959a33273b0cf40b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


