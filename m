Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6144C4321E
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 07:34:54 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.124152.1670139287564427994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 23:34:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 1418A5A90
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Dec 2022 08:34:44 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.208]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p1jWL-0yFdPF0; Sun, 4 Dec 2022 08:34:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] perfetto: update -> 27.1 -> 28.0
Date: Sun,  4 Dec 2022 08:34:26 +0100
Message-Id: <20221204073426.53036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670139281-01604ECF-595B3E46/0/0 CLEAN NORMAL
X-TOI-MSGID: fecaa868-1017-40d6-989a-741bf717222d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Dec 2022 07:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99944

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../files/0001-meson-add-pc-file-for-lib_perfetto.patch       | 2 +-
 meta-oe/recipes-devtools/perfetto/perfetto.bb                 | 2 ++
 meta-oe/recipes-devtools/perfetto/perfetto.inc                | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-fi=
le-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-=
meson-add-pc-file-for-lib_perfetto.patch
index 70de44173..d6092afeb 100644
--- a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-=
lib_perfetto.patch
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-=
lib_perfetto.patch
@@ -17,7 +17,7 @@ index 06015141c..752b4d928 100644
      ['c','cpp'],
 -    default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11']
 +    default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11'],
-+    version: '27.1'
++    version: '28.0'
  )
 =20
 +soversion =3D meson.project_version()
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb
index 86ab18cac..3b29bc389 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -54,6 +54,8 @@ do_configure () {
     STRIP_BIN=3D`echo $STRIP | awk '{print $1}'`
=20
     ARGS=3D"is_debug=3Dfalse "  # Tell gn to use release mode
+    ARGS=3D$ARGS" enable_perfetto_heapprofd=3Dfalse"
+    ARGS=3D$ARGS" enable_perfetto_traced_perf=3Dfalse"
=20
     if [ -z `echo ${TOOLCHAIN} | grep clang` ]; then
         ARGS=3D$ARGS" is_clang=3Dfalse"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/rec=
ipes-devtools/perfetto/perfetto.inc
index 5cb6f8bb3..a8e72af1a 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.inc
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/google/perfetto"
=20
 SRC_URI =3D "git://github.com/google/perfetto.git;protocol=3Dhttps;name=3D=
perfetto;nobranch=3D1"
=20
-SRCREV_perfetto =3D "1c52b5e132312aeb007ed180d4ba1d8d66227923"
-PV =3D "27.1"
+SRCREV_perfetto =3D "99ead408d98eaa25b7819c7e059734bea42fa148"
+PV =3D "28.0"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


