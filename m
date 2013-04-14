Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URPua-0003zG-JP
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 18:36:18 +0200
Received: by mail-da0-f42.google.com with SMTP id n15so1749009dad.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=GxxDnQvkxvGkFbBmrEtvH8KnR7mz/ntABdliA8zqtoo=;
	b=NQT6eiSbXogNkcdTIRyFGTHxHa8UiRTHKsmYE8qcUGWXKjUf5y07PFVh8tIzWjmBiX
	ZVMRhw4jYkPG5TfpEp1QEYqe/fD6e5j0rqiPdpvAKSguFByzeTA+92bkDyqVgBbVYwhn
	nwtR4l9f2TUqu32btxaUH5QugEBFBzqJAGdLmVfXuK7rBZeaPT7lXEIfrATuBOfQuBqf
	o9dmGjiuhrMI8FdxAnaSIL6X6YeyWkGE+aSbR9aleWyGQffoJH936X93JUmmXgfKXj6+
	U86yJd4p4asKT/OvhQ6egAvuxHwDzG7B0Ni3N+5UepECp5gw8U4pWQHa/0bfcWwAswR0
	3raA==
X-Received: by 10.68.9.34 with SMTP id w2mr5938295pba.30.1365956328253;
	Sun, 14 Apr 2013 09:18:48 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id li15sm18338625pab.2.2013.04.14.09.18.46
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 09:18:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
Date: Sun, 14 Apr 2013 09:18:48 -0700
Message-Id: <5A70C57D-2410-4CCA-8842-147914F13AFD@gmail.com>
References: <1365867474-10261-1-git-send-email-Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1503)
Subject: Re: [meta-oe][PATCH] llvm: Import from meta-java
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 16:36:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

also see =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-extras/tree/recipes/llvm

On Apr 13, 2013, at 8:37 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> * llvm is generic enough to be useful outside meta-java
>  e.g. we need it to enable llvmpipe galium driver in mesa
>=20
> * imported without any modification, all credits go to
>  Henning Heinold and Khem Raj for maintaining it in meta-java
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta-oe/recipes-core/llvm/llvm-common.bb           |  19 ++
> meta-oe/recipes-core/llvm/llvm-common/llvm-config  |  10 +
> meta-oe/recipes-core/llvm/llvm.inc                 | 214 =
+++++++++++++++++++++
> .../recipes-core/llvm/llvm2.8/0019-issue6065.patch |  20 ++
> .../llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch | 113 +++++++++++
> meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch |  12 ++
> .../llvm/llvm2.8/llvm-mc_disable.patch             |  12 ++
> meta-oe/recipes-core/llvm/llvm2.8_2.8.bb           |  21 ++
> .../llvm/llvm2.9/arm_fenv_uclibc.patch             |  14 ++
> meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           |  29 +++
> 10 files changed, 464 insertions(+)
> create mode 100644 meta-oe/recipes-core/llvm/llvm-common.bb
> create mode 100644 meta-oe/recipes-core/llvm/llvm-common/llvm-config
> create mode 100644 meta-oe/recipes-core/llvm/llvm.inc
> create mode 100644 =
meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
> create mode 100644 =
meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
> create mode 100644 meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
> create mode 100644 =
meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
> create mode 100644 meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
> create mode 100644 =
meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
> create mode 100644 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
>=20
> diff --git a/meta-oe/recipes-core/llvm/llvm-common.bb =
b/meta-oe/recipes-core/llvm/llvm-common.bb
> new file mode 100644
> index 0000000..38ca1ee
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm-common.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Helper script for OE's llvm support"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> +                    =
file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
 \
> +                   "
> +
> +SRC_URI =3D "file://llvm-config"
> +
> +do_install() {
> +  install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +  install -m 0755 ${WORKDIR}/llvm-config =
${SYSROOT_DESTDIR}${bindir_crossscripts}/
> +}
> +
> +do_install_virtclass-native() {
> +  install -d ${D}${bindir}
> +  install -m 0755 ${WORKDIR}/llvm-config ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND =3D "native"
> diff --git a/meta-oe/recipes-core/llvm/llvm-common/llvm-config =
b/meta-oe/recipes-core/llvm/llvm-common/llvm-config
> new file mode 100644
> index 0000000..a9a416d
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm-common/llvm-config
> @@ -0,0 +1,10 @@
> +#!/bin/sh
> +# Wrapper script for real llvm-config. Simply calls
> +
> +if [ $WANT_LLVM_RELEASE ]; then
> +	exec `dirname $0`/${TARGET_PREFIX}llvm-config$WANT_LLVM_RELEASE =
${@}
> +else
> +  echo "The variable WANT_LLVM_RELEASE is not defined and exported"
> +	echo "by your build recipe. Go figure."
> +  exit 1
> +fi
> diff --git a/meta-oe/recipes-core/llvm/llvm.inc =
b/meta-oe/recipes-core/llvm/llvm.inc
> new file mode 100644
> index 0000000..1fbb0ef
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm.inc
> @@ -0,0 +1,214 @@
> +# LLVM does not provide ABI stability between different versions. For =
this
> +# reason OE makes it possible to build and install different llvm =
versions
> +# at the same time.
> +#
> +# This is true for the normal recipes as well as the native ones.
> +#
> +# All regular installation directories are prefixed with =
'llvm${LLVM_RELEASE}'
> +# e.g. "${STAGING_BINDIR}/llvm2.5" or "${STAGING_INCDIR}/llvm2.5"
> +#
> +# For your program or library that makes use of llvm you do should =
not need to
> +# modify anything as long as it uses the results of various =
llvm-config
> +# invocations. If you need customizations something is wrong and it =
needs to be
> +# fixed (report bug).
> +#
> +# However the *recipe* for your program/library *must* declare
> +# export WANT_LLVM_RELEASE =3D "<valid version number>"
> +# The version number is picked up by a generic wrapper script which =
just calls
> +# the variant of the specified version.
> +
> +DESCRIPTION =3D "The Low Level Virtual Machine"
> +HOMEPAGE =3D "http://llvm.org"
> +# 3-clause BSD-like
> +LICENSE =3D "NCSA"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3D0ac5f799a2d89477c75b0a378b221855"
> +
> +DEPENDS =3D "llvm${LLVM_RELEASE}-native llvm-common"
> +DEPENDS_virtclass-native =3D "llvm-common-native cmake-native"
> +
> +INC_PR =3D "r2"
> +
> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.tgz"
> +
> +S =3D "${WORKDIR}/llvm-${PV}"
> +
> +inherit cmake perlnative pythonnative
> +
> +# Defines the LLVM supported arches. By now we always build either =
for ${BUILD}
> +# (native) or ${TARGET}. In the future it may make sense to enable =
all backends
> +# for the non-native build. The decision which backends are used is =
made by
> +# the 3rd party program or library that uses llvm anyway.
> +LLVM_ARCH =3D "${@get_llvm_arch(d)}"
> +
> +# This is used for generating the install directory for the llvm =
libraries,
> +# binaries and headers. It makes side by side installation of those =
possible.
> +LLVM_RELEASE =3D "${PV}"
> +
> +# llvm *must* be built out of tree
> +OECMAKE_SOURCEPATH =3D ".."
> +OECMAKE_BUILDPATH =3D "build"
> +EXTRA_OECMAKE =3D "\
> +  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen=
 \
> +  -DLLVM_TARGETS_TO_BUILD=3D${LLVM_ARCH} \
> +  -DCMAKE_LINKER:FILEPATH=3D${LD} \
> +  -DCMAKE_AR:FILEPATH=3D${AR} \
> +  -DCMAKE_OBJCOPY:FILEPATH=3D${OBJCOPY} \
> +  -DCMAKE_OBJDUMP:FILEPATH=3D${OBJDUMP} \
> +  -DCMAKE_RANLIB:FILEPATH=3D${RANLIB} \
> +  -DCMAKE_STRIP:FILEPATH=3D${STRIP} \
> +  -DNM_PATH:FILEPATH=3D${NM} \
> +  -DLLVM_ENABLE_PIC:BOOL=3DON \
> +  -DLLVM_TARGET_ARCH:STRING=3D${LLVM_ARCH} \
> +  -DLLVM_ENABLE_ASSERTIONS:BOOL=3DON \
> +  -DCMAKE_BUILD_TYPE:STRING=3DRelWithDebInfo \
> +  -DBUILD_SHARED_LIBS:BOOL=3DON \
> +"
> +# We need to reset this to avoid breakage as we build out of tree
> +TOOLCHAIN_OPTIONS =3D ""
> +
> +PACKAGES_DYNAMIC =3D "llvm-*"
> +
> +# the difference to the non-native build is that we do not need
> +# to declare the location of the tblgen executable.
> +EXTRA_OECMAKE_virtclass-native =3D "\
> +  -DLLVM_TARGETS_TO_BUILD=3D${LLVM_ARCH} \
> +  -DCMAKE_LINKER:FILEPATH=3D${LD} \
> +  -DCMAKE_AR:FILEPATH=3D${AR} \
> +  -DCMAKE_OBJCOPY:FILEPATH=3D${OBJCOPY} \
> +  -DCMAKE_OBJDUMP:FILEPATH=3D${OBJDUMP} \
> +  -DCMAKE_RANLIB:FILEPATH=3D${RANLIB} \
> +  -DCMAKE_STRIP:FILEPATH=3D${STRIP} \
> +  -DNM_PATH:FILEPATH=3D${NM} \
> +"
> +
> +PACKAGES_virtclass-native =3D ""
> +
> +PACKAGES_DYNAMIC_virtclass-native =3D ""
> +
> +python populate_packages_prepend () {
> +    libllvm_libdir =3D =
bb.data.expand('${libdir}/llvm${LLVM_RELEASE}', d)
> +    do_split_packages(d, libllvm_libdir, '^lib(.*)\.so$', =
'libllvm-%s', 'Split package for %s', allow_dirs=3DTrue)
> +}
> +
> +FILES_${PN} =3D ""
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/llvm${LLVM_RELEASE}/.debug =
${bindir}/llvm${LLVM_RELEASE}/.debug"
> +
> +FILES_${PN}-dev =3D " \
> +                   ${includedir} \
> +                   ${bindir}/* \
> +                   ${libdir}/llvm${LLVM_RELEASE}/LLVMHello.so \
> +                   ${libdir}/llvm${LLVM_RELEASE}/BugpointPasses.so \
> +                   ${libdir}/llvm${LLVM_RELEASE}/*.a \
> +                 "
> +
> +do_install() {
> +    # Install into a private directory to be able to reorganize the =
files.
> +
> +    cd ${OECMAKE_BUILDPATH}
> +
> +    oe_runmake DESTDIR=3D${WORKDIR}/llvm-install install
> +
> +    # Create our custom target directories
> +    install -d ${D}${bindir}/llvm${LLVM_RELEASE}
> +    install -d ${D}${includedir}/llvm${LLVM_RELEASE}
> +    install -d ${D}${libdir}/llvm${LLVM_RELEASE}
> +
> +    #	Move headers into their own directory
> +    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
> +    ${D}${includedir}/llvm${LLVM_RELEASE}/
> +    cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
> +    ${D}${includedir}/llvm${LLVM_RELEASE}/
> +
> +    find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 =
-exec \
> +    install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
> +
> +	#	I dont know another way out. Binaries are installed into =
a special subdir
> +	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 =
-exec \
> +	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
> +
> +	# LLVM does not install this by default.
> +	install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
> +
> +        # we install it here unmodified for native and none native =
and overwrite it
> +        # later for native case
> +        install -d ${D}${bindir}
> +        install -m 0755 bin/llvm-config ${D}${bindir}
> +
> +	# Fix the paths in the config script to make it find the =
binaries and
> +	# library files. Doing so allows 3rd party configure scripts =
working
> +	# unmodified.
> +	sed -e's!my.*ABS_RUN_DIR =3D.*!my $ABS_RUN_DIR =3D =
"${STAGING_DIR_TARGET}";!' \
> +		-e's!my.*INCLUDEDIR =3D.*!my $INCLUDEDIR =3D =
"${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
> +		-e's!my.*LIBDIR.*!my $LIBDIR =3D =
"${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
> +		-e's!my.*BINDIR.*!my $BINDIR =3D =
"${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
> +		bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
> +
> +        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +        install -m 0755 bin/llvm-config${LLVM_RELEASE} =
${SYSROOT_DESTDIR}${bindir_crossscripts}
> +}
> +
> +do_install_virtclass-native() {
> +	# Install into a private directory to be able to reorganize the =
files.
> +
> +        cd ${OECMAKE_BUILDPATH}
> +
> +        oe_runmake DESTDIR=3D${WORKDIR}/llvm-install install
> +
> +	# Create our custom target directories
> +	install -d ${D}${bindir}/llvm${LLVM_RELEASE}
> +	install -d ${D}${includedir}/llvm${LLVM_RELEASE}
> +	install -d ${D}${libdir}/llvm${LLVM_RELEASE}
> +
> +	#	Move headers into their own directory
> +	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm \
> +	${D}${includedir}/llvm${LLVM_RELEASE}/
> +	cp -R ${WORKDIR}/llvm-install/${prefix}/include/llvm-c \
> +	${D}${includedir}/llvm${LLVM_RELEASE}/
> +
> +	find ${WORKDIR}/llvm-install/${prefix}/lib -name "*" -maxdepth 1 =
-exec \
> +	install {} ${D}${libdir}/llvm${LLVM_RELEASE} \;
> +
> +	#	I dont know another way out. Binaries are installed into =
a special subdir
> +	find ${WORKDIR}/llvm-install/${prefix}/bin -name "*" -maxdepth 1 =
-exec \
> +	install {} ${D}${bindir}/llvm${LLVM_RELEASE} \;
> +
> +	# LLVM does not install this by default.
> +	install bin/tblgen ${D}${bindir}/llvm${LLVM_RELEASE}
> +
> +	# Fix the paths in the config script to make it find the =
binaries and
> +	# library files. Doing so allows 3rd party configure scripts =
working
> +	# unmodified.
> +	sed -e's!my.*ABS_RUN_DIR =3D.*!my $ABS_RUN_DIR =3D =
"${STAGING_DIR_TARGET}";!' \
> +		-e's!my.*INCLUDEDIR =3D.*!my $INCLUDEDIR =3D =
"${STAGING_INCDIR}/llvm${LLVM_RELEASE}";!' \
> +		-e's!my.*LIBDIR.*!my $LIBDIR =3D =
"${STAGING_LIBDIR}/llvm${LLVM_RELEASE}";!' \
> +		-e's!my.*BINDIR.*!my $BINDIR =3D =
"${STAGING_BINDIR}/llvm${LLVM_RELEASE}";!' \
> +		bin/llvm-config > bin/llvm-config${LLVM_RELEASE}
> +
> +        install -d ${D}${bindir}
> +        install -m 0755 bin/llvm-config${LLVM_RELEASE} ${D}${bindir}
> +}
> +
> +
> +# Retrieve the target in a way that is compatible to the arch
> +# value in llvm (>=3D 2.5)
> +def get_llvm_arch(d):
> +    import bb;
> +
> +    arch =3D bb.data.getVar('TARGET_ARCH', d, 1)
> +    if arch =3D=3D "x86_64" or arch =3D=3D "i486" or arch =3D=3D =
"i586" or arch =3D=3D "i686":
> +        arch =3D "X86"
> +    elif arch =3D=3D "arm":
> +        arch =3D "ARM"
> +    elif arch =3D=3D "mipsel" or arch =3D=3D "mips":
> +        arch =3D "mips"
> +    elif arch =3D=3D "powerpc" or arch =3D=3D "powerpc64":
> +        arch =3D "PowerPC"
> +    else:
> +        bb.warn("%s does not support %s yet" % (bb.data.getVar('PN', =
d, 1), arch) );
> +
> +    return arch
> +
> +BBCLASSEXTEND =3D "native"
> +
> diff --git a/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch =
b/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
> new file mode 100644
> index 0000000..a7f7bbe
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.8/0019-issue6065.patch
> @@ -0,0 +1,20 @@
> +---
> + ARMJITInfo.cpp |    6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +--- a/lib/Target/ARM/ARMJITInfo.cpp
> ++++ b/lib/Target/ARM/ARMJITInfo.cpp
> +@@ -99,7 +99,13 @@
> +     // The above twiddling of the saved return addresses allows us =
to
> +     // deallocate everything, including the LR the stub saved, all =
in one
> +     // pop instruction.
> ++#ifndef __thumb__
> +     "ldmia  sp!, {r0, r1, r2, r3, lr, pc}\n"
> ++#else
> ++    // thumb dont allow lr and pc to be poped in the same =
instruction.
> ++    "pop {r0, r1, r2, r3, lr}\n"
> ++    "pop {pc}\n"
> ++#endif
> +       );
> + #else  // Not an ARM host
> +   void ARMCompilationCallback() {
> diff --git =
a/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch =
b/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
> new file mode 100644
> index 0000000..ee5cbaf
> --- /dev/null
> +++ =
b/meta-oe/recipes-core/llvm/llvm2.8/30may-llvm2.8-pr399-ppc-arm.patch
> @@ -0,0 +1,113 @@
> +Index: llvm-2.8/lib/ExecutionEngine/JIT/JIT.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.8.orig/lib/ExecutionEngine/JIT/JIT.cpp	2010-08-17 =
18:19:18.000000000 +0200
> ++++ llvm-2.8/lib/ExecutionEngine/JIT/JIT.cpp	2011-12-19 =
21:16:21.884288536 +0100
> +@@ -252,7 +252,12 @@
> +     MutexGuard guard(Lock);
> +     JITs.erase(jit);
> +   }
> +-  void *getPointerToNamedFunction(const char *Name) const {
> ++  bool empty() {
> ++    MutexGuard guard(Lock);
> ++    return JITs.empty();
> ++  }
> ++  void *getPointerToNamedFunction(const char *Name,
> ++                                  bool AbortOnFailure =3D true) =
const {
> +     MutexGuard guard(Lock);
> +     assert(JITs.size() !=3D 0 && "No Jit registered");
> +     //search function in every instance of JIT
> +@@ -264,7 +269,19 @@
> +     }
> +     // The function is not available : fallback on the first created =
(will
> +     // search in symbol of the current program/library)
> +-    return (*JITs.begin())->getPointerToNamedFunction(Name);
> ++    return (*JITs.begin())->getPointerToNamedFunction(Name, =
AbortOnFailure);
> ++  }
> ++  void *getPointerToGlobalIfAvailable(GlobalValue *V) const {
> ++    MutexGuard guard(Lock);
> ++    assert(JITs.size() !=3D 0 && "No Jit registered");
> ++    //search function in every instance of JIT
> ++    for (SmallPtrSet<JIT*, 1>::const_iterator Jit =3D JITs.begin(),
> ++           end =3D JITs.end();
> ++         Jit !=3D end; ++Jit) {
> ++      if (void *Ptr =3D (*Jit)->getPointerToGlobalIfAvailable(V))
> ++	return Ptr;
> ++    }
> ++    return 0;
> +   }
> + };
> + ManagedStatic<JitPool> AllJits;
> +@@ -280,6 +297,22 @@
> +   }
> + }
> +=20
> ++extern "C" {
> ++  // getPointerToNamedFunctionOrNull - same as the above, but =
returns
> ++  // NULL instead of aborting if the function cannot be found.
> ++  void *getPointerToNamedFunctionOrNull(const char *Name) {
> ++    return !AllJits->empty() ? =
AllJits->getPointerToNamedFunction(Name, false) : 0;
> ++  }
> ++}
> ++
> ++extern "C" {
> ++  // getPointerToGlobalIfAvailable - same as the above, but for =
global
> ++  // variables, and only for those that have been codegened already.
> ++  void *getPointerToGlobalIfAvailable(GlobalValue *V) {
> ++    return !AllJits->empty() ? =
AllJits->getPointerToGlobalIfAvailable(V) : 0;
> ++  }
> ++}
> ++
> + JIT::JIT(Module *M, TargetMachine &tm, TargetJITInfo &tji,
> +          JITMemoryManager *JMM, CodeGenOpt::Level OptLevel, bool =
GVsWithCode)
> +   : ExecutionEngine(M), TM(tm), TJI(tji), =
AllocateGVsWithCode(GVsWithCode),
> +Index: llvm-2.8/lib/Target/ARM/ARMISelLowering.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.8.orig/lib/Target/ARM/ARMISelLowering.cpp	2010-09-03 =
03:35:08.000000000 +0200
> ++++ llvm-2.8/lib/Target/ARM/ARMISelLowering.cpp	2011-12-19 =
21:16:21.884288536 +0100
> +@@ -1119,6 +1119,9 @@
> +   }
> + }
> +=20
> ++extern "C" void *getPointerToNamedFunctionOrNull(const char *Name);
> ++extern "C" void *getPointerToGlobalIfAvailable(GlobalValue *Value);
> ++
> + /// LowerCall - Lowering a call into a callseq_start <-
> + /// ARMISD:CALL <- callseq_end chain. Also add input and output =
parameter
> + /// nodes.
> +@@ -1272,6 +1275,26 @@
> +     InFlag =3DSDValue();
> +   }
> +=20
> ++  EVT PtrVT =3D DAG.getTargetLoweringInfo().getPointerTy();
> ++
> ++  // XXX Work around for http://llvm.org/bugs/show_bug.cgi?id=3D5201
> ++  // and http://icedtea.classpath.org/bugzilla/show_bug.cgi?id=3D399
> ++  // for Shark.
> ++  //
> ++  // If the callee is an ExternalSymbol node, and the symbol can be
> ++  // resolved to a function pointer, then insert that pointer as a
> ++  // constant.  This causes the next block of code to fall into the
> ++  // block that emits an indirect call.  This works around
> ++  //
> ++  // This works for Shark because the only kinds of call that Shark
> ++  // makes that do not already fall into the indirect call block are
> ++  // calls to pre-existing external functions.
> ++  if (ExternalSymbolSDNode *S =3D =
dyn_cast<ExternalSymbolSDNode>(Callee)) {
> ++    void *FuncPtr =3D =
getPointerToNamedFunctionOrNull(S->getSymbol());
> ++    if (FuncPtr)
> ++      Callee =3D DAG.getConstant((uint64_t) FuncPtr, PtrVT);
> ++  }
> ++
> +   // If the callee is a GlobalAddress/ExternalSymbol node (quite =
common, every
> +   // direct call is) turn it into a =
TargetGlobalAddress/TargetExternalSymbol
> +   // node so that legalize doesn't hack it.
> +Index: llvm-2.8/tools/llc/CMakeLists.txt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.8.orig/tools/llc/CMakeLists.txt	2009-09-03 =
00:45:31.000000000 +0200
> ++++ llvm-2.8/tools/llc/CMakeLists.txt	2011-12-19 =
21:16:21.884288536 +0100
> +@@ -1,4 +1,4 @@
> +-set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} bitreader =
asmparser)
> ++set(LLVM_LINK_COMPONENTS ${LLVM_TARGETS_TO_BUILD} jit bitreader =
asmparser)
> +=20
> + add_llvm_tool(llc
> +   llc.cpp
> diff --git a/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch =
b/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
> new file mode 100644
> index 0000000..1c51b30
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.8/add-unistd.patch
> @@ -0,0 +1,12 @@
> +Index: llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.8.orig/lib/ExecutionEngine/JIT/Intercept.cpp	=
2012-05-14 18:31:21.008318473 +0200
> ++++ llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 =
18:32:53.523734850 +0200
> +@@ -19,6 +19,7 @@
> + #include "llvm/Support/ErrorHandling.h"
> + #include "llvm/System/DynamicLibrary.h"
> + #include "llvm/Config/config.h"
> ++#include <unistd.h>
> + using namespace llvm;
> +=20
> + // AtExitHandlers - List of functions to call when the program =
exits,
> diff --git a/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch =
b/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
> new file mode 100644
> index 0000000..fddc674
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.8/llvm-mc_disable.patch
> @@ -0,0 +1,12 @@
> +Index: llvm-2.8/tools/CMakeLists.txt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.8.orig/tools/CMakeLists.txt	2010-08-24 =
11:16:51.000000000 +0200
> ++++ llvm-2.8/tools/CMakeLists.txt	2011-12-21 16:47:47.718508763 =
+0100
> +@@ -14,7 +14,6 @@
> + add_subdirectory(opt)
> + add_subdirectory(llvm-as)
> + add_subdirectory(llvm-dis)
> +-add_subdirectory(llvm-mc)
> +=20
> + add_subdirectory(llc)
> + add_subdirectory(llvm-ranlib)
> diff --git a/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb =
b/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
> new file mode 100644
> index 0000000..27ed41d
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.8_2.8.bb
> @@ -0,0 +1,21 @@
> +require llvm.inc
> +
> +#LICENSE =3D "University of Illinois/NCSA Open Source License"
> +LICENSE =3D "NCSA"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.TXT;md5=3D0ac5f799a2d89477c75b0a378b221855"
> +
> +PR =3D "${INC_PR}.2"
> +
> +SRC_URI +=3D " \
> +            file://30may-llvm2.8-pr399-ppc-arm.patch \
> +            file://0019-issue6065.patch \
> +            file://add-unistd.patch \
> +            file://llvm-mc_disable.patch \
> +           "
> +
> +LLVM_RELEASE =3D "2.8"
> +
> +EXTRA_OECMAKE +=3D " -DBUILD_SHARED_LIBS:BOOL=3DOFF "
> +
> +SRC_URI[md5sum] =3D "220d361b4d17051ff4bb21c64abe05ba"
> +SRC_URI[sha256sum] =3D =
"25addb742f1c6cc12877ed0ee924dda962d848368ee095be8e48342ae613d43b"
> diff --git a/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch =
b/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
> new file mode 100644
> index 0000000..c3ae494
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
> @@ -0,0 +1,14 @@
> +Index: llvm-2.9/include/llvm/Support/FEnv.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- llvm-2.9.orig/include/llvm/Support/FEnv.h	2010-11-29 =
20:44:50.000000000 +0100
> ++++ llvm-2.9/include/llvm/Support/FEnv.h	2011-11-18 =
18:42:22.580161297 +0100
> +@@ -17,6 +17,9 @@
> +=20
> + #include "llvm/Config/config.h"
> + #include <cerrno>
> ++
> ++#undef HAVE_FENV_H
> ++
> + #ifdef HAVE_FENV_H
> + #include <fenv.h>
> + #endif
> diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb =
b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
> new file mode 100644
> index 0000000..b956aad
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
> @@ -0,0 +1,29 @@
> +require llvm.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
> +
> +PARALLEL_MAKE_virtclass-native =3D ""
> +
> +EXTRA_OECMAKE =3D "\
> +  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm${LLVM_RELEASE}/tblgen=
 \
> +  -DLLVM_TARGETS_TO_BUILD=3D"X86;${LLVM_ARCH}" \
> +  -DCMAKE_LINKER:FILEPATH=3D${LD} \
> +  -DCMAKE_AR:FILEPATH=3D${AR} \
> +  -DCMAKE_OBJCOPY:FILEPATH=3D${OBJCOPY} \
> +  -DCMAKE_OBJDUMP:FILEPATH=3D${OBJDUMP} \
> +  -DCMAKE_RANLIB:FILEPATH=3D${RANLIB} \
> +  -DCMAKE_STRIP:FILEPATH=3D${STRIP} \
> +  -DNM_PATH:FILEPATH=3D${NM} \
> +  -DLLVM_ENABLE_PIC:BOOL=3DON \
> +  -DLLVM_TARGET_ARCH:STRING=3D${LLVM_ARCH} \
> +  -DLLVM_ENABLE_ASSERTIONS:BOOL=3DON \
> +  -DCMAKE_BUILD_TYPE:STRING=3DRelWithDebInfo \
> +  -DBUILD_SHARED_LIBS:BOOL=3DON \
> +"
> +
> +LLVM_RELEASE =3D "2.9"
> +
> +SRC_URI[md5sum] =3D "793138412d2af2c7c7f54615f8943771"
> +SRC_URI[sha256sum] =3D =
"661236cfa17428b48cfa9cbb9909f7569c64b8ecd219fd91dbc00e3b557b3779"
> --=20
> 1.8.1.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



