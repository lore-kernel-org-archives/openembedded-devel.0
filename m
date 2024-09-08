Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18F6ECE57A
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:05:04 +0000 (UTC)
Received: from sypressi2.dnainternet.net (sypressi2.dnainternet.net [83.102.40.154])
 by mx.groups.io with SMTP id smtpd.web10.28081.1725793502735745300
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.154, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id EA20DFE0B;
	Sun,  8 Sep 2024 14:05:00 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id JUX1Gk05Wl0j; Sun,  8 Sep 2024 14:05:00 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id B4B22FA6C;
	Sun,  8 Sep 2024 14:05:00 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id 516003FF8;
	Sun,  8 Sep 2024 14:04:55 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 05/19] python3-email-validator: Fix LICENSE
Date: Sun,  8 Sep 2024 14:04:18 +0300
Message-Id: <20240908110432.31837-5-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112129

Both https://pypi.org/project/email-validator/ and
https://github.com/JoshData/python-email-validator/blob/v2.1.1/LICENSE
declare this project is subject to 'Unlicense'.

For additional reference, see upstream commit
https://github.com/JoshData/python-email-validator/commit/5d72f5341282118=
9ebc826100fb2a673530c5ac6
("Relicense under the Unlicense (instead of CC0)")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-email-validator_2.1.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_=
2.1.1.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.=
1.1.bb
index 90a22e5a0..746d56d18 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.b=
b
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.b=
b
@@ -1,6 +1,6 @@
 SUMMARY =3D "A robust email address syntax and deliverability validation=
 library."
 SECTION =3D "devel/python"
-LICENSE =3D "CC0-1.0"
+LICENSE =3D "Unlicense"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4c3197e2059016a3=
97e"
=20
 SRC_URI[sha256sum] =3D "200a70680ba08904be6d1eef729205cc0d687634399a5924=
d842533efb824b84"
--=20
2.39.2


