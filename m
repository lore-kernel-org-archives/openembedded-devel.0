Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94BDE6C5EE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8080.1733185029473194405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mDefU7e3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185029; x=1764721029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+UeBwsNsX25Pxrn8wROskPrhu0KLlNziESmWTl1TJPk=;
  b=mDefU7e3/JFxdb4uUQctChLdTmhtXVvt/NeFuIXaVNyalWoMm1dT91e4
   FrCVnhjHoBQ3sni7uI9Mf+JWqpi2IKHj4nEuv3L7PGwg8UMDOlndXJDXD
   CNcExJPLMPJyj71bb0UT48E9Jl9hxS1W39Xi4HHX//MnGIN612O7/GA/o
   MCJhU7qqYFKGfKizu5lgow7KLYDkHZhlhotaLaEHjhVoaKa9RFcT7d3Zn
   wrmtMCAuJVnvdIjs3zCc88CCMC74whmowb6oVxz3DX5OVs7lFl8lycKMq
   o2HfPAd9MLin1LQvP7UG36esWMTKLyV6lSadphI6nUk+T3/eCsVyGLcdU
   g==;
X-CSE-ConnectionGUID: 7wJN6V+pRl+qZD8H56ubtQ==
X-CSE-MsgGUID: y702NOUwR+eDP/9bwV9NmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="169713032"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="169713032"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A59AE60A4
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 30356D73CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F7F6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 665431A0003;
	Tue,  3 Dec 2024 08:17:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 32/34] sysprof: upgrade 47.1 -> 47.2
Date: Tue,  3 Dec 2024 08:16:37 +0800
Message-Id: <1733184999-27041-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--0.593500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr2FA7wK9mP9fLS2zWpoOM2Xt9
	w3NN+CM8jf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyUUi4Ehat05499zZd3pUn7KLHN
	FiwmJRq+ZmUM+T2hLBVhIV803h1Pmr78SC5iivxwURSScn+QSXt0H8LFZNFG76sBnwpOylLMLiu
	OC4Kcp7EcWe7P3idXrzqxuXiQymyBk4oWEyd+5c3DDlCA1OyeCpL45OXdubB0z8YOtrZxLLUGdC
	kBU98VMvRFqJNKLU8eIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114174

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Changelog:
============
* Use pid when generating counter IDs in SysprofCollector
* Fix potential UB in GtkBitset
* Avoid UB in bsearch() with no data
* Increased safety in SysprofDocumentLoader
* Increased safety when parsing CPU counters with async IO

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../recipes-gnome/sysprof/{sysprof_47.1.bb => sysprof_47.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/sysprof/{sysprof_47.1.bb => sysprof_47.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_47.1.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/sysprof/sysprof_47.1.bb
rename to meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
index e1b7be5180..b6f140404c 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_47.1.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_47.2.bb
@@ -21,7 +21,7 @@ SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.pat
             file://0002-meson-Do-not-invoke-the-commands-to-update-the-icon-.patch \
             file://0003-libsysprof-Check-for-unw_set_caching_policy-before-u.patch \
            "
-SRC_URI[archive.sha256sum] = "d3baba814be0cdaef28704c8004ff3110e99525422060f2a993a22a47b9334eb"
+SRC_URI[archive.sha256sum] = "e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f"
 
 # reason: gtk4 requires opengl distro feature
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk', 'opengl', '', d)}"
-- 
2.34.1


