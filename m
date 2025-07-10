Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D228C83F20
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:18:53 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.6376.1752146329378934492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 04:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id 35666E9D7
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:18:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.234.74]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uZpIX-1ONYWJ0; Thu, 10 Jul 2025 13:18:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] opencl-icd-loader: allow to build with cmake 4
Date: Thu, 10 Jul 2025 13:18:26 +0200
Message-ID: <20250710111827.2550131-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710111827.2550131-1-f_l_k@t-online.de>
References: <20250710111827.2550131-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1752146321-DA20150C-42920427/0/0 CLEAN NORMAL
X-TOI-MSGID: a267b9b8-6ece-4926-94eb-1a9ce325374e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118407

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb =
b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 7cfc75f5ed..2ff9a6ae7e 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-ICD-L=
oader.git;branch=3Dmain;proto
=20
 EXTRA_OECMAKE:append =3D " \
     -DOPENCL_ICD_LOADER_HEADERS_DIR=3D${STAGING_INCDIR} \
+    -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
 "
=20
 do_install() {
--=20
2.49.0


