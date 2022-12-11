Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1E0C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 01:56:09 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.8696.1670723766927677618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 17:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 896D2287F7
	for <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 02:55:47 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.99]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p4BZB-0Tnsen0; Sun, 11 Dec 2022 02:55:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] ostree: replace libsoup-2.4 by curl
Date: Sun, 11 Dec 2022 02:55:32 +0100
Message-Id: <20221211015533.3748098-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670723747-5A7EF991-25887449/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e2dfaad-7b89-480c-827f-cfb4aa9329b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Dec 2022 01:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100032

like it is done in fedora

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/ostree/ostree_2022.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/r=
ecipes-extended/ostree/ostree_2022.5.bb
index 1a0987361..c6ac7cbea 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -48,7 +48,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount=
', '', d)} \
     glib \
     gpgme \
-    soup \
+    curl \
 "
=20
 # We include soup because ostree can't (currently) be built without
@@ -57,14 +57,14 @@ PACKAGECONFIG:class-native ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
     gpgme \
-    soup \
+    curl \
 "
=20
 PACKAGECONFIG:class-nativesdk ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
     gpgme \
-    soup \
+    curl \
 "
=20
 PACKAGECONFIG[avahi] =3D "--with-avahi, --without-avahi, avahi"
--=20
2.34.1


