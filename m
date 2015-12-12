Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9AD6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2015 09:36:05 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n186so60582720wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Dec 2015 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=py/Yz2myeh8DP8nQFC5iiNbfP66oBnPw8eFIJJaGLGI=;
	b=xEYfyWvDIYiOjIiQvMMww2abeKCXLM4PT1fvNIzd63jt6YBwfmYAB2J4su9sFVZmJc
	ROD6Ts9hoUqYBAvcgHaunm4ClUXPhGNpFIfLkEoTLW9hoO1ybXm49OqgfrU4b99Wqwjy
	TmhQz8CLCkXvbPBNsoFjhBcr1AcORldFjzBrXC5PsS63KNJmXTqxS74DS1skwPTwwOiW
	10lBqON2SzYtDYSkSIn1+0J/KG3sf3RssXQpHYqMixLWXh9dfsLIP3IHblSHI+vDWwHL
	tYjXWeTnYn9qNwepsplV7+FD1ymFo2dPevvg3WZ2BOe6qmEiFBL48iFCOLoA1/GR91Y9
	SIqw==
X-Received: by 10.194.84.4 with SMTP id u4mr29711099wjy.149.1449912966221;
	Sat, 12 Dec 2015 01:36:06 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	wh10sm20395663wjb.45.2015.12.12.01.36.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Dec 2015 01:36:05 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.5.2
Date: Sat, 12 Dec 2015 10:36:02 +0100
Message-Id: <97430B74-EFAB-4C2E-BB83-D8695FF14CB8@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [meta-java][PATCH] openjdk-8: fix rewrite QA warnings
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
X-List-Received-Date: Sat, 12 Dec 2015 09:36:07 -0000
X-Groupsio-MsgNum: 58982
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B482E163-E26A-42AB-AF76-AD60E342A6B0";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B482E163-E26A-42AB-AF76-AD60E342A6B0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Fix bitbake warnings from variable renaming like

    Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* =
${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} =
${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} =
${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d =
${datadir}/${BPN} ${libdir}/${BPN}/* ${datadir}/pixmaps =
${datadir}/applications ${datadir}/idl ${datadir}/omf ${datadir}/sounds =
${libdir}/bonobo/servers) replaces original key FILES_openjre-8 (    =
${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     =
${JRE_HOME}/LICENSE     ${JRE_HOME}/release ).

It is caused by using FILES_${PN} and FILES_{JDKPN} or FILES_${JREPN},
respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and FILES_${JREPN} =
to
openjre-8_%.bb to allow consequently use FILES_${PN}.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 133 =
+------------------------------
 recipes-core/openjdk/openjdk-8_72b05.bb  |  93 ++++++++++++++++++---
 recipes-core/openjdk/openjre-8_72b05.bb  |  46 +++++++++--
 3 files changed, 122 insertions(+), 150 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc =
b/recipes-core/openjdk/openjdk-8-cross.inc
index 20ac194..457a010 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -1,8 +1,5 @@
-JDKPN =3D "openjdk-8"
-JREPN =3D "openjre-8"
-
-JDK_HOME =3D "${libdir_jvm}/${JDKPN}"
-JRE_HOME =3D "${libdir_jvm}/${JREPN}"
+JDK_HOME =3D "${libdir_jvm}/openjdk-8"
+JRE_HOME =3D "${libdir_jvm}/openjre-8"

 DEPENDS =3D "\
     openjdk-8-native zip-native ant-native libxslt \
@@ -72,129 +69,3 @@ EXTRA_OEMAKE_append =3D '\
     QUIETLY=3D \
     images \
 '
-
-FILES_${JREPN}_append =3D "\
-    ${JRE_HOME}/bin/[a-z]* \
-    ${JRE_HOME}/lib/[a-z]* \
-    ${JRE_HOME}/LICENSE \
-    ${JRE_HOME}/release \
-"
-
-FILES_${JDKPN}_append =3D "\
-    ${JDK_HOME}/bin/[a-z]* \
-    ${JDK_HOME}/lib/[a-z]* \
-    ${JDK_HOME}/jre/bin/[a-z]* \
-    ${JDK_HOME}/jre/lib/[a-z]* \
-    ${JDK_HOME}/LICENSE \
-    ${JDK_HOME}/jre/LICENSE \
-    ${JDK_HOME}/release \
-"
-
-FILES_${JDKPN}-dev_append =3D "\
-    ${JDK_HOME}/include \
-"
-
-FILES_${JDKPN}-dbg_append =3D "\
-    ${JDK_HOME}/bin/.debug/ \
-    ${JDK_HOME}/lib/.debug/ \
-    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
-    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
-    ${JDK_HOME}/jre/bin/.debug/ \
-    ${JDK_HOME}/jre/lib/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
-    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
-"
-
-FILES_${JREPN}-dbg_append =3D "\
-    ${JRE_HOME}/bin/.debug/ \
-    ${JRE_HOME}/lib/.debug/ \
-    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
-    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
-    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
-"
-
-FILES_${JDKPN}-demo =3D " ${JDK_HOME}/demo ${JDK_HOME}/sample "
-RDEPENDS_${JDKPN}-demo =3D " ${JDKPN} "
-
-FILES_${JDKPN}-demo-dbg =3D "\
-    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
-    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
-"
-
-FILES_${JDKPN}-doc_append =3D "\
-    ${JDK_HOME}/man \
-    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
-    ${JDK_HOME}/THIRD_PARTY_README \
-    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
-    ${JDK_HOME}/jre/THIRD_PARTY_README \
-"
-FILES_${JREPN}-doc_append =3D "\
-    ${JRE_HOME}/man \
-    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
-    ${JRE_HOME}/THIRD_PARTY_README \
-"
-
-FILES_${JDKPN}-source =3D " ${JDK_HOME}/src.zip "
-
-# Even though a vm is a hard dependency it is set as RRECOMMENDS so a =
single vm can get uninstalled:
-# root@beaglebone:~/java# opkg remove openjdk-7-vm-shark
-# No packages removed.
-# Collected errors:
-#  * print_dependents_warning: Package openjdk-7-vm-shark is depended =
upon by packages:
-#  * print_dependents_warning:         openjdk-7-java
-#  * print_dependents_warning: These might cease to work if package =
openjdk-7-vm-shark is removed.
-#RRECOMMENDS_${JDKPN}-java =3D "java2-vm"
-
-# There is a symlink to a .so but this one is valid.
-INSANE_SKIP_${JDKPN}-common =3D "dev-so"
-
-FILES_${JDKPN}-doc_append =3D "${JDK_HOME}/man"
-
-do_compile_append() {
-    find ${B}/images/j2sdk-image -name "*.jar" -print0 | \
-      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest
-    find ${B}/images/j2re-image -name "*.jar" -print0 | \
-      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest =
--strip-debug
-}
-
-do_install_jdk() {
-    rm -rf ${D}${JDK_HOME}
-        mkdir -p ${D}${JDK_HOME}
-    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
-    install -m644 ${WORKDIR}/jvm.cfg  =
${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
-    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
-}
-
-do_install_jre() {
-    rm -rf ${D}${JRE_HOME}
-        mkdir -p ${D}${JRE_HOME}
-    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
-    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
-    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
-}
-
-inherit update-alternatives
-
-ALTERNATIVE_${JDKPN} =3D "java"
-ALTERNATIVE_TARGET_${JDKPN} =3D "${JDK_HOME}/bin/java"
-
-ALTERNATIVE_${JREPN} =3D "java"
-ALTERNATIVE_TARGET_${JREPN} =3D "${JRE_HOME}/bin/java"
-
-ALTERNATIVE_${JDKPN}-jdk =3D "javac"
-ALTERNATIVE_TARGET_${JDKPN}-jdk =3D "${JDK_HOME}/bin/javac"
-
-ALTERNATIVE_LINK_NAME[java] =3D "${bindir}/java"
-ALTERNATIVE_LINK_NAME[javac] =3D "${bindir}/javac"
diff --git a/recipes-core/openjdk/openjdk-8_72b05.bb =
b/recipes-core/openjdk/openjdk-8_72b05.bb
index 4c8899e..96473f5 100644
--- a/recipes-core/openjdk/openjdk-8_72b05.bb
+++ b/recipes-core/openjdk/openjdk-8_72b05.bb
@@ -11,26 +11,97 @@ PATCHES_URI_append =3D "\
     =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
 "

+do_compile_append() {
+    find ${B}/images/j2sdk-image -name "*.jar" -print0 | \
+      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest
+}
+
 do_install() {
-    do_install_jdk
+    rm -rf ${D}${JDK_HOME}
+        mkdir -p ${D}${JDK_HOME}
+    cp -rp ${B}/images/j2sdk-image/* ${D}${JDK_HOME}
+    install -m644 ${WORKDIR}/jvm.cfg  =
${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
+    find ${D}${JDK_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
 }

 PACKAGES_append =3D " \
-    ${JDKPN}-demo-dbg \
-    ${JDKPN}-demo \
-    ${JDKPN}-source \
+    ${PN}-demo-dbg \
+    ${PN}-demo \
+    ${PN}-source \
+"
+
+FILES_${PN}_append =3D "\
+    ${JDK_HOME}/bin/[a-z]* \
+    ${JDK_HOME}/lib/[a-z]* \
+    ${JDK_HOME}/jre/bin/[a-z]* \
+    ${JDK_HOME}/jre/lib/[a-z]* \
+    ${JDK_HOME}/LICENSE \
+    ${JDK_HOME}/jre/LICENSE \
+    ${JDK_HOME}/release \
+"
+
+FILES_${PN}-dev_append =3D "\
+    ${JDK_HOME}/include \
+"
+
+FILES_${PN}-dbg_append =3D "\
+    ${JDK_HOME}/bin/.debug/ \
+    ${JDK_HOME}/lib/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/bin/.debug/ \
+    ${JDK_HOME}/jre/lib/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/native_threads/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/server/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/headless/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/xawt/.debug/ \
+    ${JDK_HOME}/jre/lib/${JDK_ARCH}/client/.debug/ \
 "

-RPROVIDES_${JDKPN} =3D "java2-vm"
-PROVIDES_${JDKPN} =3D "java2-vm"
-RPROVIDES_${JDKPN} =3D "java2-runtime"
-PROVIDES_${JDKPN} =3D "java2-runtime"
+FILES_${PN}-demo =3D " ${JDK_HOME}/demo ${JDK_HOME}/sample "
+RDEPENDS_${PN}-demo =3D " ${PN} "
+
+FILES_${PN}-demo-dbg =3D "\
+    ${JDK_HOME}/demo/jvmti/gctest/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapTracker/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/heapViewer/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/hprof/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/minst/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/mtrace/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/versionCheck/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/waiters/lib/.debug/ \
+    ${JDK_HOME}/demo/jvmti/compiledMethodLoad/lib/.debug/ \
+"
+
+FILES_${PN}-doc_append =3D "\
+    ${JDK_HOME}/man \
+    ${JDK_HOME}/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/THIRD_PARTY_README \
+    ${JDK_HOME}/jre/ASSEMBLY_EXCEPTION \
+    ${JDK_HOME}/jre/THIRD_PARTY_README \
+    ${JDK_HOME}/man \
+"
+
+FILES_${PN}-source =3D " ${JDK_HOME}/src.zip "
+
+RPROVIDES_${PN} =3D "java2-vm"
+PROVIDES_${PN} =3D "java2-vm"
+RPROVIDES_${PN} =3D "java2-runtime"
+PROVIDES_${PN} =3D "java2-runtime"

 inherit update-alternatives

-ALTERNATIVE_${PN} =3D "java"
-ALTERNATIVE_LINK =3D "${bindir}/java"
-ALTERNATIVE_TARGET =3D "${JDK_HOME}/bin/java"
 ALTERNATIVE_PRIORITY =3D "100"

+ALTERNATIVE_${PN} =3D "java"
+ALTERNATIVE_LINK_NAME[java] =3D "${bindir}/java"
+ALTERNATIVE_TARGET[java] =3D "${JDK_HOME}/bin/java"
+
+ALTERNATIVE_${PN}-jdk =3D "javac"
+ALTERNATIVE_LINK_NAME[javac] =3D "${bindir}/javac"
+ALTERNATIVE_TARGET[javac] =3D "${JDK_HOME}/bin/javac"
+
+
 # PR =3D "${INC_PR}.1"
diff --git a/recipes-core/openjdk/openjre-8_72b05.bb =
b/recipes-core/openjdk/openjre-8_72b05.bb
index 67eb1d3..1543652 100644
--- a/recipes-core/openjdk/openjre-8_72b05.bb
+++ b/recipes-core/openjdk/openjre-8_72b05.bb
@@ -11,20 +11,50 @@ PATCHES_URI_append =3D "\
     =
file://openjdk8-use_builtin_frame_address_0_rather_than_returning_address_=
of_local_variable.patch;apply=3Dno \
 "

+do_compile_append() {
+    find ${B}/images/j2re-image -name "*.jar" -print0 | \
+      xargs -0 -n1 =
${STAGING_LIBDIR_NATIVE}/jvm/openjdk-8-native/bin/pack200 --repack =
--effort=3D9 --segment-limit=3D-1 --modification-time=3Dlatest =
--strip-debug
+}
+
 do_install() {
-    do_install_jre
+    rm -rf ${D}${JRE_HOME}
+        mkdir -p ${D}${JRE_HOME}
+    cp -rp ${B}/images/j2re-image/* ${D}${JRE_HOME}
+    install -m644 ${WORKDIR}/jvm.cfg  ${D}${JRE_HOME}/lib/${JDK_ARCH}/
+    find ${D}${JRE_HOME} -name "*.debuginfo" -print0 | xargs -0 rm
 }

-RPROVIDES_${JREPN} =3D "java2-vm"
-PROVIDES_${JREPN} =3D "java2-vm"
-RPROVIDES_${JREPN} =3D "java2-runtime"
-PROVIDES_${JREPN} =3D "java2-runtime"
+FILES_${PN}_append =3D "\
+    ${JRE_HOME}/bin/[a-z]* \
+    ${JRE_HOME}/lib/[a-z]* \
+    ${JRE_HOME}/LICENSE \
+    ${JRE_HOME}/release \
+"
+
+FILES_${PN}-dbg_append =3D "\
+    ${JRE_HOME}/bin/.debug/ \
+    ${JRE_HOME}/lib/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/jli/.debug/ \
+    ${JRE_HOME}/lib/${JDK_ARCH}/server/.debug/ \
+"
+
+FILES_${PN}-doc_append =3D "\
+    ${JRE_HOME}/man \
+    ${JRE_HOME}/ASSEMBLY_EXCEPTION \
+    ${JRE_HOME}/THIRD_PARTY_README \
+"
+
+RPROVIDES_${PN} =3D "java2-vm"
+PROVIDES_${PN} =3D "java2-vm"
+RPROVIDES_${PN} =3D "java2-runtime"
+PROVIDES_${PN} =3D "java2-runtime"

 inherit update-alternatives

 ALTERNATIVE_${PN} =3D "java"
-ALTERNATIVE_LINK =3D "${bindir}/java"
-ALTERNATIVE_TARGET =3D "${JRE_HOME}/bin/java"
-ALTERNATIVE_PRIORITY =3D "100"
+ALTERNATIVE_LINK_NAME[java] =3D "${bindir}/java"
+ALTERNATIVE_TARGET[java] =3D "${JRE_HOME}/bin/java"
+ALTERNATIVE_PRIORITY[java] =3D "100"

 # PR =3D "${INC_PR}.1"
--
2.5.4 (Apple Git-61)


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B482E163-E26A-42AB-AF76-AD60E342A6B0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWa+qDAAoJEESZlq7c5QqdfzgQAJZwr6vygOwjEFoXT1mPbLK0
pwKM+W0yKCm1kMhgtw3gxvRaaQfzgkxwJEu+nz+rqEtzYe0MNxh3njDrpLRWqhZz
Q3H5IQfygviC/j4QPQ0FLhph43ddLuYPSpWULKsdFllactSFqtdtVqPx5DEztjvo
IBBA/xQ8GrqjRDJ95X1c41TrB9LY94CTOwxdqO2duabhgqQYITWeUvBcguJIXr95
R+yWezV/ddNpoG+pqmItyoYLKLzNxZlAebD9WzQ7hphm45PijB7Xh6Z7I8I0C94P
cfenr2mxNUUmMtNhjMDd1zwZKKqKRQGlxxMrqRFyF4HOhxxx2yPcicwsHaGj5KGh
Jvov2rBmeJng2xqsADKRl768fxylnOfE07jA0lnpjlvMfak2qNxEmK02C5Y4+dbg
pvZltz5iFsSKGU9GvV4+5BQrewbehsEz6mfeI+tDZAKqi9qdzdSMGMMMhZ8dYPMO
grVZDyyu/CX6ihdDEd0qzNfzwuM1FtHmncAPGw1JIf21nibYB/5tGrtpO8C7iKn9
HsGXjce+4zVQ/Ob1ix0YY1AHgH+hZECAHoy8gPrwbOD94TBBRnsrffzknYYCQf9J
JdOlfsICWkAyOmvlQ3+UHFXlCKFlJcqGbEPno7UyFhWlfEwrImA9w6Rn76ddZnND
MYXHEOd87qLIr8Jspniw
=LYYj
-----END PGP SIGNATURE-----

--Apple-Mail=_B482E163-E26A-42AB-AF76-AD60E342A6B0--
