Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D0FC87FD3
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4252.1753153984695241309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kw91oOtG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153984; x=1784689984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LLrC2fjyYiV3PfbljD5XEti5LqwJY9o09CfNpX14HEM=;
  b=Kw91oOtG2UdeJ3nVCIOVULcXzUPLsEvp93JMn3pStrHy3MzLZ7m/oKtT
   2YeuJlH/CHZfx7B4tvJlcKk/aOg3xuVOs+C5AubIDdFeQiyXhztZyDA6z
   oMNBAPIjHxtoZJC0o6lIeMGlBNsRPWnhdDteDanunx4byptjxue60GvpB
   rtaCHJzLoi7vITPT2G2H9T1Q/3ecBqWrtHth1gyUU16b2OhZejPqVlNmr
   PzCHvM5lJv+5A1wwWkdP0t/TNjYRgMnX/KkTdLMzxoRfBm9Rkpnx4fV71
   RKcYBtwDjFMVCI2LHJCRae26fUJ+icvZ1JN7+yK032OgbzBCTYVFNE608
   g==;
X-CSE-ConnectionGUID: UeF1wmz3TKiMFF5Y3SEyhA==
X-CSE-MsgGUID: KKbvfvoGTaulhir8qP9YhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="195455334"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="195455334"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:03 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 008DA1476
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 669CF180033F
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:02 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 61AD61A0078;
	Tue, 22 Jul 2025 11:12:59 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-networking] [PATCH 04/21] nbdkit: upgrade 1.43.11 -> 1.45.1
Date: Tue, 22 Jul 2025 11:12:12 +0800
Message-ID: <20250722031245.884-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118667

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...02-plugins-Avoid-absolute-buildpaths-in-binaries.patch | 8 +++++---
 .../nbdkit/{nbdkit_1.43.11.bb => nbdkit_1.45.1.bb}        | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.43.11.bb => nbdkit_1.45.1.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
index 524ea0602d..99ab7cad61 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
+++ b/meta-networking/recipes-support/nbdkit/nbdkit/0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch
@@ -1,4 +1,4 @@
-From 1ccbd8fdbd2e367a702e48c8703b2f010d067b23 Mon Sep 17 00:00:00 2001
+From b3854245f061d9ba2159bdb37197e1c711cbd9cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 22 May 2023 18:16:24 -0700
 Subject: [PATCH] plugins: Avoid absolute buildpaths in binaries
@@ -11,9 +11,11 @@ Upstream-Status: Submitted [https://gitlab.com/nbdkit/nbdkit/-/merge_requests/30
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- plugins/cc/Makefile.am | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
+ plugins/cc/Makefile.am | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
+diff --git a/plugins/cc/Makefile.am b/plugins/cc/Makefile.am
+index 478178bd..742ea535 100644
 --- a/plugins/cc/Makefile.am
 +++ b/plugins/cc/Makefile.am
 @@ -44,9 +44,13 @@ nbdkit_cc_plugin_la_SOURCES = \
diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb
index 9e7bdc9966..63194ad393 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.43.11.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "2d0f232b590f4001881dd0819f55af72b88c4b2f"
+SRCREV = "243c6911984abc82bb711d2e5ecb1a13c7ff93c4"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


