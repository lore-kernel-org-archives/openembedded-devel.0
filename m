Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9E7C41513
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:21 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9840.1717664833634623631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YDYsoIiW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664833; x=1749200833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZICYNi7S2eArNcIc+oGj/bzzC2jRxuwWPkr45L6IVtk=;
  b=YDYsoIiWaM++D1JXWfFLdV4ejTkw6qsTXRfm0ytcn1MyhWO3ztDQqxpj
   79agMHtWC0YXVzlmzWGZcd33fdX5ivI/XyGG68H/YIfSNjZBVcOaK7jTv
   ht3a0N7UTreotRAiGOBRfgiOGycsPeKdkIYIzDCYW5AsBdxtrYqjRAO1s
   gaDqREbmbT2IbeX81u3EbKdmr+IXeoniBAniNhyC9gQ3fGCQixYHS9mze
   tM0ngNaDPkIhiaCO4/PX0D+QOxxqFVsPBQKHjI3DzD45IalIdAeQfLrXe
   T0Z4hN057nW0hW5s7b7lYPUhmDrhECu9FpvA0nAGyS4blsco+Quv5Rxoq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="149566635"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="149566635"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:11 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84BDFD4F54
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7EC1159D4
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62D4720081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0EBCA1A000A;
	Thu,  6 Jun 2024 17:07:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/36] poke: upgrade 4.0 -> 4.1
Date: Thu,  6 Jun 2024 17:06:35 +0800
Message-Id: <1717664795-13902-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-4.530200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrW+HVwTKSJIbEWhdVdXNnvy1+
	4nCRr2jQKLa1Z0d/Lq7H+XQrL7UoGesZPyimk3xQv8fLAX0P50AYFQt+VRO1dLKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmiHY/bzRmIaZGeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDrkdMSQHgjjaGW26Dh729Y9LkbJUo0wqNalu7NSZ/y9QiWqZA77GXUDqQnnd0Yhk8uSV3
	vE7ltIkUzPUfKxDnVW943fipQxvZ4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110744

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Invalid memory access in 'pkl_do_pass_1' has been fixed.
- Access to possibly-uninitialized variable in IOS has been fixed.
- In error reporting, poke no longer crashes when the input is not
  seekable.
- Use of 'break'/'continue' in EXCOND operator's compound statement
  has been fixed to not crash the poke.
- 'pokefmt' now has a man page.
- Execution speed of 'pk-jojopatch' has been improved by disabling
  auto-remap feature.
- Variable 'poke_interactive_p' is now documented in the manual.
- Update jitter submodule to incorporate minor documentation update
  and a workaround for an Automake bug.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/poke/{poke_4.0.bb => poke_4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/poke/{poke_4.0.bb => poke_4.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/poke/poke_4.0.bb b/meta-oe/recipes-devtools/poke/poke_4.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/poke/poke_4.0.bb
rename to meta-oe/recipes-devtools/poke/poke_4.1.bb
index 9e68ba4ea..296368070 100644
--- a/meta-oe/recipes-devtools/poke/poke_4.0.bb
+++ b/meta-oe/recipes-devtools/poke/poke_4.1.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/poke/poke-${PV}.tar.gz \
 
 DEPENDS = "flex-native bison-native bdwgc readline"
 
-SRC_URI[sha256sum] = "02bab22cb1fa6153a1b6a927c8bb3cd58d508543c144842a6d7ee74f19973a77"
+SRC_URI[sha256sum] = "08ecaea41f7374acd4238e12bbf97e8cd5e572d5917e956b73b9d43026e9d740"
 
 # poke does not support using out-of-tree builds
 inherit autotools-brokensep gettext pkgconfig
-- 
2.34.1


