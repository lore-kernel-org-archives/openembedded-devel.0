Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD8DC001DF
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4900.1688699648883492827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="102453311"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="102453311"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71C07C53C5
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:04 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A42B5BF3D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id CF0A587E03;
	Fri,  7 Jul 2023 12:14:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] minicoredumper: upgrade 2.0.3 -> 2.0.6
Date: Fri,  7 Jul 2023 11:13:32 +0800
Message-Id: <1688699627-2519-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-4.558800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFMvIIDffuAMV9Bp
	PYGBBWzV+rzBROdr3B+2IsG2Ivx/gldvtTbdcIRVzusEIFLkpy0Jlr1xKkE5ubDGRtqVMwHzP3Z
	KKZ2icIlDjQTo+iYO/A3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StPSzAdIVxUnowLkNMQzGl5DfZL
	rUlw8Hx96Ap/+vpvjqeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBQyb2z1+UwA9bco8
	4j7nuhJKOxKR6fO6axSTgFyhtWahq5DAumGIbQD56Bd5Hs7TZmjvWHeOOP9jDWa++N1Kh1/JsDf
	RrAiIR3sfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Support comm names with spaces.
 * Also dump write-only memory segments.
 * Abort memory read if the crashed program is killed while the
   minicoredumper is actively reading memory. This fixes a possible
   endless loop in said scenario.
 * Known problems:
     - If tar is active, core files larger than 8GB will be
       truncated. If it is known that the core files will be >8GB and
       the full core file is needed, tar must be disabled.
     - If tar is active, core files larger than 8GB will be
       truncated. If it is known that the core files will be >8GB and
       the full core file is needed, tar must be disabled.
     - If tar is active, core files larger than 8GB will be
       truncated. If it is known that the core files will be >8GB and
       the full core file is needed, tar must be disabled.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{minicoredumper_2.0.3.bb => minicoredumper_2.0.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.3.bb => minicoredumper_2.0.6.bb} (97%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb
similarity index 97%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb
index 1e8ce7e69b..dfe9f7b51d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.6.bb
@@ -9,7 +9,7 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "e4706bf28a0699094add5d77a4b97145c2292c47"
+SRCREV = "da62115c0fab3a4608e4b0ee0c8aa0cf134c14ca"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
-- 
2.34.1


