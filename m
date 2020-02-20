Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A467C61299
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:49:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01KAnM2E004672
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:49:33 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 20 Feb 2020 02:49:11 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Feb 2020 18:49:10 +0800
Message-ID: <20200220104910.38976-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-grpcio: fix do_compile error for native
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
X-List-Received-Date: Thu, 20 Feb 2020 10:49:42 -0000
Content-Type: text/plain

When building python3-grpcio-native, we will meet do_compile error
because of no 'cc'.

In fact, 'cc' is not in our hosttools. So fix to use gcc and make
the patch also apply to native.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch | 6 +++---
 .../recipes-devtools/python/python3-grpcio_1.27.1.bb        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index 131daace0..f39a82a33 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,4 +1,4 @@
-From b02be74a2eff8abc612ef84f30e0fbce6a7f65f5 Mon Sep 17 00:00:00 2001
+1From b02be74a2eff8abc612ef84f30e0fbce6a7f65f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 4 Aug 2017 09:04:07 -0700
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
@@ -24,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  def check_linker_need_libatomic():
    """Test if linker on system needs libatomic."""
-+  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'cc'
++  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
    code_test = (b'#include <atomic>\n' +
                 b'int main() { return std::atomic<int64_t>{}; }')
 -  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
@@ -57,7 +57,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
              """
              # TODO(lidiz) Remove the generated a.out for success tests.
 -            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
-+            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'cc'
++            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
 +            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
                                         stdin=subprocess.PIPE,
                                         stdout=subprocess.PIPE,
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
index bc2b70cf8..42260cb27 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "${PYTHON_PN}-protobuf"
 
-SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
-                                file://ppc-boringssl-support.patch \
+SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
+SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
 "
 SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
-- 
2.17.1


