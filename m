Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96650C38142
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 05:35:17 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.8847.1674538515553501838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jan 2023 21:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout02.t-online.de (Postfix) with SMTP id 7C8E42A6AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 06:35:13 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.201]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKBxe-0hYKGn0; Tue, 24 Jan 2023 06:35:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] cups-pk-helper: add recipe
Date: Tue, 24 Jan 2023 06:35:02 +0100
Message-Id: <20230124053502.10992-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1674538510-726BD7D8-B1E5ABA0/0/0 CLEAN NORMAL
X-TOI-MSGID: ea0503ab-1a8a-49b1-b4d2-8f1e4420e8a2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 05:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100712

cups-pk-helper is a runtime dependency for gnome-control-center
or system-config-printer.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-printing/cups/cups-pk-helper_0.2.7.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb

diff --git a/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb b/meta=
-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
new file mode 100644
index 000000000..c1ac74e3a
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-pk-helper_0.2.7.bb
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "CUPS polkit helper"
+HOMEPAGE =3D "https://www.freedesktop.org/software/cups-pk-helper/releas=
es/"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+DEPENDS =3D "cups polkit glib-2.0 xz intltool-native"
+
+SRC_URI =3D "https://www.freedesktop.org/software/cups-pk-helper/release=
s/cups-pk-helper-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "66070ddb448fe9fcee76aa26be2ede5a80f85563e3a4afd5=
9d2bfd79fbe2e831"
+
+inherit meson pkgconfig gettext
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


