Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA9DC77B77
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17458.1679731394419506974
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4C57A1CBEE
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhY0; Sat, 25 Mar 2023 09:03:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 16/32] gnome-session: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:40 +0100
Message-Id: <20230325080256.923752-16-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731392-85D6DC08-FCA17177/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b66abff-1b90-47ae-bd39-6709b172e66b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101727

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-session_43.0.bb =3D> gnome-session_44.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_43.0.bb =3D=
> gnome-session_44.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb
index 12f48bc82..3f642f401 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gettext gsettings upstream-version-is=
-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "3fb9949501385c8c14618e78f178d952df98ad8c=
91080f4c5e1568c7393ae1f2"
+SRC_URI[archive.sha256sum] =3D "ccf829a96526135e9e9f917526515d36a5092bdf=
a316f3737dd8c5a524dbf2c6"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
=20
--=20
2.34.1


