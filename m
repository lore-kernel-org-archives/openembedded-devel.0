Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B9C982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:01:22 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47498.1789992075198603544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=UY9P7b0M;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd96.aul.t-online.de (fwd96.aul.t-online.de [10.223.144.122])
	by mailout10.t-online.de (Postfix) with SMTP id 57DDE380ED
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 14:01:13 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd96.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8chq-1YmOCv0; Mon, 21 Sep 2026 14:01:10 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][RFC][PATCH 2/2] RFC: python3-behave: switch to a six-free main snapshot
Date: Mon, 21 Sep 2026 14:00:58 +0200
Message-ID: <20260921120058.55586-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921120058.55586-1-f_l_k@t-online.de>
References: <20260921120058.55586-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789992070-02FFA9BA-A5714DBB/0/0 CLEAN NORMAL
X-TOI-MSGID: a060601a-65e9-4877-9e58-9c1350ae8d82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789992073; i=f_l_k@t-online.de;
	bh=+2DVcw9klZn4AbPCPxwDfexQmvAYjVD+BWA4V54ZMxM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=UY9P7b0Mlnlr0qXInheLaIpAHJ023Au0vlTbgi8Yp5LoxZD73Di1pnFJzvoznKw+J
	 M+o8nCn4X2xKwX4bNL2tP/uBP6V4zgVOmXaupcYymvR1AnnsZoMB/9KqKVH6L/58hk
	 /4S3jJR1Oc1DRqZGiT8swR7YLBKWkTgwjT773DTMrQjelFIbNlJuxgLMKQdCvYZgCm
	 FKrx1QIE9A/vpT8e0Qw8SWnWjxvifzI2vk/D7LxpK4m7EDULzqOrFo/iqRIKilTcZT
	 hEPLabjb4iXBSFFyLNBsGF2QxxigSm2ZcnQnTms6ElTn/JJgB+YFYgEfa3sCVGcm2s
	 uasaHYn7/aKiA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130155

The 1.3.3 snapshot on release/v1.3.x uses six in 68 files. Upstream has
removed six on main, so take a snapshot from there instead of carrying a
large local patch. main also replaces the cucumber-tag-expressions-only
matcher setup with cucumber-expressions and drops the tomli dependency
for Python 3.11 and newer.

Sent as RFC because main has not been released yet: its own version file
still says 1.4.0.dev0, so the version the recipe claims may still change
before upstream tags 1.4.0.

Built for intel-corei7-64.

AI-Generated: Uses Claude Code (Claude Opus 5)
---
 .../{python3-behave_1.3.3.bb =3D> python3-behave_1.4.0.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-behave_1.3.3.bb =3D>=
 python3-behave_1.4.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb =
b/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
index 9be8f25b44..c514fe7792 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
@@ -4,8 +4,8 @@ LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1fca0a9c7e4e4148d675b4dafd5c1=
e80"
=20
 PV .=3D "+git${SRCREV}"
-SRCREV =3D "7673da8324be5588642b23511ca4d7a134a0b0c1"
-SRC_URI +=3D "git://github.com/behave/behave;branch=3Drelease/v1.3.x;pro=
tocol=3Dhttps"
+SRCREV =3D "aca602b4410163fe4be045ce86c9d76ec34a717a"
+SRC_URI +=3D "git://github.com/behave/behave;branch=3Dmain;protocol=3Dht=
tps"
=20
=20
 inherit python_setuptools_build_meta
@@ -13,8 +13,9 @@ inherit python_setuptools_build_meta
 DEPENDS +=3D "python3-wheel-native"
=20
 RDEPENDS:${PN} +=3D " \
+    python3-cucumber-expressions \
+    python3-cucumber-tag-expressions \
+    python3-parse \
     python3-parse-type \
     python3-setuptools \
-    python3-six \
-    python3-cucumber-tag-expressions \
     "
--=20
2.55.0


