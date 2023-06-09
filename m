Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE61AC7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 02:37:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4908.1686278247389870191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jun 2023 19:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7930E40C1C;
	Fri,  9 Jun 2023 02:37:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vvg1oSTDOq1e; Fri,  9 Jun 2023 02:37:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5BE7E40C16;
	Fri,  9 Jun 2023 02:37:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C6E5A1639DE;
	Thu,  8 Jun 2023 22:36:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] grpc: point to the native protobuf compiler binary
Date: Fri,  9 Jun 2023 02:37:15 +0000
Message-Id: <20230609023715.1248099-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 02:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103194

Latest version of grpc fails to build nativesdk variant since it finds
and tries to execute protoc binary from nativesdk-protobuf instead of
protobuf-native. Shortcut the detection logic by pointing to the correct
version of protoc binary in native sysroot.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb b/meta-oe/recip=
es-devtools/grpc/grpc_1.50.1.bb
index 7b8a25c27..958992e1e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.50.1.bb
@@ -37,6 +37,7 @@ EXTRA_OECMAKE =3D " \
     -DgRPC_ZLIB_PROVIDER=3Dpackage \
     -DgRPC_SSL_PROVIDER=3Dpackage \
     -DgRPC_PROTOBUF_PROVIDER=3Dpackage \
+    -D_gRPC_PROTOBUF_PROTOC_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/protoc=
 \
     -DgRPC_ABSL_PROVIDER=3Dpackage \
     -DgRPC_RE2_PROVIDER=3Dpackage \
     -DgRPC_INSTALL=3DON \
--=20
2.25.1


