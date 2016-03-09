Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCFD460797
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 07:53:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u297r1C7005439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Mar 2016 23:53:01 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 8 Mar 2016 23:53:00 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Mar 2016 15:48:43 +0800
Message-ID: <1457509723-25302-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1457509723-25302-1-git-send-email-kai.kang@windriver.com>
References: <1457509723-25302-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] crash: add native package
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
X-List-Received-Date: Wed, 09 Mar 2016 07:53:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add crash-native package.

* append EXTRA_OEMAKE option to find ncurses library
* pass right install DESTDIR

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-kernel/crash/crash_7.1.3.bb | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
index f6934f7..e085094 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
@@ -32,6 +32,8 @@ SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5
 
 inherit gettext
 
+BBCLASSEXTEND = "native"
+
 # crash 7.1.3 and before don't support mips64
 COMPATIBLE_HOST = "^(?!mips64).*"
 
@@ -40,6 +42,7 @@ EXTRA_OEMAKE = 'RPMPKG="${PV}" \
                 GDB_HOST="${BUILD_SYS}" \
                 GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
                 '
+EXTRA_OEMAKE_append_class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 
 do_configure() {
     :
@@ -65,17 +68,25 @@ do_compile() {
     oe_runmake ${EXTRA_OEMAKE}
 }
 
-do_install () {
+do_install_prepend () {
     install -d ${D}${bindir}
     install -d ${D}/${mandir}/man8
     install -d ${D}${includedir}/crash
 
-    oe_runmake DESTDIR=${D} install
     install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
     install -m 0644 ${S}/defs.h ${D}${includedir}/crash
-}   
+}
+
+do_install_class-target () {
+    oe_runmake DESTDIR=${D} install
+}
+
+do_install_class-native () {
+    oe_runmake DESTDIR=${D}${STAGING_DIR_NATIVE} install
+}
 
 RDEPENDS_${PN} += "liblzma"
+RDEPENDS_${PN}_class-native += "xz-native"
 
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
-- 
2.6.1


