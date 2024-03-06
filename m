Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D8DC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7730.1709714646761391410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vr1ZgrUM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714647; x=1741250647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bImh6yTFb73dSkEiInlio6TANdhDORrwcDfUImreEDA=;
  b=Vr1ZgrUMZGwU/fhQCgOxIn2R2cPSrL4sY6QaDiXfRXeWOZJjzoW487+s
   xM8CQrq7WzKIAuDDSmRxX1cxGKOET8xwTbXVUBybVhcySv+tVdgAk47NN
   KLlxblZ906Z447yos1CBucafELFBCr6mfOwsimWO7W0AMyYJnlGPKJK79
   3tCeLh0qIXu26LhKBfcU6l5AKH0gDT8M5Rj6scfF8XfFdLxgufrt4PKg2
   zNVoOFKZX0JFoJ59U7MIqpzccB2PGVdWqWKZ4Wx6n42WdgQV9WZCHbcHm
   VBnsGujSg+Lz4Fmpxl7/jLBApwSXS6Xwn9MQDxo4moOGKZOFKQlWkNeaM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139397619"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139397619"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:05 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BB85A35E5
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BB1B42613
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 15FB841189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB9511A006A;
	Wed,  6 Mar 2024 16:44:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/26] neatvnc: upgrade 0.7.2 -> 0.8.0
Date: Wed,  6 Mar 2024 16:43:12 +0800
Message-Id: <1709714608-19296-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-1.065100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrRwwlJftO1wiOLE91R5kpxBAF
	gHZKVHH6GTx99UHtXTOJmpwkiLtwBM+MAVVuGGsd9k5nZzZVBSAnhzAhgvoq55Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/xCE2NlBjIjctE8mz+ry/JQhjp
	75eLVqH1slxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDtkG6
	aE5eMmazAHrJw6O6OQdR9j+8aP8cUgpMlAmBD8AIENk/GoFcopSIbgWVI+4HMOgYuaJuehRWBZY
	g1CvGK4CDxznUOuqRIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Apple's Diffie-Hellman authentication (security type 30) has been fixed.
-A new client connection no longer causes a DNS lookup.
-Clients are now allowed to request more than 32 encodings
-Zlib streams are now preserved when a client switches between encodings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../neatvnc/{neatvnc_0.7.2.bb => neatvnc_0.8.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.7.2.bb => neatvnc_0.8.0.bb} (89%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
index 152409de1..c9c4a6c27 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.2.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.8.0.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/any1/neatvnc"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
-SRC_URI = "git://github.com/any1/neatvnc;branch=v0.7;protocol=https"
+SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
 
-SRCREV = "14619e6281136a02e376ad23e3cfaedc8de00ffb"
+SRCREV = "46432ce8cade0b54a38d4bb42eb07f96c8ff49fd"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


