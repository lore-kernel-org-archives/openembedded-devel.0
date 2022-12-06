Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B933DC3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:36:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.921.1670355366069041256
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 121C01794
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Dec 2022 20:36:03 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.136]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2djR-1Ur1vN0; Tue, 6 Dec 2022 20:35:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 1/4] thunar-archive-plugin: update 0.4.0 -> 0.5.0
Date: Tue,  6 Dec 2022 20:35:44 +0100
Message-Id: <20221206193547.144679-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670355357-793AD9DD-9F736DFC/0/0 CLEAN NORMAL
X-TOI-MSGID: c750244a-1b69-4fd7-80a2-b41b9cd9984e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 19:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99962

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...rchive-plugin_0.4.0.bb =3D> thunar-archive-plugin_0.5.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-thunar-plugins/archive/{thunar-archive-plugin_0=
.4.0.bb =3D> thunar-archive-plugin_0.5.0.bb} (61%)

diff --git a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plug=
in_0.4.0.bb b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plu=
gin_0.5.0.bb
similarity index 61%
rename from meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugi=
n_0.4.0.bb
rename to meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_=
0.5.0.bb
index 0a1098db5..c2c4b9fa5 100644
--- a/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.4.=
0.bb
+++ b/meta-xfce/recipes-thunar-plugins/archive/thunar-archive-plugin_0.5.=
0.bb
@@ -1,12 +1,11 @@
 DESCRIPTION =3D "Thunar Archive Plugin allows you to create and extract =
archive files using file context menus in Thunar"
 HOMEPAGE =3D "http://goodies.xfce.org/projects/thunar-plugins/thunar-arc=
hive-plugin"
 LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
=20
 inherit thunar-plugin
=20
-SRC_URI[md5sum] =3D "0a7738a3a5f84bf218ece3ffb5241c63"
-SRC_URI[sha256sum] =3D "bf82fa86a388124eb3c4854249c30712b2922e6178960726=
8ee14548549b3115"
+SRC_URI[sha256sum] =3D "8eca88a358282a5acdea72984db0d930efdf658b4bc5b82e=
f7bcd06224366ffa"
=20
 # install tap files in ${libdir}/thunar-archive-plugin
 EXTRA_OECONF +=3D "--libexecdir=3D${libdir}"
--=20
2.34.1


