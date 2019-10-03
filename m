Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
X-Greylist: delayed 546 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Oct 2019 14:16:40 UTC
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 66E6460017
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 14:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A87619C02C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 10:07:35 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032) with ESMTP id 7e4aK93uAJYl
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 10:07:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 13A179C032C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 10:07:35 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id OyZf7dcpnlMY
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 10:07:34 -0400 (EDT)
Received: from sulaco.home (lfbn-1-7821-217.w92-167.abo.wanadoo.fr
	[92.167.224.217])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A9F369C02C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 10:07:34 -0400 (EDT)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Oct 2019 16:07:29 +0200
Message-Id: <20191003140729.28352-1-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-toml: add recipes for python2 and python3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Oct 2019 14:16:40 -0000
Content-Transfer-Encoding: quoted-printable

This package is a Python library for parsing and creating TOML [1].

Another python TOML parser library named pytoml already exists in
meta-oe/recipes-devtools/python/python*-pytoml_*.bb but this library is
deprecated and it is explicitly explained to consider using the toml
package instead [2].

1: https://github.com/toml-lang/toml
2: https://github.com/avakar/pytoml/commit/cd2a62e1444cda2c517b02d36b9715=
1acf379b88

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 meta-python/recipes-devtools/python/python-toml.inc    | 10 ++++++++++
 .../recipes-devtools/python/python-toml_0.10.0.bb      |  6 ++++++
 .../recipes-devtools/python/python3-toml_0.10.0.bb     |  6 ++++++
 3 files changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-toml.inc
 create mode 100644 meta-python/recipes-devtools/python/python-toml_0.10.=
0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10=
.0.bb

diff --git a/meta-python/recipes-devtools/python/python-toml.inc b/meta-p=
ython/recipes-devtools/python/python-toml.inc
new file mode 100644
index 000000000..a3b3dfc86
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-toml.inc
@@ -0,0 +1,10 @@
+SUMMARY =3D "Python Library for Tom's Obvious, Minimal Language"
+HOMEPAGE =3D "https://github.com/uiri/toml"
+LICENSE =3D "MIT"
+SECTION =3D "devel/python"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d6012eea477117abf51c31262a15=
2f8"
+
+SRC_URI[md5sum] =3D "63fffbe2d632865ec29cd69bfdf36682"
+SRC_URI[sha256sum] =3D "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66=
df18ce5f05e73d5c"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-toml_0.10.0.bb b/=
meta-python/recipes-devtools/python/python-toml_0.10.0.bb
new file mode 100644
index 000000000..3c4acce67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-toml_0.10.0.bb
@@ -0,0 +1,6 @@
+inherit setuptools
+require python-toml.inc
+
+RDEPENDS_${PN} +=3D " \
+    ${PYTHON_PN}-datetime \
+"
diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b=
/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
new file mode 100644
index 000000000..cebb41a53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-toml.inc
+
+RDEPENDS_${PN} +=3D " \
+    ${PYTHON_PN}-misc \
+"
--=20
2.20.1


