Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263FEC001B0
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4896.1688699641431048030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123141877"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123141877"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:13:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10522DDC68
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:57 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42C07D9A76
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:13:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C23587E03;
	Fri,  7 Jul 2023 12:13:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] weechat: upgrade 4.0.0 -> 4.0.1
Date: Fri,  7 Jul 2023 11:13:28 +0800
Message-Id: <1688699627-2519-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-4.045300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yYL5ja7E+OhyJ7Rnqmx7r5ummJKihLVAeCu5
	iQ9EM64ECPsqZaAae60MV0giWV8uEqZY4PxfRMWEOWUWxTQJdI881ck8U80Wlpm3OIVSf4P5jcR
	qQigdY11X0RAUDURqD98OTWGkacup7QKZR2ZkvsbDJnf/I/XWyt8VvrU8XV3S31GU/N5W5BCCDx
	bm2wVcgPu0HEWlaGvJ/7XTrlYjb7gv+0FNnM7lDZ1U1lojafr/CZa9cSpBObnut6dxL6OwmJ6ba
	/D5x6cp4vM1YF6AJbb2xnRRfQRo4gtuKBGekqUpnH7sbImOEBTb9P3FJsxLchrO0HOEEFTYD8E2
	FNXKM/neN9oTXc1IfIDFWwKy96BM0Ykt4Kte0YwlNIeWcdIBaxwfZswlW4q55OHTphHyPU3sfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103689

From: Wang Mingyu <wangmy@fujitsu.com>

Bug fixes
=========
* core: force key "return" to command "/input return" when migrating
  legacy keys
* core: display actual key name and command with key kbd:[Alt+k],
  remove key kbd:[Alt+K] (grab raw key) and associated commands
  '/input grab_raw_key' and '/input grab_raw_key_command'
* core: check for newline characters in string_is_whitespace_char
* api: do not convert option name to lower case in API functions
  config_set_plugin and config_set_desc_plugin
* guile: fix crash on quit with Guile < 3 (issue #1965)
* irc: reply to a CTCP request sent to self nick (issue #1966)
* irc: sent "QUIT" message to servers connected with TLS on '/upgrade'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.0.0.bb => weechat_4.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.0.0.bb => weechat_4.0.1.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.0.0.bb b/meta-networking/recipes-irc/weechat/weechat_4.0.1.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.0.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.0.1.bb
index eb9f8c8f14..00472e21eb 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.0.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.0.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz \
            file://0001-use-pkg-config-for-gcrypt-instead.patch \
            "
 
-SRC_URI[sha256sum] = "5bd75ee15f3392a0ad174ee7c54518daece3878477670c07f10d6ebf988240f9"
+SRC_URI[sha256sum] = "1b9533123af427922b3d7fabede958dc85392d50881d97d0b7986d8f514556e9"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


