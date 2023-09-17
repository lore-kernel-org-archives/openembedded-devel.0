Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FFDCD13CF
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 17:29:24 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.33967.1694971760876385022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 10:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 7A6B65B7A4
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 19:29:18 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhva8-3JKrGT0; Sun, 17 Sep 2023 19:29:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] polkit: upgrade 122 -> 123
Date: Sun, 17 Sep 2023 19:29:08 +0200
Message-ID: <20230917172909.1752962-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694971756-83FFD7F0-6DF570DA/0/0 CLEAN NORMAL
X-TOI-MSGID: 49ab112d-10ee-48ba-8539-b6880d1d2a69
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 17:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104915

- better safety with deeper resctiction of the configuration files
- better safety with restricting the daemon's owner under systemd
- better safety with the systemd unit sandboxing
- less thread races during upload of the configuration

- glib, gobject, gio >=3D 2.32
- mozjs-102 OR duktape
- gobject-introspection >=3D 0.6.2 (optional)
- pam (optional)
- ConsoleKit OR systemd
- gettext
- meson

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-extended/polkit/{polkit_122.bb =3D> polkit_123.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/polkit/{polkit_122.bb =3D> polkit_123.bb=
} (97%)

diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/reci=
pes-extended/polkit/polkit_123.bb
similarity index 97%
rename from meta-oe/recipes-extended/polkit/polkit_122.bb
rename to meta-oe/recipes-extended/polkit/polkit_123.bb
index 290640626..9f2570746 100644
--- a/meta-oe/recipes-extended/polkit/polkit_122.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_123.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7=
532b41f390409283eb"
 SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "da87c5698019897dd731bb2cbb54ebd9c9481f52"
+SRCREV =3D "fc8b07e71d99f88a29258cde99b913b44da1846d"
=20
 DEPENDS =3D "expat glib-2.0"
=20
--=20
2.41.0


