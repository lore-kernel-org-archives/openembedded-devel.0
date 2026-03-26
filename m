Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07B310A1E94
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46406.1774526221922271628
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p/JKkc+p;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526222; x=1806062222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jr32wiW+JuY6TY6cQeBvpZSMIZYiQRgojJtIIKM/6GE=;
  b=p/JKkc+pez261ZRsNIZEpOhyj+UB/VQeAOlmYzwV5A16T+2UM48vFr2l
   m+DZyYQgUIQr6lxJSkmHV5ctzrbqZIwNC0//8PESRJy10aM2Drq/9+sx0
   hyswGT40qTvTbUvZMVDVyEbtbL0zIpHBGdqsMwZ6R/jLdWHCjESsnvIJJ
   Dej+3YqrXuehIdyYOaNx/mZPpxgtK4V98Zqj/IwViMOa5mmtNCZ2VuNZw
   4lVNlphd/p6wsvgiTWJPYRPjaKAsyIh3EZpfhKzpyMp64AN/QJHHUJMnY
   c8Rsk3yNupma7uOj9Yt5PoTXi4SL66XMS07mUC7B1maOligougsugY9nk
   Q==;
X-CSE-ConnectionGUID: uJVqzVf9RrGYYHROTZJpmw==
X-CSE-MsgGUID: gTMiyHuSSmC+QYOlD7Yolg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234669341"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234669341"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:01 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 627E3C01B29
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:00 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1D8CF1410C99
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B06371807149;
	Thu, 26 Mar 2026 11:56:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 12/63] gnome-backgrounds: upgrade 48.0 -> 50.0
Date: Thu, 26 Mar 2026 19:55:42 +0800
Message-ID: <20260326115634.1199-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125667

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_48.0.bb => gnome-backgrounds_50.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_48.0.bb => gnome-backgrounds_50.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_50.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_50.0.bb
index d144cd0639..a898e13418 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_50.0.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "2d6baa011ee97804c7561f7e1cbd8d4763e30b55b8818dda78f9f75afb8d8d05"
+SRC_URI[archive.sha256sum] = "1acdba7acb4f34c7321febc6273444344fd55fd593611d446de70860183b52b8"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.43.0


