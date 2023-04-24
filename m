Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FAADC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 20:01:23 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.62253.1682366476400555072
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Apr 2023 13:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 52DC2DE8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 22:01:09 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.38.153]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pr2N1-3WMkxF0; Mon, 24 Apr 2023 22:01:07 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [mickledore][meta-oe][PATCH] polkit: update SRC_URI
Date: Mon, 24 Apr 2023 22:01:00 +0200
Message-Id: <20230424200100.754047-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682366467-85B50C3F-C39A3B86/0/0 CLEAN NORMAL
X-TOI-MSGID: 4aa1d3a9-57d0-4343-9d7a-76b2bb6d2b63
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 20:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102185

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/polkit/polkit_122.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_122.bb b/meta-oe/reci=
pes-extended/polkit/polkit_122.bb
index b441da744..290640626 100644
--- a/meta-oe/recipes-extended/polkit/polkit_122.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_122.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/po=
lkit"
 LICENSE =3D "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D155db86cdbafa7532b41f39040928=
3eb"
=20
-SRC_URI =3D "git://github.com/freedesktop/polkit.git;protocol=3Dhttps;br=
anch=3Dmaster"
+SRC_URI =3D "git://gitlab.freedesktop.org/polkit/polkit.git;protocol=3Dh=
ttps;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
 SRCREV =3D "da87c5698019897dd731bb2cbb54ebd9c9481f52"
--=20
2.34.1


