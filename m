Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D271BC46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 06:44:01 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.44098.1704523435006398980
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jan 2024 22:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 772153FD2B
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 07:43:53 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.174.51]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rM0PQ-1e3LMH0; Sat, 6 Jan 2024 07:43:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] glad: add recipe
Date: Sat,  6 Jan 2024 07:43:45 +0100
Message-ID: <20240106064345.14081-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704523432-CEFFA957-4EC5EF77/0/0 CLEAN NORMAL
X-TOI-MSGID: bee5da92-3e10-40e1-9458-ffff2e411966
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 06:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108058

glad is a required dependency for libplacebo

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/glad/glad_2.0.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glad/glad_2.0.4.bb

diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.4.bb b/meta-oe/recipe=
s-graphics/glad/glad_2.0.4.bb
new file mode 100644
index 000000000..839535833
--- /dev/null
+++ b/meta-oe/recipes-graphics/glad/glad_2.0.4.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the of=
ficial specifications for multiple languages."
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae570f26774ac096cff8f992091a2=
23c"
+
+SRC_URI =3D "git://github.com/Dav1dde/glad.git;protocol=3Dhttps;branch=3D=
glad2"
+SRCREV =3D "d08b1aa01f8fe57498f04d47b5fa8c48725be877"
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
+RDEPENDS:${PN} =3D "python3"
--=20
2.43.0


