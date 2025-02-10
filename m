Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF36C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46455.1739178111260815299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GmRVIRg8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178113; x=1770714113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qyZvtN7HjcQW4TIAh7sTP3toU8pYU354ekPbCQKN57g=;
  b=GmRVIRg8yf1P5B7uyc5dMq07Fn1bRX7M4NRkG4uxUkX7yLeA1B4Sfzqo
   KtigDsDcmefWHmAWslq/AfBwjr6hU5e5ZobsI8iPnsMIjjsDXsIXoR6Py
   fa10W5HqwsiFoz19vPm+c9iVAJLQZrE1aK2TMA2jdRHXzB9VrT0Ue1xoH
   JcbVMawTjSyK71l4e/C+l0JKcG04FZtO6YP8N435X3sHnT5JP7F/GaiMJ
   r8es6CgjYzINu91V3Wrr/k8vK3cBV21jdYaQsfqXs7zK8OKfl5mtrrIfb
   Mnz12lWAYyye3bE2+IWYsxzmy3+/B+/5UZA0Lbd4+i03H+wS90KgA+pLM
   g==;
X-CSE-ConnectionGUID: eCYicwwyR+mzEW4tBqtYbQ==
X-CSE-MsgGUID: DGIolyFCQYqMWTkXiqOhSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712427"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712427"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 29815D4809
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E27E5D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8788C1A006C;
	Mon, 10 Feb 2025 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/66] libpaper: upgrade 2.2.5 -> 2.2.6
Date: Mon, 10 Feb 2025 17:00:41 +0800
Message-Id: <1739178095-26432-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- .gitignore: add README, symlink created by bootstrap
- configure.ac: don't need to fiddle with manywarnings settings as much as we used to
- README.md: fix some markup
- configure.ac: add specific check for _NL_PAPER_WIDTH/HEIGHT
- GitHub Actions: use brew to get path prefix for PATH setting on macOS
- GitHub Actions: install libtool on macOS
- Assume automake >= 1.11.2, and hence AM_SILENT_RULES
- Make library versioned on Windows too
- Bump copyright year

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpaper/{libpaper_2.2.5.bb => libpaper_2.2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libpaper/{libpaper_2.2.5.bb => libpaper_2.2.6.bb} (80%)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb b/meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb
similarity index 80%
rename from meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb
rename to meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb
index 3b0e1bf0dd..4acf7fd473 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
-SRC_URI[sha256sum] = "7be50974ce0df0c74e7587f10b04272cd53fd675cb6a1273ae1cc5c9cc9cab09"
+SRC_URI[sha256sum] = "500d39dc58768ee09688738c8b5bfe07640ba2fd6c25a6dc78810eb69c719e93"
 
 UPSTREAM_CHECK_URI = "https://github.com/rrthomas/libpaper/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


