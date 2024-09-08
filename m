Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17C3E6FE49
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 11:04:54 +0000 (UTC)
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net [83.102.40.153])
 by mx.groups.io with SMTP id smtpd.web11.27945.1725793486120350800
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 04:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 83.102.40.153, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 63A121055D;
	Sun,  8 Sep 2024 14:04:44 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id 1iefOrgpcFWQ; Sun,  8 Sep 2024 14:04:44 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 2DB6910729;
	Sun,  8 Sep 2024 14:04:44 +0300 (EEST)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id BB89F3FF5;
	Sun,  8 Sep 2024 14:04:38 +0300 (EEST)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH 02/19] python3-ansi2html: Fix HOMEPAGE and LICENSE
Date: Sun,  8 Sep 2024 14:04:15 +0300
Message-Id: <20240908110432.31837-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908110432.31837-1-niko.mauno@vaisala.com>
References: <20240908110432.31837-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 11:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112126

Update HOMEPAGE to the url which old homepage address redirects to, and
change LICENSE value to match what is stated in the README file:
https://github.com/pycontribs/ansi2html?tab=3Dreadme-ov-file#license
as well as source code comment:
https://github.com/pycontribs/ansi2html/blob/v1.9.1/src/ansi2html/convert=
er.py#L9-L12
also LICENSE file is 'LESSER' variant:
https://github.com/pycontribs/ansi2html/blob/v1.9.1/LICENSE#L1

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-ansi2html_1.9.1.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.=
bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
index 6af898917..abe27c4d6 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.1.bb
@@ -1,7 +1,7 @@
 DESCRPTION =3D "ansi2html - Convert text with ANSI color codes to HTML o=
r to LaTeX"
-HOMEPAGE =3D "https://github.com/ralphbean/ansi2html"
+HOMEPAGE =3D "https://github.com/pycontribs/ansi2html"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3000208d539ec061b899bce1d9ce9=
404"
-LICENSE =3D "GPL-3.0-only"
+LICENSE =3D "LGPL-3.0-or-later"
=20
 PYPI_PACKAGE =3D "ansi2html"
=20
--=20
2.39.2


