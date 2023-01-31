Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEA7C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 17:09:14 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.113.1675184944549797829
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 09:09:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout02.t-online.de (Postfix) with SMTP id AA12214C3F
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 18:09:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.44]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pMu7x-12tof30; Tue, 31 Jan 2023 18:09:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/3] python3-pycups: add recipe
Date: Tue, 31 Jan 2023 18:08:46 +0100
Message-Id: <20230131170848.367522-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675184942-FAFFE992-F3774A88/0/0 CLEAN NORMAL
X-TOI-MSGID: 0490de2d-9cd4-4c98-85b5-4b95f4108b28
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 17:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100880

This is a runtime dependency for system-config-printer

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-printing/cups/python3-pycups.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/python3-pycups.bb

diff --git a/meta-oe/recipes-printing/cups/python3-pycups.bb b/meta-oe/re=
cipes-printing/cups/python3-pycups.bb
new file mode 100644
index 000000000..6968170d9
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/python3-pycups.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "CUPS bindings for Python"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3961efb5442165351852152985344=
4c4"
+
+RDEPENDS:${PN} =3D "python3"
+
+inherit setuptools3 pypi
+
+PV =3D "2.0.1"
+
+SRC_URI[sha256sum] =3D "e880d7d7147959ead5cb34764f08b97b41385b36eb8256e8=
af1ce163dbcccce8"
--=20
2.34.1


