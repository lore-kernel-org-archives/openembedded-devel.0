Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D0FC41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:08 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.12843.1716860942615423316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kz6F34GT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860943; x=1748396943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OWm7ACFiTKD5z33dB2TdHXyQdhCZiM2n45zKe7DCUc4=;
  b=kz6F34GTNcJYxg1duS5Cqy8i66bF0gIGkuVEBcxno+nrMFTe+LjrPKnd
   S5V84osi9zpDW0g7o4bswBbYHYHue2l2ZpXhpFY/lqib+dvDwv5owv0Wd
   QY3BjpEs5zyD+bHgW2vm9aDrKkRCIP9PEELsmmS+dLgzs/OqynLLIpzh8
   pr/hHJL8un9OTGsyKZK1+wOSkEdPB9Uj/sktzJaGMVjMi1JL/hNYJUxCl
   1FNVGc2sGmAiOH8+rG40hSAnDxafHWzAq1u0/Uk4Z9u09fW9CxEtgKxcI
   OziS0lLTyWnHWsdWtAw08YArHpdbXfN4ESfoSqNoGm+qPx8Sun3qJKpt1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="139925575"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="139925575"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EBD7CC68E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33AB6D5926
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C05A7411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:48:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 67CDD1A000A;
	Tue, 28 May 2024 09:48:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/40] file-roller: upgrade 44.2 -> 44.3
Date: Tue, 28 May 2024 09:47:45 +0800
Message-Id: <1716860901-863-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--1.681200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjPhbT/QiIN5WsW
	ZV9YMDBbK8YXPXgfUssYMPaM+DRRbMs8IESeGVRiA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBvzCK25xPd0TtoMLOoNHsM9lXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJ6sN7H8IyntXyJEurNBLIKIzXmgSy+mx3aKRq+MOor4/xz5
	vqD7yPu4+gq6saqREA9phbwyoC6fKwEKVeCRSkPACbr6St6LVBLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fixed filename not changed when creating a new archive
* 7z: error when creating archives with volumes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../file-roller/{file-roller_44.2.bb => file-roller_44.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.2.bb => file-roller_44.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb
index 2131cdd85..a195d43f0 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_44.2.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_44.3.bb
@@ -22,7 +22,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 EXTRA_OEMESON += "-Dintrospection=enabled"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/file-roller.git;protocol=https;branch=master"
-SRCREV = "5b21d887e087155b008f9293ca054d6ac3116a2b"
+SRCREV = "d4f3b970bd7dd07d8f539433628eba10551aa629"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.34.1


