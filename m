Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB017E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:05:14 +0000 (UTC)
Received: from sinikuusama2.dnainternet.net (sinikuusama2.dnainternet.net [83.102.40.152])
 by mx.groups.io with SMTP id smtpd.web11.27954.1725793508121407391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.152, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 8EA1ADF03;
	Sun,  8 Sep 2024 14:05:06 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sinikuusama2.dnainternet.net ([83.102.40.152])
	by localhost (sinikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id BLnoGQ6F5ljz; Sun,  8 Sep 2024 14:05:06 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sinikuusama2.dnainternet.net (Postfix) with ESMTP id 46CD5DED2;
	Sun,  8 Sep 2024 14:05:06 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id D01B63FF5;
	Sun,  8 Sep 2024 14:05:00 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 06/19] python3-lru-dict: Fix LICENSE and change SUMMARY to DESCRIPTION
Date: Sun,  8 Sep 2024 14:04:19 +0300
Message-Id: <20240908110432.31837-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112130

According to https://pypi.org/project/lru-dict/ and
https://github.com/amitdev/lru-dict/blob/v1.3.0/LICENSE the project is
licensed under MIT.

Also change SUMMARY to DESCRIPTION as it's value is clearly over 72
characters long.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.b=
b b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
index e9535fa6f..51f3860b0 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.3.0.bb
@@ -1,7 +1,7 @@
-SUMMARY =3D "A fixed size dict like container which evicts Least Recentl=
y Used (LRU) items once size limit is exceeded."
+DESCRIPTION =3D "A fixed size dict like container which evicts Least Rec=
ently Used (LRU) items once size limit is exceeded."
 HOMEPAGE =3D "https://github.com/amitdev/lru-dict"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9d10a486ee04034fdef5162fd791f=
153"
=20
 SRC_URI[sha256sum] =3D "54fd1966d6bd1fcde781596cb86068214edeebff1db13a2c=
ea11079e3fd07b6b"
--=20
2.39.2


