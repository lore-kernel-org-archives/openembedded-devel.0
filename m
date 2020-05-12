Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.1037.1589316743262652554
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 13:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=OtlxSJLs;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M93T3NTzz4y
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 22:52:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589316741;
	bh=/0cWJHLeda4ku0hDQHaJeYKLmN7zyaKjL0jv+Qvg+P0=;
	h=From:To:Subject:Date:From;
	b=OtlxSJLsHCaB/EGKjNhrGEA8hE7xgtHErVCXvrs3DdO+XoKrwdZNFPAkovbEHat6u
	 DgFBGdoNSuDLSsFSh/59xT5K0H8r18T/tYlhy5NO5CUtaXpHzvyiuNVRr2FWdWIoh8
	 K09+gv9JkXNWuCFWmuRv4NWciokvhB18Cp4EVOzDb49ctqZBM9caKb8XXM1JZpzD75
	 RpePWdQwR+YTXFBYiOIxybKfDB/YiRzcnpVXU7XRDJdCvu4CycBQPW4xTDQTdhBPLM
	 p6+WpnvrpCMkWvVMRcYz9iyFvr14DlLgUvDLhay22Q18cycIv+S2cVi3m051t6ntRy
	 qAW64xYAVwZXjyYnWI+UXrejWe1N/qusecmyWfjuYEznsa4kX9lr4xiFoE9Etg5BMy
	 D20wfzYwzTsJyHbLFqBYkRmvle8JY+f06o/yORcX6viLH3aRHlWCDh931gJtlSsSf3
	 lTTRYWnKZQVjLfBu1Dae2oqEuTKr3P0Kdz6XyH7BkPU/B3d8hxE0ZrBZzc8H0h1/J0
	 ObwlE6/u+w0+5crmshyuyyUxHDuZUdTrbODvmOcnA/1iT9qz5XWHN5ocOhsqa13BYU
	 kP0US0no7jSXrhtJTsMX6wo5eewyGQzLwDMxodAnrMO7SRw6bOnXnYE6Aa+MaP/hYY
	 /YFBzpIW4IU9e/vJP9uQUqE0=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: Remove workaround for gcc < 4.9
Date: Tue, 12 May 2020 23:52:17 +0300
Message-Id: <20200512205219.21168-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0014-fallback-to-2011-C++-standard.patch  | 42 -------------------
 .../recipes-extended/mozjs/mozjs_60.9.0.bb    |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch
deleted file mode 100644
index 7a0d286e1..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0014-fallback-to-2011-C++-standard.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Option '-std=gnu++14' has been supported from gcc 4.9. But on some build hosts
-such as CentOS 7.6 which only has gcc 4.8.5 and fails to configure:
-
-| checking whether the host C compiler can be used... no
-| ERROR: Only GCC 4.9 or newer is supported (found version 4.8.5).
-
-Fallback to 2011 C++ standard and lower required gcc version to 4.8.0 which is
-the same as in previous version 52.9.1 of mozjs.
-
-Upstream-Status: Inappropriate [Workaround]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/build/moz.configure/toolchain.configure b/build/moz.configure/toolchain.configure
-index 9c772a8..fc640c7 100755
---- a/build/moz.configure/toolchain.configure
-+++ b/build/moz.configure/toolchain.configure
-@@ -502,10 +502,8 @@ def check_compiler(compiler, language, target):
-             append_flag('-std=c++14')
-         # GCC 4.9 indicates that it implements draft C++14 features
-         # instead of the full language.
--        elif info.type == 'gcc' and \
--                info.language_version not in (draft_cxx14_version,
--                                              cxx14_version):
--            append_flag('-std=gnu++14')
-+        elif info.type == 'gcc' and info.language_version != 201103:
-+            append_flag('-std=gnu++11')
- 
-     # We force clang-cl to emulate Visual C++ 2017 version 15.4
-     if info.type == 'clang-cl' and info.version != '19.11.25547':
-@@ -903,9 +901,9 @@ def compiler(language, host_or_target, c_compiler=None, other_compiler=None,
-         # Check the compiler version here instead of in `compiler_version` so
-         # that the `checking` message doesn't pretend the compiler can be used
-         # to then bail out one line later.
--        if info.type == 'gcc' and info.version < '4.9.0':
-+        if info.type == 'gcc' and info.version < '4.8.0':
-             raise FatalCheckError(
--                'Only GCC 4.9 or newer is supported (found version %s).'
-+                'Only GCC 4.8 or newer is supported (found version %s).'
-                 % info.version)
- 
-         if info.type == 'gcc' and host_or_target.os == 'Android':
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
index 9466c62aa..f13a184b6 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://0011-To-fix-build-error-on-arm32BE.patch \
     file://0012-JS_PUBLIC_API.patch \
     file://0013-riscv-Disable-atomic-operations.patch \
-    file://0014-fallback-to-2011-C++-standard.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-support-musl.patch \
-- 
2.17.1

