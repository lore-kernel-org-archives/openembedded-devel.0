Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39515C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B56211D4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8EFE3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 13/19] python3-crypto-vectors: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:32 +0000
Message-Id: <20211118161138.663375-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94038

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cryptography-vectors_35.0.0.bb           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vec=
tors_35.0.0.bb b/meta-python/recipes-devtools/python/python3-cryptography=
-vectors_35.0.0.bb
index 474eb82343..c0ab9c85c1 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography-vectors_35=
.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography-vectors_35=
.0.0.bb
@@ -1,8 +1,10 @@
 SUMMARY =3D "Test vectors for the cryptography package."
 HOMEPAGE =3D "https://cryptography.io/"
 SECTION =3D "devel/python"
-LICENSE =3D "Apache-2.0 | BSD"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab9151=
1e4"
+LICENSE =3D "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6fae01f1d253ab9151=
1e4 \
+                    file://LICENSE.APACHE;md5=3D4e168cce331e5c827d4c2b68=
a6200e1b \
+                    file://LICENSE.BSD;md5=3D5ae30ba4123bc4f2fa49aa0b0dc=
e887b"
=20
 SRC_URI[sha256sum] =3D "978ad96822c0e007a0a3d8187eb0eafbd9eb1d67b50cfac7=
0277175e74957bfc"
=20
--=20
2.25.1


