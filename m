Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B77C44510
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:31:41 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9466.1768995090110366728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qoygq6Bz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995091; x=1800531091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pwyz75JkdUzZzYmufkNJHkpLOulTjAnSLEyMYLvPYZ0=;
  b=qoygq6BzRdperqf2CjK1POejzscNeNyiDT2/X+tCeKZAPgDXRi9vMHez
   /Ran/4PCLUpQK+ajMhSFRn9Bz87BWzltY9eWyg2phVbUK67rTpoqouhx2
   xiYXAa7iy+ikmroo/kGpnhpmP3mCbGpmXFBOlJpM0OoAlufkzYl2H/VXA
   mjDGl1QeGMc733E7QCsU4yD17qhLwuRkTVjZe4CRZXyShAizvD2CcC7nH
   OfVYEAkyRHJBAnKQGEeN01aU9p+Bs4FPuvJDVUnM6HqyY/LI3AC4R+ICW
   8oAxJJu822JXgHbfpGXcT7pjyq88XjpzT3jJgWM3Qwd8fYtFjtW2x3zHD
   w==;
X-CSE-ConnectionGUID: O7wIe1iJSOm/8UeVoAZdaQ==
X-CSE-MsgGUID: UaHM8mOaSUmLfCzmEtW2VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="227203989"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="227203989"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:31:30 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 71085C00428
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:30 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2931C8D65D5
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id A49B4140486A;
	Wed, 21 Jan 2026 11:31:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 21/30] weechat: upgrade 4.6.0 -> 4.8.1
Date: Wed, 21 Jan 2026 19:29:12 +0800
Message-ID: <20260121112921.857-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123712

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.6.0.bb => weechat_4.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.6.0.bb => weechat_4.8.1.bb} (93%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.6.0.bb b/meta-networking/recipes-irc/weechat/weechat_4.8.1.bb
similarity index 93%
rename from meta-networking/recipes-irc/weechat/weechat_4.6.0.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.8.1.bb
index da79c59ba5..7642a88f71 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.6.0.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.8.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2681fc662996fead9d66a26d81740088e4284cf4e6dfe6b834f3b98fc703597f"
+SRC_URI[sha256sum] = "e7ac1fbcc71458ed647aada8747990905cb5bfb93fd8ccccbc2a969673a4285a"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


