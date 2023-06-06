Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12584C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 09:01:00 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.4339.1686042050873587322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 02:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id 8B69E5241
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jun 2023 11:00:34 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.173.9]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q6SYJ-1OO6cN0; Tue, 6 Jun 2023 11:00:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/3] gnome-shell: upgrade 44.1 -> 44.2
Date: Tue,  6 Jun 2023 11:00:13 +0200
Message-Id: <20230606090013.1455222-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606090013.1455222-1-f_l_k@t-online.de>
References: <20230606090013.1455222-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686042032-FBFE8283-46AC9E00/0/0 CLEAN NORMAL
X-TOI-MSGID: ce3fc2bd-1640-42f7-b252-f6bd2286a30d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 09:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103135

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_44.1.bb =3D> gnome-shell_44.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_44.1.bb =3D> gn=
ome-shell_44.2.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
index f8f500afe..09995e51e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_44.2.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "0bfbe4394d267625154d08d01467bdbd99e81575=
12fc8df45d5c02ddb7551ca6"
+SRC_URI[archive.sha256sum] =3D "55f279ec6303b7c0c89246eced81247c87fc1c73=
948f45eb212a647218d1b63f"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.34.1


