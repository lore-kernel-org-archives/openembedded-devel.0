Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AF7C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:41:27 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.8917.1674538879318045514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 21:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id 0939023692
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 06:40:34 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.201]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKC2r-3xnWRl0; Tue, 24 Jan 2023 06:40:33 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] cups-pk-helper: add recipe
Date: Tue, 24 Jan 2023 06:40:24 +0100
Message-Id: <20230124054024.11634-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674538833-19FF5D98-F955E5E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 864dfdbb-3911-4ab9-b50d-afd56168a535
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 05:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100714

cups-pk-helper is a runtime dependency for gnome-control-center
or system-config-printer.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-printing/cups/cups-pk-helper_0.2.7.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta=
-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
new file mode 100644
index 000000000..9639a123d
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "CUPS polkit helper"
+HOMEPAGE =3D "https://www.freedesktop.org/software/cups-pk-helper/releas=
es/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+DEPENDS =3D "cups polkit glib-2.0 xz intltool-native"
+
+inherit meson pkgconfig gettext features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D "https://www.freedesktop.org/software/cups-pk-helper/release=
s/cups-pk-helper-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd5=
9d2bfd79fbe2e831"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


