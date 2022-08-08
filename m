Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB0DC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 03:27:05 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.21300.1659929215554719587
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Aug 2022 20:26:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p+WnZskc;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: schonm@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-10dc1b16c12so9247562fac.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Aug 2022 20:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc;
        bh=KdTZr7C2pNseIUh7vpcHUgyM+1szPfXoe4qTv1e5JPw=;
        b=p+WnZskcBwxb0/T7FRQna8x292WuvN8LDDR3imkPYC4epSky0/FyydG+mSfPZ1vJBY
         T9qAMGmpN+L5udoHLqPelE3owz92J98OJclsJpdq77k+rKNFnh48Dz6Ub0O+8dJKZrU8
         Va0fAcRMM21Lvh6lkb9d1XmVnNiVQsTn9eyniPmBl3oEAxiCBJ1XB4SMfALRLgAFoHnU
         xw2BTfOR+0EkDuLjg2M/CTsgNxKC9YeNhxZY0rN067B5ifAIUpqbFovbJciWuFF0QisT
         uHNHMTv9NSsSlFwjiuGWU6pFI2ArZCRMZXpHeqlp3xW9z3A862EF4d6a73eGNls8e5F9
         3uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc;
        bh=KdTZr7C2pNseIUh7vpcHUgyM+1szPfXoe4qTv1e5JPw=;
        b=7+htIqNyv54RozERRLaPs+fD1xHHltpFrWkkk4WsxeNMPyhvWgTBJYJcz2ykK6FOcV
         VU5QguCMG9b74dIIBP0TxiItEYVk0UNRZsLgn3sabBAgVNtB/704R+MrcwOwDJeftPFc
         U/hqjhoTZcVVVaw8pIdeWfEWFvuB+Ae0sXG6tGkaDhN6cE7jbYNEMYBYtYchhuGh/20w
         ZrdW0iaoLHw54Qi/+UCjnuBn0D+yXae8U/5CFTtPEn5x1NLPT1z8+Ez0CgQcr9GGeCos
         8DiDP2aHPJ5s+VXJMIumKvhJHB5reOLWrFE+nUS6T8oNi7Vse4myfdZxxoKilTGn8VSb
         dl5Q==
X-Gm-Message-State: ACgBeo0VMK63KedIZyNlmimd+7g2SdyrqSkMUt0kMAVzxdFUk7iN9yGe
	eXDMHfFdc+bdNK3wORCtu5KC2izIZYa4XXAZPimZeGzatTTzgA==
X-Google-Smtp-Source: 
 AA6agR7eEmOYxbuOzoR6AHqewudtMRAHk4VVx/d9AfVDdbAJSo71nMW2wlJ25u1sW7sgcRVdacGGkSJtXmHd/YX9xrY=
X-Received: by 2002:a05:6870:6087:b0:10b:aef4:db0a with SMTP id
 t7-20020a056870608700b0010baef4db0amr10741247oae.17.1659929214305; Sun, 07
 Aug 2022 20:26:54 -0700 (PDT)
MIME-Version: 1.0
From: "J. S." <schonm@gmail.com>
Date: Sun, 7 Aug 2022 23:26:43 -0400
Message-ID: 
 <CABTo8gCerAw61WjtOSfYkL=fNkLHFbbLAd9Xr_4+tus6DYo6Ww@mail.gmail.com>
Subject: [oe][meta-oe][PATCH][master-next] nodejs : upgrade 16.14.2 -> 16.16.0
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 03:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98148

From 337d466bd4433159492b0e18a9f654b6047cc73c Mon Sep 17 00:00:00 2001
From: Jason Schonberg <schonm@gmail.com>
Date: Sun, 7 Aug 2022 22:44:49 -0400
Subject: [PATCH] Upgrade Nodejs from 16.14.2 to 16.16.0.  This is the lates=
t
 LTS version of node.

The license file check sum changes because the new license file
mentions undici which is licensed under an MIT license.

This upgrade provides support for openssl 1.1.1q
Additional information about changes since the 16.14.2 release can be
found at https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_=
V16.md

The existing 16.14.2 patches applied with fuzz against the 16.16.0
release.  So they have been updated with devtool.

Built against master-next
commit 8dee3f24aafab5574db396770342fd62ebbbad17

    Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e-running-gyp-files-for-bundled-deps.patch |  6 +--
 ...-liftoff-Correct-function-signatures.patch | 30 +++++++++-----
 ...Use-32bit-cast-for-operand-on-mips32.patch |  6 +--
 ...Install-both-binaries-and-use-libdir.patch | 33 ++++++----------
 .../nodejs/0002-Using-native-binaries.patch   | 22 ++++++-----
 .../0004-v8-don-t-override-ARM-CFLAGS.patch   | 12 +++---
 ...5-add-openssl-legacy-provider-option.patch | 30 +++++++-------
 .../nodejs/nodejs/big-endian.patch            | 14 ++++++-
 .../nodejs/nodejs/mips-less-memory.patch      | 39 ++++++++++++-------
 .../nodejs/nodejs/system-c-ares.patch         | 11 +++++-
 .../{nodejs_16.14.2.bb =3D> nodejs_16.16.0.bb}  |  4 +-
 11 files changed, 121 insertions(+), 86 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb =3D>
nodejs_16.16.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gy=
p-files-for-bundled-deps.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for=
-bundled-deps.patch
index d6e439ba2..d30a4d06b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files=
-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files=
-for-bundled-deps.patch
@@ -1,4 +1,4 @@
-From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
+From 7e9d0939b803c07262d53ba2ea96ead44a4791fa Mon Sep 17 00:00:00 2001
 From: Zuzana Svetlikova <zsvetlik@redhat.com>
 Date: Thu, 27 Apr 2017 14:25:42 +0200
 Subject: [PATCH] Disable running gyp on shared deps
@@ -8,10 +8,10 @@ Subject: [PATCH] Disable running gyp on shared deps
  1 file changed, 1 insertion(+), 1 deletion(-)

 diff --git a/Makefile b/Makefile
-index 93d63110..79caaec2 100644
+index 3c48653..8b5a93b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -138,7 +138,7 @@ with-code-cache test-code-cache:
+@@ -147,7 +147,7 @@ with-code-cache test-code-cache:
      $(warning '$@' target is a noop)

  out/Makefile: config.gypi common.gypi node.gyp \
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-fu=
nction-signatures.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-sign=
atures.patch
index d7005ae97..e7f67875f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-=
signatures.patch
@@ -1,7 +1,7 @@
-From dc3652c0abcdf8573fd044907b19d8eda7ca1124 Mon Sep 17 00:00:00 2001
+From 2b6e124f1959a7f20c37dd1589a0794499e4d9e5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 20 Oct 2021 12:49:58 -0700
-Subject: [PATCH] [liftoff] Correct function signatures
+Subject: [PATCH] Correct function signatures

 Fixes builds on mips where clang reports an error
 ../deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h:661:5:
error: no matching member function for call to 'Move'
@@ -10,13 +10,19 @@ Fixes builds on mips where clang reports an error

 Upstream-Status: Submitted
[https://chromium-review.googlesource.com/c/v8/v8/+/3235674]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- src/wasm/baseline/liftoff-assembler.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ deps/v8/src/wasm/baseline/liftoff-assembler.h               | 6 +++---
+ deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h     | 2 +-
+ deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h | 2 +-
+ .../src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h   | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)

+diff --git a/deps/v8/src/wasm/baseline/liftoff-assembler.h
b/deps/v8/src/wasm/baseline/liftoff-assembler.h
+index 19611fb..b035154 100644
 --- a/deps/v8/src/wasm/baseline/liftoff-assembler.h
 +++ b/deps/v8/src/wasm/baseline/liftoff-assembler.h
-@@ -613,7 +613,7 @@ class LiftoffAssembler : public TurboAss
+@@ -613,7 +613,7 @@ class LiftoffAssembler : public TurboAssembler {
    void FinishCall(const ValueKindSig*, compiler::CallDescriptor*);

    // Move {src} into {dst}. {src} and {dst} must be different.
@@ -25,7 +31,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>

    // Parallel register move: For a list of tuples <dst, src, kind>, move =
the
    // {src} register of kind {kind} into {dst}. If {src} equals {dst}, ign=
ore
-@@ -759,8 +759,8 @@ class LiftoffAssembler : public TurboAss
+@@ -759,8 +759,8 @@ class LiftoffAssembler : public TurboAssembler {
    inline void MoveStackValue(uint32_t dst_offset, uint32_t src_offset,
                               ValueKind);

@@ -36,9 +42,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>

    inline void Spill(int offset, LiftoffRegister, ValueKind);
    inline void Spill(int offset, WasmValue);
+diff --git a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
+index 4ab036d..20ddf00 100644
 --- a/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
 +++ b/deps/v8/src/wasm/baseline/mips/liftoff-assembler-mips.h
-@@ -658,7 +658,7 @@ void LiftoffAssembler::Store(Register ds
+@@ -658,7 +658,7 @@ void LiftoffAssembler::Store(Register dst_addr,
Register offset_reg,
      pinned =3D pinned | LiftoffRegList::ForRegs(dst_op.rm(), src);
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -47,9 +55,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>

      src =3D tmp;
      pinned.set(tmp);
+diff --git a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
+index 0a23c19..7d816fc 100644
 --- a/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
 +++ b/deps/v8/src/wasm/baseline/mips64/liftoff-assembler-mips64.h
-@@ -596,7 +596,7 @@ void LiftoffAssembler::Store(Register ds
+@@ -596,7 +596,7 @@ void LiftoffAssembler::Store(Register dst_addr,
Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
@@ -58,9 +68,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>

      src =3D tmp;
      pinned.set(tmp);
+diff --git a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
+index fef5947..2bf79ee 100644
 --- a/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
 +++ b/deps/v8/src/wasm/baseline/riscv64/liftoff-assembler-riscv64.h
-@@ -580,7 +580,7 @@ void LiftoffAssembler::Store(Register ds
+@@ -580,7 +580,7 @@ void LiftoffAssembler::Store(Register dst_addr,
Register offset_reg,
      pinned.set(dst_op.rm());
      LiftoffRegister tmp =3D GetUnusedRegister(src.reg_class(), pinned);
      // Save original value.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cas=
t-for-operand-on-mips32.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-opera=
nd-on-mips32.patch
index a0242d8e1..4932de06e 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-o=
perand-on-mips32.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-mips-Use-32bit-cast-for-o=
perand-on-mips32.patch
@@ -1,4 +1,4 @@
-From e65dde8db17da5acddeef7eb9316199c4e5e0811 Mon Sep 17 00:00:00 2001
+From b978652dc3e9c2b74334b91b2a2c9e3ffa13710c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 19 Apr 2022 12:40:25 -0700
 Subject: [PATCH] mips: Use 32bit cast for operand on mips32
@@ -12,6 +12,7 @@
deps/v8/src/compiler/backend/mips/code-generator-mips.cc: In member
function 'vo
 Upstream-Status: Pending

 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  deps/v8/src/compiler/backend/mips/code-generator-mips.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -29,6 +30,3 @@ index 2b8197e..b226140 100644
      }
    }
    // Functions with JS linkage have at least one parameter (the receiver)=
.
---
-2.36.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binar=
ies-and-use-libdir.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use=
-libdir.patch
index 5cb2e9701..71d921d59 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and=
-use-libdir.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and=
-use-libdir.patch
@@ -1,7 +1,10 @@
-From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00 2001
+From ffda0714bd301cb9d68ee095ab70e026f61e11aa Mon Sep 17 00:00:00 2001
 From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
 Date: Tue, 19 Mar 2019 23:22:40 -0400
-Subject: [PATCH 2/2] Install both binaries and use libdir.
+Subject: [PATCH] Install both binaries and use libdir.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit

 This allows us to build with a shared library for other users while
 still providing the normal executable.
@@ -13,18 +16,17 @@ Upstream-Status: Pending
 Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.py     |  7 +++++++
  tools/install.py | 21 +++++++++------------
  2 files changed, 16 insertions(+), 12 deletions(-)

 diff --git a/configure.py b/configure.py
-index 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978=
067537abf9f0f0
100755
+index fed2688..7989076 100755
 --- a/configure.py
 +++ b/configure.py
-@@ -721,10 +721,16 @@ parser.add_argument('--shared',
-     dest=3D'shared',
-     default=3DNone,
+@@ -739,6 +739,12 @@ parser.add_argument('--shared',
      help=3D'compile shared library for embedding node in another project.=
 ' +
           '(This mode is not officially supported for regular applications=
)')

@@ -37,11 +39,7 @@ index
6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978067537
  parser.add_argument('--without-v8-platform',
      action=3D'store_true',
      dest=3D'without_v8_platform',
-     default=3DFalse,
-     help=3D'do not initialize v8 platform during node.js startup. ' +
-@@ -1305,10 +1311,11 @@ def configure_node(o):
-     o['variables']['debug_nghttp2'] =3D 'false'
-
+@@ -1348,6 +1354,7 @@ def configure_node(o):
    o['variables']['node_no_browser_globals'] =3D b(options.no_browser_glob=
als)

    o['variables']['node_shared'] =3D b(options.shared)
@@ -49,15 +47,11 @@ index
6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978067537
    node_module_version =3D getmoduleversion.get_version()

    if options.dest_os =3D=3D 'android':
-     shlib_suffix =3D 'so'
-   elif sys.platform =3D=3D 'darwin':
 diff --git a/tools/install.py b/tools/install.py
-index 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2=
257c239a7e9263
100755
+index 8a050df..40357ad 100755
 --- a/tools/install.py
 +++ b/tools/install.py
-@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
-   for subdir, files_in_path in ret.items():
-     action(files_in_path, subdir + '/')
+@@ -130,22 +130,19 @@ def subdir_files(path, dest, action):

  def files(action):
    is_windows =3D sys.platform =3D=3D 'win32'
@@ -89,8 +83,3 @@ index
41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2257c23

    if 'true' =3D=3D variables.get('node_use_dtrace'):
      action(['out/Release/node.d'], 'lib/dtrace/node.d')
-
-   # behave similarly for systemtap
---
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binar=
ies.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
index 8db1f1dd5..b85863f1a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.pat=
ch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.pat=
ch
@@ -1,16 +1,18 @@
-From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 2001
+From c2380b906832f0c4aebd0554a22cfa33ed8a5b8b Mon Sep 17 00:00:00 2001
 From: Guillaume Burel <guillaume.burel@stormshield.eu>
 Date: Fri, 3 Jan 2020 11:25:54 +0100
 Subject: [PATCH] Using native binaries

 ---
- node.gyp                 |  4 ++--
- tools/v8_gypfiles/v8.gyp | 11 ++++-------
- 2 files changed, 6 insertions(+), 9 deletions(-)
+ node.gyp                 | 2 ++
+ tools/v8_gypfiles/v8.gyp | 5 +++++
+ 2 files changed, 7 insertions(+)

+diff --git a/node.gyp b/node.gyp
+index 74e9f9c..d53465b 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -294,6 +294,7 @@
+@@ -295,6 +295,7 @@
                'action_name': 'run_mkcodecache',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -18,7 +20,7 @@ Subject: [PATCH] Using native binaries
                  '<(mkcodecache_exec)',
                ],
                'outputs': [
-@@ -319,6 +320,7 @@
+@@ -320,6 +321,7 @@
                'action_name': 'node_mksnapshot',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -26,6 +28,8 @@ Subject: [PATCH] Using native binaries
                  '<(node_mksnapshot_exec)',
                ],
                'outputs': [
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index 39b9680..e7b7d90 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
 @@ -68,6 +68,7 @@
@@ -44,7 +48,7 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX=
)',
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
-@@ -225,6 +227,7 @@
+@@ -211,6 +213,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -52,7 +56,7 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_ge=
nerator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -415,6 +418,7 @@
+@@ -395,6 +398,7 @@
              ],
            },
            'inputs': [
@@ -60,7 +64,7 @@ Subject: [PATCH] Using native binaries
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1548,6 +1552,7 @@
+@@ -1503,6 +1507,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-=
ARM-CFLAGS.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.=
patch
index 97ed972ce..501235f23 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFL=
AGS.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFL=
AGS.patch
@@ -1,4 +1,4 @@
-From 47ee5cc5501289205d3e8e9f27ea9daf18cebac1 Mon Sep 17 00:00:00 2001
+From e90d7249975d336dd77664923138aa3e2dcd23ad Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <git@andred.net>
 Date: Sat, 9 Nov 2019 14:45:30 +0000
 Subject: [PATCH] v8: don't override ARM CFLAGS
@@ -23,15 +23,16 @@ problems have been noted during compilation or runtime.

 Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
+
 ---
  tools/v8_gypfiles/toolchain.gypi | 52 ++------------------------------
  1 file changed, 2 insertions(+), 50 deletions(-)

 diff --git a/tools/v8_gypfiles/toolchain.gypi
b/tools/v8_gypfiles/toolchain.gypi
-index 264b3e478e..0b41848145 100644
+index ecbd63b..0030ced 100644
 --- a/tools/v8_gypfiles/toolchain.gypi
 +++ b/tools/v8_gypfiles/toolchain.gypi
-@@ -211,31 +211,7 @@
+@@ -177,31 +177,7 @@
          'target_conditions': [
            ['_toolset=3D=3D"host"', {
              'conditions': [
@@ -64,7 +65,7 @@ index 264b3e478e..0b41848145 100644
                  # Host not built with an Arm CXX compiler (simulator buil=
d).
                  'conditions': [
                    [ 'arm_float_abi=3D=3D"hard"', {
-@@ -254,31 +230,7 @@
+@@ -220,31 +196,7 @@
            }],  # _toolset=3D=3D"host"
            ['_toolset=3D=3D"target"', {
              'conditions': [
@@ -97,6 +98,3 @@ index 264b3e478e..0b41848145 100644
                  # Target not built with an Arm CXX compiler (simulator bu=
ild).
                  'conditions': [
                    [ 'arm_float_abi=3D=3D"hard"', {
---
-2.20.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy=
-provider-option.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-o=
ption.patch
index 4d238c03f..04321132c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch
@@ -1,4 +1,4 @@
-From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
+From 21a93c6305c1a02eb94e6fec62015d3ebb171d9f Mon Sep 17 00:00:00 2001
 From: Daniel Bevenius <daniel.bevenius@gmail.com>
 Date: Sat, 16 Oct 2021 08:50:16 +0200
 Subject: [PATCH] src: add --openssl-legacy-provider option
@@ -22,19 +22,20 @@ Hash {
 Co-authored-by: Richard Lau <rlau@redhat.com>
 Signed-off-by: Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Upstream-Status: Backport [https://github.com/nodejs/node/issues/40455]
+
 ---
  doc/api/cli.md                                         | 10 ++++++++++
  src/crypto/crypto_util.cc                              | 10 ++++++++++
- src/node_options.cc                                    | 10 ++++++++++
+ src/node_options.cc                                    |  3 +++
  src/node_options.h                                     |  7 +++++++
  .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
- 5 files changed, 42 insertions(+)
+ 5 files changed, 35 insertions(+)

 diff --git a/doc/api/cli.md b/doc/api/cli.md
-index 74057706bf8d..608b9cdeddf1 100644
+index 475894d..b0c49d4 100644
 --- a/doc/api/cli.md
 +++ b/doc/api/cli.md
-@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup.
Among other uses, this can be
+@@ -732,6 +732,14 @@ Load an OpenSSL configuration file on startup.
Among other uses, this can be
  used to enable FIPS-compliant crypto if Node.js is built
  against FIPS-enabled OpenSSL.

@@ -49,7 +50,7 @@ index 74057706bf8d..608b9cdeddf1 100644
  ### `--pending-deprecation`

  <!-- YAML
-@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
+@@ -1592,6 +1600,7 @@ Node.js options that are allowed are:
  * `--no-warnings`
  * `--node-memory-debug`
  * `--openssl-config`
@@ -57,7 +58,7 @@ index 74057706bf8d..608b9cdeddf1 100644
  * `--pending-deprecation`
  * `--policy-integrity`
  * `--preserve-symlinks-main`
-@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js
+@@ -1988,6 +1997,7 @@ $ node --max-old-space-size=3D1536 index.js
  [emit_warning]: process.md#processemitwarningwarning-options
  [jitless]: https://v8.dev/blog/jitless
  [libuv threadpool documentation]:
https://docs.libuv.org/en/latest/threadpool.html
@@ -66,7 +67,7 @@ index 74057706bf8d..608b9cdeddf1 100644
  [security warning]:
#warning-binding-inspector-to-a-public-ipport-combination-is-insecure
  [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zo=
nes
 diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
-index 7e0c8ba3eb60..796ea3025e41 100644
+index e1ef170..e93edd4 100644
 --- a/src/crypto/crypto_util.cc
 +++ b/src/crypto/crypto_util.cc
 @@ -148,6 +148,16 @@ void InitCryptoOnce() {
@@ -87,12 +88,12 @@ index 7e0c8ba3eb60..796ea3025e41 100644
    OPENSSL_INIT_free(settings);
    settings =3D nullptr;
 diff --git a/src/node_options.cc b/src/node_options.cc
-index 00bdc6688a4c..3363860919a9 100644
+index 3192faa..296fed0 100644
 --- a/src/node_options.cc
 +++ b/src/node_options.cc
-@@ -4,6 +4,9 @@
- #include "env-inl.h"
+@@ -5,6 +5,9 @@
  #include "node_binding.h"
+ #include "node_external_reference.h"
  #include "node_internals.h"
 +#if HAVE_OPENSSL
 +#include "openssl/opensslv.h"
@@ -101,7 +102,7 @@ index 00bdc6688a4c..3363860919a9 100644
  #include <errno.h>
  #include <sstream>
 diff --git a/src/node_options.h b/src/node_options.h
-index fd772478d04d..1c0e018ab16f 100644
+index 40d1c02..07bf244 100644
 --- a/src/node_options.h
 +++ b/src/node_options.h
 @@ -11,6 +11,10 @@
@@ -115,7 +116,7 @@ index fd772478d04d..1c0e018ab16f 100644
  namespace node {

  class HostPort {
-@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
+@@ -252,6 +256,9 @@ class PerProcessOptions : public Options {
    bool enable_fips_crypto =3D false;
    bool force_fips_crypto =3D false;
  #endif
@@ -126,7 +127,7 @@ index fd772478d04d..1c0e018ab16f 100644
    // Per-process because reports can be triggered outside a known V8 cont=
ext.
    bool report_on_fatalerror =3D false;
 diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s
b/test/parallel/test-process-env-allowed-flags-are-documented.js
-index 64626b71f019..8a4e35997907 100644
+index a2738f0..f4dd77e 100644
 --- a/test/parallel/test-process-env-allowed-flags-are-documented.js
 +++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
 @@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines,
...v8OptionsLines]) {
@@ -148,4 +149,3 @@ index 64626b71f019..8a4e35997907 100644
          '--tls-cipher-list',
          '--use-bundled-ca',
          '--use-openssl-ca',
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
index 529381842..cb92dffa7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
@@ -1,3 +1,8 @@
+From 6eff8d3cd15abf9f983f5f7237cbefc8106ee04d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Jan 2020 14:12:40 -0800
+Subject: [PATCH]
+ https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be

 https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be

@@ -5,9 +10,16 @@ did some automated cleanups but it missed big-endian code=
.

 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ deps/v8/src/runtime/runtime-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deps/v8/src/runtime/runtime-utils.h
b/deps/v8/src/runtime/runtime-utils.h
+index 170c0bc..a7e02ae 100644
 --- a/deps/v8/src/runtime/runtime-utils.h
 +++ b/deps/v8/src/runtime/runtime-utils.h
-@@ -126,7 +126,7 @@ static inline ObjectPair MakePair(Object
+@@ -136,7 +136,7 @@ static inline ObjectPair MakePair(Object x, Object y) =
{
  #if defined(V8_TARGET_LITTLE_ENDIAN)
    return x.ptr() | (static_cast<ObjectPair>(y.ptr()) << 32);
  #elif defined(V8_TARGET_BIG_ENDIAN)
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
index 56e93c50c..eff5261b2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory.patch
@@ -1,5 +1,9 @@
+From a3d514aeace0fc2e0f4fb375f18742fc084460d3 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20Lal?=3D <kapouer@melix.org>
+Date: Mon, 19 Apr 2021 13:51:26 -0700
+Subject: [PATCH] nodejs: Fix build on mips
+
 Description: mksnapshot uses too much memory on 32-bit mipsel
-Author: J=C3=A9r=C3=A9my Lal <kapouer@melix.org>
 Last-Update: 2020-06-03
 Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=3D10586

@@ -8,20 +12,16 @@ ensures that qemu-mips can allocate such large ranges

 Signed-off-by: Khem Raj <raj.khem@gmail.com>

---- a/deps/v8/src/common/globals.h
-+++ b/deps/v8/src/common/globals.h
-@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D
- constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on PPC L=
inux
- #elif V8_TARGET_ARCH_MIPS
- constexpr bool kPlatformRequiresCodeRange =3D false;
--constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
-+constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
- constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
- constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
- #else
+---
+ deps/v8/src/codegen/mips/constants-mips.h | 2 +-
+ deps/v8/src/common/globals.h              | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/v8/src/codegen/mips/constants-mips.h
b/deps/v8/src/codegen/mips/constants-mips.h
+index 5ed338e..700a433 100644
 --- a/deps/v8/src/codegen/mips/constants-mips.h
 +++ b/deps/v8/src/codegen/mips/constants-mips.h
-@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
+@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInInt32Offset =3D =
3;
  namespace v8 {
  namespace internal {

@@ -30,3 +30,16 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>

  // ----------------------------------------------------------------------=
-------
  // Registers and FPURegisters.
+diff --git a/deps/v8/src/common/globals.h b/deps/v8/src/common/globals.h
+index 6aee59e..bf7d800 100644
+--- a/deps/v8/src/common/globals.h
++++ b/deps/v8/src/common/globals.h
+@@ -272,7 +272,7 @@ constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
+ constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on PPC L=
inux
+ #elif V8_TARGET_ARCH_MIPS
+ constexpr bool kPlatformRequiresCodeRange =3D false;
+-constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
++constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
+ constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
+ constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
+ #else
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
index 141889ad2..cb8a7f58b 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
@@ -1,8 +1,17 @@
-keep nodejs compatible with c-ares 1.17.1
+From d8354118fd817650f8a6f9c9b77f6b000a06b7b3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Oct 2021 12:21:42 -0700
+Subject: [PATCH] keep nodejs compatible with c-ares 1.17.1

 Upstream-Status: Inappropriate [c-ares specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>

+---
+ src/cares_wrap.h | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/cares_wrap.h b/src/cares_wrap.h
+index 60f99e6..aee46a9 100644
 --- a/src/cares_wrap.h
 +++ b/src/cares_wrap.h
 @@ -22,7 +22,15 @@
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
b/meta-oe/recipes-devtools/nodejs/nodejs_16.16.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.16.0.bb
index 62188f94a..7f24c8ff1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.16.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ba5b21ac7a505195ca69344d3d7a94=
a"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2e2857f5cd9803e878099e6a228d5f1=
c"

 DEPENDS =3D "openssl"
 DEPENDS:append:class-target =3D " qemu-native"
@@ -37,7 +37,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
 SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] =3D
"e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da90ff8d1"
+SRC_URI[sha256sum] =3D
"145151eff3b2aa5ebe73384009c52271a83740ae687a93c98c628cd7d52736eb"

 S =3D "${WORKDIR}/node-v${PV}"

--=20
2.34.1

