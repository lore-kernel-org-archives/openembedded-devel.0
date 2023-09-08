Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50846CCFA0A
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:44:56 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.36846.1694173487384602472
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id AB0661BFCE
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Sep 2023 13:44:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.221]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qeZul-0aMr2X0; Fri, 8 Sep 2023 13:44:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] appstream: update 0.16.2 -> 0.16.3
Date: Fri,  8 Sep 2023 13:44:36 +0200
Message-ID: <20230908114436.1418764-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694173483-358CE16C-6DABD9F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 32b5f7e0-f6af-4da5-9d0d-475191d6e9b3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 11:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104804

Version 0.16.3
~~~~~~~~~~~~~~
Released: 2023-08-22

Features:
 * compose: Allow creating metadata with complete URLs and no base URL

Bugfixes:
 * Fix tweaking of appstream.pc when building as subproject
 * Do not override default-priority when parsing multiple metadata files
 * Ensure stemmer always has the right locale and token-search works
 * Require a more recent libxmlb to avoid crashes

Miscellaneous:
 * Work around invalid null-dereference warning in GCC 13

Contributors:
 Daniel Drake, Matthias Klumpp

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../appstream/{appstream_0.16.2.bb =3D> appstream_0.16.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/appstream/{appstream_0.16.2.bb =3D> appst=
ream_0.16.3.bb} (94%)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.2.bb b/meta=
-oe/recipes-support/appstream/appstream_0.16.3.bb
similarity index 94%
rename from meta-oe/recipes-support/appstream/appstream_0.16.2.bb
rename to meta-oe/recipes-support/appstream/appstream_0.16.3.bb
index 240e63a1b..222cd80be 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.2.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.3.bb
@@ -25,7 +25,7 @@ GIR_MESON_OPTION =3D "gir"
=20
 SRC_URI =3D "https://www.freedesktop.org/software/appstream/releases/App=
Stream-${PV}.tar.xz"
 SRC_URI:append:class-target =3D " file://0001-fix-crosscompile.patch"
-SRC_URI[sha256sum] =3D "f9cb80bd388fbf06be268afa7f2d65863c85d605ad874b90=
5094f3982d03f232"
+SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8=
e6344a2b318b98b1"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
=20
--=20
2.41.0


