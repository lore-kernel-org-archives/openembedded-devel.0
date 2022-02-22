Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5C7DC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 02:50:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8275.1645498252259836162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 18:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D4E540C5D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYozxjSYqZTP
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3882540951
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 02:50:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E442C17476A;
	Mon, 21 Feb 2022 21:50:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 4/4] meta-openembedded: rename SYSROOT_DIRS_BLACKLIST to
 SYSROOT_DIRS_IGNORE
Date: Tue, 22 Feb 2022 02:50:48 +0000
Message-Id: <20220222025048.2826709-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222025048.2826709-1-denis@denix.org>
References: <20220222025048.2826709-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 02:50:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95435

Part of inclusive language changes.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb          | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.41.1.bb
index 8a9e76273..925907e17 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.41.1.bb
@@ -82,6 +82,6 @@ do_configure:prepend:toolchain-clang:x86() {
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-SYSROOT_DIRS_BLACKLIST:append:class-target =3D " ${baselib}/cmake/grpc"
+SYSROOT_DIRS_IGNORE:append:class-target =3D " ${baselib}/cmake/grpc"
=20
 FILES:${PN}-compiler +=3D "${bindir}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb b/meta=
-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
index b02dbbdaa..919dad82e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.37.bb
@@ -51,5 +51,5 @@ SRC_URI[sha256sum] =3D "fa9ca4d13871dd122f61258a80d0175=
1d603b4d3ee14095d65453b4e84
 BBCLASSEXTEND =3D "native nativesdk"
=20
 # Allow installation of fonts into recipe-sysroot-native
-SYSROOT_DIRS_BLACKLIST:remove =3D "${datadir}/fonts"
+SYSROOT_DIRS_IGNORE:remove =3D "${datadir}/fonts"
=20
--=20
2.25.1


