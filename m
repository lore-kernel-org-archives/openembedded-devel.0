Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82914CD1296
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.39490.1711983110517186269
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hSVTBfRf;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983110; x=1743519110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e9ezq1nLqHqUb0sWTXEZx6Fuh7VCmOWHu9o1AstaT8M=;
  b=hSVTBfRfH8P2iUkELqjo0ZwYcKh1oEUg7p83QwKcI2E151BXg3eH9dRQ
   Ltuv5qMycxbt0a6az/cyH/ZcUZY1ifL7PZLUrCwkoWt8SH1gHQadvTRgv
   Vh2k47+M2X0k8V06ZpQgStK6fUYjssQFZqfVKtRTruD4YOl4dGjuAQzkZ
   AdJRsdFAXeHBwgds85PotqDlXMkN2droYq5MxhtpYpXBd6oYVbrZ6Eiv6
   PRqT3GcJDyawmSPv4PeCabyd5YPRmrNl0v+xcdrMP9j0gcGKClVtLGZZw
   452kCcmbehf8F1tDQ2jkvcu/jxM+jEBkDhhydPHLlly7TAlcdciZTHgmE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563987"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563987"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:48 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 39293A3442
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 73ACED7B62
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 008BB40FF7
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9D8F1A000B;
	Mon,  1 Apr 2024 22:51:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 44/47] tracker-miners: upgrade 3.7.0 -> 3.7.1
Date: Mon,  1 Apr 2024 22:51:16 +0800
Message-Id: <1711983079-16849-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.548200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrzlT5a6V0OSN4YeSlHZYFotSH
	nJDq2yhMXj9sQHEWIDST8jPQpoV7ERDITYD8arnZA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYo3m/SOHWG/bCwxtNmfvYmJ7TXnCjI8t9ukphWnlDPb36HO1a47FqZAl2F
	OhQ0H97rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLO9EY/C2in1W1odr
	ZeOuE87thgBQx3ETsVn2kxomC3vn9PbU02J+Ub0bdcRbTl1UOUZxSXlVHEHh4N36wEFRFz7Qo1W
	4nxkHDeIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109762

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  * Improvements to the handling of corrupted databases
  * Further syscall rules in the seccomp sandbox
  * Fix some possible warnings during tracker-extract-3 startup
  * Fixes to extraction of dc:source fields from XMP data
  * Avoid SIGABRT on missing Landlock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{tracker-miners_3.7.0.bb => tracker-miners_3.7.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.0.bb => tracker-miners_3.7.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb
index 4f058cf90..7bbee2a88 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.1.bb
@@ -18,7 +18,7 @@ SRC_URI:append = " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch \
 "
-SRC_URI[archive.sha256sum] = "74e796c1625094a8a2175993c7907281e97ab6e002578e846b8f4ca44e36bf61"
+SRC_URI[archive.sha256sum] = "50a3abe40cfb0b35ced43ec716dbf1368992e444ef7a0babf202c7ac6ab2f6f4"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.34.1


