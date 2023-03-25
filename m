Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA79EC77B79
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17453.1679731392506410050
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id EE18118978
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrl-0RoPhM0; Sat, 25 Mar 2023 09:03:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 04/32] evolution-data-server: update 3.46.3 -> 3.48.0
Date: Sat, 25 Mar 2023 09:02:28 +0100
Message-Id: <20230325080256.923752-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731389-8556AC08-B50F97A8/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c0f9f69-a2c4-4883-8015-13744eebbb75
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101717

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb            | 3 +--
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index a27115267..d6f6d7c23 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -37,8 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D=
${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?=3D "oauth"
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
-# ENABLE_OAUTH2_WEBKITGTK4 would require webkit to be built with gtk4
-PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON,-DENABLE_OA=
UTH2_WEBKITGTK4=3DOFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
 PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 2b74b2e60..9db5e9011 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "0938e2279e5cfbc2204766ca9d3fea570911699b=
07c10cbe01aca62a7e8b2bee"
-PV =3D "3.46.3"
+SRC_URI[archive.sha256sum] =3D "0f25f73331edf53909be40f412b2a86939270327=
517616303f322de157083c35"
+PV =3D "3.48.0"
--=20
2.34.1


