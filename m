Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55B9CF64A5
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.48951.1727682213603552276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fcqdTXWt;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682213; x=1759218213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wW8BF8IAChoVJJ6BGi9jYtK9oG8T215b968uRr/WWBs=;
  b=fcqdTXWtP1Els/rurV4ZTjr6p/Ba9RHEkiqrHIhF2SdaPIr8kb23ERQJ
   EIvhXIQ2ILlGur/iTnUrw1qwvZQSeiPPDb4fNsmplSw0AQm4guI+9VcFY
   6QFsyAqVhQBXBS7OSN1nalEmUewSxkFEbczQU+etBS7GYy6s3HbPF5V4r
   QjwpMRCoSY+NufaT6isoLYSyD8KFdA8MQoORSSXLlhrc5vY0T8txKApAi
   qBwNcu8dz0Y77fTrCfQxHS/64Ar8F3WaXudXAIX4ywHP6JpAvY60o8Knl
   AMcgJgEWFAhJEtHmtVh85QaVaSUpBfX/3cUOSM4Zb2ydG7UCh92ENGDEy
   w==;
X-CSE-ConnectionGUID: HeqPm6bwSuCYvBBSlMLYHQ==
X-CSE-MsgGUID: Z4wbYVx8St2fuQ1OjD77Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154209885"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154209885"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B0D6D8021
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40F08D774C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D27EE6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 822DA1A01ED;
	Mon, 30 Sep 2024 15:43:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/40] ctags: upgrade 6.1.20240915.0 -> 6.1.20240922.0
Date: Mon, 30 Sep 2024 15:42:28 +0800
Message-Id: <1727682185-12664-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZFBAb4CyKPieM8KgZMynf4j6OrCq1tjNPMY3TTv7fNeY3igqmhPz3NGsT
	PRyS0RVKCN+w9esRzQET4yrKksamIbDMxI/PiGxB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112564

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240915.0.bb => ctags_6.1.20240922.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240915.0.bb => ctags_6.1.20240922.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb
index 247e1a844..436793c58 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240915.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240922.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "40b58618f9f0dc4123a205cbd50b73c6ab2e6f5c"
+SRCREV = "7e96624c9be94c5b4b89e5ae1f093e58282abf43"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


