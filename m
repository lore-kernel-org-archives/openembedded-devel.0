Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A60C83F10
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.55569.1751879234060672811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KnbzcTpt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879234; x=1783415234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5VB1iivOv9PNCX8vD7mIyZdgekrj59hTMpB9+ijp4C0=;
  b=KnbzcTptJZHxm59REvgahu9XQWSRfSfR+mgbIp01q90rqofecX7y6WAY
   DdzKheXn5pi4OELrGHm5pR8j/HDqn03mw2RJyBE5uLr2ezDXVH6HQKpci
   ptSMyo02SpxiN9qepyOIsmEKIb87r2UqAoqjhrGVON08EM4WxRQFh1eLx
   qYvLr+wnxnaZ7ynuTrtcvYJviNK0wsoOc1g5GR2qzXgZ2b7QzmwHCnvJQ
   lvmIMheJiq6ugj4PAareFFzJA/Ekn3VvsOywO/j5w0xCGQ+LjSk3em83x
   eW1X5hOqOy6L1vXQmfLuLyeNWr3vnemGpalacIXV+lPFcGRd3zaxaAgez
   A==;
X-CSE-ConnectionGUID: 4pLQCTZNSOi0ArL09Y4ztg==
X-CSE-MsgGUID: r901/IYzRymj5VJxfsH0zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="192895249"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="192895249"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:12 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 9CE6AC00093
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 232311800261
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 84C1668A0B1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:10 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C492B1A0074;
	Mon,  7 Jul 2025 17:07:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/35] libdex: upgrade 0.10.0 -> 0.10.1
Date: Mon,  7 Jul 2025 17:06:31 +0800
Message-ID: <20250707090656.1216-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118258

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fix autoptr usage
* Raise critical on finalization of thread-pool-scheduler which should
  not happen in proper usage of libdex
* Avoid extra pointer chase when dispatching to thread pool workers
* Don't dispatch blocks while on fibers, wait for scheduler
* Fix leak of unix signal futures
* Improve management of fiber run queues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/libdex/{libdex_0.10.0.bb => libdex_0.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libdex/{libdex_0.10.0.bb => libdex_0.10.1.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb b/meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb
rename to meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb
index 17471a3b5c..3b83273272 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb
@@ -11,7 +11,7 @@ DEPENDS:append:libc-musl = " libucontext"
 
 LDFLAGS:append:libc-musl = " -lucontext"
 
-SRC_URI[archive.sha256sum] = "98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1"
+SRC_URI[archive.sha256sum] = "7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6"
 
 PACKAGECONFIG ?= ""
 EXTRA_OEMESON += "-Dintrospection=enabled -Dvapi=false"
-- 
2.43.0


