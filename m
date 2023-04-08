Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BB3C77B6E
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 15:20:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.14214.1680967214317004413
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Apr 2023 08:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id C9C32550C
	for <openembedded-devel@lists.openembedded.org>; Sat,  8 Apr 2023 17:20:12 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.229.22]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plAMO-4aRAWo0; Sat, 8 Apr 2023 17:20:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] libnfs: add recipe
Date: Sat,  8 Apr 2023 17:19:57 +0200
Message-Id: <20230408151957.10322-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408151957.10322-1-f_l_k@t-online.de>
References: <20230408151957.10322-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680967212-EEFFAC53-BE15881D/0/0 CLEAN NORMAL
X-TOI-MSGID: 1962cf4c-1888-4f63-be79-59bf8047ed78
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Apr 2023 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101996

This package is e.g. needed as a dependency for kodi or gvfs

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_5.0.2.bb
new file mode 100644
index 000000000..7a40f4efc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "NFS client library"
+HOMEPAGE =3D "https://github.com/sahlberg/libnfs"
+LICENSE =3D "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D825301ba17efc9d188ee0abd4b924=
ada"
+
+SRC_URI =3D "git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branc=
h=3Dmaster"
+SRCREV =3D "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.34.1


