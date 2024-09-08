Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D774BCD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:04:44 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web10.28077.1725793482161194672
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id E2F83DED2;
	Sun,  8 Sep 2024 14:04:38 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id qZmGvHoq0lnj; Sun,  8 Sep 2024 14:04:38 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id A43A4DE6A;
	Sun,  8 Sep 2024 14:04:38 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 34AA93FF5;
	Sun,  8 Sep 2024 14:04:34 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 01/19] python3-xlsxwriter: Fix LICENSE
Date: Sun,  8 Sep 2024 14:04:14 +0300
Message-Id: <20240908110432.31837-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112125

According to homepage https://xlsxwriter.readthedocs.io/license.html
and pypi page https://pypi.org/project/XlsxWriter/ as well as
https://github.com/jmcnamara/XlsxWriter/blob/RELEASE_3.1.9/LICENSE.txt
the module is licensed under BSD-2-Clause.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9=
.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
index ee7dab35c..4e23feebb 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.9.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Python 2 and 3 compatibility library"
 HOMEPAGE =3D "https://xlsxwriter.readthedocs.io"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D12d9fac1f0049be71ab5aa4a7=
8da02b0"
=20
 inherit pypi setuptools3
--=20
2.39.2


