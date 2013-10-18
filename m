Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id B63FD6D15E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 05:15:00 +0000 (UTC)
Received: from localhost (83.252.255.124) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Fri, 18 Oct 2013
	07:15:01 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 07:14:54 +0200
Message-ID: <70e79543abe0d7ec0708cbdbea18db96fa4a7086.1382073166.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.rc3
In-Reply-To: <cover.1382073165.git.anders@chargestorm.se>
References: <cover.1382073165.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH 1/2] breakpad: add initial recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 05:15:01 -0000
Content-Type: text/plain

Breakpad is an open-source multi-platform crash reporting system.

Apart from the breakpad recipe, add a bbclass for applications that want
to use this library. This bbclass will set up the include path and also
generate the symbol file.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72 +++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta-oe/classes/breakpad.bbclass
 create mode 100644 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb

diff --git a/meta-oe/classes/breakpad.bbclass b/meta-oe/classes/breakpad.bbclass
new file mode 100644
index 0000000..8c49ca7
--- /dev/null
+++ b/meta-oe/classes/breakpad.bbclass
@@ -0,0 +1,32 @@
+# Class to inherit when you want to build against Breakpad.
+# Apart from inheriting this class, you need to set BREAKPAD_BIN in
+# your recipe, and make sure that you link against libbreakpad_client.a.
+
+DEPENDS += "breakpad breakpad-native"
+
+CFLAGS += "-I${STAGING_DIR_TARGET}${includedir}/breakpad "
+
+BREAKPAD_BIN ?= ""
+
+python () {
+    breakpad_bin = d.getVar("BREAKPAD_BIN", True)
+
+    if not breakpad_bin:
+       PN = d.getVar("PN", True)
+       FILE = os.path.basename(d.getVar("FILE", True))
+       bb.error("To build %s, see breakpad.bbclass for instructions on \
+                 setting up your Breakpad configuration" % PN)
+       raise ValueError('BREAKPAD_BIN not defined in %s' % PN)
+}
+
+# Add creation of symbols here
+PACKAGE_PREPROCESS_FUNCS += "breakpad_package_preprocess"
+breakpad_package_preprocess () {
+    mkdir -p ${PKGD}/usr/share/breakpad-syms
+    find ${D} -name ${BREAKPAD_BIN} -exec sh -c "dump_syms {} > ${PKGD}/usr/share/breakpad-syms/${BREAKPAD_BIN}.syms" \;
+}
+
+PACKAGES =+ "${PN}-breakpad"
+
+FILES_${PN}-breakpad = "/usr/share/breakpad-syms"
+
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
new file mode 100644
index 0000000..7c7024a
--- /dev/null
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -0,0 +1,72 @@
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+# Applications using this library needs to add link against libbreakpad_client.a.
+
+SUMMARY = "An open-source multi-platform crash reporting system"
+DESCRIPTION = "Breakpad is a library and tool suite that allows you to distribute an application to users with compiler-provided debugging information removed, record crashes in compact \"minidump\" files, send them back to your server, and produce C and C++ stack traces from these minidumps. "
+HOMEPAGE = "https://code.google.com/p/google-breakpad/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c80d1a3b623f72bb85a4c75b556551df"
+SECTION = "libs"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+SRCREV = "r1218"
+SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
+S = "${WORKDIR}/trunk"
+
+do_install_append() {
+        install -d ${D}${includedir}
+        install -d ${D}${includedir}/breakpad
+
+        install -d ${D}${includedir}/breakpad/client/linux/crash_generation
+        install -m 0644 ${S}/src/client/linux/crash_generation/crash_generation_client.h  ${D}${includedir}/breakpad/client/linux/crash_generation/crash_generation_client.h
+
+        install -d ${D}${includedir}/breakpad/client/linux/handler/
+        install -m 0644 ${S}/src/client/linux/handler/exception_handler.h ${D}${includedir}/breakpad/client/linux/handler/exception_handler.h
+        install -m 0644 ${S}/src/client/linux/handler/minidump_descriptor.h ${D}${includedir}/breakpad/client/linux/handler/minidump_descriptor.h
+
+        install -d ${D}${includedir}/breakpad/client/linux/minidump_writer
+        install -m 0644 ${S}/src/client/linux/minidump_writer/linux_dumper.h ${D}${includedir}/breakpad/client/linux/minidump_writer/linux_dumper.h
+        install -m 0644 ${S}/src/client/linux/minidump_writer/minidump_writer.h ${D}${includedir}/breakpad/client/linux/minidump_writer/minidump_writer.h
+
+        install -d ${D}${includedir}/breakpad/common
+        install -m 0644 ${S}/src/common/memory.h ${D}${includedir}/breakpad/common/memory.h
+        install -m 0644 ${S}/src/common/scoped_ptr.h ${D}${includedir}/breakpad/common/scoped_ptr.h
+        install -m 0644 ${S}/src/common/using_std_string.h ${D}${includedir}/breakpad/common/using_std_string.h
+
+        install -d ${D}${includedir}/breakpad/google_breakpad/common
+        install -m 0644 ${S}/src/google_breakpad/common/breakpad_types.h ${D}${includedir}/breakpad/google_breakpad/common/breakpad_types.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_format.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_format.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_amd64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_amd64.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_arm.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_arm.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_mips.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_mips.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc64.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc64.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_ppc.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_ppc.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_sparc.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_sparc.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_cpu_x86.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_cpu_x86.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_exception_linux.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_exception_linux.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_exception_mac.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_exception_mac.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_exception_ps3.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_exception_ps3.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_exception_solaris.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_exception_solaris.h
+        install -m 0644 ${S}/src/google_breakpad/common/minidump_exception_win32.h ${D}${includedir}/breakpad/google_breakpad/common/minidump_exception_win32.h
+
+        install -d ${D}${includedir}/breakpad/third_party/lss
+        install -m 0644 ${S}/src/third_party/lss/linux_syscall_support.h ${D}${includedir}/breakpad/third_party/lss/linux_syscall_support.h
+}
+
+PACKAGES =+ "${PN}-minidump-upload ${PN}-sym-upload"
+
+FILES_${PN}-minidump-upload = "${bindir}/minidump_upload"
+FILES_${PN}-sym-upload = "${bindir}/sym_upload"
+
+
+SYSROOT_PREPROCESS_FUNCS += "breakpad_populate_sysroot"
+breakpad_populate_sysroot() {
+        sysroot_stage_dir ${D}/usr/include ${SYSROOT_DESTDIR}/usr/include
+        sysroot_stage_dir ${D}/usr/lib ${SYSROOT_DESTDIR}/usr/lib
+        sysroot_stage_dir ${D}/usr/lib ${SYSROOT_DESTDIR}/usr/lib
+}
+
-- 
1.8.4.rc3


