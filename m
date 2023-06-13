Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FB9C88CB4
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574482"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574482"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:03 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B288C53C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:41:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E71ED4BF7
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:41:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CC39B20074724;
	Tue, 13 Jun 2023 10:40:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.30 -> 1.4.31
Date: Tue, 13 Jun 2023 09:40:21 +0800
Message-Id: <1686620422-29962-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--3.573800-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mrShfYxkaruAmatSg8/T+FuzZr
	09iwbwmQnK0E4bVZnFYRm9ous1gWbVK4l8RZlJB8OWUWxTQJdI+XBPRemiwRNQ3H/quqvfm40Bh
	ZSjgdIiTtL1FgCoXplNwvoAJ3YEa7z4wBVW4Yax1q0YIZ2L+damFODOFBIXWKlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDWgws6g0ewz2QuLGuwInWNPBILqohnmeSaPFj
	JEFr+olKE0Je8DR/D6No+PRbWqfRMZW5ai5WKlyH/Fd6XTFTqGnsJV+jbhd68AtRZm7uBe68DJP
	m43AzcTeNtZ5oWYbML0TRofDl+LWQ5xahXWuMbSkNf44qEOTwptf+ud0dlhp/r/b+dmSKFo6AH9
	/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103250

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [REM-2874] muli password changer search now matches partial strings
* Fix segfault in VNC when using domain socket
* Switched pylist Append to SetItem
* Template texts updated
* Add menu option to delete multiple profiles at the same time
* add 1080p as a default resolution to remmina_pref.c
* Add ubuntu22.04 dockerfile
* Remove character limit on password length
* Create better postats.html
* Redesign santahat.png & add santahat.svg
* Edit preferences UI
* Change the icon of the new connection button
* Modify the checkbox of the appearance-tab
* Add valign to the switch of the debugging window
* plugins/rdp: Ensure output redirection configuration applies to both dynamic and static rdpsnd

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.30.bb => remmina_1.4.31.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.30.bb => remmina_1.4.31.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.30.bb b/meta-oe/recipes-support/remmina/remmina_1.4.31.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.30.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.31.bb
index 0437fba51..56ad32ce3 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.31.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "61ea9b6681104cadf0a3f8c25bd3e5685ee6691a"
+SRCREV = "7407cc3a27eb25ba4ddddeab565f67fd688324ed"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


