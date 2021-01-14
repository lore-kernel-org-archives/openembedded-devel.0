Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2.1610622903660428292
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jan 2021 03:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 468CDED1
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 03:15:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6BF23F719
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Jan 2021 03:15:01 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] cppunit: add support for native version
Date: Thu, 14 Jan 2021 11:14:57 +0000
Message-Id: <20210114111458.2170077-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

This is useful for native tools relying on CppUnit to test their
functionality.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: I9f6bfcbddf3a67696395eb1061352b9ca1cd7036
---
 meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb b/meta-oe/rec=
ipes-test/cppunit/cppunit_1.15.1.bb
index 92db31e1ea..f4871ee778 100644
--- a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
+++ b/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb
@@ -12,3 +12,5 @@ SRC_URI[md5sum] =3D "9dc669e6145cadd9674873e24943e6dd"
 SRC_URI[sha256sum] =3D "89c5c6665337f56fd2db36bc3805a5619709d51fb136e519=
37072f63fcc717a7"
=20
 inherit autotools
+
+BBCLASSEXTEND =3D "native"
--=20
2.25.1

