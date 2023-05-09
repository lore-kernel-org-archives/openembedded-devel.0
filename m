Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663A4C77B7F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 01:59:39 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.3777.1683597571086217544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 18:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=D70sEw+k;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8D8DB85FE0;
	Tue,  9 May 2023 03:59:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683597568;
	bh=gye7hhhGOI59M9Vzn0PS3wCS+ZA9lKK6fzUpoVi8nxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D70sEw+k9kDFWRZj7/vr7G6Qv7bJjkPx72ihp2VrTxv1+aT/2pM+XfE2/icU+9yaT
	 6e5OqxGSZcSypumj3i0wXsKFRWZF5JBt+qf4w3ekFEB2hjwpt/r8t9A71Frbk1F9o/
	 2tS9ZpB00GtIr6BHfaXf+ElsC0s8ouxVSfkqBM9/DSQXta3oatNa8d50MW820dJM76
	 BHrX+BxU8I1w8Ej32Dwt0zttxBfq2Lu+e/T7NqUxHaAA8f+yTM3crxV97cGc1iBLuE
	 5U2lO3PrClbnZC0MIHNZU5RqjY7ocW8YeGQ5nJoOmcvd4zBPbeRwtsXeixJ8QnoeVn
	 qayqMmV0sNIgA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH 2/3] lvgl: Reinstate git submodules in lvgl-demo-fb
Date: Tue,  9 May 2023 03:59:14 +0200
Message-Id: <20230509015915.77182-2-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509015915.77182-1-marex@denx.de>
References: <20230509015915.77182-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 01:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102446

The lvgl-demo-fb depends on specific configuration of LVGL which
includes demo widgets, which as far as I can tell are not needed
for regular LVGL application development. Reinstate the gitsm in
this recipe temporarily, so it can again build its own version of
LVGL and stops failing to build, at least until better fix exists.

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
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 6d9ff89f5..d86d6ff9c 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -5,9 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80ef=
5f343050bf96cce3a4 \
                     file://lv_drivers/LICENSE;md5=3Dd6fc0df890c5270ef045=
981b516bb8f2 \
                     file://lvgl/LICENCE.txt;md5=3Dbf1198c89ae87f043108ce=
a62460b03a"
=20
-DEPENDS =3D "lvgl lv-drivers"
-
-SRC_URI =3D "git://github.com/lvgl/lv_port_linux_frame_buffer.git;branch=
=3Dmaster;protocol=3Dhttps"
+SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
 SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
=20
 S =3D "${WORKDIR}/git"
--=20
2.39.2


