Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D43CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 18:12:54 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.396.1697652765887061200
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 11:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=uCHgSLBy;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 59B3587012;
	Wed, 18 Oct 2023 20:12:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1697652763;
	bh=JsGDk5lFfmS6gdZBz2/fwJCeCRGzj+bBL6cFWIUHCl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCHgSLBynkWWpRNP98sDVbMO4msP8AlAosiLfrHcprc7Tmz/xpN1XSAI+q8AZ8Wna
	 caiLs9Dk6+4BWte9Ds0q60RIRTBU1YZ3ETzw3Zkf52i72OItXlPGa76//Ox5VWbqI8
	 NzLUXZLpZEw4g+hojjxae+b9zGsgy/Cjhjz1mg9mMVsSCyXDzrx63kD0wZP0IIvgQ8
	 gYANatpzVI9YiuWwl+dkmDPt2coim359hYsTPlHrc1o8PLcLFr4R9OsjUM3ZiZQfgI
	 A+QaAUmjz9Fb+JaoKR9Tjoxx7UctmsE/7Ohofzy0GbVGy2jHikY3MdTusOqqhQ0yVM
	 Mb14nB+VhxoTA==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-oe][PATCH 2/2] lvgl: Allow empty package
Date: Wed, 18 Oct 2023 20:12:08 +0200
Message-ID: <20231018181221.87138-2-marex@denx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231018181221.87138-1-marex@denx.de>
References: <20231018181221.87138-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 18:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105579

The lvgl main package is empty, since all the headers end up in
the -dev variant and static library archive ends up in -staticdev
variant. Mark the main package as ALLOW_EMPTY.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.9.bb
index dc681c249..2aaf60a3d 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.9.bb
@@ -16,6 +16,8 @@ inherit cmake
 EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
 S =3D "${WORKDIR}/git"
=20
+ALLOW_EMPTY:${PN} =3D "1"
+
 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
 LVGL_CONFIG_LV_COLOR_DEPTH ?=3D "32"
=20
--=20
2.42.0


