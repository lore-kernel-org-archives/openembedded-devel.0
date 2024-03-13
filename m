Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A44FC54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9065.1710305477777197769
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=D9WJuaPJ;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8C05487B07;
	Wed, 13 Mar 2024 05:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305475;
	bh=IjOQIMmh5UOltZMI7AVLSTMxaHV9gGftZgpqg4mhIZI=;
	h=From:To:Cc:Subject:Date:From;
	b=D9WJuaPJ5PUXHeF42zes/7Cfegd7MCEaiygY83gLPHmcZkPxuL5Ag+cMIvGnmNnip
	 9kH9yZKd0+VFYvrPsmKmNbuXZF3Zj4PumUIROIT5asH6Kre8HZn7nCMyTDvzcTdfEa
	 9j3c0mDYPdlHMGnyMXmoNG+XEMNYBz/fkSVDkKSpXhVwjyzJc09vlyWEeI0bCquoh3
	 NcSZOLVoOrUgJ/LrBtlE/yKvMxrVQMiRxVQc+Es2x6VbvXwO6avnETlbvgbSMVqmHs
	 RrKfb87EVwuSoUoIrswhBBl24KNl57gzk1of7pxMWF1nCaa5r39R3cuQ89KXSyGz1/
	 E/0nYYDqQiIvw==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 0/8] lvgl: Upgrade to LVGL 9 series
Date: Wed, 13 Mar 2024 05:40:03 +0100
Message-ID: <20240313045038.90500-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109280

This series updates LVGL to new 9 series. The 9 series contains significa=
nt
changes, which are documented in patch 2/8, which is also the main patch =
of
this series and the changes are listed there in further detail.

In short, the library API and configuration has changed considerably. Bui=
ld
time configuration has been reworked to match and moved into one place. S=
ome
recipes are no longer needed and/or compatible, so they are dropped.

The current patching of code using sed has been left in place only for th=
e
library configuration where it kind-of makes sense, the rest of the code
patching is now done using actual patches, all with already opened upstre=
am
MRs.

DRM/KMS and SDL2 support in LVGL and lvgl-demo-fb now actually works well=
,
SDL2 backend even does some rudimentary GPU accelerated blitting.

LVGL is now compiled as shared library instead of static library.

Note that it seems LVGL 9.1 release is close, so depending on the feedbac=
k
here, there will be either a follow up series, or V2, to update to LVGL 9=
.1.
LVGL 9.1 contains quite a few fixes:
https://github.com/lvgl/lvgl/issues/5843

Marek Vasut (8):
  lvgl: Drop dialog-lvgl
  lvgl: Upgrade to LVGL 9 series
  lvgl: Rename lv-drivers.inc to lv-conf.inc
  lvgl: Add SDL2 fullscreen mode configuration option
  lvgl: Configure assertions based on DEBUG_BUILD
  lvgl: Default to XRGB8888 DRM framebuffer
  lvgl: Build shared library
  lvgl: Replace sed patching with real patches

 ...-wayland-Switch-to-custom-timer-tick.patch | 72 -------------------
 .../0002-wayland-Fix-callback-data-type.patch | 30 --------
 .../recipes-graphics/lvgl/dialog-lvgl_git.bb  | 31 --------
 ...-drm-Default-to-XRGB8888-framebuffer.patch | 36 ++++++++++
 ...oth-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch | 63 ++++++++++++++++
 ...e-node-runtime-configurable-via-envi.patch | 45 ++++++++++++
 ...Factor-out-fbdev-initialization-code.patch | 52 ++++++++++++++
 .../0005-Add-DRM-KMS-example-support.patch    | 59 +++++++++++++++
 .../files/0006-Add-SDL2-example-support.patch | 69 ++++++++++++++++++
 meta-oe/recipes-graphics/lvgl/lv-conf.inc     | 54 ++++++++++++++
 meta-oe/recipes-graphics/lvgl/lv-drivers.inc  | 48 -------------
 .../recipes-graphics/lvgl/lv-drivers_8.3.0.bb | 28 --------
 .../recipes-graphics/lvgl/lv-lib-png_8.0.2.bb | 31 --------
 .../lvgl/lvgl-demo-fb_8.3.0.bb                | 46 ------------
 .../lvgl/lvgl-demo-fb_9.0.0.bb                | 44 ++++++++++++
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb  | 44 ------------
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb   | 32 +++++++++
 17 files changed, 454 insertions(+), 330 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0001-waylan=
d-Switch-to-custom-timer-tick.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl/0002-waylan=
d-Fix-callback-data-type.patch
 delete mode 100644 meta-oe/recipes-graphics/lvgl/dialog-lvgl_git.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0001-fix-drm-Defa=
ult-to-XRGB8888-framebuffer.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0002-fix-sdl-hand=
le-both-LV_IMAGE_SRC_FILE-and-LV_IMAGE_S.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0003-Make-fbdev-d=
evice-node-runtime-configurable-via-envi.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0004-Factor-out-f=
bdev-initialization-code.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0005-Add-DRM-KMS-=
example-support.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/files/0006-Add-SDL2-exa=
mple-support.patch
 create mode 100644 meta-oe/recipes-graphics/lvgl/lv-conf.inc
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers.inc
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lv-lib-png_8.0.2.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_8.3.11.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb

---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>

--=20
2.43.0


