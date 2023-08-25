Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725D9C7EE2C
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 05:45:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.7463.1692942304625964903
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 22:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id AFB5246AC9
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 07:45:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.212]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZPcz-2AQiNm0; Fri, 25 Aug 2023 07:45:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] phodav: add recipe
Date: Fri, 25 Aug 2023 07:44:46 +0200
Message-ID: <20230825054449.2315061-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825054449.2315061-1-f_l_k@t-online.de>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692942301-EAFF4029-68AB7DAC/0/0 CLEAN NORMAL
X-TOI-MSGID: 177fbbef-a4e5-4965-8a75-ba5b0ebd6fec
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 05:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104594

phodav is a small webdav server, that was originally created as a tool to
provide folder sharing for spice but it can be used on a wider range
of applications.

It is usable e.g. in virt-viewer or gnome-boxes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/phodav_3.0.bb       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/phodav_3.0.bb

diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb b/meta-n=
etworking/recipes-support/spice/phodav_3.0.bb
new file mode 100644
index 0000000000..03e3caee27
--- /dev/null
+++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "phodav is a WebDav server implementation using libsoup (RFC=
 4918)."
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D " \
+    glib-2.0 \
+    libsoup \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
+GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
+GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
+
+PACKAGECONFIG ??=3D "avahi"
+PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi"
+
+inherit pkgconfig gnomebase gettext gtk-doc
+
+SRC_URI =3D "https://download.gnome.org/sources/phodav/3.0/phodav-${PV}.=
tar.xz;name=3Darchive"
+SRC_URI[archive.sha256sum] =3D "392ec2d06d50300dcff1ef269a2a985304e29bce=
3520002fca29f2edc1d138d1"
+
+FILES:${PN} +=3D "${libdir}"
--=20
2.41.0


