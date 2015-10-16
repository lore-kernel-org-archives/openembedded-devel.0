Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 525BE77163
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 17:26:13 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so21274496wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=ySuhZkwhWRE1DXDSZ27WoiZ1FRipsjd79dK4mB50tvY=;
	b=brrYeoXU8slKhA4dfSsmF6k2r35Y2bYk/YDC6ItrFdGjLKJ6HQsZr4jVBYP9JK8kO9
	xJBeqzXjtVXkShMGntI8UsRRF56wBajtdNblpqV15EHCbQUyzGbPkiTdlQFL8PPCVzov
	L1RJrb7pHUx9xKUUOGHBYgdtnMGZb834T3/gG18K33P34KMtLWTVckb9eY+hUKrr5L2n
	dIR0RKF9iVSD/u47fz8BmsQxbfILQZdkHYfSL5ntvaFggKrstDiX6ZdxxW0pQg20JOtz
	157t5r1Jhq0Y32xB3Utyw4/bcWA/glUH6TUemeCwlfbby826dRKNCpMEPSCjD0WOOMgV
	m3oQ==
X-Received: by 10.180.198.12 with SMTP id iy12mr6381507wic.72.1445016374045;
	Fri, 16 Oct 2015 10:26:14 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	it4sm23659034wjb.0.2015.10.16.10.26.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Oct 2015 10:26:13 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <2299DC06-2647-4E8F-97DF-A070CFDF65E9@gmail.com>
Date: Fri, 16 Oct 2015 19:26:12 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 2/5] Revert "Avoid parse time errors due to dependency on x11, for distros without x11"
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
X-List-Received-Date: Fri, 16 Oct 2015 17:26:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since OpenJDK-8 builds find without x11 and icedtea does either (native
builds), the restriction is a bit to hasty.

This reverts commit 24b98ac3a6ca7fadfba24709aac8d0b71316e299.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/cacao/cacao_1.6.1.bb       | 4 +---
 recipes-core/classpath/classpath.inc    | 4 +---
 recipes-core/jamvm/jamvm.inc            | 4 +---
 recipes-core/openjdk/openjdk-common.inc | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb =
b/recipes-core/cacao/cacao_1.6.1.bb
index 564dd1e..65aaf93 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -15,9 +15,7 @@ SRC_URI =3D =
"http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-
 SRC_URI[md5sum] =3D "2c18478404afd1cffdd15ad1e9d85a57"
 SRC_URI[sha256sum] =3D =
"eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
=20
-inherit java autotools-brokensep update-alternatives pkgconfig =
distro_features_check
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
+inherit java autotools-brokensep update-alternatives pkgconfig
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
2.4.3


--=20
Jens Rehsack - rehsack@gmail.com


