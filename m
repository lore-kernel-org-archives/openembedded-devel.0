Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD25BECE57A
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:05:14 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web11.27957.1725793513681951108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 24856DE6A;
	Sun,  8 Sep 2024 14:05:12 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id aDQwWwLHC3s5; Sun,  8 Sep 2024 14:05:11 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id DA6A9DF03;
	Sun,  8 Sep 2024 14:05:11 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 619594006;
	Sun,  8 Sep 2024 14:05:06 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 07/19] python3-mock: Fix LICENSE
Date: Sun,  8 Sep 2024 14:04:20 +0300
Message-Id: <20240908110432.31837-7-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112131

According to
https://github.com/testing-cabal/mock/blob/5.1.0/LICENSE.txt the
project is subject to BSD-2-Clause license. (Also
https://pypi.org/project/mock/ states 'BSD License'.)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-mock_5.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb b/=
meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
index d9ecb9d4c..1b89260e1 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.1.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "A Python Mocking and Patching Library for Testing"
 HOMEPAGE =3D "https://pypi.python.org/pypi/mock"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dde9dfbf780446b18aab11f00b=
aaf5b7e"
=20
 inherit pypi setuptools3
--=20
2.39.2


