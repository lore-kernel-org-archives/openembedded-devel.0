Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97436C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 17:57:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.3407.1713981430067958713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 10:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout02.t-online.de (Postfix) with SMTP id E970619F17
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 19:57:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.163]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rzgrf-20Nsbi0; Wed, 24 Apr 2024 19:57:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/2] gssdp: fix a reproducibility issue
Date: Wed, 24 Apr 2024 19:57:23 +0200
Message-ID: <20240424175723.63679-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424175723.63679-1-f_l_k@t-online.de>
References: <20240424175723.63679-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1713981423-7EFFB3DD-CE148E6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 85d04299-83f0-4dfe-8138-461ee79e83ba
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 17:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110138

- add a	patch to fix a buildpath leakage
  SRC_URI +=3D did not work, therefore use SRC_URI:append

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...mplate-use-basename-instead-of-filen.patch | 32 +++++++++++++++++++
 .../recipes-connectivity/gupnp/gssdp_1.6.3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/0001=
-gssdp-enums.c.template-use-basename-instead-of-filen.patch

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-=
enums.c.template-use-basename-instead-of-filen.patch b/meta-multimedia/re=
cipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-i=
nstead-of-filen.patch
new file mode 100644
index 000000000..63126520e
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c=
.template-use-basename-instead-of-filen.patch
@@ -0,0 +1,32 @@
+From 78270f9159a9ec7284ca39a2fbb1774347942de1 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 24 Apr 2024 19:08:43 +0200
+Subject: [PATCH] gssdp-enums.c.template: use basename instead of filenam=
e
+
+This would prevent the build path from leaking into the source code.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gssdp/-/merge=
_requests/13]
+---
+ libgssdp/gssdp-enums.c.template | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libgssdp/gssdp-enums.c.template b/libgssdp/gssdp-enums.c.te=
mplate
+index 600d426..2dfb859 100644
+--- a/libgssdp/gssdp-enums.c.template
++++ b/libgssdp/gssdp-enums.c.template
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
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb b/=
meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
index f2e27622c..e6ea47270 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.3.bb
@@ -6,6 +6,7 @@ BUGTRACKER =3D "https://gitlab.gnome.org/GNOME/gssdp/-/is=
sues"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
+SRC_URI:append =3D " file://0001-gssdp-enums.c.template-use-basename-ins=
tead-of-filen.patch"
 SRC_URI[archive.sha256sum] =3D "2fedb5afdb22cf14d5498a39a773ca89788a250f=
cf70118783df821e1f3f3446"
=20
 GTKDOC_MESON_OPTION =3D 'gtk_doc'
--=20
2.44.0


