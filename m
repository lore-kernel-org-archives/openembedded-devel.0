Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 409C260424
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 10:02:58 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id b8so3052945lan.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Aug 2014 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ao0CddZwqA01figVrmiiGG05A1JdfigrgOWEroIJlQE=;
	b=NnSkqpRYxVMXhqTwBBalGHIb45dFsfuSGKKfc1q2HqgzE5Y+ZI8knEYAwSUR0JS3AA
	RJe+1gGKJ+LREVrG/bOVJAM+qxVpNxGrbqBNXt0fSNacGABPYYPzfiGPBtWzVCN5NlUF
	SyP9sMrzXJELftf12AK6FtkSVEXoMX+UmOvteDP/Pjc6BKiTL95o1vqknkhJarjF50Y/
	jzHlbh9JHyWopndXjILZtaMFSCDLiErRMLscZe7TjlroRGeoJP3XlhpkndlM7Wpu66EQ
	EYuz33cG9p0B6Cnd67WVdveochMxAbNaF6X71tmoi5vrz7RS8g7XyXjWHhsSE5s2VrYB
	pGaQ==
X-Received: by 10.112.163.103 with SMTP id yh7mr16264131lbb.73.1408183378542; 
	Sat, 16 Aug 2014 03:02:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j2sm6561458laf.15.2014.08.16.03.02.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Aug 2014 03:02:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 16 Aug 2014 12:03:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140816100336.GK22747@jama>
References: <1408006032-21762-1-git-send-email-Martin.Jansa@gmail.com>
	<1408006032-21762-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1408006032-21762-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][WIP][PATCH 2/2] webkit-efl: upgrade to 1.11.0-beta1
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
X-List-Received-Date: Sat, 16 Aug 2014 10:03:05 -0000
X-Groupsio-MsgNum: 51720
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F55Y67F01HNW3AgB"
Content-Disposition: inline

--F55Y67F01HNW3AgB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2014 at 10:47:12AM +0200, Martin Jansa wrote:
> * webkit-efl snapshots are now versioned consistenly with efl
>   bump PE to prevent version going backwards
> * announcement:
>   http://sourceforge.net/p/enlightenment/mailman/message/32713414/

This will stay WIP until I (or someone else) replace ewebkit1 based eve
with elbow:

https://github.com/bunhere/elbow

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-efl/recipes-efl/webkit/webkit-efl.inc         |  28 ++--
>  ...on.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch |  46 ++++++
>  ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  30 ----
>  ...r.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch |  80 ----------
>  ...rs.cmake-Add-Wno-error-deprecated-declara.patch |  27 ++++
>  .../webkit/webkit-efl/0003-Fix-linking-issue.patch |  63 --------
>  ...emorySamplerLinux-Fix-type-limits-warning.patch |  32 ----
>  .../webkit-efl/0004-fix-type-limits-error.patch    |  15 ++
>  .../recipes-efl/webkit/webkit-efl/CMakeLists.txt   | 166 ---------------=
------
>  .../webkit/webkit-efl_1.10.0+1.11.0-beta1.bb       |  10 ++
>  .../webkit/webkit-efl_2.3.4+svnr164189.bb          |  13 --
>  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  22 ---
>  12 files changed, 111 insertions(+), 421 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCo=
mmon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHel=
pers.cmake-Add-Wno-error-cast-align.patch
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssemb=
ler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHel=
pers.cmake-Add-Wno-error-deprecated-declara.patch
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linki=
ng-issue.patch
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemory=
SamplerLinux-Fix-type-limits-warning.patch
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0004-fix-type-=
limits-error.patch
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
>  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_1.10.0+1.11.0-=
beta1.bb
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr1641=
89.bb
>  delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
>=20
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipe=
s-efl/webkit/webkit-efl.inc
> index 44ef9d4..bb5d7a6 100644
> --- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
> @@ -1,8 +1,10 @@
>  DESCRIPTION =3D "Webkit browser engine, EFL edition"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://Source/WebKit/LICENSE;md5=3D4646f90082c40bc=
f298c285f8bab0b12 \
> -                    file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d=
6397a5d84286dda758da57bd691 \
> -                    file://Source/WebKit/efl/ewk/EWebKit.h;endline=3D20;=
md5=3D55ea170b1582797d2c69712de850f2fa \
> +LICENSE =3D "GPLv2+ & LGPL-2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://Source/JavaScriptCore/COPYING.LIB;md5=3Dd0c6d6397a5d84286dda7=
58da57bd691 \
> +    file://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8b=
ab0b12 \
> +    file://Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c=
36b6eec80 \
> +    file://Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b249444=
5b79d21 \
>  "
> =20
>  # you need harfbuzz with icu enabled, you can add this to your config:
> @@ -10,18 +12,14 @@ LIC_FILES_CHKSUM =3D "file://Source/WebKit/LICENSE;md=
5=3D4646f90082c40bcf298c285f8ba
>  DEPENDS =3D "icu libxslt sqlite3 gperf-native bison-native flex-native j=
peg \
>             libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
>             libxml2 pango eina ecore evas edje eldbus harfbuzz enchant \
> -           ruby-native"
> +           ruby-native elementary"
> +
> +PE =3D "1"
> =20
>  SRC_URI =3D "\
> -    ${E_RELEASES}/libs/webkit-efl/webkit-efl-164189.tar.xz \
> -    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
> -    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.pat=
ch \
> -    file://0003-Fix-linking-issue.patch \
> +    ${E_RELEASES}/libs/webkit-efl/ewebkit-${SRCVER}.tar.xz \
>  "
> -SRC_URI[md5sum] =3D "731513fc042ec8e03840bc1ab6a66771"
> -SRC_URI[sha256sum] =3D "660aefd65c0e5c6494eaec30539cda5f40fbdff17f28e7e8=
3d341b245227cccd"
> -
> -S =3D "${WORKDIR}/efl-webkit"
> +S =3D "${WORKDIR}/ewebkit"
> =20
>  inherit cmake lib_package pkgconfig perlnative pythonnative
> =20
> @@ -60,8 +58,8 @@ COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>  LEAD_SONAME =3D "libewebkit.so"
>  PACKAGES =3D+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
> =20
> -FILES_${PN} +=3D "${datadir}/webkit-1.0/theme/default.edj ${datadir}/ewe=
bkit-0/themes/default.edj"
> +FILES_${PN} +=3D "${datadir}/ewebkit2-1/themes/default.edj"
>  FILES_${PN}-dev +=3D "${libdir}/cmake"
>  FILES_${PN}launcher =3D "${bindir}/EWebLauncher"
>  FILES_${PN}launcher-dbg =3D "${bindir}/.debug/EWebLauncher"
> -FILES_${PN}-inspector +=3D "${datadir}/ewebkit-0/inspector"
> +FILES_${PN}-inspector +=3D "${datadir}/ewebkit2-1/inspector"
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cm=
ake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch b/meta-efl/recipes-efl/webkit/we=
bkit-efl/0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch
> new file mode 100644
> index 0000000..56026ea
> --- /dev/null
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cmake-don=
-t-mix-CXX_FLAGS-into-C_FLAGS.patch
> @@ -0,0 +1,46 @@
> +From 3c0dbb8f46f61127d89b29a1be2793325f104989 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Thu, 14 Aug 2014 01:00:21 +0200
> +Subject: [PATCH 1/2] OptionsCommon.cmake: don't mix CXX_FLAGS into C_FLA=
GS
> +
> +* it was added in https://bugs.webkit.org/show_bug.cgi?id=3D130261
> +* causes build failures in udis86 which explicitly asks for gcc but then
> +  gets g++ flags from CMAKE_CXX_FLAGS.
> +
> +cc1: error: command line option '-fvisibility-inlines-hidden' is valid
> +for C++/ObjC++ but not for C [-Werror]
> +cc1: error: command line option '-fpermissive' is valid for C++/ObjC++
> +but not for C [-Werror]
> +cc1: all warnings being treated as errors
> +Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/build.make:11182:
> +recipe for target
> +'Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/disassembler/udis86=
/udis86.c.o'
> +failed
> +make[2]: ***
> +[Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/disassembler/udis86=
/udis86.c.o]
> +Error 1
> +make[2]: *** Waiting for unfinished jobs....
> +make[2]: Leaving directory
> +'/OE/build/oe-core/tmp-eglibc/work/core2-64-oe-linux/webkit-efl/1_1.10.0=
+1.11.0-beta1-r0/build'
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + Source/cmake/OptionsCommon.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsComm=
on.cmake
> +index e304a99..045c614 100644
> +--- a/Source/cmake/OptionsCommon.cmake
> ++++ b/Source/cmake/OptionsCommon.cmake
> +@@ -25,7 +25,7 @@ endif ()
> + set_property(GLOBAL PROPERTY USE_FOLDERS ON)
> +=20
> + if (CMAKE_COMPILER_IS_GNUCXX OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Cl=
ang")
> +-    set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-a=
liasing")
> ++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-ali=
asing")
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=3Dc++11 -fno-exception=
s -fno-strict-aliasing -fno-rtti")
> + endif ()
> +=20
> +--=20
> +2.0.4
> +
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cm=
ake-Add-Wno-error-cast-align.patch b/meta-efl/recipes-efl/webkit/webkit-efl=
/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
> deleted file mode 100644
> index c769c7f..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add=
-Wno-error-cast-align.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From b37711ca03ea9410e795f29398069fed9e9c2d30 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Mon, 13 Jan 2014 17:21:25 +0100
> -Subject: [PATCH 1/3] WebKitHelpers.cmake: Add -Wno-error=3Dcast-align
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/cmake/WebKitHelpers.cmake | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/Source/cmake/WebKitHelpers.cmake b/Source/cmake/WebKitHelpe=
rs.cmake
> -index 409931c..345b346 100644
> ---- a/Source/cmake/WebKitHelpers.cmake
> -+++ b/Source/cmake/WebKitHelpers.cmake
> -@@ -44,7 +44,11 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
> -=20
> -         # Enable errors on warning
> -         if (OPTION_ENABLE_WERROR)
> --            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=3Dunused-paramete=
r ${OLD_COMPILE_FLAGS}")
> -+            # FIXME: When we use -fno-tree-dce to support the jsCStack =
branch merge, build error occurs due to the uninitialization. Temporarily w=
e set
> -+            # uninitialized as build warning in order to support the js=
CStack merge. https://bugs.webkit.org/show_bug.cgi?id=3D127777.
> -+            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=3Dunused-paramete=
r -Wno-error=3Duninitialized ${OLD_COMPILE_FLAGS}")
> -+            # | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gn=
ueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runti=
me/JSDataViewPrototype.cpp:161:104: error: cast from 'uint8_t* {aka unsigne=
d char*}' to 'JSC::FloatTypedArrayAdaptor<double, JSC::GenericTypedArrayVie=
w<JSC::Float64Adaptor>, JSC::JSGenericTypedArrayView<JSC::Float64Adaptor>, =
(JSC::TypedArrayType)9u>::Type* {aka double*}' increases required alignment=
 of target type [-Werror=3Dcast-align]
> -+            set(OLD_COMPILE_FLAGS "-Wno-error=3Dcast-align -Wno-error=
=3Darray-bounds -Wno-error=3Ddeprecated-declarations ${OLD_COMPILE_FLAGS}")
> -         endif ()
> -=20
> -         set_target_properties(${_target} PROPERTIES
> ---=20
> -1.9.0
> -
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-D=
on-t-generate-BKPT-and-BLX-for-armv4.patch b/meta-efl/recipes-efl/webkit/we=
bkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
> deleted file mode 100644
> index 9f005bc..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-ge=
nerate-BKPT-and-BLX-for-armv4.patch
> +++ /dev/null
> @@ -1,80 +0,0 @@
> -From e284e92da00011e55d8f79383034e0c9c1a8a106 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 27 Feb 2014 13:40:43 +0100
> -Subject: [PATCH 2/3] ARMAssembler.h: Don't generate BKPT and BLX for arm=
v4*
> -
> -* I haven't tested it in runtime yet, but it's better than to wait for a=
sm failure later:
> -  {standard input}: Assembler messages:
> -  {standard input}:35: Error: selected processor does not support ARM mo=
de `bkpt #0'
> -  {standard input}:62: Error: selected processor does not support ARM mo=
de `blx llint_throw_stack_overflow_error'
> -  ...
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/JavaScriptCore/assembler/ARMAssembler.h | 19 +++++++++++++++++++
> - 1 file changed, 19 insertions(+)
> -
> -diff --git a/Source/JavaScriptCore/assembler/ARMAssembler.h b/Source/Jav=
aScriptCore/assembler/ARMAssembler.h
> -index 087d31c..1b40ded 100644
> ---- a/Source/JavaScriptCore/assembler/ARMAssembler.h
> -+++ b/Source/JavaScriptCore/assembler/ARMAssembler.h
> -@@ -211,7 +211,9 @@ namespace JSC {
> -             LDMIA =3D 0x08b00000,
> -             B =3D 0x0a000000,
> -             BL =3D 0x0b000000,
> -+#if WTF_ARM_ARCH_AT_LEAST(5)
> -             BX =3D 0x012fff10,
> -+#endif
> -             VMOV_VFP64 =3D 0x0c400a10,
> -             VMOV_ARM64 =3D 0x0c500a10,
> -             VMOV_VFP32 =3D 0x0e000a10,
> -@@ -223,8 +225,10 @@ namespace JSC {
> -             VCVT_F64_F32 =3D 0x0eb70ac0,
> -             VMRS_APSR =3D 0x0ef1fa10,
> -             CLZ =3D 0x016f0f10,
> -+#if WTF_ARM_ARCH_AT_LEAST(5)
> -             BKPT =3D 0xe1200070,
> -             BLX =3D 0x012fff30,
> -+#endif
> - #if WTF_ARM_ARCH_AT_LEAST(7)
> -             MOVW =3D 0x03000000,
> -             MOVT =3D 0x03400000,
> -@@ -689,7 +693,11 @@ namespace JSC {
> -=20
> -         void bkpt(ARMWord value)
> -         {
> -+#if WTF_ARM_ARCH_AT_LEAST(5)
> -             m_buffer.putInt(BKPT | ((value & 0xff0) << 4) | (value & 0x=
f));
> -+#else
> -+            // BKPT is available in ARMv5T and above, skip it here
> -+#endif
> -         }
> -=20
> -         void nop()
> -@@ -704,12 +712,23 @@ namespace JSC {
> -=20
> -         void bx(int rm, Condition cc =3D AL)
> -         {
> -+#if WTF_ARM_ARCH_AT_LEAST(5)
> -             emitInstruction(toARMWord(cc) | BX, 0, 0, RM(rm));
> -+#else
> -+            // BX is available in ARMv5T and above.
> -+            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::pc, ARMR=
egisters::lr, 0);
> -+#endif
> -         }
> -=20
> -         AssemblerLabel blx(int rm, Condition cc =3D AL)
> -         {
> -+#if WTF_ARM_ARCH_AT_LEAST(5)
> -             emitInstruction(toARMWord(cc) | BLX, 0, 0, RM(rm));
> -+#else
> -+            // BLX is available in ARMv5T and above.
> -+            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::lr, ARMR=
egisters::pc, 0);
> -+            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::pc, RM(r=
m), 0);
> -+#endif
> -             return m_buffer.label();
> -         }
> -=20
> ---=20
> -1.9.0
> -
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cm=
ake-Add-Wno-error-deprecated-declara.patch b/meta-efl/recipes-efl/webkit/we=
bkit-efl/0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch
> new file mode 100644
> index 0000000..8b8bf15
> --- /dev/null
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cmake-Add=
-Wno-error-deprecated-declara.patch
> @@ -0,0 +1,27 @@
> +From c7d6469d07fc8f04352a56a649b9abfafa4a1355 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Mon, 13 Jan 2014 17:21:25 +0100
> +Subject: [PATCH 2/2] WebKitHelpers.cmake: Add
> + -Wno-error=3Ddeprecated-declarations
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + Source/cmake/WebKitHelpers.cmake | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/Source/cmake/WebKitHelpers.cmake b/Source/cmake/WebKitHelpe=
rs.cmake
> +index 227b9ee..bf5257c 100644
> +--- a/Source/cmake/WebKitHelpers.cmake
> ++++ b/Source/cmake/WebKitHelpers.cmake
> +@@ -40,6 +40,8 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
> +             # FIXME: When we use -fno-tree-dce to support the jsCStack =
branch merge, build error occurs due to the uninitialization. Temporarily w=
e set
> +             # uninitialized as build warning in order to support the js=
CStack merge. https://bugs.webkit.org/show_bug.cgi?id=3D127777.
> +             set(OLD_COMPILE_FLAGS "-Werror -Wno-error=3Dunused-paramete=
r -Wno-error=3Duninitialized -Wno-error=3Dliteral-suffix ${OLD_COMPILE_FLAG=
S}")
> ++            # libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:13:84: erro=
r: 'GType soup_proxy_uri_resolver_get_type()' is deprecated (declared at /O=
E/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libs=
oup/soup-proxy-uri-resolver.h:48) [-Werror=3Ddeprecated-declarations]
> ++            set(OLD_COMPILE_FLAGS "-Wno-error=3Ddeprecated-declarations=
 ${OLD_COMPILE_FLAGS}")
> +         endif ()
> +=20
> +         set_target_properties(${_target} PROPERTIES
> +--=20
> +2.0.4
> +
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issu=
e.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.pat=
ch
> deleted file mode 100644
> index ce1c687..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -From 09088da56f3de17ab1cc537627cda6bf808eaf4c Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Thu, 27 Feb 2014 14:17:29 +0100
> -Subject: [PATCH 3/3] Fix linking issue
> -
> -* inline function is sometimes not included soon enough
> -
> -  Partialy taken from:
> -  https://bugs.webkit.org/show_bug.cgi?id=3D124152
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/JavaScriptCore/llint/LLIntEntrypoint.cpp          | 3 +++
> - Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp | 3 +++
> - Source/JavaScriptCore/runtime/SymbolTable.cpp            | 4 ++++
> - 3 files changed, 10 insertions(+)
> -
> -diff --git a/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp b/Source/Ja=
vaScriptCore/llint/LLIntEntrypoint.cpp
> -index 5d91be6..73cba31 100644
> ---- a/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp
> -+++ b/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp
> -@@ -31,6 +31,9 @@
> - #include "CodeBlock.h"
> - #include "JITCode.h"
> - #include "JSObject.h"
> -+#include "JSCellInlines.h"
> -+#include "JSDestructibleObject.h"
> -+#include "SlotVisitorInlines.h"
> - #include "LLIntThunks.h"
> - #include "LowLevelInterpreter.h"
> - #include "MaxFrameExtentForSlowPathCall.h"
> -diff --git a/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp b/=
Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
> -index d0583fc..4be5ec3 100644
> ---- a/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
> -+++ b/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
> -@@ -25,6 +25,9 @@
> -=20
> - #include "config.h"
> - #include "FunctionExecutableDump.h"
> -+#include "JSCellInlines.h"
> -+#include "JSDestructibleObject.h"
> -+#include "SlotVisitorInlines.h"
> -=20
> - #include "CodeBlock.h"
> -=20
> -diff --git a/Source/JavaScriptCore/runtime/SymbolTable.cpp b/Source/Java=
ScriptCore/runtime/SymbolTable.cpp
> -index 6eb0239..21450df 100644
> ---- a/Source/JavaScriptCore/runtime/SymbolTable.cpp
> -+++ b/Source/JavaScriptCore/runtime/SymbolTable.cpp
> -@@ -33,6 +33,10 @@
> - #include "JSCInlines.h"
> - #include "SlotVisitorInlines.h"
> -=20
> -+#include "JSCellInlines.h"
> -+#include "JSDestructibleObject.h"
> -+#include "SlotVisitorInlines.h"
> -+
> - namespace JSC {
> -=20
> - const ClassInfo SymbolTable::s_info =3D { "SymbolTable", 0, 0, 0, CREAT=
E_METHOD_TABLE(SymbolTable) };
> ---=20
> -1.9.0
> -
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySampler=
Linux-Fix-type-limits-warning.patch b/meta-efl/recipes-efl/webkit/webkit-ef=
l/0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch
> deleted file mode 100644
> index f30987b..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl/0004-WebMemorySamplerLinux-F=
ix-type-limits-warning.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ed7972510df191d9fabe7aff2f688cbc45f0c955 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Sun, 20 Jul 2014 10:52:17 +0200
> -Subject: [PATCH] WebMemorySamplerLinux: Fix type-limits warning
> -
> -* otherwise it fails with:
> -  webkit-efl/2.3.4+svnr164189-r0/efl-webkit/Source/WebKit2/Shared/linux/=
WebMemorySamplerLinux.cpp:70:16:
> -  error: comparison is always false due to limited range of data type [-=
Werror=3Dtype-limits]
> -  |          if (ch =3D=3D EOF || (isASCIISpace(ch) && index)) // Break =
on non-initial ASCII space.
> -  |                 ^
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp b/Sou=
rce/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
> -index 7cb70d4..6bb78d8 100644
> ---- a/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
> -+++ b/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp
> -@@ -67,7 +67,7 @@ static inline String nextToken(FILE* file)
> -     unsigned int index =3D 0;
> -     while (index < maxBuffer) {
> -         char ch =3D fgetc(file);
> --        if (ch =3D=3D EOF || (isASCIISpace(ch) && index)) // Break on n=
on-initial ASCII space.
> -+        if (isASCIISpace(ch) && index) // Break on non-initial ASCII sp=
ace.
> -             break;
> -         if (!isASCIISpace(ch)) {
> -             buffer[index] =3D ch;
> ---=20
> -2.0.0
> -
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0004-fix-type-limits-=
error.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0004-fix-type-limits-e=
rror.patch
> new file mode 100644
> index 0000000..21ebb65
> --- /dev/null
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl/0004-fix-type-limits-error.p=
atch
> @@ -0,0 +1,15 @@
> +webkit-efl/2.3.4+svnr164189-r0/efl-webkit/Source/WebKit2/Shared/linux/We=
bMemorySamplerLinux.cpp:70:16: error: comparison is always false due to lim=
ited range of data type [-Werror=3Dtype-limits]
> +|          if (ch =3D=3D EOF || (isASCIISpace(ch) && index)) // Break on=
 non-initial ASCII space.
> +|                 ^
> +
> +--- efl-webkit/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp.ori=
g       2014-07-20 10:50:06.454145736 +0200
> ++++ efl-webkit/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp    =
2014-07-20 10:46:33.952159063 +0200
> +@@ -67,7 +67,7 @@
> +     unsigned int index =3D 0;
> +     while (index < maxBuffer) {
> +         char ch =3D fgetc(file);
> +-        if (ch =3D=3D EOF || (isASCIISpace(ch) && index)) // Break on n=
on-initial ASCII space.
> ++        if (isASCIISpace(ch) && index) // Break on non-initial ASCII sp=
ace.
> +             break;
> +         if (!isASCIISpace(ch)) {
> +             buffer[index] =3D ch;
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt b/meta=
-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
> deleted file mode 100644
> index 8071d61..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl/CMakeLists.txt
> +++ /dev/null
> @@ -1,166 +0,0 @@
> -CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
> -PROJECT(WebKit)
> -
> -# Set a default build type if and only if user did not define one as com=
mand
> -# line options and he did not give custom CFLAGS or CXXFLAGS. Otherwise,=
 flags
> -# from default build type would overwrite user-defined ones.
> -IF (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_C_FLAGS AND NOT CMAKE_CXX_FLAGS)
> -    SET(CMAKE_BUILD_TYPE Release)
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Default library type
> -# ----------------------------------------------------------------------=
-------
> -SET(ENABLE_WEBCORE ON)
> -
> -IF (NOT ENABLE_WEBKIT AND NOT ENABLE_WEBKIT2)
> -    SET(ENABLE_WEBKIT ON)
> -ENDIF ()
> -
> -SET(ENABLE_TOOLS ON)
> -
> -SET(WTF_DIR "${CMAKE_SOURCE_DIR}/Source/WTF")
> -SET(JAVASCRIPTCORE_DIR "${CMAKE_SOURCE_DIR}/Source/JavaScriptCore")
> -SET(WEBCORE_DIR "${CMAKE_SOURCE_DIR}/Source/WebCore")
> -SET(WEBKIT_DIR "${CMAKE_SOURCE_DIR}/Source/WebKit")
> -SET(WEBKIT2_DIR "${CMAKE_SOURCE_DIR}/Source/WebKit2")
> -SET(THIRDPARTY_DIR "${CMAKE_SOURCE_DIR}/Source/ThirdParty")
> -
> -SET(TOOLS_DIR "${CMAKE_SOURCE_DIR}/Tools")
> -
> -SET(DERIVED_SOURCES_DIR "${CMAKE_BINARY_DIR}/DerivedSources")
> -SET(DERIVED_SOURCES_JAVASCRIPTCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSourc=
es/JavaScriptCore")
> -SET(DERIVED_SOURCES_WEBCORE_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebC=
ore")
> -SET(DERIVED_SOURCES_WEBKIT_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebKi=
t")
> -SET(DERIVED_SOURCES_WEBKIT2_DIR "${CMAKE_BINARY_DIR}/DerivedSources/WebK=
it2")
> -
> -SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/Source/cmake")
> -
> -SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
> -SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
> -SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
> -
> -INCLUDE(WebKitMacros)
> -INCLUDE(WebKitFS)
> -INCLUDE(WebKitHelpers)
> -INCLUDE(WebKitFeatures)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine which port will be built
> -# ----------------------------------------------------------------------=
-------
> -SET(ALL_PORTS Efl WinCE BlackBerry)
> -SET(PORT "NOPORT" CACHE STRING "choose which WebKit port to build (one o=
f ${ALL_PORTS})")
> -
> -LIST(FIND ALL_PORTS ${PORT} RET)
> -IF (${RET} EQUAL -1)
> -    MESSAGE(FATAL_ERROR "Please choose which WebKit port to build (one o=
f ${ALL_PORTS})")
> -ENDIF ()
> -
> -STRING(TOLOWER ${PORT} WEBKIT_PORT_DIR)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Find common packages (used by all ports)
> -# ----------------------------------------------------------------------=
-------
> -FIND_PACKAGE(BISON REQUIRED)
> -FIND_PACKAGE(FLEX REQUIRED)
> -FIND_PACKAGE(Gperf REQUIRED)
> -FIND_PACKAGE(Perl REQUIRED)
> -FIND_PACKAGE(PythonInterp REQUIRED)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine the target processor
> -# ----------------------------------------------------------------------=
-------
> -STRING(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSO=
R)
> -IF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
> -    SET(WTF_CPU_ARM 1)
> -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^mips")
> -    SET(WTF_CPU_MIPS 1)
> -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(x86_64|amd64)")
> -    SET(WTF_CPU_X86_64 1)
> -ELSEIF (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "(i[3-6]86|x86)")
> -    SET(WTF_CPU_X86 1)
> -ELSE ()
> -    MESSAGE(FATAL_ERROR "Unknown CPU '${CMAKE_SYSTEM_PROCESSOR}'")
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Determine the operating system
> -# ----------------------------------------------------------------------=
-------
> -IF (UNIX)
> -    IF (APPLE)
> -        SET(WTF_OS_MAC_OS_X 1)
> -    ELSE ()
> -        SET(WTF_OS_UNIX 1)
> -    ENDIF ()
> -ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Windows")
> -    SET(WTF_OS_WINDOWS 1)
> -ELSEIF (CMAKE_SYSTEM_NAME MATCHES "QNX")
> -    SET(WTF_OS_QNX 1)
> -    SET(WTF_OS_UNIX 1)
> -ELSE ()
> -    MESSAGE(FATAL_ERROR "Unknown OS '${CMAKE_SYSTEM_NAME}'")
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Default target names (can be overrriden in Options${PORT}.cmake file)
> -# ----------------------------------------------------------------------=
-------
> -SET(JSC_EXECUTABLE_NAME JSC)
> -SET(WTF_LIBRARY_NAME WTF)
> -SET(JavaScriptCore_LIBRARY_NAME JavaScriptCore)
> -SET(WebCore_LIBRARY_NAME WebCore)
> -SET(WebKit_LIBRARY_NAME WebKit)
> -SET(WebKit2_LIBRARY_NAME WebKit2)
> -SET(WebCoreTestSupport_LIBRARY_NAME WebCoreTestSupport)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Default library types
> -# ----------------------------------------------------------------------=
-------
> -OPTION(SHARED_CORE "build JavaScriptCore and WebCore as shared libraries=
")
> -
> -IF (SHARED_CORE)
> -    SET(JavaScriptCore_LIBRARY_TYPE SHARED)
> -    SET(WebCore_LIBRARY_TYPE SHARED)
> -ELSE ()
> -    SET(JavaScriptCore_LIBRARY_TYPE STATIC)
> -    SET(WebCore_LIBRARY_TYPE STATIC)
> -ENDIF ()
> -
> -SET(WebKit_LIBRARY_TYPE SHARED)
> -SET(WebKit2_LIBRARY_TYPE SHARED)
> -SET(WebCoreTestSupport_LIBRARY_TYPE STATIC)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Port-specific options
> -# ----------------------------------------------------------------------=
-------
> -INCLUDE(OptionsCommon)
> -INCLUDE(Options${PORT})
> -
> -# ----------------------------------------------------------------------=
-------
> -# Enable API unit tests and create a target for the test runner
> -# ----------------------------------------------------------------------=
-------
> -IF (ENABLE_API_TESTS)
> -    ENABLE_TESTING()
> -ENDIF ()
> -
> -# ----------------------------------------------------------------------=
-------
> -# Install JavaScript shell
> -# ----------------------------------------------------------------------=
-------
> -OPTION(SHOULD_INSTALL_JS_SHELL "generate an installation rule to install=
 the built JavaScript shell")
> -
> -# ----------------------------------------------------------------------=
-------
> -# Define packaging
> -# ----------------------------------------------------------------------=
-------
> -INCLUDE(WebKitPackaging)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Add module directories
> -# ----------------------------------------------------------------------=
-------
> -ADD_SUBDIRECTORY(Source)
> -
> -# ----------------------------------------------------------------------=
-------
> -# Add tools
> -# ----------------------------------------------------------------------=
-------
> -IF (ENABLE_TOOLS)
> -    ADD_SUBDIRECTORY(Tools)
> -ENDIF ()
> -
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_1.10.0+1.11.0-beta1.b=
b b/meta-efl/recipes-efl/webkit/webkit-efl_1.10.0+1.11.0-beta1.bb
> new file mode 100644
> index 0000000..82f6ac2
> --- /dev/null
> +++ b/meta-efl/recipes-efl/webkit/webkit-efl_1.10.0+1.11.0-beta1.bb
> @@ -0,0 +1,10 @@
> +require ${BPN}.inc
> +
> +SRCVER =3D "1.11.0-beta1"
> +
> +SRC_URI +=3D "\
> +    file://0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.pat=
ch \
> +    file://0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.pat=
ch \
> +"
> +SRC_URI[md5sum] =3D "03932735215118c3c354ccab4a517b13"
> +SRC_URI[sha256sum] =3D "7d0545f79be3633973eb7340318552f80a213c5afddd2c3f=
ee5ccd543cc0418d"
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb b=
/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
> deleted file mode 100644
> index 748ecea..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require ${BPN}.inc
> -
> -SRC_URI =3D "\
> -    ${E_RELEASES}/libs/webkit-efl/webkit-efl-164189.tar.xz \
> -    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
> -    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.pat=
ch \
> -    file://0003-Fix-linking-issue.patch \
> -    file://0004-WebMemorySamplerLinux-Fix-type-limits-warning.patch \
> -"
> -SRC_URI[md5sum] =3D "731513fc042ec8e03840bc1ab6a66771"
> -SRC_URI[sha256sum] =3D "660aefd65c0e5c6494eaec30539cda5f40fbdff17f28e7e8=
3d341b245227cccd"
> -
> -S =3D "${WORKDIR}/efl-webkit"
> diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/rec=
ipes-efl/webkit/webkit-efl_svn.bb
> deleted file mode 100644
> index e50139c..0000000
> --- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -require ${BPN}.inc
> -
> -SRCREV =3D "164189"
> -PV =3D "2.3.4+svnr${SRCPV}"
> -
> -SRCREV_FORMAT =3D "source"
> -
> -SRC_URI =3D "\
> -    svn://svn.webkit.org/repository/webkit/trunk;module=3DSource;name=3D=
source;protocol=3Dhttp;subdir=3Dsrc \
> -    svn://svn.webkit.org/repository/webkit/trunk/;module=3DWebKitLibrari=
es;protocol=3Dhttp;subdir=3Dsrc \
> -    svn://svn.webkit.org/repository/webkit/trunk/;module=3DTools;protoco=
l=3Dhttp;subdir=3Dsrc \
> -    file://CMakeLists.txt \
> -    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
> -    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.pat=
ch \
> -    file://0003-Fix-linking-issue.patch \
> -"
> -
> -S =3D "${WORKDIR}/src"
> -
> -do_configure_prepend() {
> -    cp ${WORKDIR}/CMakeLists.txt ${S};
> -}
> --=20
> 2.0.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F55Y67F01HNW3AgB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPvLHgACgkQN1Ujt2V2gBzCIACeIzLJmmBQi0ucRhEBWjquNl0f
1fgAn3CeqjT8Pa/fUPHjuroaElnr3sMK
=RRgP
-----END PGP SIGNATURE-----

--F55Y67F01HNW3AgB--
