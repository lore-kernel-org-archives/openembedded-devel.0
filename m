Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A58AC3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.61110.1742893331453657027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aozxnU8B;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893334; x=1774429334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WVN4zB/5CiFa7Q7U8CJDY/IUrcf3Dt0YwbNGLrVUa18=;
  b=aozxnU8BCdypJwd35zAcCXWM9YZjCdz+keLJSO3GZ4Xwc0AvzCx2Nmm4
   qcI4JeqkxGCGEhN8lge4oyG8T98to4zzOvaTsIA1q267vAjIr16pL4Y35
   ZT8hmbeN1F/ZHSdXl1kOeXN9led50kG0AChGRTeqSlTYYg962Er79fMDs
   a27tofCyy0ew9nJqGNYRiyjyBIiB+pjs2jw+pjib33DNUZdBySMAKPvm2
   9DVC78kIJTYx4IrpKk4pKMrTHDNgL4f3lTnDKTE6TBM19VTUE3tLxllBh
   q3NdxakM0d0VWSJZWYZh5LegLBEw7xZyGidTavWpaR/gZpL87+3SLgYNI
   Q==;
X-CSE-ConnectionGUID: WOxX+6ctS/KXv/O2cLfVmg==
X-CSE-MsgGUID: ERypIBPrRY+CoW6EbjHSLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173638039"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173638039"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E089AD4812
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A5B71D4BD5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:10 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 406B21A0078;
	Tue, 25 Mar 2025 17:02:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/45] libdex: upgrade 0.8.1 -> 0.10.0
Date: Tue, 25 Mar 2025 17:01:18 +0800
Message-Id: <1742893312-3809-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116235

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Discard dependent futures if fiber was cancelled during await.
- Discard dependent futures when finalizing DexBlock.
- Build fix for macOS
- Improve build checks for libatommic
- Add dex_promise_resolve_boxed()
- Improve cancellation of fibers
- Use libucontext when necessary
- Support for OpenBSD
- Raise default mmap stack size to 128kb for fibers
- Add await/resolve API for file-descriptors
- New dex_return_error_if_fail() precondition macro similar to
  g_return_val_if_fail()
- Additional GIO wrapper functions including dex_file_delete() and
  dex_file_replace_contents_bytes()
- Build system improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/libdex/{libdex_0.8.1.bb => libdex_0.10.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libdex/{libdex_0.8.1.bb => libdex_0.10.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb b/meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
rename to meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb
index 3ed2f6ccb3..17471a3b5c 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_0.8.1.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_0.10.0.bb
@@ -11,7 +11,7 @@ DEPENDS:append:libc-musl = " libucontext"
 
 LDFLAGS:append:libc-musl = " -lucontext"
 
-SRC_URI[archive.sha256sum] = "955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0"
+SRC_URI[archive.sha256sum] = "98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1"
 
 PACKAGECONFIG ?= ""
 EXTRA_OEMESON += "-Dintrospection=enabled -Dvapi=false"
-- 
2.43.0


