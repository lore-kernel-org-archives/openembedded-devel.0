Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E70C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:51:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.12891.1716861059984494203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ez6CVVYv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861061; x=1748397061;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Y9jsQmNqlqcUD5CgkK+5BerKKzGpafO9J/i8WqUjDhc=;
  b=Ez6CVVYvR4toCVqnBzRny+7ulhOxAV627XypbPbXkt5SnbKlz6fX3m82
   seo8knmBfLUisI2fU1NlAIv36yVpEDPgwNl2x5kajcsZjRFpR3TETiYsY
   AmeglqcXedjq0yhH5Ei+YRXOPAdTodH+4DqeG/EpM4a4uf2s+H/UCErEK
   0EvaRFBBIQEjeYkOb6iYrCHGmX0/V3ZHrRwdoDeBbxhxXzXvNPk4/nMUE
   innGMqmhlg52oKwFbgMIHv8hokMrgmUrPTCBv/6X9sFUXnTjEnVaOo28g
   OhIF7NU1E/LLptpzjhDJMIOIftZTv9ubpz9h2x0wQ11tgCDz8djVcLHru
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160605252"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160605252"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:50:59 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B7AEBDAD30
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3BAAD5928
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86D9F2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33F931A000A;
	Tue, 28 May 2024 09:50:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 39/40] wireshark: upgrade 4.2.4 -> 4.2.5
Date: Tue, 28 May 2024 09:48:20 +0800
Message-Id: <1716860901-863-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.451800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGJcLewwAa76f3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrSukA+DHGFtqqImlpWtyB/cIwbjE2PdUCCM+SZZjFB5J+mmkOanJJW+NHg
	U/cQDlQIXtpAPJw98QdhxpAyjN5iS3jv4yTfgUJh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110574

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_4.2.4.bb => wireshark_4.2.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.4.bb => wireshark_4.2.5.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
index 95db2efc4..7cbe3e632 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "46bd0f4474337144b30816fb2d8f14e72a26d0391f24fe0b7b619acdcdad8c0c"
+SRC_URI[sha256sum] = "55e793ab87a9a73aac44336235c92cb76c52180c469b362ed3a54f26fbb1261f"
 
 PE = "1"
 
-- 
2.34.1


