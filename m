Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31822C6371A
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:02 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.10019.1649533618376837603
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 12:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=dlZU05SS;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C2335820A3;
	Sat,  9 Apr 2022 21:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1649533615;
	bh=4JzkuiRJNxg8DnRumd/a5nxfj0fDLQonmWWwO5YloDg=;
	h=From:To:Cc:Subject:Date:From;
	b=dlZU05SSCwXmiHnacrPWC0+yg7MrX1EsM0RtCzRxFsJVQ7dYIp5krIjpR093suHAN
	 TVRv4iXL1pIKMilxbF4AO+8acwMVOXYhCeLv6OvbAMzpeOMs1XcvS07mJaL8B3SdDj
	 W8JvjBAPI1p73CFuRqQOU8iGT259SKrfS5FPerK7wf36uKOyMV13txb7cvNITXEfUT
	 3CQETS4c/NrKmC5bnTmA/sC4friZWMMiGqsPn3nxNYlLji6htlrLY8eI6rS6vGwa1u
	 qpiInyYX2qZzqUqESmj/9///Zs+UoUQTbTcCUjYu8Gd0zTbGeWK+0aUDvzhDkNePVt
	 syGXIq27LQT7A==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][PATCH] wxwidgets: Fix build without x11 and with opengl
 DISTRO_FEATURES
Date: Sat,  9 Apr 2022 21:46:44 +0200
Message-Id: <20220409194644.78969-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96501

In case DISTRO_FEATURES contains both 'x11' and 'opengl', which is a
valid use case for systems using e.g. WL instead, the PACKAGECONFIG
of this recipe is expanded to 'no_gui opengl', and the 'no_gui' option
conflicts with 'opengl'.

Adjust the default PACKAGECONFIG such that 'opengl' is added only in
case the 'gtk' GUI option is added, and not when the 'no_gui' option
is added.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index e82143040..0c0c8417b 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -44,8 +44,7 @@ EXTRA_OECMAKE:append:libc-musl =3D " \
 "
=20
 # All toolkit-configs except 'no_gui' require x11 explicitly (see toolki=
t.cmake)
-PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk'=
, 'no_gui', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk =
' + bb.utils.filter('DISTRO_FEATURES', 'opengl', d), 'no_gui', d)} \
 "
=20
 PACKAGECONFIG:remove:class-native =3D "opengl"
--=20
2.35.1


