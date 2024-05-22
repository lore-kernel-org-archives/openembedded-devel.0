Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B37EC25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 11:48:23 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by mx.groups.io with SMTP id smtpd.web11.7448.1716376511964815375
 for <Openembedded-Devel@Lists.Openembedded.Org>;
 Wed, 22 May 2024 04:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: moellendorf.eu, ip: 212.227.126.135, mailfrom: mail@moellendorf.eu)
Received: from localhost ([78.43.203.234]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N45th-1sZgpl2ThJ-0107pQ; Wed, 22 May 2024 13:15:04 +0200
From: =?UTF-8?B?TGFycyBNw7ZsbGVuZG9yZg==?= <openembedded@moellendorf.eu>
To: Openembedded-Devel@Lists.Openembedded.Org
Cc: =?UTF-8?q?Lars=20M=C3=B6llendorf?= <lars.moellendorf@plating.de>
Subject: [PATCH 2/2] iniparser: remove dependency on doxygen-native
Date: Wed, 22 May 2024 13:13:48 +0200
Message-ID: <20240522111348.6109-3-openembedded@moellendorf.eu>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240522111348.6109-1-openembedded@moellendorf.eu>
References: <20240522111348.6109-1-openembedded@moellendorf.eu>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ygDkwxHJWYBCe9JQIceRyuLMM/RW/uJwf+whliGdXfnciImvXcJ
 Drx/DqMOwEB7X4WmclfHcCsC0as9xZUuctooIjsENUaFbVqkFvgYbN6goaR9G4x6l5FnLFd
 Dbio9v6INoiO7eXmNzSNYdc9cxW3tMaoCExVLCItMk4gJxFAlOApVTbkDcS3D9cTc+y9qEr
 D9lRmWnBMHQx1sS7ZfG6g==
UI-OutboundReport: notjunk:1;M01:P0:TN11OQMLBqM=;9kNkk5GTMhok26USrYbBdVjzWsO
 MSjkMhiOTz7Fl+77gqADFXml/ijxUZDWHRIer2xQrSWLGOtCfzwIwNlbojYS0PoCWrIPh+b6c
 I3qk5ThbQcD3oYZ2fgMcrug9GW0AtuwuWCmCD6KHCRAanU0XCkw/6pyTmyxNwsYkkzRST6fMM
 scUMOtL+eKr+O2PBOFGlYXgkN/oGV330WoHGLD9Z/02BWUleBGNp4T5Fjmpz9WFJ/+TuwX3Ws
 TDHgPyjqmtalgq4/PVOp2DLbmRzlHu0zsKY+je+e/KJMiTEVU1qqV8DcV93PXKGl7SBVIj4p9
 IkGStPp/m9sBNr59AB86m8j+YDz2k4sGukuPGDTQcU1E1ZT8FCfJVxFlYx9DH+K6pYkDtbbk/
 q8ctwuZYkej7B/UyrJ0gePE1Eir+XjMCYRA1eqjMOjecB0oGNPCLZTFtuNlCvsjjjFsSEyMk2
 sBZlbkTPv9lLa+LGLCLN+zQyNbJXDGgRqTvJ3oCL3RSf2RTNOvdEESkiYwVAnz+Cn/L2MXj63
 q0SBXL5VIbw+6ag+jjXQzsGMd75ylWn1x80NWj6Np+ZqWI+DAxaUPqlatvGlaFtffMNCU74ef
 KD0HbhYNJ8q/FQ8OiC0/kIZGBZVE/Nm0YvHubrVA9splCiI+UXzVqlb2BHA+cD2VOKTRS9Ph6
 MvjvuTlM0b50wAI4VsJHWQIKg1V5nC9Ppn5XMBRLS6rJJ5PxCsdjagoK1bxf3tY1O7k+zrHJm
 WZR2clGgNDT38mdUSlHZ0K75AyF297zy91Zdq/iIGnHsKegWNuWFM4=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 11:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110486

From: Lars Möllendorf <lars.moellendorf@plating.de>

This is an extra commit since I am not sure if documentation is wanted or
not.

Signed-off-by: Lars Möllendorf <lars.moellendorf@plating.de>
---
 meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
index a8f7947c8..4a1c6db15 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.2.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 SRCBRANCH = "main"
 SRCREV = "v${PV}"
 
-DEPENDS = "doxygen-native"
-
 SRC_URI = "git://gitlab.com/iniparser/iniparser.git;protocol=https;branch=${SRCBRANCH}"
 S = "${WORKDIR}/git"
 
 inherit cmake
 
+EXTRA_OECMAKE = " \
+	-DBUILD_DOCS=OFF \
+	"
+
 FILES_${PN}-staticdev += "${libdir}/cmake/iniparser/iniparser-staticTargets*.cmake"
-- 
2.43.2


