Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8630CF64A4
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.49303.1727682230246643019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=arqdlFek;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682230; x=1759218230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=R7IYuZn0X5LG43TxOHvu3GPkWNlDENlCcHdwtqzifBQ=;
  b=arqdlFekN+hoJUuBiLVZMg9/clJ6ZQQKr3THdolNxcv3qjWTvvgF1I9M
   2WrGhyZzt/NT66GG+kklSDGOR0hnBEQvqeffNoJO/RG3bLOrkmv8jWs1h
   VJJD6C8lHsAxuauSTuyspO/w++RIJQfNVeN7jl2qJFhKdCm5EANxsyehC
   h1zTw1BUiz2bECfZmCV8YitdxWTQja9toUcDROVkG7ZAxE29rk6gJscsu
   Ayf+1at6wgwesSL69FYnQI+o6hvilOBYtLm50ANrMW06UmTJrhUvYo8/W
   SEDldGomQ2wBAoBQibvSTp+bj79oxKM4DZ3cCKIkjKiLNbiemh497G1EY
   w==;
X-CSE-ConnectionGUID: aIRadI5wQLqojN0D+ObP+g==
X-CSE-MsgGUID: ceA4Xm9GQRWVEzFhBDzCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154116672"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154116672"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 57F51C9324
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A3C80D5098
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DC026B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2BB81A01E9;
	Mon, 30 Sep 2024 15:43:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/40] python3-portion: upgrade 2.4.2 -> 2.5.0
Date: Mon, 30 Sep 2024 15:42:49 +0800
Message-Id: <1727682185-12664-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-1.741700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrG3SoAWcU42XtoWPk1+F1IL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIBV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62fJ5/bZ6npdjGVuWouVipcs5JJ0D42KufdIKl92+VnvGKDO
	wh+mmBPSYPcFOEZNs9vB+tkrkcr/JVWJPYcnm75v3XnEkC0KrvmOqGPqK/75V2d+Aqf0gDh/6/2
	/nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112583

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Update license file so it is recognized by GH

Changelog:
==========
- The combine method of an IntervalDict accepts a missing parameter to fill
  values for non-overlapping keys
- A recipe to combine more than two IntervalDict
- Drop official support for Python 3.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-portion_2.4.2.bb => python3-portion_2.5.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.4.2.bb => python3-portion_2.5.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb b/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
index a5e26f302..f4e5d2036 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.5.0.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/AlexandreDecan/portion"
 SECTION = "devel/python"
 
 LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d7778e5e04dd9a065"
+SRC_URI[sha256sum] = "80ae7bab71f4844e3eb33c57954d76a3bd4cb351039b6e260e779325aeb4a487"
 
 RDEPENDS:${PN} = "\
     python3-sortedcontainers \
-- 
2.34.1


