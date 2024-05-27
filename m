Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF460C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 12:23:12 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.26233.1716812588805111194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 05:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 8593E4C3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 14:23:06 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.219]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBZNW-3HbL8r0; Mon, 27 May 2024 14:23:02 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] unicode-ucd: fix UNPACKDIR conversion leftovers
Date: Mon, 27 May 2024 14:23:37 +0200
Message-ID: <20240527122337.959894-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716812582-C57F9D1D-598D4695/0/0 CLEAN NORMAL
X-TOI-MSGID: 39cc5bfa-46d1-47ec-b3c1-dffba1a41f25
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 May 2024 12:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110535

this avoids:
WARNING: unicode-ucd-14.0.0-r0 do_unpack: unicode-ucd: the directory ${WO=
RKDIR}/${BP}
(/home/flk/poky/build-hypr/tmp/work/all-poky-linux/unicode-ucd/14.0.0/uni=
code-ucd-14.0.0)
pointed to by the S variable doesn't exist - please set S within the reci=
pe to point to
where the source has been unpacked to

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/=
meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index 0c8a10e0e..026d4ffe0 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -12,6 +12,9 @@ SRC_URI[ucd-license.sha256sum] =3D "f7830d126f59d838425=
65d3dddedc79db4ca978ed52aee
=20
 inherit allarch
=20
+S =3D "${WORKDIR}/sources"
+UNPACKDIR =3D "${S}"
+
 do_configure[noexec] =3D "1"
=20
 do_install() {
--=20
2.44.0


