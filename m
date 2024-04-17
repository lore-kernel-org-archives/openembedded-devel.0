Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB45C05024
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2751.1713318083970143038
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qQtwL6At;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318084; x=1744854084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fDZyB4f8KJ7jDt0jhwTrYNb2MRYvrOQz+OASO6mRJxM=;
  b=qQtwL6AttIyI3Fd/QVIGNnslCjXY/iJ7ArfRXWeNOffpduFM6X/ma63x
   z+wZMPe3by/ymdnxnPY1zLnIli3ovq6BcOEHY4lVJTSEWvAaa65LJ0RMO
   SNblFU/HUml7Px5v1weGyc4l0ceDpXNHzAVZ8U/iVhNtpYuWqbQpn+bDh
   gxRN7hCUov+sKRQYJi8J/hIdkQSIX24Q/oQtqzA+a15mvA0vc8Xa+pnxI
   Xusk5DWajqeBJHaZe79Vf7Hk6fuUxn7z56Y78lIYL2QwKP4iBe7f7+wlU
   xSCwofeRdSBmgszLLvNmjEtXT/OYV7ugDHVAJ0mjmsqtTiB1ArzjIE0OK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="135163758"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="135163758"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 618B9D4804
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8877AFD903
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E93AC200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95E381A0002;
	Wed, 17 Apr 2024 09:41:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/49] gnome-online-accounts: upgrade 3.50.0 -> 3.50.1
Date: Wed, 17 Apr 2024 09:40:18 +0800
Message-Id: <1713318061-17128-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-2.564300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvG6iWKMNj1gAC6
	qXrz88+Q6LiaWyEDpLQKG0cNhRV/Puo7bV31UxoOn6y0mNkW0aTUxCm0TmLrkJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1ZNYSHk3Zr0ekphWnlDPb3lyN+6bsOM7qem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkqEz67qlQ5i4A2uwy3JFEyVkH1qaUzmKqefcP
	WrZkbYRMTKqnksoaEhbLK6i2Bg+zKhEO3DNqKnOUIfEPRs32HArEr88PDj2mku/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix translation domain in account dialogs
* Fix OAuth 2.0 URI handler for some users
* Fix crash in Kerberos/Fedora provider
* Improved WebDAV support for Fastmail and mailbox.org
* Fixes for WebDAV discovery
* OAuth 2.0 PKCE support
* Fix issues caught by static analysis
* Update Microsoft Client ID
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.50.0.bb => gnome-online-accounts_3.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.50.0.bb => gnome-online-accounts_3.50.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.0.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb
index d28cc876d..66df8902f 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.50.1.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr"
 
-SRC_URI[archive.sha256sum] = "b0f64f0dcfbb8885a3a759e1c9de7fb204adb3ce6bd32c30bcf52d5533c06d4e"
+SRC_URI[archive.sha256sum] = "42ee43fd1e2942b9ff6106252ccdc834602815508bf7a3a52c0bdfffa56eaf40"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
 
-- 
2.34.1


