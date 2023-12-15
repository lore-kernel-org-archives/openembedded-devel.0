Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB836C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 03:55:34 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.52885.1702612529098362204
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 19:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143471181"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143471181"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 12:55:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71272D9DB3
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:55:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A78FDD96FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 12:55:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D57542008631F;
	Fri, 15 Dec 2023 12:55:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lvgl: upgrade 8.3.10 -> 8.3.11
Date: Fri, 15 Dec 2023 11:47:54 +0800
Message-Id: <1702612074-3294-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.004
X-TMASE-Result: 10-1.498300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY32lF
	7OhYLlctoiRiRqJbjhYF1Ec/oUIRldAy2LXTI7g3EXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah/tAdDE/EtBJIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz4nkIQFWs+VwFpg
	YDh96Z9IUEyhO/+Aq/CftQycYL9nOWHc9re7K8g6DfbL0wvve1jAw+Roy+A7lVURUJbL8rFZiiI
	7VzpU0EiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 03:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107483

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.lvgl.io/8.3/CHANGELOG.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/lvgl/{lvgl_8.3.10.bb => lvgl_8.3.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_8.3.10.bb => lvgl_8.3.11.bb} (96%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
similarity index 96%
rename from meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
index 7dd36cac2..252368061 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.10.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=bf1198c89ae87f043108cea62460b03a"
 
 SRC_URI = "git://github.com/lvgl/lvgl;protocol=https;branch=release/v8.3"
-SRCREV = "06e229cc7679c01119ca5d905a1f9dad96f475f0"
+SRCREV = "74d0a816a440eea53e030c4f1af842a94f7ce3d3"
 
 inherit cmake
 
-- 
2.34.1


