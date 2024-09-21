Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16391CF9C6B
	for <webhook@archiver.kernel.org>; Sat, 21 Sep 2024 15:58:45 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.11933.1726934315926445736
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Sep 2024 08:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 734C448702
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 17:58:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.251]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ss2VE-4A2kTq0; Sat, 21 Sep 2024 17:58:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] grilo-plugins: switch from tracker to tinysparql
Date: Sat, 21 Sep 2024 18:00:20 +0200
Message-ID: <20240921160020.5364-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240921160020.5364-1-f_l_k@t-online.de>
References: <20240921160020.5364-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726934312-577FC467-2BD4BA42/0/0 CLEAN NORMAL
X-TOI-MSGID: 5897c71d-a05c-4631-a1e4-648bd4b47785
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Sep 2024 15:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112432

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/met=
a-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index 40603993f..05df108e9 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -18,6 +18,6 @@ SRC_URI +=3D "file://0001-Avoid-running-trackertestutil=
s.patch"
 SRC_URI[archive.sha256sum] =3D "fe6f4dbe586c6b8ba2406394e202f22d009d642a=
96eb3a54f32f6a21d084cdcb"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-in=
trospection-data', 'tracker', '', d)}"
-PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tracker"
+PACKAGECONFIG[tracker] =3D "-Denable-tracker3=3Dyes,-Denable-tracker3=3D=
no,tinysparql"
=20
 FILES:${PN} +=3D "${libdir}/grilo-0.3"
--=20
2.46.0


