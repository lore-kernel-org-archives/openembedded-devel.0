Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D03CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 07:23:56 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.202204.1697527435500664762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 00:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="124747726"
X-IronPort-AV: E=Sophos;i="6.03,231,1694703600"; 
   d="scan'208";a="124747726"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C44ADDC67
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 16:23:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B0C5D500F
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 16:23:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C0C9170BC7;
	Tue, 17 Oct 2023 16:23:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from /usr/ to /.
Date: Tue, 17 Oct 2023 15:23:38 +0800
Message-Id: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27940.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27940.005
X-TMASE-Result: 10-1.599900-10.000000
X-TMASE-MatchedRID: N4NqWiMGRfn3FZ31mJ166LPx3rO+jk2QTSz0JdEAJbT7vFWrBZLBuCUA
	i6zraQcQCC8aAmGeO6lV00+whwxVQy/7QU2czuUNA9lly13c/gHzWEMQjooUzWAN6i+va16ukWN
	Ccn0XQOLfjT8jjWZr5U+ar1fsIOhmcwmXl5CnQGlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe8gz2YRMI7vTJ0RPnyOnrZKqfRvKAwYdQFQg7piBmlrxGkm6wbRMdYcsfrcdhtXHfB7l4
	L/zH/NCcBRAZdSBS8yhlgFZC1PrUS5BGh0MiQGsIf7zAsZYBMJLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 07:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105550

From: Wang Mingyu <wangmy@fujitsu.com>

From Poky 4.3, by default, usrmerge has been enabled.
Some important binaries have been installed to /usr/sbin instead of
/sbin such as init. So it is necessary to create symlinks from /usr/
to /, such as /usr/sbin to /sbin, /usr/bin to /bin.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index 94023922a2..0709019056 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "83917a3935ac7ce1d8d96e914d96a6679319a336"
+SRCREV = "baac322a8a6d57e62c703f6ed523152baec18b4f"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.34.1


