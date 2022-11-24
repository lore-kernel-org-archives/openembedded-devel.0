Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C908C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:34:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.23708.1669296875559095644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 05:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id EB78B5153
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 14:34:32 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.89]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyCN6-1tISS90; Thu, 24 Nov 2022 14:34:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-networking][PATCH] blueman: upgrade 2.34 -> 2.35
Date: Thu, 24 Nov 2022 14:34:25 +0100
Message-Id: <20221124133425.27046-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669296872-C9C89B6F-58CFD927/0/0 CLEAN NORMAL
X-TOI-MSGID: fd79e63a-31a9-4603-bdc3-eeecc3887e25
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 13:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99714

This fixes a nasty bug where the shown device list doesnt match the under=
lying
MAC list, resulting in connecting to a different device than selected.

This fixes keyboard not being able to reconnect after disconnect.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../blueman/{blueman_2.3.4.bb =3D> blueman_2.3.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.3.4.bb =3D=
> blueman_2.3.5.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index 2822e8713..2343cec71 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -13,7 +13,7 @@ SRC_URI =3D " \
     file://0001-meson-add-pythoninstalldir-option.patch \
 "
 S =3D "${WORKDIR}/git"
-SRCREV =3D "89bb5313a7cc24ca6fdbeaf2b02f6142dc1a8e60"
+SRCREV =3D "c85e7afb8d6547d4c35b7b639124de8e999c3650"
=20
 EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse -Dpythoninstalldir=3D${@=
noprefix('PYTHON_SITEPACKAGES_DIR', d)}"
=20
--=20
2.34.1


