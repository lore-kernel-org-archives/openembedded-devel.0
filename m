Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706F1C52D72
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:46:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2880.1722934012727295909
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M1fh/hwX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934015; x=1754470015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=snm2vMoqfYFFAyM+7U/YCUKXhitjBA7D7ELU0LGgzzo=;
  b=M1fh/hwXcf7Mc9pY7DDj88TJMx7XpeN0bPoeZHliVd/RoiNzuE9nVX4p
   PbY9mt2TnYexjM1epwjhAhTMx4v6ImtyNIVlKJzh8o2mL6bBwuK20SfSm
   fslWnwGMr0wlVM8O8UzzpNTQpZyGCnuvvH6OQZzf7IULCkDrZ4Rfi+zkf
   k+NUQslwuTlWWMZmARXAs3W6hQBDoG6wcRWhILSB5Ie/V0iXwM4m+tdvm
   HRJvVVfTguPOMI+zO4vsJcjWuSJWo7xsC7B/h4jmPo25LbDCsuXW/0qtd
   j9QPeRg7910ouh+mz52O1LqNc9prZnTE3uHQJWi31bCSU4QKxuQGGHzL2
   A==;
X-CSE-ConnectionGUID: Z9LOekrWTR6tDww8/18Pjw==
X-CSE-MsgGUID: 4NlVZhnBSy638P4DP1uGeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="169882433"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="169882433"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A0F8D64A6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F873D7461
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D5E5F20050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 821FD1A0002;
	Tue,  6 Aug 2024 16:46:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/60] eog: upgrade 45.3 -> 45.4
Date: Tue,  6 Aug 2024 16:45:40 +0800
Message-Id: <1722933994-32549-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-2.052800-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2vWnCr+BLtz8KjaFW98O54CCKFDk1kJexIxXH/dlhvLv0ZCAhWuYEvkzGZ
	7HyniqgKZmUM+T2hLBUK+1v9ofiO9HxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w50Dn
	y6erJyq4jpm4PrTyHOEfEIx/5KxFfr83gQL7teNgkd0vpHsRoNNLZav1TATTsR/nzlyl2kWv3dg
	X/QQKHpUQ/6yZqpjZ+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111523

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_45.3.bb => eog_45.4.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_45.3.bb b/meta-gnome/recipes-gnome/eog/eog_45.4.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_45.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_45.4.bb
index 00fe26669..af838e298 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.4.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "8650f662d4921d83a7904f6bb9ca245baf735f717b47fac5b37f0d90e5e891a8"
+SRC_URI[archive.sha256sum] = "b50f321c70ac64af7bcaa5b4460dc675b3ca60fdad385616f3ac7b770e0666fe"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.34.1


