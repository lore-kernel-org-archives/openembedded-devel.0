Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEB7C00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:29:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.13692.1660544964247548663
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A4+cNVEt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660544962; i=@fujitsu.com;
	bh=h2tJHbCNd75mS8lU82pT+O4z+hLOfnXRVykfLnLfKxE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A4+cNVEtwO9UF/iluJJ8DsoWWVXSFYPdshW63rtyC13yy/YIr+87YDFfl78l1c8+Z
	 0l3F9toZrCF5yAEOXJrEqBNQ9NJIfoamL+M/3JhUfvv8YZagOW1jtpTnNWpt3Ub8Ux
	 q4oju0DhipxBS+cK7mKr/sKaBQinjz/BemgUUoKaPA3yVWt6p2zTEpryeFg86/3qYm
	 tmR8F9n3sgOLUl01vk+JDa4eET7+G3/S50wd/o+o712uLBiKzZaOvfNVq+ZbKStLrL
	 kfOn94Iba/c30dH8lypg13cWQx0Hzx3D/KuS9gtZKvrJRjmJGl4t69uJyAcwxdGEa6
	 XUAeS9ZythswA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpHvg+c8
  kg7uz5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2NZ/ZCzq4K3YuvsrcwPids4uRi0NI4CGj
  xMWbN9ggnMtMEhdXz2SFcPYwSnw894Oxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBV4k9vzeCxVkEVCUm3OxlArF5BRwluk5vYwGxJQQUJKY8fA9WwyngJPH6QQtQnANoma
  PE1YYyiHJBiZMzn7BAjJeQOPjiBTNEq6LE7MvNUGMqJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2mpa2Gil1ilm6iXWqqbl19UkqFrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjGKcXJITsYT+77pXeIUZKDSUmU99rFn0lCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHjNHgPlBItS01Mr0jJzgDEFk5bg4FES4V1wGyjNW1yQmFucmQ6ROsWoyzHza9sBZi
  GWvPy8VClx3rpnQEUCIEUZpXlwI2DxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC8vyBS
  ezLwSuE2vgI5gAjpC7+53kCNKEhFSUg1MCR2RW0Pyv17zEGd+OykiecK3p2qGJ9YnWy1TM2O3
  jUmdM+cOe/z2chvenDUXbpZ7rI6bU3hcgmXSc4H/vIZK2Ywh2Ye27eYMdfnbYym90GZVg7Qhf
  9yxt7nlV/6dC2D9Z8Qo8G1rR7rJyX+74qzu9nxeXaW1dvuGvNPMTtU7l02TZv7uuZ61vJ3x79
  b5a77cLP/C4jJr23emK3+Pp2y9cZzXedcad+b32W+et/ZE5JvsKDFK33/ON2drdv723fdUjLQ
  +Tqw6GHXH98+lVmbhZzP5RH6d4a7+qH5iXeuME+bvXKSDli9R+sPcoFre9XTBsZliXiv5lqc0
  PzojIqe25/uiE6XnahZJL028eL31qhJLcUaioRZzUXEiAF5a/ttqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1660544960!136225!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15946 invoked from network); 15 Aug 2022 06:29:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:29:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E5D4F1AC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:19 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DAD337C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:29:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:29:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libadwaita: upgrade 1.1.3 -> 1.1.4
Date: Mon, 15 Aug 2022 14:28:56 +0800
Message-ID: <1660544937-1453-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
References: <1660544937-1453-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:29:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98242

Changelog:
=========
- AdwAvatar
  - Fix draw_to_texture() with rectangular avatars
- AdwTabBar
  - Fix squished or clipped text with gtk-hint-font-metrics=0
- AdwShadowHelper
  - Fix warnings when drawing vertical shadow
- AdwSwipeTracker
  - Fix swipe speed on GTK 4.7.x
  - Fix criticals with GTK 4.7.x

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libadwaita/{libadwaita_1.1.3.bb => libadwaita_1.1.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libadwaita/{libadwaita_1.1.3.bb => libadwaita_1.1.4.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb
rename to meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb
index eaec983ade..44d18f596b 100644
--- a/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.3.bb
+++ b/meta-gnome/recipes-gnome/libadwaita/libadwaita_1.1.4.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc vala features_check
 
-SRC_URI[archive.sha256sum] = "9b92be6007da1bf75131a2d5e697f0ff985bccf82380d298d46f013675aa4197"
+SRC_URI[archive.sha256sum] = "fcc6d56669d33ac3d030098d7571d8045a02e18dc083b49a5a5a6325068e6b58"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
-- 
2.25.1


