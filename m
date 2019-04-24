Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 394EC6C44A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 07:10:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3O7B0p8025362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 00:11:01 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 24 Apr 2019 00:11:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Apr 2019 00:10:59 -0700
Message-ID: <20190424071100.23092-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libdev-checklib-perl: add new recipe
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
X-List-Received-Date: Wed, 24 Apr 2019 07:11:00 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

It provides the perl module (Devel::CheckLib) which
may needed by other package which uses it to
check libs.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...CheckLib.pm-don-t-execute-the-binary.patch | 46 +++++++++++++++++++
 .../perl/libdev-checklib-perl_1.13.bb         | 21 +++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb

diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
new file mode 100644
index 000000000..223aa6751
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl/0001-CheckLib.pm-don-t-execute-the-binary.patch
@@ -0,0 +1,46 @@
+From d111fd85b25466f7829ccee34493aa0e3b551308 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 23 Apr 2019 19:13:19 -0700
+Subject: [PATCH] CheckLib.pm: don't execute the binary
+
+Don't execute the binary in build env as the
+binary which is generated in cross compile env
+may fail when executed in build env.
+
+Any it's enough to verify the libs via successully
+generate the binary which links the libs as below.
+  $ /yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc \
+  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security \
+  -Werror=format-security --sysroot=/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/recipe-sysroot \
+  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/perl/5.28.1-r1=/usr/src/debug/perl/5.28.1-r1 \
+  -fdebug-prefix-map=/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/perl/5.28.1-r1=/usr/src/debug/perl/5.28.1-r1 \
+  -fdebug-prefix-map=/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/recipe-sysroot= -fdebug-prefix-map=/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/recipe-sysroot-native= -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 assertlibEhx19yuY.c -L/yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/recipe-sysroot/usr/lib -lcrypto -fstack-protector-strong -o assertlibCOw_eujb
+
+Execute the binary in cross compile env as below
+and use the return status to determine the lib's
+checking status is not appropriate in cross compile env.
+ $ /yocto/builds/upgrade1/tmp/work/core2-64-poky-linux/libdbd-mysql-perl/4.050-r0/git/assertlibCOw_eujb
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/Devel/CheckLib.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Devel/CheckLib.pm b/lib/Devel/CheckLib.pm
+index e45cfb4..d228bb5 100644
+--- a/lib/Devel/CheckLib.pm
++++ b/lib/Devel/CheckLib.pm
+@@ -424,7 +424,7 @@ sub assert_lib {
+             my $absexefile = File::Spec->rel2abs($exefile);
+             $absexefile = '"'.$absexefile.'"' if $absexefile =~ m/\s/;
+             if (!$not_execute && system($absexefile) != 0) {
+-                push @wrongresult, $lib;
++                print "Checking the lib $lib\n";
+             }
+             else {
+                 if ($analyze_binary) {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb
new file mode 100644
index 000000000..f5bdb2087
--- /dev/null
+++ b/meta-oe/recipes-devtools/perl/libdev-checklib-perl_1.13.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A Perl module that checks whether a particular C library and its headers are available"
+DESCRIPTION = "This module provides a way of checking whether a particular library \
+and its headers are available, by attempting to compile a simple program and \
+link against it."
+HOMEPAGE = "https://metacpan.org/pod/Devel::CheckLib"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://README;md5=7911cdbb572d25c5f2e2ea17f669efc2"
+
+SRC_URI = "https://cpan.metacpan.org/modules/by-module/Devel/Devel-CheckLib-${PV}.tar.gz \
+           file://0001-CheckLib.pm-don-t-execute-the-binary.patch \
+"
+SRC_URI[md5sum] = "930216c5abc0f016df8a7539d48c891a"
+SRC_URI[sha256sum] = "24adfd908705dfac4bb320711763f37126b75cf54b3566c2c27c7cdef9c429a8"
+
+S = "${WORKDIR}/Devel-CheckLib-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND="native"
-- 
2.17.1


