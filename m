Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F91C282C6
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2208.1740525902713691053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DQl9JlRN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525904; x=1772061904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TXc2rioQgG4f0RqPRWpMRQPP/V5me/cVa+ypBaRN/iY=;
  b=DQl9JlRNuPY5MDVX3QcgT8R0YbT+IbsEOOE9l6kCAHPpChjN0CRyzjlT
   XeaZRqOKPjd3MtESnNrGuEZM1+ahYo1AfYYFNLqh5PDPgg7kQdk2qUy5P
   lyFRwO2ChpvfDjAd2x1Vn8bYS+ngklU2LUg7kb7wIREPs8sBpyG2Ih6VU
   zLrr+SNpn61Q8j+ApnTBjKLnZVJeW0+maHo4bbPd91V3B/HwEdEyMIU9v
   w9jKEqbIPKe2l5zigZgZ3uPrXyH+lug9rqAU64j7gdcD/RuwbI9Z8c253
   4MBxx4mJjHnDRun+8Yo3wNwPVr9ccU/0u1weRGlaj+7m8DycE4Uurd2py
   w==;
X-CSE-ConnectionGUID: eda8QTwvTHqvXnuHbU7mWA==
X-CSE-MsgGUID: LyygteWCTm25OwdvrxOVkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179538604"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179538604"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E92BD6EA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CBE6BCF7C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6BD831A000B;
	Wed, 26 Feb 2025 07:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/51] python3-setproctitle: upgrade 1.3.4 -> 1.3.5
Date: Wed, 26 Feb 2025 07:24:31 +0800
Message-Id: <1740525881-21103-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115637

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Modernizing handling of bool type.
- docs: add release note about C23 compilers fix
- fix: modernize handling of bool type
- Preventing bouncing Dock icon when using setproctitle on newer macOS versions.
- docs: add history note about bouncy macOS fix
- fix(macOS): prevent bouncing Dock icon on newer macOS versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-setproctitle_1.3.4.bb => python3-setproctitle_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setproctitle_1.3.4.bb => python3-setproctitle_1.3.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
index 24200533f5..cf03bc3b51 100644
--- a/meta-python/recipes-devtools/python/python3-setproctitle_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-setproctitle_1.3.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=86d2d41b5f4f023f43466f8cb7adebaa"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "3b40d32a3e1f04e94231ed6dfee0da9e43b4f9c6b5450d53e6dd7754c34e0c50"
+SRC_URI[sha256sum] = "1e6eaeaf8a734d428a95d8c104643b39af7d247d604f40a7bebcf3960a853c5e"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


