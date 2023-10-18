Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A336ECDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 18:12:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.385.1697652765893851621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 11:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Xg4Flsdc;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 06E9D86FC3;
	Wed, 18 Oct 2023 20:12:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1697652763;
	bh=g5zRQj5KdDs7c2SiOrk3ve5AJXF65STSlx8eDe0BoTw=;
	h=From:To:Cc:Subject:Date:From;
	b=Xg4FlsdcUb+AkUAXD2Fi7z/200PBNu51XMZn0MrhL9fReuIc1y5hvZJkDU4f169H3
	 tqly+jUBsNWOaPMUc6tvwsf46px106Muu5jeLOPZIzMiFbF5flasXDmKzLwGrH57VH
	 O7fJJnZK08kGOk0NGSZXp6hI2dQnA0tqLuiz6fiQFkQtA8QfxT3Yst5dPS/dkn7P9r
	 n68uEnRCRZ88e31PtK3TJxnI/EVcUEbE0GI/lDhnAF1OUGFgCrwK7BKDIEZVVXytn1
	 nV9wX1GiJ21dswpCnQM3lmut2ih0NlY3KF8nz/sY3qRL0E48PtYqYEgP9puUw+igfh
	 5unKUmQfRuVzQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-oe][PATCH 1/2] lvgl: lv-drivers: Allow empty package
Date: Wed, 18 Oct 2023 20:12:07 +0200
Message-ID: <20231018181221.87138-1-marex@denx.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 18:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105580

The lv-drivers main package is empty, since all the headers end up
in the -dev variant and static library archive ends up in -staticdev
variant. Mark the main package as ALLOW_EMPTY.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-oe/recipes-graphics/lvgl/lv-drivers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc b/meta-oe/recip=
es-graphics/lvgl/lv-drivers.inc
index dcf1ad14b..6cfb7fa07 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers.inc
@@ -17,6 +17,8 @@ LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'wayland', '1',
 LVGL_CONFIG_WAYLAND_HOR_RES ?=3D "480"
 LVGL_CONFIG_WAYLAND_VER_RES ?=3D "320"
=20
+ALLOW_EMPTY:${PN} =3D "1"
+
 EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
=20
 do_configure:append() {
--=20
2.42.0


