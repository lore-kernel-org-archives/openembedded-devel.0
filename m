Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5910C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 10:12:47 +0000 (UTC)
Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web12.4769.1637575961885570527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 02:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4HyNPL6KGgzllmD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 11:12:38 +0100 (CET)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4HyNPL3gMHz30hM
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 11:12:38 +0100 (CET)
Received: from localhost.localdomain (192.168.54.242) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 22 Nov
 2021 11:12:37 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-python][PATCH] python3-gcovr: add recipe
Date: Mon, 22 Nov 2021 11:12:04 +0100
Message-ID: <20211122101204.10405-1-ceggers@arri.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.242]
X-RMX-ID: 20211122-111238-WSgBhRphdKsR-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 10:12:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94090

Self description from the website: Gcovr provides a utility for managing
the use of the GNU gcov utility and generating summarized code coverage
results. This command is inspired by the Python coverage.py package,
which provides a similar utility for Python.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../recipes-devtools/python/python3-gcovr_5.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gcovr_5.0=
.bb

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb b/m=
eta-python/recipes-devtools/python/python3-gcovr_5.0.bb
new file mode 100644
index 000000000000..330831a0b3d9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION =3D "generate GCC code coverage reports"
+HOMEPAGE =3D "https://gcovr.com"
+SECTION =3D "devel/python"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D08208c66520e8d69d53674831=
86d94ed"
+
+SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3D=
https"
+SRCREV =3D "2b50284e8a6792b4ddcba14e2050c5c05f15deb6"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS:${PN} +=3D "${PYTHON_PN}-jinja2 ${PYTHON_PN}-lxml ${PYTHON_PN}-=
setuptools ${PYTHON_PN}-pygments"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler


