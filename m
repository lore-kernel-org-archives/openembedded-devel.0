Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEC6C77B76
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17461.1679731398838096358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 50F561E81D
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrp-0RoPhf0; Sat, 25 Mar 2023 09:03:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 23/32] gtksourceview5: update 5.6.1 -> 5.7.1
Date: Sat, 25 Mar 2023 09:02:47 +0100
Message-Id: <20230325080256.923752-23-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731393-8656CC08-D4C470CF/0/0 CLEAN NORMAL
X-TOI-MSGID: 873075c0-2464-4c95-88cb-c579e0d7fa9c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101734

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.6.1.bb =3D> gtksourceview5_5.7.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.6.1.bb =3D=
> gtksourceview5_5.7.1.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.b=
b
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
index 2fb64325c..99826c594 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
@@ -25,8 +25,8 @@ inherit gnomebase lib_package gettext features_check gt=
k-doc gtk-icon-cache gobj
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.6/${PNAM=
E}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "659d9cc9d034a114f07e7e134ee80d77dec0497cb1516ae5=
369119c2fcb9da16"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.7/${PNAM=
E}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "3b42541964db9c2fa50a9658d4886bdf77d023fe4e96c5b1=
7bce51c9f58c48e6"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.34.1


