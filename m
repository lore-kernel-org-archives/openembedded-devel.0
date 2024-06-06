Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D33C27C52
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:06:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.9819.1717664810123751180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XPtSE8kM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664809; x=1749200809;
  h=from:to:cc:subject:date:message-id;
  bh=gv9WKRZ7WHEhgszys/YKyjxYZ92Gj4cTZYHk33N5I8g=;
  b=XPtSE8kM43B71JcxIgku0FIhGCVva1y86sw2PqabhTxtPhb7+Sp6AFu/
   QgKseCLQJbL9az4BKW20m1pc41OHPTUXXwHe0uLQigAnFmIKJxvkfaWdK
   qOd4DUVh8AWU0ytLNVhQ/to9KbfB0ZOPM0X+b+3ves4kFmQVyEOqYuIw5
   gTyBzg/fkjUceXrCQAFMZnqCAlfqmSRQ4v1tNgHmwVJBi0Hwq55ouI4GF
   +0khLnh1en8em6UXprZzwXX3TWD1QW+/SSrt3s/uVISZ+jydldC8vfgtg
   wLnZSqFDj87Az1uKHRCqsZf0UkrdvYGZUbpjHsYM32SnefW0T29RJLUop
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141040276"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141040276"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFD08C53CD
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17FA3D72A3
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9696520081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 446041A000A;
	Thu,  6 Jun 2024 17:06:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/36] atkmm-2.36: upgrade 2.36.2 -> 2.36.3
Date: Thu,  6 Jun 2024 17:06:00 +0800
Message-Id: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--2.157000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwFk60oHehTzg1U
	4SKH6t6vNtWYZmc8YCQHMSexFgmXDsOY7UMlS7FZvL/Dm1nUPdliMNd0z/HZUzPJJylm6P+evqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgARryDXHx6oXQGXZZOuBkiOjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcqFsNMlqwlF3Yt6NfVz2XBwWgrZiBbdExDnw/
	FDgwvoyZcGhzZNu1jwVKoIOS32uII8u4X8ELxqCuNiuoA7HzJXmBDdUTIFGT/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* atkmm.h: Update link to ATK
* Add README.win32.md with Win32 build documentation
* Remove AUTHORS and add general information to README.md
* Detect if we build from a git subtree
* Don't copy files with configure_file()
* Fix the evaluation of is_git_build on Windows
* Don't fail if warning_level=everything

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{atkmm-2.36_2.36.2.bb => atkmm-2.36_2.36.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/atk/{atkmm-2.36_2.36.2.bb => atkmm-2.36_2.36.3.bb} (84%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
similarity index 84%
rename from meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
rename to meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
index fa47cbd48..62ca01530 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.3.bb
@@ -13,7 +13,7 @@ inherit gnomebase features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "6f62dd99f746985e573605937577ccfc944368f606a71ca46342d70e1cdae079"
+SRC_URI[archive.sha256sum] = "6ec264eaa0c4de0adb7202c600170bde9a7fbe4d466bfbe940eaf7faaa6c5974"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.34.1


