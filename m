Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D655EC54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 10:38:51 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.31541.1710067121453629249
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 03:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id C180B2D353
	for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 11:38:39 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.166.16]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjGZg-28YwnB0; Sun, 10 Mar 2024 11:38:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] waylandpp: fix reproducibility issue
Date: Sun, 10 Mar 2024 11:38:39 +0100
Message-ID: <20240310103839.1602112-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710067116-867FA383-05C67B0A/0/0 CLEAN NORMAL
X-TOI-MSGID: 1331c037-b2bf-44da-b45a-7944433cdac7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 10:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109253

remove STAGING_DIR_HOST and S from the waylandpp-targets.cmake file

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb b/meta-o=
e/recipes-graphics/wayland/waylandpp_1.0.0.bb
index eb8ec4f5f..c1f5f4ed8 100644
--- a/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
+++ b/meta-oe/recipes-graphics/wayland/waylandpp_1.0.0.bb
@@ -37,4 +37,9 @@ EXTRA_OECMAKE:class-target =3D " \
 	-DCMAKE_EXE_LINKER_FLAGS=3D"-Wl,--enable-new-dtags" \
 "
=20
+do_install:append:class-target() {
+    sed -i -e 's|${S}||g' ${D}${libdir}/cmake/waylandpp/waylandpp-target=
s.cmake
+    sed -i -e 's|${STAGING_DIR_HOST}||g' ${D}${libdir}/cmake/waylandpp/w=
aylandpp-targets.cmake
+}
+
 BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.44.0


