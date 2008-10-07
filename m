Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC71-0007GM-9M
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:27 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97CpkAN021282;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>)
	id 1KnC2U-00015V-HI; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:46 +0200
Message-Id: <f2596b99780ea3954dc25884bf29704a5584c2f8.1223383759.git.eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <6f8742b61ff8e48ed77c91bc9573711e0d3c6f53.1223383759.git.eha@doredevelopment.dk>
References: <> <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
	<b011d8abd4dd7f517da3f835736cce56a1acd919.1223383759.git.eha@doredevelopment.dk>
	<c00c0e996ed9eff33dae83236a28a88f6bcf9a73.1223383759.git.eha@doredevelopment.dk>
	<2c0637f3c20a6f84ea03f1fdb9212b970ef9c371.1223383759.git.eha@doredevelopment.dk>
	<d01d019899790eefd7fb6742174f2c359022b4fa.1223383759.git.eha@doredevelopment.dk>
	<cc617cfc6a87cb5e145ace9c07d91a4cf4853600.1223383759.git.eha@doredevelopment.dk>
	<5b160cf460453dfb437c1b2c8972e4f3678e6aad.1223383759.git.eha@doredevelopment.dk>
	<93d0cbbfbf07239138d3b25f7a411ab8409fc67a.1223383759.git.eha@doredevelopment.dk>
	<8d921520e115ee5aeb40f0b1dc2b4fd2a6abea29.1223383759.git.eha@doredevelopment.dk>
	<eb9f8974f6c3f5c6f86634656ccc0be509e9ad6f.1223383759.git.eha@doredevelopment.dk>
	<dd0ef3bb331e249a81458281dabe93098943e0a3.1223383759.git.eha@doredevelopment.dk>
	<6f8742b61ff8e48ed77c91bc9573711e0d3c6f53.1223383759.git.eha@doredevelopment.dk>
In-Reply-To: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
References: <c50b431758852b327e53d4de9de43173d439b36a.1223383759.git.eha@doredevelopment.dk>
Cc: Esben Haabendal <eha@doredevelopment.dk>
Subject: [PATCH 13/13] canadian-sdk.bb, task-sdk-canadian-host.bb
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
X-List-Received-Date: Tue, 07 Oct 2008 12:56:27 -0000

From: Esben Haabendal <eha@doredevelopment.dk>


Signed-off-by: Esben Haabendal <eha@doredevelopment.dk>
---
 packages/meta/canadian-sdk.bb            |  143 ++++++++++++++++++++++++++++++
 packages/tasks/task-sdk-canadian-host.bb |   24 +++++
 2 files changed, 167 insertions(+), 0 deletions(-)
 create mode 100644 packages/meta/canadian-sdk.bb
 create mode 100644 packages/tasks/task-sdk-canadian-host.bb

diff --git a/packages/meta/canadian-sdk.bb b/packages/meta/canadian-sdk.bb
new file mode 100644
index 0000000..119b4b0
--- /dev/null
+++ b/packages/meta/canadian-sdk.bb
@@ -0,0 +1,143 @@
+DESCRIPTION = "Meta package for building a installable toolchain"
+LICENSE = "MIT"
+DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native"
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
+	mkdir -p ${SDK_OUTPUT}${prefix}/ipk/
+	mkdir -p ${SDK_OUTPUT}${prefix}/pkgdata/runtime/
+	mkdir -p ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/shlibs/
+	for pkg in $target_pkgs ; do
+		for arch in $revipkgarchs; do
+			pkgnames=${DEPLOY_DIR_IPK}/$arch/${pkg}_*_$arch.ipk
+			if [ -e $pkgnames ]; then
+				oenote "Found $pkgnames"
+				cp $pkgnames ${SDK_OUTPUT}${prefix}/ipk/
+				orig_pkg=`ipkg-list-fields $pkgnames | grep OE: | cut -d ' ' -f2`
+				pkg_subdir_postfix=${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}
+				for aarch in $revipkgarchs; do
+					if [ -e "${STAGING_DIR}/pkgdata/${aarch}${pkg_subdir_postfix}/${orig_pkg}" ]; then
+						pkg_subdir="${aarch}${pkg_subdir_postfix}"
+						break
+					fi
+				done
+				oenote "Original package in ${pkg_subdir}"
+				mkdir -p ${SDK_OUTPUT}${prefix}/pkgdata/$pkg_subdir/runtime
+				cp ${STAGING_DIR}/pkgdata/$pkg_subdir/$orig_pkg ${SDK_OUTPUT}${prefix}/pkgdata/$pkg_subdir/
+				subpkgs=`cat ${STAGING_DIR}/pkgdata/$pkg_subdir/$orig_pkg | grep PACKAGES: | cut -b 10-`
+				for subpkg in $subpkgs; do
+					cp ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg ${SDK_OUTPUT}${prefix}/pkgdata/$pkg_subdir/runtime/
+					if [ -e ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ];then
+						cp ${STAGING_DIR}/pkgdata/$pkg_subdir/runtime/$subpkg.packaged ${SDK_OUTPUT}${prefix}/pkgdata/$pkg_subdir/runtime/
+					fi
+					if [ -e ${STAGING_DIR_TARGET}/shlibs/$subpkg.list ]; then
+						cp ${STAGING_DIR_TARGET}/shlibs/$subpkg.* ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/shlibs/
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
+	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/libgcc_s.so
+
+	# remove unwanted executables
+	rm -rf ${SDK_OUTPUT}${prefix}/sbin ${SDK_OUTPUT}${prefix}/etc
+
+	# remove broken .la files
+	rm -f ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/*.la
+
+	# fix pkgconfig data files
+	if [ -e ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/pkgconfig ]; then
+		cd ${SDK_OUTPUT}${prefix}/${TARGET_SYS}/lib/pkgconfig
+		for f in *.pc ; do
+			sed -i 's%=/usr%=${prefix}/${TARGET_SYS}%g' "$f"
+		done
+		for f in *.pc ; do
+			sed -i 's%${STAGING_DIR}%${prefix}%g' "$f"
+		done
+	fi
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
diff --git a/packages/tasks/task-sdk-canadian-host.bb b/packages/tasks/task-sdk-canadian-host.bb
new file mode 100644
index 0000000..2f8c1e3
--- /dev/null
+++ b/packages/tasks/task-sdk-canadian-host.bb
@@ -0,0 +1,24 @@
+#
+# Copyright (C) 2007 OpenedHand Ltd
+#
+
+DESCRIPTION = "Host packages for the standalone SDK or external toolchain"
+PR = "r1"
+LICENSE = "MIT"
+ALLOW_EMPTY = "1"
+
+inherit canadian-sdk
+
+PACKAGES = "${PN}"
+
+RDEPENDS_${PN} = "\
+    binutils-canadian-sdk \
+    gcc-canadian-sdk \
+    g++ \
+    cpp \
+    libgcc \
+    libgcc-dev \
+    libstdc++ \
+    libstdc++-dev \
+    "
+#    gdb-canadian-sdk \
-- 
1.5.4.3



