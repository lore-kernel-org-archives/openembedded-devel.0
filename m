Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626EBC531DD
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2878.1722934011958228024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ct1uEk8z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934022; x=1754470022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aFbgpNqvVAr4KB2GZzsZ22f3qqPsNK3a4IEvHhe2wa4=;
  b=ct1uEk8z7llFMfNGkXdAQG1w1L/M1u3a4ewMIWXYjKZHl7dPX/KcwqNZ
   q2bHy5QQn82c/c8TIH4wUB/ZnQKynrRF2j6GPNRTlF98a9SZVrTGOjwdL
   vmP8gzlZE9I4AHrq0Lat1tntg0ZDMcyVkB+QYHoIkncKbinhru1FXjBx+
   ize0kKqtEKsAirw/lsg0uxQxRDKYbVBfWEPrDrWftj0tq3W1hf9+gz3NS
   E1GOcVX/5y+CQcofQgULjnAuLw1BFhRf1S3unu8bPgyYf4sCJJ5gOvrDp
   xcRS1mbZ7ZAw82jZ0lRsZRRx7o9fCf2M9oyOT9NarFOqksrz+RCbswq5t
   w==;
X-CSE-ConnectionGUID: xsFygW1SSb6TSdiw5Su7ZQ==
X-CSE-MsgGUID: HlQCVnMQT6+KHx8WghL+dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169971748"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169971748"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 820C2D4240
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C9C59D8B01
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 66E3220050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 159471A0002;
	Tue,  6 Aug 2024 16:46:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/60] python3-autobahn: upgrade 23.6.2 -> 24.4.2
Date: Tue,  6 Aug 2024 16:46:09 +0800
Message-Id: <1722933994-32549-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-0.820300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yaoXHZz/dXlxVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJouyFp77aPvWd71Wx2uUbPLdy4VFP6muDhmAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMONtptvEPKuyGqpz
	SxloTNN2fEsuq+bel6ReMgnOERRWzT7B6OImrW9qraMeDtOx8VtKxFliGoYPRnwsOFiGLE/fsZX
	xqEqiKPgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111551

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add"and contributors" to Copyright

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-autobahn_23.6.2.bb => python3-autobahn_24.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_23.6.2.bb => python3-autobahn_24.4.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
index d9cc40b1b..d785a76cc 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_23.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
 HOMEPAGE = "http://crossbar.io/autobahn"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3e2c2c2cc2915edc5321b0e6b1d3f5f8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
-SRC_URI[sha256sum] = "ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181"
+SRC_URI[sha256sum] = "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
 
 inherit pypi setuptools3
 
-- 
2.34.1


