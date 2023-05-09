Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B08C7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:44:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6846.1683600257323744781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=oQBRcScf;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6A4ED8479D;
	Tue,  9 May 2023 04:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683600255;
	bh=auS28xqNLL2TtVP9dnMFHTyMGTM925KWIO32fuIYejs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oQBRcScfE7LBElAY/MFKRcLJKSOLD7T5r8LrCD2H+Asy0vQtTIdo04mhjfwqS+TO8
	 HToY2zIpGzELu3zOrnxfCGUErK/gp8Of+/lMX5prAPgj+ZyJY+6jf1ESLYXbm5nnue
	 KL+1k++9qR4YRfzIjkijbUDzujniufYUck+ajT410+oyNFJpoLu9PizTgD2DirlneC
	 OKYOD1ghEdYdC0dEeDwiwXkzWlW3c1P890eLz34aHU23LXWg5Q1UZEkOWvziYy7Hlg
	 fGWv0XKyKqwrohwgpgVSFedLapD9fyeWklLm9qd+9IaMjzgBNLduaTMTHGxeQyqUvt
	 qmweLfp7/mDiA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH v2 5/7] lvgl: Update lvgl-demo-fb to 8.3.0
Date: Tue,  9 May 2023 04:43:53 +0200
Message-Id: <20230509024355.79006-5-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509024355.79006-1-marex@denx.de>
References: <20230509024355.79006-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102453

The lvgl-demo-fb depends on specific configuration of LVGL which
includes demo widgets, which as far as I can tell are not needed
for regular LVGL application development. Currently lvgl-demo-fb
contains its own copy of lvgl and lv-drivers, for which meta-oe
already contains its own recipes, but so far we cannot reuse them.

Upgrade the lvgl-demo-fb to 8.3.0 to at least match the lvgl and
lv-drivers .

Signed-off-by: Marek Vasut <marex@denx.de>
---
NOTE: I am almost tempted to drop this recipe, it basically builds
two files against LVGL configured in specific way. And it seems the
LVGL has no modularity support, so we cannot deal with packaging
the extra widgets easily.
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
V2: New patch
---
 .../lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_8.3.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_=
8.3.0.bb} (91%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb b/meta-oe/reci=
pes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
similarity index 91%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 3430c2491..d86d6ff9c 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef=
5f343050bf96cce3a4 \
                     file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
=20
 SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "dd010430b959f40b8f25a51c76bc920cbc2550cc"
+SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


