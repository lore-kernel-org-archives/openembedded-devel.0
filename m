Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CF5C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:46:32 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.31210.1683636388812055210
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 05:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 7CAF54CBCF
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 May 2023 14:46:25 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.32.109]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pwMjZ-0P8K9p0; Tue, 9 May 2023 14:46:25 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] paprefs: add recipe
Date: Tue,  9 May 2023 14:46:11 +0200
Message-Id: <20230509124612.37627-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683636385-42FF7266-2B4E1D15/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f0fd668-5811-49c0-8487-027f62af58a4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 12:46:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102505

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pulseaudio/paprefs_1.2.bb                  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb

diff --git a/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb b/meta-=
oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
new file mode 100644
index 0000000000..6d0cf7ed7f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/pulseaudio/paprefs_1.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION =3D "PulseAudio Preferences (paprefs) is a simple GTK based =
configuration dialog for the PulseAudio sound server."
+HOMEPAGE =3D "https://freedesktop.org/software/pulseaudio/paprefs/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "pulseaudio gtkmm3 gtk+3 libsigc++-3 glibmm"
+
+inherit meson pkgconfig features_check
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+SRC_URI =3D "http://freedesktop.org/software/pulseaudio/paprefs/${BP}.ta=
r.xz"
+
+SRC_URI[sha256sum] =3D "b3f21e40dc3936d15e3ffc910fb0c07c14b88e8c287715b4=
56a948c17638f633"
+
+EXTRA_OEMESON =3D "-Dlynx=3Dfalse"
+
+RDEPENDS:${PN} +=3D "pulseaudio-server"
--=20
2.34.1


