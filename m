Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DDFC52D76
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.33830.1721034180775824157
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O2TAdwQx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034185; x=1752570185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wJmSUkpd70ZlZIh+bpn1ZnDSWlvhcu3VsdSmzD30g2o=;
  b=O2TAdwQx4WGgnykzhwVLvQbGR7QU1QW48MXxt3S5/9Gqzk1OFWsMLMHb
   t/Wprjxi3+WPHMaxKxkglUStOC0X5JaczR/imlRhwO+zmuOskKyQhcEKR
   NxXJjgSBhomYhLm3faPYVTPH5nL76MkxWMawk9sGVnp9zw75XQS7nj3x0
   lOIaqL4Lna50t5G4ZpLOeFe9aqM9jZ4gSpx3X7d5QzbwRDSxeL8M/NES2
   oIweaIlj0A2x3sy9Bz2MhdAuRLsLIANToHTRzyNyG+tcWtZa+dFHrvZOr
   fPQikxpvf/xkBuF9XIqmAlvbDkG+FG+qeYdMvWgCyHQ6LhzbItdoFe1pk
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166987418"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166987418"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB52EDE2E8
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FD85D5083
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9160720071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 409CC1A000C;
	Mon, 15 Jul 2024 17:03:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 38/38] zenity: upgrade 4.0.1 -> 4.0.2
Date: Mon, 15 Jul 2024 17:02:31 +0800
Message-Id: <1721034151-540-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--10.167600-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrmZiw53dqSN9hR1Y/uhfqyI3E
	akIoHWNdiLgNYoWtEg6ecAXDeMEbkP12TsqRMnfHLGzDOk/IlANezmeoa8MJ84EBeX0uQ+npQ9v
	7kqn17iLDMFuTMOucjCPk0cSE4V/+NtywwIf5ksVYKMMlFh4BnTgN1uze3QYJ31GU/N5W5BCCDx
	bm2wVcgPu0HEWlaGvJ/7XTrlYjb7gv+0FNnM7lDVk1hIeTdmvRC//1TMV5chNAZdlk64GSI6PFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrRvKQ6fQGJVv+X0xtjRvx7XEV+Lc+eri2HP3afOgxSPCR6ja
	kSKwrfY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111356

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- tree: Enable 'activates-default' in GtkSearchEntry
- main: Fix command-line signal signature
- filesel: Passing a dir with trailing '/' should open that dir
- colview: Return if nth item of row exceeds num items in row
- tree: Don't try to print nonexisting items
- colview: Add more sanity checks
- colview: Clicking on column titles should sort items
- filesel: Allow a non-existing filename with --save and add associated test
- filesel: Remove spurious extra _show() call

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/zenity/{zenity_4.0.1.bb => zenity_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/zenity/{zenity_4.0.1.bb => zenity_4.0.2.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb
index 88b4b5c86..801eaae8e 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_4.0.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.0.2.bb
@@ -18,7 +18,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "0c2f537813b10f728470d9d05d6c95713db2512f9c95096e1e85b1a6739605e6"
+SRC_URI[archive.sha256sum] = "c16dcae46e29e22c2fa0b95e80e06c96b2aec93840161369c95c85ed9f093153"
 
 PACKAGECONFIG ?= "webkitgtk"
 PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
-- 
2.34.1


