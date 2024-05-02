Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F70FC25B77
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6680.1714628966417448856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rgyaL7Bq;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628967; x=1746164967;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1TsOk+OeqRYzwoe4xyt6lYpmDUTDijxQXPSVouqV/as=;
  b=rgyaL7Bqz29GcfeCb1yM+u8fhLly7VPi4F6E3fLdEj7Fc3RPSBrKgSwm
   wPCp089TLK8bvaRiD6YbRlgY7J8lFVm8Jjdg8p0MNIhK4tc9DkVtuT6WP
   N1QnB9fkzS/tTJg0mYq/wuAg569hmTWuaGV8iURjjsSH918Ca6zw/8eOn
   qwtsPzd8Xhah5RhAvC0N+a53dvQzw+2Q/oojxCqhTMMTUeEksKTaVR0NI
   XAXn6zFL5dUlEtyvg0AYSbO6TpI25zDnkyjhEUrtglKsrbeYTxu3qJF2i
   KQbpI9sGm5zcRBBfXVitbTNnrnRCV4uAPhC+4WpWGyQ+ZrAWFEeeVarzH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="159223469"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="159223469"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DD0FC6905
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2B9E1DFC1
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69D052008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:20 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E27F1A0002;
	Thu,  2 May 2024 13:49:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/30] libgedit-gtksourceview: upgrade 299.1.0 -> 299.2.1
Date: Thu,  2 May 2024 10:48:02 -0400
Message-Id: <20240502144829.241208-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-2.044100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45shjol69azi+aDCzqDR7DPZqp573tpzEIw9r3iN/4cJv1+0
	KsXaxWz7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPqqZPVyXxis1erqSAL3sywcRM
	TT2hVELsQMIKxoHN149V2pdLbNTzSuuyon1sKEs9C8VudU/kfbNPOQREc5eMEHqE/+yG/fL5sNE
	GpLafrrLM/nEDLP056e+TDiyH/49wxfkLAfkNNSaAZk0sEcY14=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110213

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ksourceview_299.1.0.bb => libgedit-gtksourceview_299.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{libgedit-gtksourceview_299.1.0.bb => libgedit-gtksourceview_299.2.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.bb
rename to meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
index 0ebc22acb..d66ce6080 100644
--- a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.1.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.2.1.bb
@@ -9,7 +9,7 @@ inherit meson pkgconfig gobject-introspection features_check gtk-doc
 
 SRC_URI = "git://github.com/gedit-technology/libgedit-gtksourceview.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
-SRCREV = "b271a625ca057cc3fa7d5ac83285c5d4e038202e"
+SRCREV = "eaafc892d033713c7c823d8ad602061e456b3c88"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.34.1


