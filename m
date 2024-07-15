Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC21AC52D7D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.33837.1721034185569097936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LNQpxQra;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034185; x=1752570185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hmtMFnZ4Gb889Nw0m992TYnsIbIOhRkjGZKyezFNfag=;
  b=LNQpxQraFoRHyIkVd29AzzLqefxVS1joqNjawGL08fQ6svcXpyBBF16y
   gj0IsMSnvYYFJHGKvrq9KMElMSp6k7bJnnWWt2jypXanFjWp7r/T/zIGu
   TV97BVOUS/3RwlATJFJtuNfejdvafrkT+7dUF65FMkjgU2Ih5yU6W0KBT
   GftL3VgT5kh20FOxBAWzd+36euq4TZRLZ5eRtQT1Bp/yNe9PmWUfeBRzY
   sjLPF9mCoXueAmXFh0LpluGX95Tnon0WbMmbGYPxEP20seRWat9Cpj6bA
   dkPWL/Gu7TI1maE0oT+uWR/5MQVKMYyJuk/Gwi2R66Fg/vJRAZUpirnx4
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="155224463"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="155224463"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AE57DE2E8
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B9F2D5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5539620071A3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 218E51A000D;
	Mon, 15 Jul 2024 17:02:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 35/38] wireshark: upgrade 4.2.5 -> 4.2.6
Date: Mon, 15 Jul 2024 17:02:28 +0800
Message-Id: <1721034151-540-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--2.913200-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yTAdpuStCriJF7ufiw/c2JB+GziShTu+Zn3Y
	vtP37IU4PMdA7Jm+2dMngSBWaB6DMsWqox1jZ5NwBDoR8w7C9OajCFJZOodhGMboqPA6+88kU6R
	EgJOfyQoosj3rqK+1N4LvEn3rGwzEEK2QongmqLJrzsINdopFUlvh1cEykiSG68KDVWDlXEDN2W
	jbpqXgoVxNy8rltPsIDcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZcFfXzPlfY7e0NlQ
	W0IPvCboDz6JOyTqkCAMuqetGVetnyef22ep6XYxlblqLlYqXL5UUUYp7r3BP6omGWZFXSiOWAA
	07fwjJ0Ze5kwEqYVfxjEfipaVKHrk1Y43VtPSd3gt4F/or4jpfEwXdKGE+pDrw0Hy3hVt3f+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111358

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
===========
* RADIUS dissector's dictionary loading broken in many ways.
* 3.4 -> 3.6.5 ASCII display is broken on CentOS 7.
* Funnel/Lua: Closing child window disconnects buttons of parent.
* Lua detection fails with Alpine Linux: missing: LUA_LIBRARIES.
* vnd.3gpp.5gnas payloads of type SMS not decoded inside HTTP2 5GC.
* TCP Stream Graphs green sliding window line not displayed correctly.
* Wireshark window doesn't fully fit on screen on small resolutions and can't be resized properly on Russian language.
* Wireshark started from command line doesn't set gui.fileopen_remembered_dir correctly on Windows.
* Wireshark expects wrong length for DHCP Relay Agent Information Source Port Suboption.
* SIP P-Access-Network-Info header not correctly decoded.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.5.bb => wireshark_4.2.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.5.bb => wireshark_4.2.6.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb
index 7cbe3e632..246264040 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "55e793ab87a9a73aac44336235c92cb76c52180c469b362ed3a54f26fbb1261f"
+SRC_URI[sha256sum] = "5ec6028df29068d889c98489bf194a884b00831106fea1e921fea3c65f2003f5"
 
 PE = "1"
 
-- 
2.34.1


