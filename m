Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B7FC32771
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 04:45:56 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.4275.1664340353460112201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 21:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 7CD8554A2
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Sep 2022 06:45:35 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.42.142]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1odOwl-0GwyvJ0; Wed, 28 Sep 2022 06:45:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] jansson: use cmake instead of autotools
Date: Wed, 28 Sep 2022 06:45:15 +0200
Message-Id: <20220928044515.1735098-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664340323-09691417-28F38216/0/0 CLEAN NORMAL
X-TOI-MSGID: f8e097bc-4965-4751-9717-fe977733e2da
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Sep 2022 04:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98998

This fixes build with clang and lld linker

| x86_64-poky-linux-ld.lld: error: unknown argument '--default-symver'
| clang-15: error: linker command failed with exit code 1 (use -v to see =
invocation)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/jansson/jansson_2.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/r=
ecipes-extended/jansson/jansson_2.14.bb
index 945b31f58..94bb99ab7 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -10,6 +10,6 @@ SRC_URI[sha256sum] =3D "fba956f27c6ae56ce6dfd52fbf9d202=
54aad42821f74fa52f839576252
 UPSTREAM_CHECK_URI =3D "https://github.com/akheron/${BPN}/releases"
 UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools pkgconfig
+inherit cmake pkgconfig
=20
 BBCLASSEXTEND =3D "native"
--=20
2.34.1


