Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4E0C71140
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.78432.1749526425679932358
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dWEjJIm7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526425; x=1781062425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AcsPIuPQb4IMRIkZLsNIUptZOryuudPANhbrr5eSSww=;
  b=dWEjJIm7dMC35Nj1HHFMS0Acwyqj/ceivPe2iclXN0OX2vm0ptXThAiB
   biCwmNibjsR8kTxmsDnsUGQ79ae5p8CuKvH9lNRCZIbdWXheqAUj0Rh9f
   O7jy3xum6AoZMd9+PtDJwxzDLUCs1uFf5PGFJZlaTcwWD9tPvuDlNge+K
   b5uYXx1UT25dZn7TYr/UiaZ0lAdIfwiX53ISd3of0M0S//xWI3ByruITv
   2xYrkP86QHWRQnl+5xHPzhDlPv5nvsUHPtx7o5Zy1jjO7uuEs523TwMhw
   VAu+mH9AhaKHoj3RGHmRCS+UvKBjigzEIp0Ru/cxZbWdZq5CeHeZ/Gsw/
   w==;
X-CSE-ConnectionGUID: JkjU5VTzS0OFz6y/hqKk9g==
X-CSE-MsgGUID: ZTDlzwmpQFu1AydKZzQUcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="190662459"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="190662459"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:43 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9519FD4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FBACD7624
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:41 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C5AB51A0071;
	Tue, 10 Jun 2025 11:33:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/64] libusbmuxd: upgrade 2.1.0 -> 2.1.1
Date: Tue, 10 Jun 2025 11:32:45 +0800
Message-ID: <20250610033330.924-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- tools: Fix potential issue with select() in case the network fd is higher than the usbmux fd
- Switch to better initializer strategy
- Fix compilation on MSVC
- iproxy: Make sure to print correct socket error messages
- inetcat: Make sure to report correct error messages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libusbmuxd_2.1.0.bb => libusbmuxd_2.1.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libusbmuxd_2.1.0.bb => libusbmuxd_2.1.1.bb} (90%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
similarity index 90%
rename from meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
index 747274de1b..5a7548a7e6 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_2.1.1.bb
@@ -8,7 +8,7 @@ inherit autotools pkgconfig gitpkgv
 
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "36ffb7ab6e2a7e33bd1b56398a88895b7b8c615a"
+SRCREV = "adf9c22b9010490e4b55eaeb14731991db1c172c"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


