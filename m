Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 216886D561
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 05:22:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5R5ML9T013811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 22:22:21 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 26 Jun 2019 22:22:15 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 27 Jun 2019 01:22:12 -0400
Message-ID: <20190627052213.127012-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: fix configure failure on CentOS 7.6
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
X-List-Received-Date: Thu, 27 Jun 2019 05:22:21 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Option '-std=gnu++14' has been supported from gcc 4.9. But on some build hosts
such as CentOS 7.6 which only has gcc 4.8.5 and fails to configure:

| checking whether the host C compiler can be used... no
| ERROR: Only GCC 4.9 or newer is supported (found version 4.8.5).

Fallback to 2011 C++ standard and lower required gcc version to 4.8.0 which is
the same as in previous version 52.9.1 of mozjs.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mozjs/fallback-to-2011-C++-standard.patch | 42 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_60.5.2.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C++-standard.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C++-standard.patch b/meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C++-standard.patch
new file mode 100644
index 000000000..7a0d286e1
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/fallback-to-2011-C++-standard.patch
@@ -0,0 +1,42 @@
+Option '-std=gnu++14' has been supported from gcc 4.9. But on some build hosts
+such as CentOS 7.6 which only has gcc 4.8.5 and fails to configure:
+
+| checking whether the host C compiler can be used... no
+| ERROR: Only GCC 4.9 or newer is supported (found version 4.8.5).
+
+Fallback to 2011 C++ standard and lower required gcc version to 4.8.0 which is
+the same as in previous version 52.9.1 of mozjs.
+
+Upstream-Status: Inappropriate [Workaround]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/build/moz.configure/toolchain.configure b/build/moz.configure/toolchain.configure
+index 9c772a8..fc640c7 100755
+--- a/build/moz.configure/toolchain.configure
++++ b/build/moz.configure/toolchain.configure
+@@ -502,10 +502,8 @@ def check_compiler(compiler, language, target):
+             append_flag('-std=c++14')
+         # GCC 4.9 indicates that it implements draft C++14 features
+         # instead of the full language.
+-        elif info.type == 'gcc' and \
+-                info.language_version not in (draft_cxx14_version,
+-                                              cxx14_version):
+-            append_flag('-std=gnu++14')
++        elif info.type == 'gcc' and info.language_version != 201103:
++            append_flag('-std=gnu++11')
+ 
+     # We force clang-cl to emulate Visual C++ 2017 version 15.4
+     if info.type == 'clang-cl' and info.version != '19.11.25547':
+@@ -903,9 +901,9 @@ def compiler(language, host_or_target, c_compiler=None, other_compiler=None,
+         # Check the compiler version here instead of in `compiler_version` so
+         # that the `checking` message doesn't pretend the compiler can be used
+         # to then bail out one line later.
+-        if info.type == 'gcc' and info.version < '4.9.0':
++        if info.type == 'gcc' and info.version < '4.8.0':
+             raise FatalCheckError(
+-                'Only GCC 4.9 or newer is supported (found version %s).'
++                'Only GCC 4.8 or newer is supported (found version %s).'
+                 % info.version)
+ 
+         if info.type == 'gcc' and host_or_target.os == 'Android':
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
index 70bdbc168..c89aba773 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://dev.gentoo.org/~axs/distfiles/mozjs-60.5.2.tar.bz2 \
            file://0001-To-fix-build-error-on-arm32BE.patch \
            file://JS_PUBLIC_API.patch \
            file://0001-riscv-Disable-atomic-operations.patch \
+           file://fallback-to-2011-C++-standard.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
-- 
2.20.0


