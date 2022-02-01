Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B270C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:35:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.50647.1643733310592080334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E1F7113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389E63F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:35:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/14] python3-jsonpath-rw: set correct license
Date: Tue,  1 Feb 2022 16:34:54 +0000
Message-Id: <20220201163507.1320861-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:35:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95186

This package is Apache-2.0 licensed, not BSD.

Also set the license checksum to the specific fragment of the README.rst
which states the license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.=
0.bb b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
index 51280eb9e2..b1af0f0336 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpath-rw_1.4.0.bb
@@ -1,10 +1,9 @@
 DESCRIPTION =3D "A robust and significantly extended implementation of J=
SONPath for Python"
 HOMEPAGE =3D "https://github.com/kennknowles/python-jsonpath-rw"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD+"
-LIC_FILES_CHKSUM =3D "file://README.rst;md5=3D02384665f821c394981e0dd1fa=
ec9a7d"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://README.rst;beginline=3D198;endline=3D215;md=
5=3D2866908485c18dc999b6c8dc608563ec"
=20
-SRC_URI[md5sum] =3D "3a807e05c2c12158fc6bb0a402fd5778"
 SRC_URI[sha256sum] =3D "05c471281c45ae113f6103d1268ec7a4831a2e96aa80de45=
edc89b11fac4fbec"
=20
 inherit pypi setuptools3
--=20
2.25.1


