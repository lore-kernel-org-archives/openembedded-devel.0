Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72831C7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 13:24:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.65318.1683465853315331417
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 06:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=rHXbbB7V;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E8EEC83744;
	Sun,  7 May 2023 15:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683465850;
	bh=7eTJ+UDqzCa99H/JdkxGwzAJh4spvTRUKOaa8Me6aRU=;
	h=From:To:Cc:Subject:Date:From;
	b=rHXbbB7Vrq5dkMRELWOsmjAXDmBlMv9ku0ZiQA54/lRZGFtou92ajp0gAXlaiqVIZ
	 Ctvuow1Gdnd4ATE0SuGxGV1lDIPB+eChKte1sy5eQkGo0dkHGq5hRrHwdz5jMcYZZ6
	 qWDYvce+fopefYEJFU4/XKWLw4aw54rmYll7coTEkG+Ghla9CC6jf8IwWIdZKxkPvI
	 4jSmpf+d4owekZyWZgmEIbL4Yp5odcZaPEqpyzaEDSEpd55dUGRDz4r5dRsUSVwvPI
	 LipH9FW7J+WtTAnseLSX7mkNgsRSr87JRtKF4iZocTPE2Pp5fF+GuxBSR/IsMfs0hH
	 ob8DfbSeuwmdg==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 1/5] lvgl: Upgrade lvgl to 8.3.7 and lv-driver to 8.3.0
Date: Sun,  7 May 2023 15:23:45 +0200
Message-Id: <20230507132349.10674-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 13:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102327

Both the LVGL and lv-drivers are now available in 8.3.y release,
upgrade both to latest 8.3.y release version in lock step. Also,
lvgl contains no submodules, drop the gitsm fetcher use.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
 .../lvgl/{lv-drivers_7.11.0.bb =3D> lv-drivers_8.3.0.bb}       | 5 ++---
 .../recipes-graphics/lvgl/{lvgl_8.1.0.bb =3D> lvgl_8.3.7.bb}   | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lv-drivers_7.11.0.bb =3D> lv-drive=
rs_8.3.0.bb} (89%)
 rename meta-oe/recipes-graphics/lvgl/{lvgl_8.1.0.bb =3D> lvgl_8.3.7.bb} =
(89%)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb b/meta-oe=
/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
similarity index 89%
rename from meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
rename to meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
index cf33c6904..d9cde497c 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_7.11.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
@@ -8,9 +8,8 @@ DESCRIPTION =3D "Collection of drivers: SDL, framebuffer,=
 wayland and more..."
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890c5270ef045981b516bb=
8f2"
=20
-# TODO: Pin upstream release (current v7.11.0-80-g419a757)
-SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;nobranch=3D=
1"
-SRCREV =3D "419a757c23aaa67c676fe3a2196d64808fcf2254"
+SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;branch=3D=
release/v8.3"
+SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
=20
 DEPENDS =3D "libxkbcommon lvgl wayland"
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.7.bb
similarity index 89%
rename from meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
index ea74c5918..a82ab3b74 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
@@ -8,8 +8,8 @@ SUMMARY =3D "Light and Versatile Graphics Library"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea62=
460b03a"
=20
-SRC_URI =3D "gitsm://github.com/lvgl/lvgl;protocol=3Dhttps;nobranch=3D1"
-SRCREV =3D "d38eb1e689fa5a64c25e677275172d9c8a4ab2f0"
+SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dreleas=
e/v8.3"
+SRCREV =3D "2b56e04205481daa6575bd5f7ab5df59d11676eb"
=20
 REQUIRED_DISTRO_FEATURES =3D "wayland"
=20
--=20
2.39.2


