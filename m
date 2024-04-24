Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746DC07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 17:57:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.3406.1713981429692424068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 10:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id E7B1419F16
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 19:57:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzgrf-20Nsbh0; Wed, 24 Apr 2024 19:57:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/2] gupnp: fix reproducibility issue
Date: Wed, 24 Apr 2024 19:57:22 +0200
Message-ID: <20240424175723.63679-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713981423-8E0993DD-6386005A/0/0 CLEAN NORMAL
X-TOI-MSGID: c9b93de1-2490-44ea-bc11-23cc1b05d778
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 17:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110137

- add a patch to fix a buildpath leakage

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 +++++++++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.6.6.bb |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001=
-gupnp-enums.c.template-use-basename-instead-of-filen.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-=
enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/re=
cipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-i=
nstead-of-filen.patch
new file mode 100644
index 000000000..373eb4548
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c=
.template-use-basename-instead-of-filen.patch
@@ -0,0 +1,32 @@
+From f875a0afe24fdebdefc46d132f6722dfcb55115a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 24 Apr 2024 18:52:45 +0200
+Subject: [PATCH] gupnp-enums.c.template: use @basename@ instead of @file=
name@
+
+This would prevent the build path from leaking into the source code.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gupnp/-/merge=
_requests/36]
+---
+ libgupnp/gupnp-enums.c.template | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgupnp/gupnp-enums.c.template b/libgupnp/gupnp-enums.c.te=
mplate
+index 3ce5fa4..a7ff89c 100644
+--- a/libgupnp/gupnp-enums.c.template
++++ b/libgupnp/gupnp-enums.c.template
+@@ -3,8 +3,8 @@
+=20
+ /*** END file-header ***/
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
+-#include "@filename@"
++/* enumerations from "@basename@" */
++#include "@basename@"
+ /*** END file-production ***/
+ /*** BEGIN value-header ***/
+ GType
+--=20
+2.44.0
+
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
index f1628d82e..7d9b8a477 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.6.bb
@@ -8,6 +8,8 @@ DEPENDS =3D "e2fsprogs gssdp libsoup-3.0 libxml2"
 inherit gnomebase pkgconfig vala gobject-introspection
=20
 SRC_URI[archive.sha256sum] =3D "c9dc50e8c78b3792d1b0e6c5c5f52c93e9345d3d=
ae2891e311a993a574f5a04f"
+SRC_URI +=3D "file://0001-gupnp-enums.c.template-use-basename-instead-of=
-filen.patch"
+
=20
 SYSROOT_PREPROCESS_FUNCS +=3D "gupnp_sysroot_preprocess"
=20
--=20
2.44.0


