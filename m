Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816A3C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 05:46:51 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5994.1715320008221130112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 22:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout09.t-online.de (Postfix) with SMTP id 65FB16CE8D
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 07:46:46 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.205]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s5J5h-00nUnp0; Fri, 10 May 2024 07:46:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] fuse3: move from meta-filesystems to meta-oe
Date: Fri, 10 May 2024 07:47:08 +0200
Message-ID: <20240510054709.4044191-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1715320006-224FF89A-44744492/0/0 CLEAN NORMAL
X-TOI-MSGID: 847a4270-6e9a-42f0-b787-5dc201497267
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 May 2024 05:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110306

Technically flatpak and xdg-desktop-portal have a runtime dependency on
fuse3-utils. I was worried that adding it might cause problems with CI si=
nce fuse3
is not included in meta-oe.

Given that both packages also require fuse3 at buildtime it could be a go=
od
idea to move fuse3 to avoid a meta-filesystems dependency for meta-oe

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/fuse/fuse3/run-ptest                       | 0
 .../recipes-support/fuse/fuse3_3.16.2.bb                       | 3 +--
 2 files changed, 1 insertion(+), 2 deletions(-)
 rename {meta-filesystems =3D> meta-oe}/recipes-support/fuse/fuse3/run-pt=
est (100%)
 rename {meta-filesystems =3D> meta-oe}/recipes-support/fuse/fuse3_3.16.2=
.bb (98%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3/run-ptest b/meta=
-oe/recipes-support/fuse/fuse3/run-ptest
similarity index 100%
rename from meta-filesystems/recipes-support/fuse/fuse3/run-ptest
rename to meta-oe/recipes-support/fuse/fuse3/run-ptest
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb b/meta=
-oe/recipes-support/fuse/fuse3_3.16.2.bb
similarity index 98%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
rename to meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 2b0797a6f..307544bf3 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -13,8 +13,7 @@ LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3Da55c12a2d7d742ecb41ca9ae0a6ddc66 \
 "
=20
-SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz \
-"
+SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "f797055d9296b275e981f5f62d4e32e089614fc253d1ef29=
85851025b8a0ce87"
=20
 S =3D "${WORKDIR}/fuse-${PV}"
--=20
2.44.0


