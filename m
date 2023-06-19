Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFB1EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2314.1687157422040252285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="120836458"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="120836458"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A3E8DAE10
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:17 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A565D5E90
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id B29F32FC5C6B;
	Mon, 19 Jun 2023 15:50:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.6.5 -> 2.6.6
Date: Mon, 19 Jun 2023 14:48:08 +0800
Message-Id: <1687157308-17342-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--4.923500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/ybcPsR57JkIzEITY2UGMiNyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNBO00Q/2PQs8plXRoxG4ek4Thq5qjtQVGwrj
	XAJniWtc3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNY68bpVbgWY5bE7t6KavN0yylAlSoVK278wmuMDN3ptNmLK/Cv43TVl3DluaPxy2kKMBi
	qU6SRLmOaptvP2+/N9oZILfm9mDzpltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103359

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Update GPL and LGPL text files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.6.5.bb => gensio_2.6.6.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.6.5.bb => gensio_2.6.6.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.6.5.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb
index a512d2965..85160bcda 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.5.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.6.6.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A library to abstract stream I/O like serial port, TCP, telnet, etc"
 HOMEPAGE = "https://github.com/cminyard/gensio"
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
-                    file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "b5a275af5feac1ea15c19912715444f6e52e21f7"
+SRCREV = "536db06723bd3cde8e1f2d52a5cdd65af2433784"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


