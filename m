Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC320784B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I7Vfev009812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:40 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:24 +0800
Message-ID: <1531899089-395618-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] oprofile: 1.1.0 -> 1.1.2
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:39 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-kernel/oprofile/oprofile.inc       |  5 ++-
 .../0001-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ----------------------
 .../0001-fix-musl-libc-compile-error.patch         | 30 +++++++++++++
 meta-oe/recipes-kernel/oprofile/oprofile_1.1.0.bb  | 10 -----
 meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb  | 10 +++++
 5 files changed, 43 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
 delete mode 100644 meta-oe/recipes-kernel/oprofile/oprofile_1.1.0.bb
 create mode 100644 meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb

diff --git a/meta-oe/recipes-kernel/oprofile/oprofile.inc b/meta-oe/recipes-kernel/oprofile/oprofile.inc
index 4b01654..dabc30b 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile.inc
+++ b/meta-oe/recipes-kernel/oprofile/oprofile.inc
@@ -25,12 +25,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://root-home-dir.patch \
            file://0001-Add-rmb-definition-for-NIOS2-architecture.patch \
-           file://0001-Fix-FTBFS-problem-with-GCC-6.patch \
 "
 UPSTREAM_CHECK_REGEX = "oprofile-(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/oprofile/files/oprofile/"
 
-SRC_URI_append_libc-musl = " file://musl.patch"
+SRC_URI_append_libc-musl = " file://musl.patch \
+                             file://0001-fix-musl-libc-compile-error.patch \
+"
 
 inherit autotools pkgconfig ptest
 
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
deleted file mode 100644
index d372fd5..0000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile/0001-Fix-FTBFS-problem-with-GCC-6.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
-From: William Cohen <wcohen@redhat.com>
-Date: Fri, 5 Feb 2016 17:30:19 -0500
-Subject: [PATCH] Fix FTBFS problem with GCC-6
-
-GCC-6 is pickier about some of the type conversions causing the Fedora
-24 mass rebuild the build of oprofile failed with:
-
-make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
-g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
-op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
-op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
-  bool const verbose = cverb << (vbfd & vlevel1);
-                                               ^
-op_bfd.cpp:546:7: error: in argument to unary !
-  if (!verbose)
-       ^~~~~~~
-
-Avoid the intermediate bool type to make GCC-6 happy.
-
-Signed-off-by: William Cohen <wcohen@redhat.com>
----
-Upstream-Status: Backport
-
- libutil++/op_bfd.cpp | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
-index 389c920..f2eb42b 100644
---- a/libutil++/op_bfd.cpp
-+++ b/libutil++/op_bfd.cpp
-@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
- {
- 	op_bfd_symbol const & sym = syms[sym_idx];
- 
--	bool const verbose = cverb << (vbfd & vlevel1);
--
- 	if (anon_obj)
- 		start = sym.vma();
- 	else
- 		start = sym.filepos();
- 	end = start + sym.size();
- 
--	if (!verbose)
-+	if (!(cverb << (vbfd & vlevel1)))
- 		return;
- 
- 	io_state state(cverb << (vbfd & vlevel1));
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch b/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
new file mode 100644
index 0000000..c21a105
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile/0001-fix-musl-libc-compile-error.patch
@@ -0,0 +1,30 @@
+From 512f1b3a4727a3a18f8fa55f196eedcacdd4a872 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 18 Jul 2018 13:01:03 +0800
+Subject: [PATCH] fix musl libc compile error
+
+use op_basename instead of basename to fix below error:
+../../oprofile-1.2.0/pp/oparchive.cpp:264:20: error: 'basename'
+was not declared in this scope
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ pp/oparchive.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pp/oparchive.cpp b/pp/oparchive.cpp
+index 6221e14..274152b 100644
+--- a/pp/oparchive.cpp
++++ b/pp/oparchive.cpp
+@@ -261,7 +261,7 @@ int oparchive(options::spec const & spec)
+ 		/* determine the session name of sample file */
+ 		int offset = sample_name.find('{');
+ 		string base_samples_dir = sample_name.substr(0, offset-1);
+-		string session = basename(base_samples_dir.c_str());
++		string session = op_basename(base_samples_dir.c_str());
+ 		/* Get rid of the the archive_path from the name */
+ 		string sample_base = sample_name.substr(offset);
+ 		string sample_archive_file = dest_samples_dir + "/" + session + "/" + sample_base;
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.1.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.1.0.bb
deleted file mode 100644
index 92a94ad..0000000
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.1.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require oprofile.inc
-
-DEPENDS += "virtual/kernel"
-DEPENDS_append_powerpc64 = " libpfm4"
-
-SRC_URI[md5sum] = "248c4c069f9476f427fa7195563f9867"
-SRC_URI[sha256sum] = "cf759a6de1a6033d5dfc93bda129a9f2e128aecc4238cc657feb0801d1b0366c"
-
-S = "${WORKDIR}/oprofile-${PV}"
-
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb
new file mode 100644
index 0000000..e85e805
--- /dev/null
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.2.0.bb
@@ -0,0 +1,10 @@
+require oprofile.inc
+
+DEPENDS += "virtual/kernel"
+DEPENDS_append_powerpc64 = " libpfm4"
+
+SRC_URI[md5sum] = "4fcd3920984dcb607314b2e225086c3a"
+SRC_URI[sha256sum] = "eb95f98c40b7d0ee29b45fba3565d9f8381747528aa6b6159e37d4fa0c8ca57d"
+
+S = "${WORKDIR}/oprofile-${PV}"
+
-- 
2.7.4


