Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA68CF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.48952.1727682214049941115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CwfWG6Di;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682218; x=1759218218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BFufNM6ijJiTWaQd+XnjEPse/8U1TGBC603O0zlOoGA=;
  b=CwfWG6Die9yzNT2J0D/k++I1mP1nyQadDg526FbVuraohK/SJyI8ZdnU
   eF2nH1c+M1nzUSrdUzKTwDJlbpxDy7dmiQl9hXkr5tvT9AKCz8xRy/i1m
   SmDTd/MCVtazLRTkEU2cVjX959kAb8o0eZh4Td1VvLRIkahl/OCPysJLb
   SQWvXPU065c/abPkCmbdDUnOjsyIEhNGzDx1ns4yB/mX9cTtvrDkjeqzc
   1Yr+McHHCv0f5kM6oCsXjhjCbNUR/80+yODTZJUkxDdIVbfZ/n7UpPVqt
   UqRc1RDE686ZeU51XujUhsGeN62FFoyM0EKrip/pTyH6rIfl5y/zuGLbQ
   Q==;
X-CSE-ConnectionGUID: d/biW3JDTRm+RlyVV0X8WQ==
X-CSE-MsgGUID: 7r9eRsAOSX6LE6059mNzAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163553660"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163553660"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:37 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5084AC9324
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 93BFECFB76
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29B946B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE5B41A000A;
	Mon, 30 Sep 2024 15:43:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/40] python3-asyncinotify: upgrade 4.0.9 -> 4.1.0
Date: Mon, 30 Sep 2024 15:42:40 +0800
Message-Id: <1727682185-12664-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.869700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKQK6IYbaPQnFrUEz73bfk0uoO4u36ob1PW4q
	bFu5B0kyhGAYVoN63+rPHHTUKdt1YI5g47WH6/qcIFH1c9iCpwEdDhLQihhlf+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112572

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add recursive watcher

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.0.9.bb => python3-asyncinotify_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.0.9.bb => python3-asyncinotify_4.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb
index 0946dd2a3..eeb44aa51 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "d0fc2c9af487b6ac2a3bd7db7b5139de54afcc3660720f80d7324b122a27c1c7"
+SRC_URI[sha256sum] = "41743900519ebdefe53e751df1d39689aca88794d783af945d306348a1398501"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


