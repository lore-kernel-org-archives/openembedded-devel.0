Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0DDCD4F4C
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:04:54 +0000 (UTC)
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net [83.102.40.151])
 by mx.groups.io with SMTP id smtpd.web10.28078.1725793491704382912
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.151, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id E7DF32044D;
	Sun,  8 Sep 2024 14:04:49 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id zzgoBcld_q0U; Sun,  8 Sep 2024 14:04:49 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id A76B828956;
	Sun,  8 Sep 2024 14:04:49 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 465E63FF5;
	Sun,  8 Sep 2024 14:04:44 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 03/19] python3-cbor2: Fix LICENSE and LIC_FILES_CHKSUM
Date: Sun,  8 Sep 2024 14:04:16 +0300
Message-Id: <20240908110432.31837-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112127

Both project pypi page: https://pypi.org/project/cbor2/ as well as
https://github.com/agronholm/cbor2/blob/5.6.3/LICENSE.txt state that it
is subject to MIT rather than Apache-2.0 license. Also update
LIC_FILES_CHKSUM value to reference the LICENSE.txt file from the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb b=
/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
index c9c98b6fb..69573064b 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.3.bb
@@ -1,8 +1,8 @@
 DESCRIPTION =3D "An implementation of RFC 7049 - Concise Binary Object R=
epresentation (CBOR)."
 DEPENDS +=3D"python3-setuptools-scm-native"
=20
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89ae=
a4e17d99a7cacdbeed46a0096b10"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da79e64179819c7ce293372c05=
9f1dbd8"
=20
 SRC_URI[sha256sum] =3D "e6f0ae2751c2d333a960e0807c0611494eb1245631a16796=
5acbc100509455d3"
=20
--=20
2.39.2


