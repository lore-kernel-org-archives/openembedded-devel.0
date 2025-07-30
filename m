Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D29CA0EC1
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.31492.1753869308021251125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eYZvyOQM;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869309; x=1785405309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zYjFNdffOGI2VqvFGgTfHfXYuc5zAodzLho/p3PFo3w=;
  b=eYZvyOQMpcNAE8+jQJklta+TX/jnHUB3vL7jMvyfj82/yGrl2DsOVgCQ
   YjtMPagYGoAhIEzpP6Rwp0N11LCTDpG2TGQ+xmib5L96gSuRb5wxMN1WX
   ++QVfW9K/S3cEC6GN1Ze3Fejyrn00Si2UCjBGoiZa+OD5TWBCeJFBxThL
   OWfGgdsXcgj/mSZvti9Y/lwzD6QUxaAvLKDZ2ps7QuWAny6IkoM1wWVIu
   nOnj+5/6ePjczNkyzK9n2MKF3kByGlooFR8GkLJqUN7p8kUNskCPELHCP
   YKrveai19BAX1noUdBBFRLLvj9gD6L69w/mRr6d0kj6qC5OpWu88Jkjwg
   Q==;
X-CSE-ConnectionGUID: g6zSauI7SB+I+QeHgacsZQ==
X-CSE-MsgGUID: Esc4MpLNSd6NJ1W6AxZpTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186838682"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186838682"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9C2A81002B93
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 142B383D96A
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 403D01A0074;
	Wed, 30 Jul 2025 17:55:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/40] ndctl: upgrade v79 -> v82
Date: Wed, 30 Jul 2025 17:54:32 +0800
Message-ID: <20250730095456.695-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118782

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v79.bb => ndctl_v82.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v79.bb => ndctl_v82.bb} (95%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-core/ndctl/ndctl_v82.bb
similarity index 95%
rename from meta-oe/recipes-core/ndctl/ndctl_v79.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v82.bb
index 4014e3bca6..2603217326 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v82.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "16f45755f991f4fb6d76fec70a42992426c84234"
-SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
+SRCREV = "74b9e411bf13e87df39a517d10143fafa7e2ea92"
+SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https;tag=${PV} \
            file://0001-include-libgen.h-for-basename.patch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
-- 
2.43.0


