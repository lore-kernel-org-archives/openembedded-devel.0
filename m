Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3B7C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 18:46:21 +0000 (UTC)
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by mx.groups.io with SMTP id smtpd.web11.30100.1700678774608925037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 10:46:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@fris.de header.s=dkim header.b=pf1ogI1X;
 spf=pass (domain: fris.de, ip: 116.203.77.234, mailfrom: frieder@fris.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E0FDBFBE2;
	Wed, 22 Nov 2023 19:46:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1700678772; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=q1/NbpxwHJ+45w76VhGfmhU3W+9jkxw9UcqakkPvSJQ=;
	b=pf1ogI1XEbodkY29AnlUCl9GtupOx6YIk4VIp+sNNuoCdN9GUbY4sfujBpC5NXCE6UMvT0
	XsfIFqILOBE7vo2nffOurPWd9bG9CJFHTGtZIuOXFhRBfHtlQ5NxgSxKPtQU1yr5FiLt/F
	lrKGtt0TV+dvni6LW5SvO+JSJmrMTjx+e0WYGyu/PMC3+5+lfTp2QYZb15OHmXUmx5P86x
	XBYDslhu+5yRXV+3Hzh93JAjH1DiVvx0XIsbccEchLHLEPCfUukeDKdbLUoJdpUwn9E7uG
	pLMr8KxYz1bvtcLTV8HYW20+BTrtLfdZb4QFa+j9Ko1vb8aBtCKC9OvgEmH0xA==
From: Frieder Schrempf <frieder@fris.de>
To: openembedded-devel@lists.openembedded.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: [meta-oe][dunfell][PATCH] spirv-tools: Use main branch for all repos
Date: Wed, 22 Nov 2023 19:46:00 +0100
Message-ID: <20231122184600.2333926-1-frieder@fris.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 18:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107014

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The master branch has been removed in all of the repos used
in SRC_URI. Switch to the main branch instead.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/r=
ecipes-graphics/spir/spirv-tools_git.bb
index ffacee4c9..362a25072 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -8,9 +8,9 @@ SECTION =3D "graphics"
=20
 S =3D "${WORKDIR}/git"
 DEST_DIR =3D "${S}/external"=20
-SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;name=3Dspirv-=
tools;branch=3Dmaster;protocol=3Dhttps \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-headers;de=
stsuffix=3D${DEST_DIR}/spirv-headers;branch=3Dmaster;protocol=3Dhttps \
-	git://github.com/google/effcee.git;name=3Deffcee;destsuffix=3D${DEST_DI=
R}/effcee;branch=3Dmaster;protocol=3Dhttps \
+SRC_URI =3D "git://github.com/KhronosGroup/SPIRV-Tools.git;name=3Dspirv-=
tools;branch=3Dmain;protocol=3Dhttps \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;name=3Dspirv-headers;de=
stsuffix=3D${DEST_DIR}/spirv-headers;branch=3Dmain;protocol=3Dhttps \
+	git://github.com/google/effcee.git;name=3Deffcee;destsuffix=3D${DEST_DI=
R}/effcee;branch=3Dmain;protocol=3Dhttps \
 	git://github.com/google/re2.git;name=3Dre2;destsuffix=3D${DEST_DIR}/re2=
;branch=3Dmain;protocol=3Dhttps \
 	git://github.com/google/googletest.git;name=3Dgoogletest;destsuffix=3D$=
{DEST_DIR}/googletest;branch=3Dmain;protocol=3Dhttps \
         file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file=
.patch \
--=20
2.42.1


