Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web08.3724.1612497535544064229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 19:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.188.50])
	by smtp0.taitradio.net (Postfix) with ESMTP id 445A72204CB;
	Fri,  5 Feb 2021 16:58:53 +1300 (NZDT)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [meta-java][PATCH] classpath-native and friends: inherit native last
Date: Fri,  5 Feb 2021 16:58:46 +1300
Message-Id: <20210205035846.344799-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fixes QA Issue: classpath-native: native/nativesdk class is not inherited=
 last

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb  | 2 +-
 recipes-core/classpath/classpath-native.inc      | 2 +-
 recipes-core/ecj/libecj-bootstrap.inc            | 2 +-
 recipes-core/icedtea/icedtea7-native.inc         | 3 ++-
 recipes-core/jamvm/jamvm-initial-native_1.4.5.bb | 2 +-
 recipes-core/openjdk/openjdk-8-native.inc        | 4 ++--
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-co=
re/cacao/cacao-initial-native_0.98.bb
index 8125e88..a43d3f4 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -6,7 +6,7 @@ SECTION  =3D "interpreters"
=20
 PROVIDES =3D "virtual/java-initial-native"
=20
-inherit native autotools-brokensep
+inherit autotools-brokensep native
=20
 DEPENDS =3D "zlib-native libtool-native fastjar-native classpath-initial=
-native jikes-initial-native"
=20
diff --git a/recipes-core/classpath/classpath-native.inc b/recipes-core/c=
lasspath/classpath-native.inc
index b1de458..c81e064 100644
--- a/recipes-core/classpath/classpath-native.inc
+++ b/recipes-core/classpath/classpath-native.inc
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daf0004801732bc=
4b20d90f351cf80510"
=20
 DEPENDS =3D "fastjar-native zip-native"
=20
-inherit autotools native gettext
+inherit autotools gettext native
=20
 SRC_URI =3D "${GNU_MIRROR}/classpath/classpath-${PV}.tar.gz"
=20
diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/lib=
ecj-bootstrap.inc
index 04425f4..8f84fd0 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -9,7 +9,7 @@ DEPENDS =3D "classpath-initial-native fastjar-native jike=
s-initial-native virtual/
=20
 INC_PR =3D "r5"
=20
-inherit native java
+inherit java native
=20
 S =3D "${WORKDIR}"
=20
diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/iced=
tea/icedtea7-native.inc
index 5351fe1..f53715f 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -36,9 +36,10 @@ CFLAGS_append =3D " ${@oe.utils.conditional('HOST_COMP=
ILER_MAJOR', '9', '-Wno-erro
 # Explicitly pass -fcommon since GCC 10 defaults to -fno-common for C so=
urces
 CFLAGS_append =3D " -fcommon"
=20
-inherit native java autotools pkgconfig
+inherit java autotools pkgconfig
 inherit openjdk-build-helper
 inherit python3native
+inherit native
=20
 JAVA_HOME[unexport] =3D "1"
=20
diff --git a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb b/recipes-c=
ore/jamvm/jamvm-initial-native_1.4.5.bb
index bf005db..1f5921f 100644
--- a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
+++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.ta=
r.gz \
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET =3D "arm"
=20
-inherit native autotools pkgconfig
+inherit autotools pkgconfig native
=20
 # libdir must be modified so that jamvm-initial and -native
 # do not interfere
diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/ope=
njdk/openjdk-8-native.inc
index 92d9473..3282257 100644
--- a/recipes-core/openjdk/openjdk-8-native.inc
+++ b/recipes-core/openjdk/openjdk-8-native.inc
@@ -32,10 +32,10 @@ EXTRA_OECONF_append =3D "\
 "
 # --with-boot-jdk=3D${WORKDIR}/fake-jdk
=20
-inherit native
-
 require openjdk-8-common.inc
=20
+inherit native
+
 CFLAGS_append =3D " ${@jdk_cpp_options(d)}"
 CPPFLAGS_append =3D "${@jdk_cpp_options(d)}"
 CXXFLAGS_append =3D " ${@jdk_cpp_options(d)}"
--=20
2.25.1

