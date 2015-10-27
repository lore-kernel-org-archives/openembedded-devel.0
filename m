Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8765B608B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:27:38 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so176075848wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=qs8sF9Rqm+CcGeaAALKzRMxt2QieSi0P519sR9vFubI=;
	b=ZaO+nMoURDj/Y+Iem0k2ESOfW7QLOUt+XAU/AwkX8+081ePsNF43oaaawHcDgSgnJJ
	HaNHq/FPP4jhZSzigw/l6Ax8JsfEqFNW8TgdgRt278e1KL0Y6RuVehfozQnIjq85wBJY
	xj5ByFDk42K1bv9WXMtiB+OY3aASPgP70niHKAUZfqnypvj/4qhrClAuSsz2AHlvss97
	/8RwRBY0sdf0D375cTpe/8lMrz28tGIwwZ1uE4JU5a2yWdf3al91QziNaw7H5YdXIGNj
	6FrTsVM6E/oKxoNb8Mb7ubjAFTF7rC+yCp+YNuB8V4dFmDktjYzYXKYL5ubZezPlWPMY
	oPFA==
X-Received: by 10.194.205.33 with SMTP id ld1mr8694544wjc.46.1445977658077;
	Tue, 27 Oct 2015 13:27:38 -0700 (PDT)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	jt9sm31541906wjc.24.2015.10.27.13.27.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Oct 2015 13:27:37 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <CA37575B-457D-4C92-8A2F-307E94BB47D8@gmail.com>
Date: Tue, 27 Oct 2015 21:27:36 +0100
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 1/4] Avoid parse time errors due to dependency on x11, for distros without x11
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Oct 2015 20:27:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


BitBake raises some errors when processing recipes that depend on x11
for distros that don't have x11 in DISTRO_FEATURES. To work around
that issue, REQUIRED_DISTRO_FEATURES =3D "x11" (from
distro_features_check.bbclass) has been set for the following recipes:

* cacao (_class-target)
* classpath (_class-target)
* jamvm (_class-target)
* openjdk-7-release

That makes BitBake skip those recipes during the cache generation
(they'd still be parsed, but ignored).

This patch improves the idea from Mario Domenech Goulart =
<mario@ossystems.com.br>

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/cacao/cacao_1.6.1.bb             | 1 +
 recipes-core/classpath/classpath.inc          | 4 +---
 recipes-core/classpath/classpath_0.99.bb      | 4 ++++
 recipes-core/jamvm/jamvm.inc                  | 4 +---
 recipes-core/jamvm/jamvm_git.bb               | 4 ++++
 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb | 4 ++++
 recipes-core/openjdk/openjdk-common.inc       | 4 +---
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index 564dd1e..f88293b 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -18,6 +18,7 @@ SRC_URI[sha256sum] =3D =
"eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6
 inherit java autotools-brokensep update-alternatives pkgconfig =
distro_features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
+REQUIRED_DISTRO_FEATURES_class-native :=3D ""
=20
 EXTRA_OECONF_class-native =3D "\
     --enable-debug \
diff --git a/recipes-core/classpath/classpath.inc =
b/recipes-core/classpath/classpath.inc
index 0f760fe..1bdfd78 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -7,9 +7,7 @@ LICENSE =3D "Classpath"
=20
 PBN =3D "classpath"
=20
-inherit autotools java gettext distro_features_check
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
+inherit autotools java gettext
=20
 DEPENDS =3D "virtual/javac-native fastjar-native zip-native gmp =
antlr-native gtk+ gconf libxtst file"
=20
diff --git a/recipes-core/classpath/classpath_0.99.bb =
b/recipes-core/classpath/classpath_0.99.bb
index 8b3a6e3..6aa3baa 100644
--- a/recipes-core/classpath/classpath_0.99.bb
+++ b/recipes-core/classpath/classpath_0.99.bb
@@ -1,5 +1,9 @@
 require classpath.inc
=20
+inherit distro_features_check
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
+
 LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D92acc79f1f429143f4624d07b253702a"
=20
 SRC_URI +=3D " \
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index e00813e..5893cbc 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -21,9 +21,7 @@ SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "
=20
=20
-inherit java autotools update-alternatives pkgconfig =
distro_features_check
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
+inherit java autotools update-alternatives pkgconfig
=20
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET =3D "arm"
diff --git a/recipes-core/jamvm/jamvm_git.bb =
b/recipes-core/jamvm/jamvm_git.bb
index 07eed6a..63364aa 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -3,6 +3,10 @@
=20
 require jamvm.inc
=20
+inherit distro_features_check
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
+
 SRCREV =3D "ebd11bde0a97b57f0d18938c6b65468d3c932719"
 PV =3D "1.5.5+1.6.0-devel+git${SRCPV}"
=20
diff --git a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb =
b/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
index 1ca3b08..e631c13 100644
--- a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
+++ b/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
@@ -1,5 +1,9 @@
 require openjdk-7-release-85b01.inc
=20
+inherit distro_features_check
+
+REQUIRED_DISTRO_FEATURES =3D "x11"
+
 PR =3D "${INC_PR}.1"
=20
 SRC_URI[iced.md5sum] =3D "efac44117a94b9d3278988959e336e05"
diff --git a/recipes-core/openjdk/openjdk-common.inc =
b/recipes-core/openjdk/openjdk-common.inc
index e3e597a..dc26522 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,9 +17,7 @@ DEPENDS_append_libc-uclibc =3D " virtual/libiconv "
 # because structure sizes and/or alignment may differ.
 DEPENDS_append =3D " qemu-native "
=20
-inherit java autotools gettext qemu pkgconfig distro_features_check
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
+inherit java autotools gettext qemu pkgconfig
=20
 # OpenJDK uses slightly different names for certain arches. We need to =
know
 #	this to create some files which are expected by the build.
--=20
1.9.1


--=20
Jens Rehsack - rehsack@gmail.com


