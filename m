Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15AFC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 19:31:52 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.1701.1705951909025195275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 11:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 922B01EA7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 20:31:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.62]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rS00q-0XEiVn0; Mon, 22 Jan 2024 20:31:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] luajit: allow to build on supported platforms
Date: Mon, 22 Jan 2024 20:31:09 +0100
Message-ID: <20240122193109.3041355-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122193109.3041355-1-f_l_k@t-online.de>
References: <20240122193109.3041355-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705951876-0CA7E850-DABA84EF/0/0 CLEAN NORMAL
X-TOI-MSGID: e6e95c9b-533c-4544-a855-93951ce97cda
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 19:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108373

According to documentation mips,mips64 and powerpc are supported
platforms. Adjust accordingly

This was tested to work for mips64, where luajit compiled without
issue.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/reci=
pes-devtools/luajit/luajit_git.bb
index cadc9843d..240271d41 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -91,10 +91,7 @@ FILES:${PN}-dev +=3D "${libdir}/libluajit-5.1.a \
 "
 FILES:luajit-common =3D "${datadir}/${BPN}-${PV}"
=20
-# mips64/ppc/ppc64/riscv64/riscv32 is not supported in this release
-COMPATIBLE_HOST:mipsarchn32 =3D "null"
-COMPATIBLE_HOST:mipsarchn64 =3D "null"
-COMPATIBLE_HOST:powerpc =3D "null"
+# ppc64/riscv64/riscv32 is not supported in this release
 COMPATIBLE_HOST:powerpc64 =3D "null"
 COMPATIBLE_HOST:powerpc64le =3D "null"
 COMPATIBLE_HOST:riscv64 =3D "null"
--=20
2.43.0


