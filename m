Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6307.1613561456869755885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Feb 2021 03:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F135106F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 03:30:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3A163F73B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Feb 2021 03:30:55 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-python v2] python3-intelhex: add recipe for the intelhex package
Date: Wed, 17 Feb 2021 11:30:53 +0000
Message-Id: <20210217113053.1690364-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb          |  1 +
 .../recipes-devtools/python/python3-intelhex_2.3.0.bb  | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-intelhex_=
2.3.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index e31b0b8b40..635dee1942 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -170,6 +170,7 @@ RDEPENDS_packagegroup-meta-python3 =3D "\
     python3-imageio \
     python3-incremental \
     python3-inflection \
+    python3-intelhex \
     python3-intervals \
     python3-ipaddress \
     python3-ipy \
diff --git a/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.b=
b b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
new file mode 100644
index 0000000000..befcb34780
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-intelhex_2.3.0.bb
@@ -0,0 +1,10 @@
+SUMMARY =3D "Python library for Intel HEX files manipulations"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4eba844696655c3eae07aca8e=
3a94772"
+
+SRC_URI[sha256sum] =3D "892b7361a719f4945237da8ccf754e9513db32f562885278=
5aea108dcd250093"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native nativesdk"
+
--=20
2.25.1

