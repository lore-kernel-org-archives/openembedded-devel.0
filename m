Received: from C02VH2K5HV2R.localdomain (C02VH2K5HV2R.localdomain [81.96.232.39])
 by mx.groups.io with SMTP id smtpd.web10.534.1611867058656512603
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: c02vh2k5hv2r.localdomain, ip: 81.96.232.39, mailfrom: adrher02@c02vh2k5hv2r.localdomain)
Received: by C02VH2K5HV2R.localdomain (Postfix, from userid 501)
	id C9A22983B2B7; Wed, 16 Dec 2020 09:37:59 +0000 (GMT)
From: "Adrian Herrera" <adrian.herrera@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [meta-oe][PATCH] cppunit: add support for native version
Date: Wed, 16 Dec 2020 09:37:47 +0000
Message-Id: <20201216093747.37372-1-adrian.herrera@arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is useful for native tools relying on CppUnit to test their
functionality.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: I9f6bfcbddf3a67696395eb1061352b9ca1cd7036
---
 meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-test/cppunit/cppunit_1.15.1.bb b/meta-oe/rec=
ipes-test/cppunit/cppunit_1.15.1.bb
index 92db31e1e..f4871ee77 100644
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
2.29.2

