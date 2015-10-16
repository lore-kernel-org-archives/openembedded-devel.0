Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id B68EE77163
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 17:31:10 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so21430308wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 10:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=itBhmrd6I77DXJ8A3HKBG7f6WyC0t3WHgHc9iqW0UrA=;
	b=kcraofAD9dD7j8BMpuua9/UKcgf/prOVfXO2imZi/aPM8f95JVfAZQqySC1tdAEK/h
	Dha2370g6CEPoSktO81ExGnt+jKv4zyftr4CqYKbgipNCOHNIsjBAZt1p++IF7ABZekX
	ajKQaN49DM/w+4JPriOpTwsc3Dur/y17QZmKo4zuAy07rSDqU/1aqF61tGBISB/y4ONt
	H1BZftp4rjtHwjCFDdZjs8UntIdv8L2+ylBWFXknPOdipvzuaPaN4G5Xq6WZZFUS9g+L
	8yaGVP5+ElhRTV6O9NbrFTteetidCfcYm52xR6bHdIRstvl5wOaEHYUN49J1qdmULU4h
	McXw==
X-Received: by 10.180.149.167 with SMTP id ub7mr6267592wib.43.1445016670624;
	Fri, 16 Oct 2015 10:31:10 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	qq4sm23628014wjc.14.2015.10.16.10.31.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Oct 2015 10:31:10 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <29C1BE52-9B4A-4121-8BC8-0563CFFC228C@gmail.com>
Date: Fri, 16 Oct 2015 19:31:09 +0200
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH 5/5] openjdk7: remove broken/unsupported VM's
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
X-List-Received-Date: Fri, 16 Oct 2015 17:31:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Since Shark is utterly broken and cacao and jamvm are terrible slow =
compared
to zero, it's pointless to support them for targets with limited =
resources
unless there is active maintainership taken by responsible person.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/openjdk/openjdk-7-common.inc        | 31 =
------------------------
 recipes-core/openjdk/openjdk-7-release-85b01.inc | 12 ---------
 recipes-images/images/java-test-image.bb         |  4 +--
 3 files changed, 1 insertion(+), 46 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc =
b/recipes-core/openjdk/openjdk-7-common.inc
index 6ff2a79..db47af4 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -12,8 +12,6 @@ SRC_URI =3D " \
   ${JAXWS_URI} \
   ${JDK_URI} \
   ${LANGTOOLS_URI} \
-  ${CACAO_URI} \
-  ${JAMVM_URI} \
   ${OEPATCHES} \
   ${ICEDTEAPATCHES} \
   file://jvm.cfg \
@@ -60,11 +58,6 @@ export CACAO_CONFIGURE_ARGS =3D " \
=20
 JAVA_HOME[unexport] =3D "1"
=20
-# disable shark until it is fully working again
-# WITH_ADDITIONAL_VMS ?=3D "--with-additional-vms=3Dshark,cacao,jamvm"
-
-WITH_ADDITIONAL_VMS ?=3D "--with-additional-vms=3Dcacao,jamvm"
-
 # OpenJDK supports parallel compilation but uses a plain number for =
this.
 # In OE we have PARALLEL_MAKE which is the actual option passed to =
make,
 # e.g. "-j 4".
@@ -110,9 +103,6 @@ EXTRA_OECONF =3D " \
 	--with-jaxws-src-zip=3D${WORKDIR}/${JAXWS_FILE} \
 	--with-jdk-src-zip=3D${WORKDIR}/${JDK_FILE} \
 	--with-langtools-src-zip=3D${WORKDIR}/${LANGTOOLS_FILE} \
-        ${WITH_ADDITIONAL_VMS} \
-	--with-cacao-src-zip=3D${WORKDIR}/${CACAO_FILE} \
-	--with-jamvm-src-zip=3D${WORKDIR}/${JAMVM_FILE} \
 	\
 	--with-parallel-jobs=3D${JDK_JOBS} \
 	\
@@ -223,10 +213,7 @@ PACKAGES =3D " \
             ${JDKPN}-doc \
             ${JDKPN}-jdk \
             ${JDKPN}-java \
-            ${JDKPN}-vm-shark \
             ${JDKPN}-vm-zero \
-            ${JDKPN}-vm-cacao \
-	    ${JDKPN}-vm-jamvm \
             ${JDKPN}-common \
            "
=20
@@ -240,9 +227,6 @@ FILES_${JDKPN}-dbg =3D "\
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/.debug \
-        ${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug \
 	${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug \
@@ -268,12 +252,6 @@ FILES_${JDKPN}-java =3D "${JDK_HOME}/jre/bin/java"
=20
 FILES_${JDKPN}-vm-zero =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/server/"
=20
-FILES_${JDKPN}-vm-shark =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/shark/"
-
-FILES_${JDKPN}-vm-cacao =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/cacao/"
-
-FILES_${JDKPN}-vm-jamvm =3D "${JDK_HOME}/jre/lib/${JDK_ARCH}/jamvm/"
-
 FILES_${JDKPN}-common =3D "${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
                           ${JDK_HOME}/jre/THIRD_PARTY_README \
                           ${JDK_HOME}/jre/LICENSE \
@@ -299,10 +277,7 @@ FILES_${PN}_append =3D " \
=20
 RDEPENDS_${JDKPN}-common =3D "librhino-java"
=20
-RPROVIDES_${JDKPN}-vm-shark =3D "java2-vm"
 RPROVIDES_${JDKPN}-vm-zero =3D "java2-vm"
-RPROVIDES_${JDKPN}-vm-cacao =3D "java2-vm"
-RPROVIDES_${JDKPN}-vm-jamvm =3D "java2-vm"
=20
 # Even though a vm is a hard dependency it is set as RRECOMMENDS so a =
single vm can get uninstalled:
 # root@beaglebone:~/java# opkg remove openjdk-7-vm-shark
@@ -315,15 +290,9 @@ RRECOMMENDS_${JDKPN}-java =3D "java2-vm"
=20
 # For some reason shark and cacao do not automatically depends on =
-common.
 # So we add that manually.
-RDEPENDS_${JDKPN}-vm-shark =3D "${JDKPN}-common"
-RDEPENDS_${JDKPN}-vm-cacao =3D "${JDKPN}-common"
-RDEPENDS_${JDKPN}-vm-jamvm =3D "${JDKPN}-common"
=20
 # There is a symlink to a .so but this one is valid.
-INSANE_SKIP_${JDKPN}-vm-shark =3D "dev-so"
 INSANE_SKIP_${JDKPN}-vm-zero =3D "dev-so"
-INSANE_SKIP_${JDKPN}-vm-cacao =3D "dev-so"
-INSANE_SKIP_${JDKPN}-vm-jamvm =3D "dev-so"
 INSANE_SKIP_${JDKPN}-common =3D "dev-so"
=20
 FILES_${JDKPN}-jdk =3D " \
diff --git a/recipes-core/openjdk/openjdk-7-release-85b01.inc =
b/recipes-core/openjdk/openjdk-7-release-85b01.inc
index 6a8b482..cbb28c7 100644
--- a/recipes-core/openjdk/openjdk-7-release-85b01.inc
+++ b/recipes-core/openjdk/openjdk-7-release-85b01.inc
@@ -38,18 +38,6 @@ JDK_URI =3D =
"${ICEDTEA_HG_URL}/jdk/archive/${JDK_FILE};name=3Djdk;unpack=3Dfalse"
 LANGTOOLS_FILE =3D "${LANGTOOLS_CHANGESET}.tar.bz2"
 LANGTOOLS_URI =3D =
"${ICEDTEA_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=3Dlangtools;un=
pack=3Dfalse"
=20
-CACAO_VERSION =3D "c182f119eaad"
-CACAO_FILE =3D "cacao-${CACAO_VERSION}.tar.gz"
-CACAO_URI =3D =
"http://icedtea.classpath.org/download/drops/cacao/${CACAO_FILE};name=3Dca=
cao;unpack=3Dfalse"
-SRC_URI[cacao.md5sum] =3D "df428cf98e5baf28c1d186bc9b92fb01"
-SRC_URI[cacao.sha256sum] =3D =
"eade43f6c5da8b3b5a64e6b206b624eaca88539f80101d7164d6aa426eb590b1"
-
-JAMVM_VERSION =3D "ec18fb9e49e62dce16c5094ef1527eed619463aa"
-JAMVM_FILE =3D "jamvm-${JAMVM_VERSION}.tar.gz"
-JAMVM_URI =3D =
"http://icedtea.wildebeest.org/download/drops/jamvm/${JAMVM_FILE};name=3Dj=
amvm;unpack=3Dfalse"
-SRC_URI[jamvm.md5sum] =3D "d50ae193d01a9251e10679c7a2cc6ff1"
-SRC_URI[jamvm.sha256sum] =3D =
"31810266666c23822942aac62a78019c2c4589e1c5ee48329cbf42652d4437bc"
-
 # Split up patches to allow overriding them separately
 OEPATCHES =3D "\
 	file://build-hacks.patch \
diff --git a/recipes-images/images/java-test-image.bb =
b/recipes-images/images/java-test-image.bb
index b8a729a..005e7a1 100644
--- a/recipes-images/images/java-test-image.bb
+++ b/recipes-images/images/java-test-image.bb
@@ -7,12 +7,10 @@ IMAGE_LINGUAS =3D " "
=20
 IMAGE_INSTALL =3D "busybox modutils-initscripts initscripts opkg udev =
sysvinit netbase base-files base-passwd \
                  ${ROOTFS_PKGMANAGE_BOOTSTRAP} =
${CORE_IMAGE_EXTRA_INSTALL} \
-                 openjdk-7-jre openjdk-7-vm-zero openjdk-7-vm-jamvm =
openjdk-7-vm-cacao \
+                 openjdk-7-jre openjdk-7-vm-zero \
                  strace dropbear binutils \
                  classpath \
                  classpath-common \
                  classpath-examples \
                  classpath-tools \
-                 jamvm \
-                 cacao \
 "
--=20
2.4.3


--=20
Jens Rehsack - rehsack@gmail.com


