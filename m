Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A79FC619D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11425.1726716751774462316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XUjQQkjY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716757; x=1758252757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TE6VHD3UkFsSZYacMOfVbz5nOibednuqaFEo6ePq+Js=;
  b=XUjQQkjYCS/X7xamIUco5YTuKwqIYHSWDRGFXRi+uyRLTNi2bxeP/wxH
   r4M4r6TSdd2VB+LGiJBEEI5p1gQkB+7ii+hQN7tOkmgbJiQtDd3pX56at
   XwI5U7ykDfElJg+Z/MtHVF90GvNHV4pq20TK3AXbFTq8Ik09b+eyb3ZQO
   hoXUujUrUS49aUAEaTLm4pNf3yrbNJRotYPgBunymOOI+D/Infm+jT/7U
   mkdLlatxmaNEZ+0gKml5YZKvLKlwwu/z20c+83O7NO3voXUJ8DwISv1Hl
   ZrotBR8mKIiTnlD9zwhMNPKqcs/si6D8wjgJjTDr4flLz+Nkyi/JAmmpx
   A==;
X-CSE-ConnectionGUID: MeaRPP4YSuOKScglk+ayEQ==
X-CSE-MsgGUID: 3DO6a1ZuRDyTu+d6WCXULw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="174296152"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="174296152"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:36 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 00DA0D8008
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 38F21D4C33
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C387F228921
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A4471A01E9;
	Thu, 19 Sep 2024 11:32:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/28] python3-pyasn1-modules: upgrade 0.4.0 -> 0.4.1
Date: Thu, 19 Sep 2024 11:32:01 +0800
Message-Id: <1726716733-14548-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62So7E+qU55XIa1LSqA7kfAGjTU+VjNe875ndWIuFXo6CxFoI
	tDu4UKn0VpYKZrJNWK64WqBCIrjSU1u5QUCb60dbG0OYZ3Vt2ES7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Added support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyasn1-modules_0.4.0.bb => python3-pyasn1-modules_0.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.4.0.bb => python3-pyasn1-modules_0.4.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
index 48372d917..e8c0f960a 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.4.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "831dbcea1b177b28c9baddf4c6d1013c24c3accd14a1873fffaa6a2e905f17b6"
+SRC_URI[sha256sum] = "c28e2dbf9c06ad61c71a075c7e0f9fd0f1b0bb2d2ad4377f240d33ac2ab60a7c"
 
 PYPI_PACKAGE = "pyasn1_modules"
 
-- 
2.34.1


