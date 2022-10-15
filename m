Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93930C433FE
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 17:19:37 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web12.21787.1665854374261630213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Oct 2022 10:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout06.t-online.de (Postfix) with SMTP id 6BA2571BD
	for <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 19:19:32 +0200 (CEST)
Received: from flk-MS-7C91.. ([79.219.224.131]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ojkor-3HnAFG0; Sat, 15 Oct 2022 19:19:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 2/2] wireplumber: upgrade 0.4.11 -> 0.4.12
Date: Sat, 15 Oct 2022 19:19:17 +0200
Message-Id: <20221015171917.3622-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015171917.3622-1-f_l_k@t-online.de>
References: <20221015171917.3622-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665854369-4AFF5689-D8626D57/0/0 CLEAN NORMAL
X-TOI-MSGID: 7bf29b46-2aca-4b0b-a8f7-d17e33ce90fa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Oct 2022 17:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99177

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{wireplumber_0.4.11.bb =3D> wireplumber_0.4.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/wireplumber/{wireplumber_0.4.1=
1.bb =3D> wireplumber_0.4.12.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.11.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.12.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.=
4.11.bb
rename to meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.=
12.bb
index e093734ed..d80d9348a 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.11.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.12.b=
b
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native lua pipewire \
     ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data"=
, "python3-native python3-lxml-native doxygen-native", "", d)} \
 "
=20
-SRCREV =3D "80b3559963f0ad40a7bfa6c23b0098275c0b5ebe"
+SRCREV =3D "6f6e5df9c1b223907efa8dcbfcd538821d0dabc4"
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/wireplumber.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://90-OE-disable-session-dbus-dependent-features.lua \
            "
--=20
2.34.1


