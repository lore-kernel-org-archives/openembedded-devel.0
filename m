Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7E0E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:05:04 +0000 (UTC)
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
 by mx.groups.io with SMTP id smtpd.web10.28079.1725793496971704422
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.153, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 6EC4010729;
	Sun,  8 Sep 2024 14:04:55 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id e8Iii2i5H7ZV; Sun,  8 Sep 2024 14:04:55 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 3A35A1055D;
	Sun,  8 Sep 2024 14:04:55 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id C02A13FF8;
	Sun,  8 Sep 2024 14:04:49 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 04/19] python3-crc32c: Amend LICENSE declaration
Date: Sun,  8 Sep 2024 14:04:17 +0300
Message-Id: <20240908110432.31837-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112128

According to https://github.com/ICRAR/crc32c/blob/v2.3/LICENSE and
https://github.com/ICRAR/crc32c?tab=3Dreadme-ov-file#license change
'LGPL-2.0-or-later' in LICENSE value to 'LGPL-2.1-or-later'.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-crc32c_2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb b/=
meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index da756ea07..125a7ad87 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "A python package implementing the crc32c algorithmin hardwa=
re and software"
 HOMEPAGE =3D "https://github.com/ICRAR/crc32c"
=20
-LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.0-or-la=
ter"
+LICENSE =3D "BSD-2-Clause & BSD-3-Clause & CRC32C-ADLER & LGPL-2.1-or-la=
ter"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3D4fbd65380cdd255951079008b364516c \
     file://LICENSE.google-crc32c;md5=3De9ed01b5e5ac9eae23fc2bb33701220c =
\
--=20
2.39.2


