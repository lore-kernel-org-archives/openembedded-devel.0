Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E62C00A8F
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:49:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6838.1698104945160264348
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137286673"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137286673"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:49:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07DF8D4F51
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:49:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ACF7CFBA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:49:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 79C1C2005A580;
	Tue, 24 Oct 2023 08:48:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.32 -> 1.4.33
Date: Tue, 24 Oct 2023 07:48:44 +0800
Message-Id: <1698104924-32278-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-2.869800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrShfYxkaruAnozDhGeQC9Ei2b
	H6xzzy+LxLWbFZxDIaJTmiRbU90cZtGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJGFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZluYBobWQBo3fO83xKc2lDDxRGwBdoyhq/U2gc0JTLNyptjpJDp2NVLviLDsEYbUXypJ
	ZYWGFobYSwTajbUpUxjQIHdD/3EOWOCjzW1o6/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [REM-2977] add shortcut for 'send clipboard as keystrokes'
* [REM-2972] Make keeping window open on session disconnect configurable
* [REM-2974] fix crash cause by using freed memory

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.32.bb => remmina_1.4.33.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.32.bb => remmina_1.4.33.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.32.bb b/meta-oe/recipes-support/remmina/remmina_1.4.33.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.32.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.33.bb
index 74c68a59d8..590f5089e5 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.32.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.33.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "4804f68f23045a38c3a7be46810fce14bac2fc3c"
+SRCREV = "2c4e1479433e51418ecb6089f35182bfebc5b57e"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


