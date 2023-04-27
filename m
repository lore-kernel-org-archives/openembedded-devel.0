Return-Path: <johannes.pointner@br-automation.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044D8C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 09:42:42 +0000 (UTC)
Received: from inet11.abb.com (inet11.abb.com [138.225.1.77])
 by mx.groups.io with SMTP id smtpd.web11.16227.1682588553162019625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 02:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: br-automation.com, ip: 138.225.1.77, mailfrom: johannes.pointner@br-automation.com)
Received: from brsmtp01.br-automation.co.at ([10.15.2.36])
	by inet11.abb.com (8.14.7/8.14.7) with ESMTP id 33R9gTLw019832
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 11:42:30 +0200
Received: from extmail.br-automation.com ([192.168.112.26])
          by brsmtp01.br-automation.co.at (IBM Domino Release 10.0.1FP3)
          with ESMTP id 2023042711422898-42461 ;
          Thu, 27 Apr 2023 11:42:28 +0200 
Received: from ategge3723.brdev.net ([10.43.109.145])
          by extmail.br-automation.com (HCL Domino Build V1202_05192022)
          with ESMTP id 2023042711422949-13945 ;
          Thu, 27 Apr 2023 11:42:29 +0200 
From: "Johannes Pointner" <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Johannes Pointner" <johannes.pointner@br-automation.com>
Subject: [meta-python][PATCH] python3-pyzstd: add new recipe
Date: Thu, 27 Apr 2023 11:41:17 +0200
Message-Id: <20230427094117.256986-1-johannes.pointner@br-automation.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Build V1202_05192022|May
 19, 2022) at 04/27/2023 11:42:29 AM,Serialize by Router on BRSMTPINTERN2/InternSMTP(Build V1202_05192022|May 19, 2022) at
 04/27/2023 11:42:29 AM,Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release 10.0.1FP3|August
 09, 2019) at 04/27/2023 11:42:28 AM
X-TNEFEvaluated: 1
X-Disclaimed: 29499
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 09:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102208

Add recipe for python bindings to ZStandard (zstd) compression library

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../python/python3-pyzstd=5F0.15.7.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyzstd=5F0.=
15.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd=5F0.15.7.bb=
 b/meta-python/recipes-devtools/python/python3-pyzstd=5F0.15.7.bb
new file mode 100644
index 000000000..e7a6c2108
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyzstd=5F0.15.7.bb
@@ -0,0 +1,13 @@
+DESCRIPTION =3D "Pyzstd module provides classes and functions for compress=
ing and \
+decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short n=
ame) algorithm."
+HOMEPAGE =3D "https://github.com/animalize/pyzstd"
+SECTION =3D "devel/python"
+
+LICENSE =3D "BSD-3-Clause"
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE;md5=3D8458383225d7107f3383ee5c521=
628d2"
+
+PYPI=5FPACKAGE =3D "pyzstd"
+
+SRC=5FURI[sha256sum] =3D "55e503f28f5a9d225ce9d0639e3f5b1801bacace5aea926e=
c2998e73c5150fe7"
+
+inherit pypi setuptools3
--=20
2.40.1



