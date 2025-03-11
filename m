Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9C6C35FF5
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4202.1741683326615161703
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AWh/53gl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683326; x=1773219326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YvQR76swozwBXGmJ3cjt+KrifTmaTxzGHtIy/sbfcTs=;
  b=AWh/53glnqvCKHY97D2n/liEgShUz0geo8Jt84r9JwE9Ujf4bVQ+/khX
   YWCu2lUFuaG0IzJqdBUFPHzXIUhWpAnAbLsc5wlGtPWIFVTMJ1ULwgn7b
   lmqpZ24hrvMYlli9ZBNVJReR9pzwtyGquLXhUmpQmI0rVdjx9Ae1oK6Zy
   JHb5xe8Q8QlzHeLkGnrLc1dRlKz/KOJVi9reiH1EesjSPWN1HYTzWh+zS
   HxyvkcN3GppEiAB02rbGginlloY4fZvzv8hmnb9olkXlLnaLDnM3ArLVp
   LdL951jtSFz4U+e2l3ZAm9TSKMPAy/YDtx0XU83TZbo5bO3iD93tG4gb2
   Q==;
X-CSE-ConnectionGUID: drl+zo37QGiVLok11kbn3w==
X-CSE-MsgGUID: Rxc6R6CES3uK6Roh7FYSdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180663298"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180663298"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E60C4E0776
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A927CD50B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 431831A0071;
	Tue, 11 Mar 2025 16:55:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/36] icewm: upgrade 3.7.0 -> 3.7.1
Date: Tue, 11 Mar 2025 16:54:39 +0800
Message-Id: <1741683310-8681-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115856

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Link against NLS libs for icewm-menu-fdo and closes ice-wm/icewm
- Fix broken modSuperIsCtrlAlt
- Simplify key handling in MenuProgSwitchItems.
- Skip past carriage-returns in getArgument for ice-wm/icewm#186.
- Remove trailing carriage-returns from each input line in icewm-menu-fdo
- Let QuickSwitch select the proper client tab, before activating a frame.
- Fix toolbar addButton for issue ice-wm/icewm#186.
- Wait for the Return key-release event before accepting the address bar
   input line to avoid stray Return key-release events in applications.
- Improve focusing xterms by first updating our notion of the server time
   from xproperty events
- Update the event time strictly increasing.
- Translated using Weblate

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.0.bb => icewm_3.7.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.0.bb => icewm_3.7.1.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.0.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.1.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.1.bb
index 2200a1973b..a0acffae52 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "7828ca860d110c54afceb9fa57f8171a3a857feabe5d45a427f30b788f38f6a8"
+SRC_URI[sha256sum] = "0d86e542c5d56aa0f443d67549e150c419d497ae869f561edae06b293571add8"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


