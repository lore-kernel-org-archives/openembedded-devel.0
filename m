Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785F6D49C75
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:33:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6368.1769762007974580286
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eVM41cHG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769762007; x=1801298007;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XkNZplffWwOfOI3atyd6QjkYeZqHQYwX5L8j+AG8hfM=;
  b=eVM41cHGOh3TUfZQ3XEfrzr5oPGnPQyLr5iiLyt3gAbJCKUVAqIr/2U4
   BANLUgbhS0CtYwSfAX8lgwpXLBqlpgt6VzHx/5dre85auIh6zV8rnuDoy
   n7FCyxhJ/foqEQbFA9EdrUGA4NEjXVEg05fAfWM3IxI0m2/Jen+nU2UXI
   CN0t/xVLGxBRUCsbJrH50EZqnDwUDPXEcvoUZ3ZNxZ8c0y/XrPhRxytFk
   +MFOAVwFi0hmOooreanFuGOFvW1qWz6Tt57k9ubgtYey3lSaTMPRfafCo
   tzH0f1QGPXUI9OGOn6y4dDeAz94yzwge7OZ59UsZjrmGLARn7pLdbxqzt
   g==;
X-CSE-ConnectionGUID: 6xNobGo3Sg++ee+skcq4JA==
X-CSE-MsgGUID: VssPzfWNSgudu02cJqX4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="227821972"
X-IronPort-AV: E=Sophos;i="6.21,262,1763391600"; 
   d="scan'208";a="227821972"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 17:33:25 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1CD92C01AE2
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:26 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CAA2484F49D
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:25 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7C4892000135
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:23 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] mutter: upgrade 48.5 -> 48.7
Date: Fri, 30 Jan 2026 16:33:11 +0800
Message-ID: <20260130083314.11280-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124003

Changelog
48.7
====
* Still constrain fullscreen wayland windows with size limits [Jonas Å.; !4587]
* Fixed crashes [Jonas, Marco; !4643, !4705]

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-gnome/mutter/{mutter_48.5.bb => mutter_48.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.5.bb => mutter_48.7.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
index ce7f44947e..ed8f77e8b9 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
@@ -27,7 +27,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
-SRC_URI[archive.sha256sum] = "02ed0ab4194fc537540f9ee92acbf5af8209971a404df319c1cb7763294ae58b"
+SRC_URI[archive.sha256sum] = "ec102aa3cbb0e39001206627aca3055314555f70609de5e6c2b7efcd1fa90f20"
 
 SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
 
-- 
2.43.0


