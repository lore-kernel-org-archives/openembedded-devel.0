Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LO3CT-0003HI-EM
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 05:54:25 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090117044735.GYYU12540.fed1rmmtao106.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 16 Jan 2009 23:47:35 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 4UnW1b00M1E665w04UnYTr; Fri, 16 Jan 2009 23:47:36 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=2Bw3cwVKivTe5eFJqfIA:9 a=LMbeiPqTwpW_YkDiE7kA:7
	a=z1OPZzDzPrawVdXSLUrCFW61dE0A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 16 Jan 2009 21:47:28 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090117044728.GT6710@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
	<20090101182526.GF7040@smtp.west.cox.net>
	<1230840687.5320.56.camel@dax.rpnet.com>
	<20090101220229.GH7040@smtp.west.cox.net>
	<1230858713.10424.4.camel@dax.rpnet.com>
	<1231462490.6467.85.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1231462490.6467.85.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Sat, 17 Jan 2009 04:54:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 12:54:50AM +0000, Richard Purdie wrote:
[snip]
> a) We push my tree into OE

Done on your behalf now.

> b) You rebase onto my tree's changes and adjust the EXEEXT stuff.
> 
> c) You add changes which add the EXEEXT changes only to existing 
>    recipes and commit that.
> 
> d) The checksums.ini changes are a no brainer.
> 
> e) You start adding the totally new files to OE directly in a logical 
>    sequence of something like:
> 
>    i) Add canadian core classes (classes/canadian*)
>    ii) Add mingw new recipes
>    iii) Add misc support recipes (gmp/mprf-canadian)
>    iv) Add new binutils recipes
>    v) Add new gcc recipes

OK, this is the trini/canadian-merge branch.

> f) You make a diff of the remaining changes that are needed and we 
>    review those.

This is all that's left:
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index a20b6bb..3a97729 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -5,6 +5,7 @@ IMAGE_PKGTYPE ?= "ipk"
 
 IPKGCONF_TARGET = "${STAGING_ETCDIR_NATIVE}/opkg.conf"
 IPKGCONF_SDK =  "${STAGING_ETCDIR_NATIVE}/opkg-sdk.conf"
+IPKGCONF_CANSDK =  "${STAGING_ETCDIR_NATIVE}/opkg-canadian-sdk.conf"
 
 python package_ipk_fn () {
 	from bb import data
@@ -90,6 +91,10 @@ package_update_index_ipk () {
 			touch ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages
 			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/
 		fi
+		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/ ] ; then
+			touch ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages
+			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/
+		fi
 	done
 }
 
@@ -102,11 +107,13 @@ package_generate_ipkg_conf () {
 	mkdir -p ${STAGING_ETCDIR_NATIVE}/
 	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_TARGET}
 	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_SDK}
+	echo "src oe file:${DEPLOY_DIR_IPK}" > ${IPKGCONF_CANSDK}
 	ipkgarchs="${PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
 		echo "arch ${BUILD_ARCH}-$arch-sdk $priority" >> ${IPKGCONF_SDK}
+		echo "arch ${SDK_SYS}-sdk-$arch $priority" >> ${IPKGCONF_CANSDK}
 		priority=$(expr $priority + 5)
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
@@ -114,6 +121,9 @@ package_generate_ipkg_conf () {
 		if [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages ] ; then
 		        echo "src oe-${BUILD_ARCH}-$arch-sdk file:${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk" >> ${IPKGCONF_SDK}
 		fi
+		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages ] ; then
+		        echo "src oe-${SDK_SYS}-sdk-$arch file:${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch" >> ${IPKGCONF_CANSDK}
+		fi
 	done
 }
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 06fb893..a136548 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -89,6 +89,14 @@ TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
 
+SDK_ARCH ?= "${BUILD_ARCH}"
+SDK_OS ?= "${BUILD_OS}"
+SDK_VENDOR ?= "${BUILD_VENDOR}"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) == ('' or 'custom')]}"
+SDK_PREFIX = "${SDK_SYS}-"
+SDK_CC_ARCH ?= "${BUILD_CC_ARCH}"
+SDK_EXEEXT = ""
+
 # A shortcut for the commonly used value
 EXEEXT = "${HOST_EXEEXT}"
 
@@ -274,6 +282,8 @@ STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 # specific packages - hack around it for now.
 STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}"
 
+STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
+
 DEPLOY_DIR = "${TMPDIR}/deploy"
 DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
@@ -398,14 +408,17 @@ PATCHRESOLVE = 'noop'
 export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 export CPPFLAGS = "${TARGET_CPPFLAGS}"
 export TARGET_CPPFLAGS = "-isystem${STAGING_DIR_TARGET}${layout_includedir}"
+export SDK_CPPFLAGS = "-isystem${STAGING_DIR_SDK}${layout_includedir} -isystem${STAGING_DIR_HOST}${layout_includedir}"
 
 export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 export CFLAGS = "${TARGET_CFLAGS}"
 export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+export SDK_CFLAGS = "${SDK_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
 export BUILD_CXXFLAGS = "${BUILD_CFLAGS} -fpermissive"
 export CXXFLAGS = "${TARGET_CXXFLAGS}"
 export TARGET_CXXFLAGS = "${TARGET_CFLAGS} -fpermissive"
+export SDK_CXXFLAGS = "${SDK_CFLAGS} -fpermissive"
 
 export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
@@ -416,6 +429,9 @@ export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
                          -Wl,-O1 \
                          ${TARGET_LINK_HASH_STYLE}"
+export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${layout_libdir} \
+                         -Wl,-rpath-link,${STAGING_DIR_SDK}${layout_libdir} \
+                         -Wl,-O1"
 
 # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
 ALLOWED_FLAGS = "-O -mcpu -march -pipe"
diff --git a/packages/gcc/gcc-package-sdk.inc b/packages/gcc/gcc-package-sdk.inc
index 41f47ae..1882fbe 100644
--- a/packages/gcc/gcc-package-sdk.inc
+++ b/packages/gcc/gcc-package-sdk.inc
@@ -9,10 +9,10 @@ PACKAGES = "${PN} ${PN}-doc"
 
 FILES_${PN} = "\
     ${bindir}/* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771 \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1${EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2${EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f771${EXEEXT} \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus${EXEEXT} \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
@@ -29,17 +29,17 @@ FILES_${PN}-doc = "\
     "
 
 do_install () {
-	oe_runmake 'DESTDIR=${D}' install
+	oe_runmake 'DESTDIR=${D}' 'prefix=${SDK_PATH}' install
 
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 
 	# We care about g++ not c++
-	rm -f ${D}${bindir}/*c++
+	rm -f ${D}${bindir}/*c++${EXEEXT}
 
 	# We don't care about the gcc-<version> copies
-	rm -f ${D}${bindir}/*gcc-?.?*
+	rm -f ${D}${bindir}/*gcc-?.?*${EXEEXT}
 
 	# We use libiberty from binutils
 	rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
@@ -50,7 +50,7 @@ do_install () {
 	for l in ${D}${bindir}/*; do
 		ln -sf "${bindir}/`basename $l`" "${D}${prefix}/${TARGET_SYS}/bin/`basename $l | sed -e 's,${TARGET_PREFIX},,'`"
 	done
-	ln -sf "${bindir}/${TARGET_PREFIX}gcc" "${D}${prefix}/${TARGET_SYS}/bin/cc"
+	ln -sf "${bindir}/${TARGET_PREFIX}gcc${EXEEXT}" "${D}${prefix}/${TARGET_SYS}/bin/cc${EXEEXT}"
 
 	# Manually run the target stripper since we won't get it run by
 	# the packaging.
@@ -60,4 +60,3 @@ do_install () {
 		${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/libgcc_s.so.*
 	fi
 }
-
diff --git a/packages/meta/canadian-sdk.bb b/packages/meta/canadian-sdk.bb
new file mode 100644
index 0000000..150c752
--- /dev/null
+++ b/packages/meta/canadian-sdk.bb
@@ -0,0 +1,136 @@
+DESCRIPTION = "Meta package for building a installable toolchain"
+LICENSE = "MIT"
+DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
+PR = "r2"
+
+inherit canadian-sdk meta
+
+SDK_DIR = "${WORKDIR}/sdk"
+SDK_OUTPUT = "${SDK_DIR}/image"
+SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
+SDK_SUFFIX = "toolchain"
+
+FEED_ARCH ?= "${TARGET_ARCH}"
+
+IPKG_HOST = "ipkg-cl -f ${IPKGCONF_CANSDK} -o ${SDK_OUTPUT}"
+IPKG_TARGET = "ipkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}${prefix}"
+
+TOOLCHAIN_CANADIAN_HOST_TASK ?= "task-sdk-canadian-host"
+TOOLCHAIN_TARGET_TASK ?= "task-sdk-bare"
+
+RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_CANADIAN_HOST_TASK}"
+
+do_populate_sdk() {
+	rm -rf ${SDK_OUTPUT}
+	mkdir -p ${SDK_OUTPUT}
+
+	package_update_index_ipk
+	package_generate_ipkg_conf
+
+	for arch in ${PACKAGE_ARCHS}; do
+		revipkgarchs="$arch $revipkgarchs"
+	done
+
+	${IPKG_HOST} update
+	${IPKG_HOST} -force-depends install ${TOOLCHAIN_CANADIAN_HOST_TASK}
+
+	${IPKG_TARGET} update
+	${IPKG_TARGET} install ${TOOLCHAIN_TARGET_TASK}
+
+	mkdir -p ${SDK_OUTPUT}${prefix}/${TARGET_SYS}
+	cp -pPR ${SDK_OUTPUT}${prefix}/usr ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/
+	rm -rf ${SDK_OUTPUT}${prefix}/usr
+
+	cp -pPR ${SDK_OUTPUT}${prefix}/lib/* ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/
+	rm -rf ${SDK_OUTPUT}${prefix}/lib/*
+
+	cp -pPR ${SDK_OUTPUT}/usr/lib/ipkg ${SDK_OUTPUT}${prefix}/lib/
+	rm -rf ${SDK_OUTPUT}/usr/lib/ipkg/*
+	rmdir -p --ignore-fail-on-non-empty ${SDK_OUTPUT}/usr/lib/ipkg
+
+	for fn in `ls ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/`; do
+		if [ -h ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn ]; then
+			link=`readlink ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn`
+			bname=`basename $link`
+			if [ ! -e $link -a -e ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$bame ]; then
+				rm ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn
+				ln -s $bname ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/$fn
+			fi
+		fi
+	done
+
+	mv ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/gcc ${SDK_OUTPUT}${prefix}/lib
+
+	echo 'GROUP ( libpthread.so.0 libpthread_nonshared.a )' > ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/libpthread.so
+	echo 'GROUP ( libc.so.6 libc_nonshared.a )' > ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/libc.so
+
+	# extract and store ipks, pkgdata and shlibs data
+	target_pkgs=`cat ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/usr/lib/ipkg/status | grep Package: | cut -f 2 -d ' '`
+	mkdir -p ${SDK_OUTPUT}/${prefix}/ipk/
+	mkdir -p ${SDK_OUTPUT}/${prefix}/pkgdata/runtime/
+	mkdir -p ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/shlibs/
+	for pkg in $target_pkgs ; do
+		for arch in $revipkgarchs; do
+			pkgnames=${DEPLOY_DIR_IPK}/$arch/${pkg}_*_$arch.ipk
+			if [ -e $pkgnames ]; then
+				oenote "Found $pkgnames"
+				cp $pkgnames ${SDK_OUTPUT}/${prefix}/ipk/
+				orig_pkg=`ipkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
+				pkg_subdir=$arch${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}
+				mkdir -p ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime
+				cp ${TMPDIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/
+				subpkgs=`cat ${TMPDIR}/pkgdata/$pkg_subdir/$orig_pkg | grep PACKAGES: | cut -b 10-`
+				for subpkg in $subpkgs; do
+					cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
+					if [ -e ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ];then
+						cp ${TMPDIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT}/${prefix}/pkgdata/$pkg_subdir/runtime/
+					fi
+					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
+						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/shlibs/
+					fi
+				done
+				break
+			fi
+		done
+	done
+
+	# add missing link to libgcc_s.so.1
+	# libgcc-dev should be responsible for that, but it's not getting built
+	# RP: it gets smashed up depending on the order that gcc, gcc-cross and
+	# gcc-cross-sdk get built :( (30/11/07)
+	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
+
+	# Fix or remove broken .la files
+	for i in `find ${SDK_OUTPUT}/${prefix}/${TARGET_SYS} -name \*.la`; do
+		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${layout_base_libdir},\1${prefix}/${TARGET_SYS}${layout_base_libdir},g" \
+			-e "/^dependency_libs=/s,\([[:space:]']\)${layout_libdir},\1${prefix}/${TARGET_SYS}${layout_libdir},g" \
+			-e "/^dependency_libs=/s,\-\([LR]\)${layout_base_libdir},-\1${prefix}/${TARGET_SYS}${layout_base_libdir},g" \
+			-e "/^dependency_libs=/s,\-\([LR]\)${layout_libdir},-\1${prefix}/${TARGET_SYS}${layout_libdir},g" \
+			-e 's/^installed=yes$/installed=no/' $i
+	done
+	rm -f ${SDK_OUTPUT}/${prefix}/lib/*.la
+
+	# Setup site file for external use
+	siteconfig=${SDK_OUTPUT}/${prefix}/site-config
+	touch $siteconfig
+	for sitefile in ${CONFIG_SITE} ; do
+		cat $sitefile >> $siteconfig
+	done
+}
+
+do_package_sdk() {
+	# package it up
+	mkdir -p ${SDK_DEPLOY}
+	cd ${SDK_OUTPUT}
+	fakeroot tar cfj ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.tar.bz2 .${prefix}
+	rm -f ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.zip
+	zip -r -D ${SDK_DEPLOY}/${SDK_SYS}-sdk-${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}.zip .${prefix}
+}
+
+do_populate_sdk[nostamp] = "1"
+do_populate_sdk[recrdeptask] = "do_package_write"
+addtask populate_sdk before do_build after do_install
+
+do_package_sdk[nostamp] = "1"
+do_package_sdk[recrdeptask] = "do_populate_sdk"
+addtask package_sdk before do_build after do_populate_sdk

So, we've got a few things in here:
- IPKGCONF_CANSDK stuff.  Analogous to the others we have now.
- The rest of the SDK_foo variables.
- ${EXEEXT} stuff in gcc-package.sdk.inc
- In gcc-package-sdk.inc's do_install, pass in 'prefix=${SDK_PATH}' to
  the install target.  This is needed in some path games that get played
  by gcc, iirc.
- canadian-sdk.bb

> * The amount of code duplication in meta-toolchain/canadian-sdk - we 
>   really need to think about refactoring that code. 

Totally agree, but can we bring this in THEN try and abstract things out
more (I'm thinking meta-toolchain.inc for a filename, and functions for
common stuff)?

> * I'm also not keen on the SDK_PREFIX -> SDK_PATH change. Why? It 
>   breaks things for people. In fact please back this out before merging 
>   anything above, I don't see a good reason for it.

See the other parts of this thread for a recap.  I've specifically put
this into the merge branch.

> * The choice of OVERRIDE you're using worries me as sdk- is far to much 
>   of a generic expression. You don't use the overrides much and only 
>   for DEFAULT_PREFERENCE. Can we not find a better way to do this and 
>   avoid adding overrides? The fact these are there suggests something 
>   with the PROVIDES and DEPENDS logic you're using is broken as it 
>   should be fairly magic (and a lot of effort went into that for the 
>   standard toolchains) :/

As I've said elsewhere, dropped.

-- 
Tom Rini


