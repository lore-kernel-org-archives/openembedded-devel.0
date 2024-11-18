Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01AFD44017
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.37265.1731922212291396906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GGbA00LJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922216; x=1763458216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a99ZMhRnJIdAo/2jwLPVUjAb/dmTGBBWXFt9HbL56LA=;
  b=GGbA00LJbimtl7k7oQ56jVVPsM1Efo+6l2zW9jG9v5kcMnRgCpFEXcGR
   KhmJysAdZO4Ra7l8kSEUaQnxL+Gm9RkHxmpoL4YooQcZPqWvVSuBDuM5x
   qK0IZRuepTtFjMPO1FT/UVqaeuz2RnArkhOYYZ/4BHc4hWzCNxLA3AcTT
   ls533QydrHM5gOOgoawvlA8boOHV5sS/9IsdC0T6/8aP0sFuBke4MAdij
   wAlOL/6LRiu2yC77RmdLTTteJLc6um6gEpdRornPlTMADz0EXn85e45Ud
   vDyj/IXWk2b9dORjNfh7GXgAbrtyreTVtIDfdbisSxWY/uwZ44yWczovK
   A==;
X-CSE-ConnectionGUID: M1W/LGDXS1yTZbkgkPZzJQ==
X-CSE-MsgGUID: Qb+OY8azRA6MYYs3XeBsWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180785050"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180785050"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0977DBB89
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 323AFD52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB24C20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:11 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6AF151A01ED;
	Mon, 18 Nov 2024 17:30:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/32] python3-flexparser: upgrade 0.3.1 -> 0.4
Date: Mon, 18 Nov 2024 17:29:40 +0800
Message-Id: <1731922195-5266-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrW189rFh2nX7enFG1Pv9t58vdnTIlyY6mzmBTYOLv5zonzD51EvFItCp6J
	F31m3hneLagq3q1d8A/kN9TBr9KZIJq47OgtMZcB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113882

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Exceptions are not longer dataclasses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flexparser_0.3.1.bb => python3-flexparser_0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flexparser_0.3.1.bb => python3-flexparser_0.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb
rename to meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
index 7867dc501..ef8cbe5a5 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.4.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 
 DEPENDS += "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "36f795d82e50f5c9ae2fde1c33f21f88922fdd67b7629550a3cc4d0b40a66856"
+SRC_URI[sha256sum] = "266d98905595be2ccc5da964fe0a2c3526fbbffdc45b65b3146d75db992ef6b2"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


