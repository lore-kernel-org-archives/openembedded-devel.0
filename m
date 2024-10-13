Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277EACF2591
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 20:41:49 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.39624.1728852099633852041
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 13:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id B886C23A30
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 22:33:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.41]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t05Gw-47rSPx0; Sun, 13 Oct 2024 22:33:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] glad: add recipe
Date: Sun, 13 Oct 2024 22:34:57 +0200
Message-ID: <20241013203459.47304-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728851582-0C7F6467-BE07FF4A/0/0 CLEAN NORMAL
X-TOI-MSGID: 31ca9b06-2552-428a-8bd3-602f3db38f45
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 20:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112843

Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the official specifi=
cations for multiple languages.

This is used by libplacebo -> mpv

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/glad/glad_2.0.8.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/glad/glad_2.0.8.bb

diff --git a/meta-oe/recipes-graphics/glad/glad_2.0.8.bb b/meta-oe/recipe=
s-graphics/glad/glad_2.0.8.bb
new file mode 100644
index 000000000..4065c27e6
--- /dev/null
+++ b/meta-oe/recipes-graphics/glad/glad_2.0.8.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Vulkan/GL/GLES/EGL/GLX/WGL Loader-Generator based on the of=
ficial specifications for multiple languages."
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dae570f26774ac096cff8f992091a2=
23c"
+
+SRC_URI =3D "git://github.com/Dav1dde/glad.git;protocol=3Dhttps;branch=3D=
glad2"
+SRCREV =3D "73db193f853e2ee079bf3ca8a64aa2eaf6459043"
+S =3D "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta
+
+BBCLASSEXTEND =3D "native nativesdk"
+RDEPENDS:${PN} =3D "python3 python3-jinja2"
--=20
2.47.0


