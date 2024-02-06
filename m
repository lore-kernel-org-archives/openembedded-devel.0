Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6878AC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:35:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.17362.1707208511370623645
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D0+9bOIM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208511; x=1738744511;
  h=from:to:cc:subject:date:message-id;
  bh=kliOWQxPPkCu9+YtK8d3qDmii6Ie+8XkJiGdchugSDw=;
  b=D0+9bOIMzbVC5RCDxFdFzR+McpGJYBYYPDeRJ66XA/YRbMmzdM1BLUqa
   iOYQjKgdhEhdEDzfRTrD9JTQheY6J5ZmPyuPAzoVdPTF75YduZff9zSXz
   VyzXC6ZsHuRFzZLxfTBSCs85Ygs5WF5s6qEFv0Hi+cCEIqed8haAjSoaM
   W/cVbPJULZ1kjucbyEWBGocSE/2Ixot3WNLJUqgIbpHTsMtOlwm9+PNSo
   E/Fx83/s5X96OWFIIt519qmqk20bGZuCJ77372X+C1Cd3LYrQWoQlhY/2
   y5df9+4RaOOd1EKOaYn+sjHRquthWayYKj+u5uLsX3b2UBGfD51QDILja
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136179331"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136179331"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:35:08 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7195C10827A
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:35:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B120CD3F21
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:35:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4001C1E9461
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:35:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA7FA1A006A;
	Tue,  6 Feb 2024 16:35:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 3.0.2 -> 3.0.3
Date: Tue,  6 Feb 2024 16:33:21 +0800
Message-Id: <1707208401-5726-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFABb4ykafn91kgj34yAj5cfrHR
	EDi96oFf2G0rZF5r0DBjMvgV+EkypuxhmpylBDtYiNqLN+FLjSGhXXSCgPuVqmVr85Otz3fex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108612

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix type of UnicodeDecodeError.object inferred as str instead of bytes.
-Fix no-member false positives for args and kwargs on ParamSpec under Python 3.12.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.0.2.bb => python3-astroid_3.0.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.0.2.bb => python3-astroid_3.0.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
index 23501ce00..1b8787215 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "4a61cf0a59097c7bb52689b0fd63717cd2a8a14dc9f1eee97b82d814881c8c91"
+SRC_URI[sha256sum] = "4148645659b08b70d72460ed1921158027a9e53ae8b7234149b1400eddacbb93"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


