Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36BC578842
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 03:14:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBM3EkEG001667
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 19:14:47 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 19:14:45 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Dec 2017 10:54:51 +0800
Message-ID: <20171222025451.1928-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH] protobuf: add ptest support
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
X-List-Received-Date: Fri, 22 Dec 2017 03:14:46 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Add DEPENDS_class-target  = "protobuf-native"
  to fix below error:
  | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
  | DEBUG: Executing shell function do_compile_ptest_base
  | NOTE: make -C $Prj/build/tmp-glibc/work/core2-64-wrs-linux/protobuf/3.4.1+gitAUTOINC+b04e5cba35-r0/git/examples cpp
  | make: Entering directory '$Prj/build/tmp-glibc/work/core2-64-wrs-linux/protobuf/3.4.1+gitAUTOINC+b04e5cba35-r0/git/examples'
  | protoc --cpp_out=. --java_out=. --python_out=. addressbook.proto
  | make: protoc: Command not found
  | make: *** [Makefile:25: protoc_middleman] Error 127
* Add run-ptest
* Add rdepends on bash and python-protobuf for ptest

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../recipes-devtools/protobuf/protobuf/run-ptest   | 38 +++++++++++++++
 .../recipes-devtools/protobuf/protobuf_3.4.1.bb    | 54 +++++++++++++++++++++-
 2 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/run-ptest

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
new file mode 100644
index 000000000..7c3a8d1b3
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
@@ -0,0 +1,38 @@
+#!/bin/bash
+DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
+TEST_FILE="/tmp/test.data"
+
+RETVAL=0
+# Test every writing test application
+for write_exe_full_path in ${DIR}/add_person_*; do
+	if [ -x "${write_exe_full_path}" ]; then
+		write_exe=`basename ${write_exe_full_path}`
+		echo "Generating new test file using ${write_exe}..."
+		${write_exe_full_path} "${TEST_FILE}"
+		RETVAL=$?
+		[ $RETVAL -eq 0 ] || exit $RETVAL
+
+		# Test every reading test application
+		for read_exe_full_path in ${DIR}/list_people_*; do
+			read_exe=`basename ${read_exe_full_path}`
+			echo "Test: Write with ${write_exe}; Read with ${read_exe}..."
+			if [ -x "${read_exe_full_path}" ]; then
+				${read_exe_full_path} "${TEST_FILE}"
+				RETVAL=$?
+				[ $RETVAL -eq 0 ] || exit $RETVAL
+			fi
+		done
+
+		# Cleanup...
+		if [ -e "${TEST_FILE}" ]; then
+			rm "${TEST_FILE}"
+		fi
+	fi
+done
+
+if [ $RETVAL -eq 0 ] ; then
+    echo "PASS: protobuf"
+else
+    echo "FAIL: protobuf"
+fi
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
index fae7c18a1..1407d08bb 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
@@ -9,8 +9,10 @@ LICENSE = "BSD-3-Clause"
 PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 
 DEPENDS = "zlib"
+DEPENDS_append_class-target  = " protobuf-native"
 RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
+RDEPENDS_${PN}-ptest = "bash python-protobuf"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
 
@@ -18,13 +20,61 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
 
 PV = "3.4.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
+SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x \
+	   file://run-ptest \
+          "
 
 EXTRA_OECONF += " --with-protoc=echo"
 
-inherit autotools-brokensep
+inherit autotools-brokensep pkgconfig ptest
 
 S = "${WORKDIR}/git"
+TEST_SRC_DIR="examples"
+LANG_SUPPORT="cpp python"
+
+do_compile_ptest() {
+	# Modify makefile to use the cross-compiler
+	sed -e "s|c++|${CXX} \$(LDFLAGS)|g" -i "${S}/${TEST_SRC_DIR}/Makefile"
+
+	mkdir -p "${B}/${TEST_SRC_DIR}"
+
+	# Add the location of the cross-compiled header and library files
+	# which haven't been installed yet.
+	cp "${B}/protobuf.pc" "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${B}/src/.libs|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
+
+	# Save the pkgcfg sysroot variable, and update it to nothing so
+	# that it doesn't append the sysroot to the beginning of paths.
+	# The header and library files aren't installed to the target
+	# system yet.  So the absolute paths were specified above.
+	save_pkg_config_sysroot_dir=$PKG_CONFIG_SYSROOT_DIR
+	export PKG_CONFIG_SYSROOT_DIR=
+
+	# Compile the tests
+	for lang in ${LANG_SUPPORT}; do
+		oe_runmake -C "${S}/${TEST_SRC_DIR}" ${lang}
+	done
+
+	# Restore the pkgconfig sysroot variable
+	export PKG_CONFIG_SYSROOT_DIR=$save_pkg_config_sysroot_dir
+}
+
+do_install_ptest() {
+	local olddir=`pwd`
+
+	cd "${S}/${TEST_SRC_DIR}"
+	install -d "${D}/${PTEST_PATH}"
+	for i in add_person* list_people*; do
+		if [ -x "$i" ]; then
+			install "$i" "${D}/${PTEST_PATH}"
+		fi
+	done
+	cp "${S}/${TEST_SRC_DIR}/addressbook_pb2.py" "${D}/${PTEST_PATH}"
+	cd "$olddir"
+}
 
 FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES_${PN}-lite = "${bindir} ${libdir}/libprotobuf-lite${SOLIBS}"
-- 
2.13.3


