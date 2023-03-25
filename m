Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29575C77B61
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17460.1679731396187517368
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 01BB01CBF7
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:13 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyro-0RoPhd0; Sat, 25 Mar 2023 09:03:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 21/32] gnome-terminal: update 3.46.7 -> 3.48.0
Date: Sat, 25 Mar 2023 09:02:45 +0100
Message-Id: <20230325080256.923752-21-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731392-85D6DC08-E22B5965/0/0 CLEAN NORMAL
X-TOI-MSGID: f8b03d61-7a66-47ca-985b-0dd388fadb3a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101733

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-terminal_3.46.7.bb =3D> gnome-terminal_3.48.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-terminal/{gnome-terminal_3.46.7.bb=
 =3D> gnome-terminal_3.48.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.=
7.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7=
.bb
rename to meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.b=
b
index d9afeec46..75e609d15 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.46.7.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.0.bb
@@ -22,7 +22,7 @@ DEPENDS =3D " \
=20
 SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-terminal.git;protocol=3D=
https;nobranch=3D1"
 SRC_URI +=3D "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.pat=
ch"
-SRCREV =3D "816edf80cd7bf7f253366099ea9fcaf361676139"
+SRCREV =3D "a85ecc959344ee2e0d345f7dd081dc781d95d364"
 S =3D "${WORKDIR}/git"
=20
 PACKAGECONFIG ?=3D ""
--=20
2.34.1


