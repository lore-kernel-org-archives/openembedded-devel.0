Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2EAC43217
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7B61042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53DE83F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/19] python3-lxml: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:35 +0000
Message-Id: <20211118161138.663375-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94041

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Also update the HOMEPAGE.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/=
meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
index 669c2eaeeb..d5594847f4 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
@@ -4,9 +4,9 @@ libxslt libraries. It provides safe and convenient access=
 to these \
 libraries using the ElementTree API. It extends the ElementTree API \
 significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
 C14N and much more."
-HOMEPAGE =3D "http://codespeak.net/lxml"
+HOMEPAGE =3D "https://lxml.de/"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD & GPLv2 & MIT & PSF"
+LICENSE =3D "BSD-3-Clause & GPLv2 & MIT & PSF"
 LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3De4c045ebad958ead4b48008f=
70838403 \
                     file://doc/licenses/elementtree.txt;md5=3Deb34d036a6=
e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=3D700a1fc17f4797d4f2=
d34970c8ee694b \
--=20
2.25.1


