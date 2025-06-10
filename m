Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89812C71151
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.77947.1749526420542438253
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QHwUlgfy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526421; x=1781062421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TtRjJaKDYI4YKpfXsMz5bGx1VIsIVnxc8s6J0P0R1w4=;
  b=QHwUlgfykOwr0SW6PCLc0z3socp2pnoqH6EFKnV839DYIUfaeQO+Ha6F
   9fzB6U0fhO7wZ1FndujhfBS3rk4BYp9c9GZeUZEXoON2b4NzBs1Kq6OpT
   fugpl/8vyKNWvNur081/TTRVqyghRtvgxyfVDEXuWEcAC+5krZtp3FT2L
   SwaaHGqwUEJRX6Sm7DH6gPppBuvhj8e59ZT1ymxRH2fnxtla48xbJsK+J
   sbaMkcDlQu4kZhb6aZUaT6erO4u42PK7yXmC/GZ2we3ZZB8PWK1+DaQdb
   b00ZF7lLW3oOsoA4ofuoSNUGGXlYPNTcJcS+0f7wQDE6o05Ahs/SbAz7u
   Q==;
X-CSE-ConnectionGUID: o6okLNlBQqOd0cSpZ4lvgA==
X-CSE-MsgGUID: 7mHu+fVgS6Gs7ANDGAZIuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202196156"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202196156"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97FD6D64EA
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E8C713F3B
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:35 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63C691A009A;
	Tue, 10 Jun 2025 11:33:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/64] bats: upgrade 1.11.1 -> 1.12.0
Date: Tue, 10 Jun 2025 11:32:28 +0800
Message-ID: <20250610033330.924-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117796

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- bats::on_failure hook that gets called when a test or setup* function fails
- increase compatibility with Solaris
- fix noclobber breaking bats-gather-tests
- fix exiting with 0 despite bats:focus when all tests have been filtered out
- remove deprecated ubuntu 20.04 from CI config
- Fix hyperlink to external Bash resource
- Remove mentions to no longer existing find_library_load_path in
- lib/bats-core docstrings
- Add missing "status" word in --returned-status documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.11.1.bb => bats_1.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.11.1.bb => bats_1.12.0.bb} (93%)

diff --git a/meta-oe/recipes-test/bats/bats_1.11.1.bb b/meta-oe/recipes-test/bats/bats_1.12.0.bb
similarity index 93%
rename from meta-oe/recipes-test/bats/bats_1.11.1.bb
rename to meta-oe/recipes-test/bats/bats_1.12.0.bb
index 82f57e51b1..ae59a27dc9 100644
--- a/meta-oe/recipes-test/bats/bats_1.11.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.12.0.bb
@@ -9,8 +9,8 @@ SRC_URI = "\
   git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
   "
 
-# v1.10.0
-SRCREV = "b640ec3cf2c7c9cfc9e6351479261186f76eeec8"
+# v1.12.0
+SRCREV = "713504bc0224a19b3d7c7958c18dc07f64f54b44"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


