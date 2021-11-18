Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F393C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3702.1637251904514145144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7904B1042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 220CB3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/19] python3-cryptography: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:31 +0000
Message-Id: <20211118161138.663375-12-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94037

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-cryptography_3.3.2.bb   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3=
.2.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
index 8808b81625..a4c3344278 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
@@ -1,8 +1,10 @@
 SUMMARY =3D "Provides cryptographic recipes and primitives to python dev=
elopers"
 HOMEPAGE =3D "https://cryptography.io/"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbf405a8056a6647e7d077b0e7bc36=
aba"
+LICENSE =3D "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbf405a8056a6647e7d077b0e7bc36=
aba \
+                    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68=
a6200e1b \
+                    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dc=
e887b"
=20
 LDSHARED +=3D "-pthread"
=20
--=20
2.25.1


