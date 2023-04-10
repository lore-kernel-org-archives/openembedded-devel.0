Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CEEC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 13:47:00 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.45393.1681134410995007785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 06:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id 205187F98
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 15:46:49 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.40.74]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plrr5-1wfzik0; Mon, 10 Apr 2023 15:46:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] glibmm: fix reproducibility issues
Date: Mon, 10 Apr 2023 15:46:36 +0200
Message-Id: <20230410134636.459404-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410134636.459404-1-f_l_k@t-online.de>
References: <20230410134636.459404-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1681134407-837FDC79-9163FE87/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f901386-6929-423a-baaa-8093e333ba81
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 13:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102032

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb  | 16 ++++++++++------
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb   | 16 ++++++++++------
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb b/meta-o=
e/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
index 5028a8bb8..83ceb6458 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.74.0.bb
@@ -17,13 +17,17 @@ SRC_URI[archive.sha256sum] =3D "2b472696cbac79db8e405=
724118ec945219c5b9b18af63dc8c
=20
 S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
=20
-do_install:append() {
-    for i in generate_wrap_init.pl gmmproc; do
-        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.6=
8/proc/$i
-    done
-}
-
 FILES:${PN} =3D "${libdir}/lib*.so.*"
 FILES:${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/${BPN}/include/ ${li=
bdir}/${BPN}/proc/ ${libdir}/giomm-2.68/include/"
=20
 RDEPENDS:${PN}-dev =3D "perl"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross -Dmainta=
iner-mode=3Dfalse"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+m4 =3D '${bindir}/m4'
+perl =3D '${bindir}/perl'
+EOF
+}
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb b/meta-oe/rec=
ipes-core/glib-2.0/glibmm_2.66.2.bb
index f554a73fa..a6dc8ff20 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
@@ -15,13 +15,17 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.g=
etVar('PV').split('.')[1]}"
=20
 SRC_URI[archive.sha256sum] =3D "b2a4cd7b9ae987794cbb5a1becc10cecb65182b9=
bb841868625d6bbb123edb1d"
=20
-do_install:append() {
-    for i in generate_wrap_init.pl gmmproc; do
-        sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4=
/proc/$i
-    done
-}
-
 FILES:${PN} =3D "${libdir}/lib*.so.*"
 FILES:${PN}-dev +=3D "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ =
${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
=20
 RDEPENDS:${PN}-dev =3D "perl"
+
+EXTRA_OEMESON +=3D "--cross-file=3D${WORKDIR}/meson-${PN}.cross -Dmainta=
iner-mode=3Dfalse"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+m4 =3D '${bindir}/m4'
+perl =3D '${bindir}/perl'
+EOF
+}
--=20
2.34.1


