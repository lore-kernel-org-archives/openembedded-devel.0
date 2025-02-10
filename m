Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC02C021B5
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.46620.1739178111221225344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p3sE9uKI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178118; x=1770714118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qJ1LX6lLk4kehyM0B+XlobIedQHiLyBEndGloXy0ljU=;
  b=p3sE9uKI1SBLDIce/+RZ5PMX7Qaxl36OlrKsonebBW6WbYfbfc8/9a06
   uyJ2qLVbY2guJJ+25aK5WCdqFmz1atpfhlCQcUnUP7cFUJDbegIlMna3E
   mutjLQKufp3OOlggAlG7WQtx1JbI6HeC+C/tJJE6HGILBS8kgyGA68toe
   lQG6nzcjmj2eCPbhX2wGy8eEPOmScpNhRAah0GygTRB0aNEzsTe6jZgYO
   nJftKfrtNs/Q4gYjjmTYYuYkIE+/ZSp35u5zm86uyTpLZtcPGE/wN68eF
   eS+oAQqyat2bcn6s6gMuSRDA84a5XnsnX0LWw4Z6wJhpeFoqIVH5N0YSj
   w==;
X-CSE-ConnectionGUID: 2L0bAQE7Q7yH06GZqSZ/tw==
X-CSE-MsgGUID: urnWH59OSoqOnku8+fcNng==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189426335"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189426335"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC1E0DC6A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C476D4C33
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 124501A006C;
	Mon, 10 Feb 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 20/66] nautilus: upgrade 47.1 -> 47.2
Date: Mon, 10 Feb 2025 17:00:49 +0800
Message-Id: <1739178095-26432-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115348

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Enhancements:
- Adopt CI release workflow
 - Speed up batch file deletions
 - Speed up simple recursive search through mount monitors
* Bugfixes:
 - Fix thumbnails for changed files
 - Fix parent path URIs for remote path
 - Fix potential crashes in directory callbacks
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_47.1.bb => nautilus_47.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_47.1.bb => nautilus_47.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_47.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_47.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
index 4baa8c2944..9f44dcb114 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_47.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "15450ebc7aa61ed2fae63130af9ebbbae14ce706a547f594c66bb8cca724d74c"
+SRC_URI[archive.sha256sum] = "7f3203474f2e6374a11c6754ef33f3360eaf7f5b5e85f5e477e8a0ae0fa764d9"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


