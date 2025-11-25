Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F97CFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13204.1764061987455025067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C3QpOqmu;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061988; x=1795597988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VRD80FFoc7YoOtrRu3O33eUkSQOdiW3MM0eWPeGPCQU=;
  b=C3QpOqmujMTtpxnIO1oZu8uZGV+c/kdwsbYqKkQnlMQsYXvnSLccpYR3
   v7w4WiF4FDSN5k4OrLlMWbYDE4i7xFcGEW+TodGpa42W7QnCkus2JM2MA
   yORHPL332tRUYI7iZeqCutBaot3A08PgIrp3/qF+htjMn5w59vZKFf6Wy
   iMZqsoKed8XUfNJ1oLj7r93PynpVIyJUL/kI1qZIlZFP/JfOc7pw4/h4G
   pqUmDiNW+F98KVqGqo/i8b2k0nnXRRkX3BfZAnBhkM1kKpWRyool0bWCS
   DgOlms3gx+woWJ9qzqo0KKqnhVRna5YBkVe7iJ9xfNf/orXbGJgN4qZl+
   g==;
X-CSE-ConnectionGUID: BBsY4KARSme1KxshSuXCyA==
X-CSE-MsgGUID: mNwQw/FkTi2PUKBp5daJKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199293626"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199293626"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CB0DE1C000A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7E47AC01812
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 232C014001E4;
	Tue, 25 Nov 2025 09:13:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/26] nautilus: upgrade 49.1 -> 49.2
Date: Tue, 25 Nov 2025 17:11:37 +0800
Message-ID: <20251125091156.1376-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122031

From: Wang Mingyu <wangmy@fujitsu.com>

* Bugfixes:
- Fix handling of unset XDG directories
- Reduce memory usage of thumbnails by correct scaling
- Fix potential rescaling of item when switching to cut icon
- Fix crash on empty file lists in drops
- Correct sorting of loopback devices
- Don't skip the first file from operation progress monitoring

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_49.1.bb => nautilus_49.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.1.bb => nautilus_49.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
index b71182e3bf..1229fa4a80 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "add2a0e410fd22da2851ddd0c5b3d22c9e9d8c33111511f336961e3b461b535e"
+SRC_URI[archive.sha256sum] = "2576b34bed2781a89f09051ec9fcae3ae17eb7172cd7be678f592aa14e4c26b1"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


