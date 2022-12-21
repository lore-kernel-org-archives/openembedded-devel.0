Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A1AC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 05:10:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.12077.1671599418111224069
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 21:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout07.t-online.de (Postfix) with SMTP id 131DF1A631
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 06:10:16 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.43]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7rMs-0V8NKT0; Wed, 21 Dec 2022 06:10:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] basu: import recipe from meta-wayland
Date: Wed, 21 Dec 2022 06:10:04 +0100
Message-Id: <20221221051004.28230-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671599414-E5FDF07E-89BD6A53/0/0 CLEAN NORMAL
X-TOI-MSGID: 46c7ee31-0141-47d4-bccf-109726576a35
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 05:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100171

basu provides the sdbus api for builds without systemd.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-core/basu/basu_0.2.1.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-core/basu/basu_0.2.1.bb

diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-co=
re/basu/basu_0.2.1.bb
new file mode 100644
index 000000000..500408e11
--- /dev/null
+++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "The sd-bus library, extracted from systemd."
+HOMEPAGE =3D "https://sr.ht/~emersion/basu"
+SECTION =3D "base"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079=
008b364516c"
+
+SRC_URI =3D "git://git.sr.ht/~emersion/basu;protocol=3Dhttps;branch=3Dma=
ster"
+
+DEPENDS +=3D "gperf-native"
+
+S =3D "${WORKDIR}/git"
+PV =3D "0.2.1"
+SRCREV =3D "684a41d68cfbb05e38aacb60a8548e21ddfbecdb"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[libcap] =3D "-Dlibcap=3Denabled,-Dlibcap=3Ddisabled,libcap=
"
+PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit"
+
+EXTRA_OEMESON +=3D "--buildtype release"
--=20
2.34.1


