Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726C4C7EE26
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 13:24:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.65340.1683465853432308268
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 06:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Af9REl++;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 890D384694;
	Sun,  7 May 2023 15:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683465851;
	bh=3M01pKNSuFZwTN/Ormr71Gc0ORWV/pM7NxEDxwllYNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Af9REl++8XCm4MkPzRiC0p6GYyhqrBsE6YrAesXW6pWNT9Sy7M1eCHZpOcl8/RY4K
	 iYgBNPbfUUSerEs2Ib6tzK17SatbUU14bdZS3A2P1HFYYgLF1BSt0SPnT4uM9LtIto
	 ehrwgB7blzVl+YkYrBiik1QXf12npMl25WhvwY8fQUtLoblx8Hf/yznWrhLRpk8iRS
	 AOa1/1L4tnMhcqEX3ue8/h/5lKjSY7pcx1W8szj0gyqvZ/GHBktOBBpMDg8JH5KDF+
	 38u8bI/byJtY4T5rldTYZj4iXXh5Zsr16vYQMJ6bkiU6pXSXDXQ3oDuy07cktkzrBD
	 LfFvE+Wy2klmQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 5/5] lvgl: Upgrade lvgl-demo-fb to 8.3 and decouple from submodules
Date: Sun,  7 May 2023 15:23:49 +0200
Message-Id: <20230507132349.10674-5-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507132349.10674-1-marex@denx.de>
References: <20230507132349.10674-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 13:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102328

The lvgl-demo-fb really contains its own copy of lvgl and lv-drivers,
for which meta-openembedded already contains its own recipes. Stop
pulling those as git submodules and instead only pull the example
application, and compile it against the lvgl and lv-drivers from
local recipes.

Upgrade the lvgl-demo-fb to 8.3.0 to match the lvgl and lv-drivers too.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
 .../lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_8.3.0.bb}         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb.bb =3D> lvgl-demo-fb_=
8.3.0.bb} (72%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb b/meta-oe/reci=
pes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
similarity index 72%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 3430c2491..6d9ff89f5 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -5,8 +5,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80e=
f5f343050bf96cce3a4 \
                     file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045=
981b516bb8f2 \
                     file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
=20
-SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "dd010430b959f40b8f25a51c76bc920cbc2550cc"
+DEPENDS =3D "lvgl lv-drivers"
+
+SRC_URI =3D "git://github.com/lvgl/lv_port_linux_frame_buffer.git;branch=
=3Dmaster;protocol=3Dhttps"
+SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.2


