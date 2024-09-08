Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A0CE6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:05:24 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web11.27958.1725793519180181503
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 9EF0EDF03;
	Sun,  8 Sep 2024 14:05:17 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id cyKbD8MGDJVL; Sun,  8 Sep 2024 14:05:17 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 66B61DED2;
	Sun,  8 Sep 2024 14:05:17 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 01D6F4006;
	Sun,  8 Sep 2024 14:05:11 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 08/19] python3-parse-type: Fix LICENSE
Date: Sun,  8 Sep 2024 14:04:21 +0300
Message-Id: <20240908110432.31837-8-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112132

According to https://pypi.org/project/parse-type/ and
https://github.com/jenisys/parse_type/blob/v0.6.2/LICENSE the
project is subject to MIT license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2=
.bb b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
index a7d8cd86c..57dfc5a50 100644
--- a/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse-type_0.6.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Simplifies building parse types based on the parse module"
 HOMEPAGE =3D "https://github.com/jenisys/parse_type"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e469278ace89c246d52505acc39c=
3da"
=20
 SRC_URI[sha256sum] =3D "79b1f2497060d0928bc46016793f1fca1057c4aacdf15ef8=
76aa48d75a73a355"
--=20
2.39.2


