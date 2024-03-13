Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57177C54E6A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9109.1710305480247455242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=jGQZg6pm;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6844887DDA;
	Wed, 13 Mar 2024 05:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305477;
	bh=n6u5i9b7SFLN2kWhn8/YXPea2M9sqEbkbb4oDb5RXTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGQZg6pm/EXQIe+zO/REbE6h8iVGBReeEdurHReUyJn/kpq4EOKwqpYfrGjiAoZUb
	 i1vYo5c4kUF01z+ym7+Qd+Tgu5uIhSnq9YT8WP3w3KHPMNHy9AvbHmvEBtVfTu+m2I
	 VYCGvQ6syacRrzMf0wVlbmQvjdsWRptK6BDJx+sjtDRe9TjWr0eobYws2CP4wY8EL5
	 iO1Y9uGsSaFk6egOzwNEp4yJMgKfJq3z3l3Xv/NZWSWNnUgBB1N1APvUQnrolgNLlO
	 OEz+Y5mulZxhpmvftDYR0l3fzUo6U2yWy+37i4KhqeeITE6X0LFLO8D8DYMcFtgKdu
	 cq88ToXFxAnnw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 5/8] lvgl: Configure assertions based on DEBUG_BUILD
Date: Wed, 13 Mar 2024 05:40:08 +0100
Message-ID: <20240313045038.90500-6-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109285

Configure all the LVGL assertions to enabled or disabled based on OE
DEBUG_BUILD variable. This way, debug builds come with assertions
which are expensive, while regular builds do not.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-=
graphics/lvgl/lv-conf.inc
index 85c08b0d5..cb676ac62 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -14,6 +14,8 @@ LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
 LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
=20
+DEBUG_BUILD ??=3D "0"
+
 ALLOW_EMPTY:${PN} =3D "1"
=20
 EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
@@ -42,5 +44,11 @@ do_configure:append() {
         \
         -e "s|\(^#define LV_USE_EVDEV \).*|#define LV_USE_EVDEV ${LVGL_C=
ONFIG_USE_EVDEV}|g" \
         \
+        -e "s|\(^#define LV_USE_ASSERT_NULL \).*|#define LV_USE_ASSERT_N=
ULL ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MALLOC \).*|#define LV_USE_ASSERT=
_MALLOC ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_STYLE \).*|#define LV_USE_ASSERT_=
STYLE ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_MEM_INTEGRITY \).*|#define LV_USE=
_ASSERT_MEM_INTEGRITY ${DEBUG_BUILD}|g" \
+        -e "s|\(^#define LV_USE_ASSERT_OBJ \).*|#define LV_USE_ASSERT_OB=
J ${DEBUG_BUILD}|g" \
+        \
         -i "${S}/lv_conf.h"
 }
--=20
2.43.0


