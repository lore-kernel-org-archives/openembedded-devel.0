Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06107C5472D
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8726.1724833550442503744
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KnKJMTQm;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833552; x=1756369552;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=le8oD/K9jisjCx0me7RKV7bUI9RUkfqeeIEIDB2CuNM=;
  b=KnKJMTQm5gGHDKbT+d1t5EDEf9p+5I0dM/GQeFuROh5WQtiGGyB5DXrR
   WlzqlTMB9sFjlSpyu/TkbGRYMztbrVg002YoWMPTHqVkRNA2h1rls41ll
   wFlmZj23NYXpeQxgj7yuMhegxmT+SGhukBJtoJZQtW+Fi3N4SzdabS9yu
   R9M/zlE3XUNYtzA1uhojYaPoUiJoyAOJZwQFoQzypPL0e0lNpMhQ5pcud
   Fy/JasoO67sTW8+XTx33B9sVqqO+PPcfSgDhyfAQ27ORHrlnPDbPD3IHo
   H4yyPEqr4fhzqmfiSw1yWwHHktLbzBrLSB2K4W4HBM7gGDMAOX5Lfh860
   A==;
X-CSE-ConnectionGUID: Z+4RtOI3Shm+/Cz050+Sxw==
X-CSE-MsgGUID: ZQi7puh3TqKRLyDw5L6BGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150902405"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150902405"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E04EBD800D
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B511BF4A3
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF11D6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C1E21A0002;
	Wed, 28 Aug 2024 16:25:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/46] python3-nocasedict: upgrade 2.0.3 -> 2.0.4
Date: Wed, 28 Aug 2024 16:25:06 +0800
Message-Id: <1724833525-2162-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.080700-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrGeIujupKDm/VbZFdXapsKQfN
	hshqWR175EGhbVgBG57EevVorkpplWHZHUGvnBShFWovz5bBLuZh1mb42cZVB5Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjcB1VGYAjOG0CjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcgyf3/yeNKqqbaGUUmzObqVgEcAHh+5nnIFmV
	Ga0iJBm8XQ5jHV6w6J6i7jQelOW11HrnubzdteA6FuhZuWmQKkMLVuXsamQbf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added missing dependency psutil
- Updated dev versions
- Eliminated warnings about node v16
- Fixed dev install issue by increasing package versions
- Added py310/min to normal tests
- Fixed dependency inconsistency for dill on Python 3.12
- Improved pip backtracking optimization

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocasedict_2.0.3.bb => python3-nocasedict_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.0.3.bb => python3-nocasedict_2.0.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb
index 105c20b5a..31bd15f8b 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "1c9226c7f5a8a97ad51dcb0ae3157a720e3f7cb9c4568d22ea3a05e3f85658a9"
+SRC_URI[sha256sum] = "4ca934f65df57b10d0fcab5f0c39e9dccb93577ff9f22bef98265ddbf12f8af1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


