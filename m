Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13F7ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.5441.1663157013976349112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=euhlTFBP;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id cc5so15506539wrb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=GcE9Si1QTx21vfwQ3umLXcVO6JL3CIfYj5VTW2NgIbI=;
        b=euhlTFBPthbkS5vfmFn37u5GdeD+/LHWVWW4puGh4G0g8pU8ChIXEix0ho1soFKBko
         DPVxFeum1vQMPPdAvXoPuPj6NwS4Vh6erz6TPMmjpcYlgoZmXOBV4le0U8oBTl9MuhTN
         s9vDWYC7PHotxhE3Z6rQLPkzgSCoWrXAIM/oleEGUK7hCZa8MbidLy07zQQA+5JACGO2
         xvwvRPiIXIpiCIOhtgkKrucBVx7/ij2Q3iHvvlS10RPRKdzs0+OvCf83AUnkOanlReOz
         9POUIY+9wm55lIDCKnzguTnZ5epv35uR7d5UbWP9J4trI2ILTDCG1Vaau8457R+LMFjZ
         gFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GcE9Si1QTx21vfwQ3umLXcVO6JL3CIfYj5VTW2NgIbI=;
        b=HssfIU06enaFaU9QI7V066H153UqDDlF32jXVU/1k6MpjttNT03dHZIDv/eFQf5X4J
         iBUBkRUjyaA2rwxSdsFeAFoau/b0985I26hyLxeIsQJkLXyoiJvSS7F29MokTRviyOQU
         yXq48YEThj8RN5GPpx/v3jx02hHsE1YMqs9eI34CnByhMQxCeE9rNFIbry6KxWAGQC8Q
         C0SAf/aS/NvmzUrWUKZ3gVgkocIZsLdw1lxiRK3vAgHXC/tfKGbmLqzhYryZPITECh4C
         UY83+kwbr6/6HW/0JBffoFteLpSgRqQN6BihTCYV7PopcVrmdq7mvO/Bv7cF52oUiJXq
         ElyA==
X-Gm-Message-State: ACgBeo1xf3njXncNGM/LFG/nEwfIRH3FNQAH3VnLS0LqZyz4sATaPDDa
	g527fBlroyo61AA4CLi1yQpJoTVMfhIr5w==
X-Google-Smtp-Source: 
 AA6agR6zTkfyVdrUWEP1kBRgIYU6pvZdIhMxdljeGE/W6tfQmZT9vbZ4dOD40nh44eC4HNR9HDeOAg==
X-Received: by 2002:a05:6000:1a8e:b0:22a:c2ce:f556 with SMTP id
 f14-20020a0560001a8e00b0022ac2cef556mr3830541wry.154.1663157011711;
        Wed, 14 Sep 2022 05:03:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/8] mozjs-78: remove the recipe
Date: Wed, 14 Sep 2022 14:03:15 +0200
Message-Id: <20220914120316.551377-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98801

Nothing is depending on it, and mozjs-78 has been EOL for a while.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...figure-Skip-all-target-manipulations.patch |  66 ----
 ...-autoconf-s-config.sub-to-canonicali.patch |  33 --
 ...03-Do-not-check-binaries-after-build.patch |  55 ----
 ...004-Cargo.toml-do-not-abort-on-panic.patch |  33 --
 ...ibility-of-mozbuild-with-Python-3.10.patch | 304 ------------------
 .../mozjs-78/0006-use-asm-sgidefs.h.patch     |  35 --
 .../mozjs/mozjs-78/0007-fix-musl-build.patch  |  15 -
 .../mozjs/mozjs-78/0008-riscv.patch           |  52 ---
 ...0009-riscv-Disable-atomic-operations.patch |  52 ---
 .../0010-riscv-Set-march-correctly.patch      |  60 ----
 ...ace-include-by-code-to-fix-arm-build.patch |  43 ---
 ...aredArrayRawBufferRefs-to-public-API.patch |  35 --
 ...ix-one-occasionally-reproduced-confi.patch |  50 ---
 ...rewrite-cargo-host-linker-in-python3.patch |  56 ----
 .../mozjs/mozjs-78_78.15.0.bb                 | 146 ---------
 15 files changed, 1035 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0001-rust.configure-Skip-all-target-manipulations.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0003-Do-not-check-binaries-after-build.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0004-Cargo.toml-do-not-abort-on-panic.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0005-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0006-use-asm-sgidefs.h.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0007-fix-musl-build.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0008-riscv.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0009-riscv-Disable-atomic-operations.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0010-riscv-Set-march-correctly.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0011-replace-include-by-code-to-fix-arm-build.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0012-Add-SharedArrayRawBufferRefs-to-public-API.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0013-util.configure-fix-one-occasionally-reproduced-confi.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78/0014-rewrite-cargo-host-linker-in-python3.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/moz=
js/mozjs-78_78.15.0.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0001-rust.configure-Skip-all-target-manipulations.patch b/meta-oe/dyna=
mic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0001-rust.configure-=
Skip-all-target-manipulations.patch
deleted file mode 100644
index 453174e51..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
01-rust.configure-Skip-all-target-manipulations.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From b75661fbddd00ba9a43680c35b8c08aad8807d6b Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.com>
-Date: Sun, 31 Oct 2021 16:49:55 +0100
-Subject: [PATCH] rust.configure: Skip all target manipulations
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Mozjs/rust targets are different from OE-rust targets. Use targets reported
-as is.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- build/moz.configure/rust.configure | 16 +---------------
- 1 file changed, 1 insertion(+), 15 deletions(-)
-
-diff --git a/build/moz.configure/rust.configure b/build/moz.configure/rust=
.configure
-index e5122d6..9f3cc91 100644
---- a/build/moz.configure/rust.configure
-+++ b/build/moz.configure/rust.configure
-@@ -81,9 +81,6 @@ def unwrap_rustup(prog, name):
-=20
-     return unwrap
-=20
--rustc =3D unwrap_rustup(rustc, 'rustc')
--cargo =3D unwrap_rustup(cargo, 'cargo')
--
-=20
- set_config('CARGO', cargo)
- set_config('RUSTC', rustc)
-@@ -239,6 +236,7 @@ def rust_triple_alias(host_or_target, host_or_target_c=
_compiler):
-     @imports(_from=3D'textwrap', _import=3D'dedent')
-     def rust_target(rustc, host_or_target, compiler_info,
-                     rust_supported_targets, arm_target):
-+        return host_or_target.alias
-         # Rust's --target options are similar to, but not exactly the same
-         # as, the autoconf-derived targets we use.  An example would be t=
hat
-         # Rust uses distinct target triples for targetting the GNU C++ ABI
-@@ -401,22 +399,10 @@ def rust_triple_alias(host_or_target, host_or_target=
_c_compiler):
-=20
-     return rust_target
-=20
--
- rust_target_triple =3D rust_triple_alias(target, c_compiler)
- rust_host_triple =3D rust_triple_alias(host, host_c_compiler)
-=20
-=20
--@depends(host, rust_host_triple, rustc_info.host)
--def validate_rust_host_triple(host, rust_host, rustc_host):
--    if rust_host !=3D rustc_host:
--        if host.alias =3D=3D rust_host:
--            configure_host =3D host.alias
--        else:
--            configure_host =3D '{}/{}'.format(host.alias, rust_host)
--        die("The rust compiler host ({}) is not suitable for the configur=
e host ({})."
--            .format(rustc_host, configure_host))
--
--
- set_config('RUST_TARGET', rust_target_triple)
- set_config('RUST_HOST_TARGET', rust_host_triple)
-=20
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch b/meta=
-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0002-build-d=
o-not-use-autoconf-s-config.sub-to-canonicali.patch
deleted file mode 100644
index 21ad82ede..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
02-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e5b95b3918588e2930c9af7ba304c57e871b2d55 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Oct 2021 12:44:18 +0200
-Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicalize'
- names
-
-The outcome is that processed names no longer match our custom rust
-target definitions, and the build fails.
-
-Upstream-Status: Inappropriate [oespecific]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- build/moz.configure/init.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init=
.configure
-index b887153..0a6a33c 100644
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -808,7 +808,7 @@ def help_host_target(help, host, target):
- def config_sub(shell, triplet):
-     config_sub =3D os.path.join(os.path.dirname(__file__), '..',
-                               'autoconf', 'config.sub')
--    return check_cmd_output(shell, config_sub, triplet).strip()
-+    return triplet
-=20
-=20
- @depends('--host', shell)
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0003-Do-not-check-binaries-after-build.patch b/meta-oe/dynamic-layers/=
meta-python/recipes-extended/mozjs/mozjs-78/0003-Do-not-check-binaries-afte=
r-build.patch
deleted file mode 100644
index a0f37f597..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
03-Do-not-check-binaries-after-build.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1a47eac590f57c765033c7797b0759dc314f2128 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.com>
-Date: Mon, 1 Nov 2021 22:52:57 +0100
-Subject: [PATCH] Do not check binaries after build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-* It buys us a dependency hard to fulfill in different layer setups
-* Mozjs-91 does not perform these checks when setting --enable-project=3Dj=
s. Here
-  for old configuration style --enable-project changes nothing and build w=
ants
-  to check binaries created.
-
-So omit checks by not searching for llvm_objdump and making check_binary.p=
y a
-stub to prevent errors by using unset LLVM_OBJDUMP.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- moz.configure                                   | 7 -------
- python/mozbuild/mozbuild/action/check_binary.py | 2 +-
- 2 files changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/moz.configure b/moz.configure
-index 9b0e784..41e3e4d 100755
---- a/moz.configure
-+++ b/moz.configure
-@@ -648,13 +648,6 @@ def llvm_objdump(host_c_compiler, c_compiler, bindgen=
_config_paths):
-     return (llvm_objdump,)
-=20
-=20
--llvm_objdump =3D check_prog('LLVM_OBJDUMP', llvm_objdump, what=3D'llvm-ob=
jdump',
--                          when=3D'--enable-compile-environment',
--                          paths=3Dtoolchain_search_path)
--
--add_old_configure_assignment('LLVM_OBJDUMP', llvm_objdump)
--
--
- js_option('--enable-dtrace', help=3D'Build with dtrace support')
-=20
- dtrace =3D check_header('sys/sdt.h', when=3D'--enable-dtrace',
-diff --git a/python/mozbuild/mozbuild/action/check_binary.py b/python/mozb=
uild/mozbuild/action/check_binary.py
-index 57ccfa6..bd2c167 100644
---- a/python/mozbuild/mozbuild/action/check_binary.py
-+++ b/python/mozbuild/mozbuild/action/check_binary.py
-@@ -366,4 +366,4 @@ def main(args):
-=20
-=20
- if __name__ =3D=3D '__main__':
--    sys.exit(main(sys.argv[1:]))
-+    sys.exit(0)
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0004-Cargo.toml-do-not-abort-on-panic.patch b/meta-oe/dynamic-layers/m=
eta-python/recipes-extended/mozjs/mozjs-78/0004-Cargo.toml-do-not-abort-on-=
panic.patch
deleted file mode 100644
index 665eace66..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
04-Cargo.toml-do-not-abort-on-panic.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9e37248870b2b955293754933c789ca00bca06ef Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:00:24 +0200
-Subject: [PATCH] Cargo.toml: do not abort on panic
-
-OE's rust is configured to unwind, and this setting clashes with it/
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- Cargo.toml | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index 897daad41b..505454263e 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -56,13 +56,11 @@ opt-level =3D 1
- rpath =3D false
- lto =3D false
- debug-assertions =3D true
--panic =3D "abort"
-=20
- [profile.release]
- opt-level =3D 2
- rpath =3D false
- debug-assertions =3D false
--panic =3D "abort"
-=20
- [patch.crates-io]
- libudev-sys =3D { path =3D "dom/webauthn/libudev-sys" }
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0005-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch b/meta-oe/=
dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0005-Fixup-compa=
tibility-of-mozbuild-with-Python-3.10.patch
deleted file mode 100644
index d069d00af..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
05-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch
+++ /dev/null
@@ -1,304 +0,0 @@
-From a88d0c8e27b48344942187c2611bb121bde9332d Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Franti=3DC5=3DA1ek=3D20Zatloukal?=3D <fzatlouk@redhat.co=
m>
-Date: Tue, 13 Jul 2021 11:46:20 +0200
-Subject: [PATCH] Fixup compatibility of mozbuild with Python 3.10
-
-Stolen from [1]
-
-[1] https://src.fedoraproject.org/rpms/mozjs78/raw/rawhide/f/Fixup-compati=
bility-of-mozbuild-with-Python-3.10.patch
-
-Upstream-Status: Pending
-
----
- python/mach/mach/config.py                                    | 4 ++--
- python/mach/mach/decorators.py                                | 2 +-
- python/mozbuild/mozbuild/backend/configenvironment.py         | 3 ++-
- python/mozbuild/mozbuild/makeutil.py                          | 2 +-
- python/mozbuild/mozbuild/util.py                              | 2 +-
- testing/marionette/client/marionette_driver/wait.py           | 2 +-
- testing/mozbase/manifestparser/manifestparser/filters.py      | 3 ++-
- testing/mozbase/versioninfo.py                                | 2 +-
- testing/web-platform/tests/tools/manifest/vcs.py              | 2 +-
- .../web-platform/tests/tools/third_party/h2/h2/settings.py    | 2 +-
- .../tests/tools/third_party/html5lib/html5lib/_trie/_base.py  | 2 +-
- .../tools/third_party/html5lib/html5lib/treebuilders/dom.py   | 2 +-
- .../tests/tools/third_party/hyper/hyper/common/headers.py     | 2 +-
- .../tests/tools/third_party/hyper/hyper/h2/settings.py        | 2 +-
- .../tests/tools/third_party/hyper/hyper/http11/connection.py  | 4 ++--
- .../third_party/hyper/hyper/packages/hyperframe/flags.py      | 2 +-
- .../tests/tools/third_party/hyperframe/hyperframe/flags.py    | 2 +-
- testing/web-platform/tests/tools/wptserve/wptserve/config.py  | 3 ++-
- testing/web-platform/tests/webdriver/tests/support/sync.py    | 2 +-
- 19 files changed, 24 insertions(+), 21 deletions(-)
-
-diff --git a/python/mach/mach/config.py b/python/mach/mach/config.py
-index 7210eca82..edb4d2e93 100644
---- a/python/mach/mach/config.py
-+++ b/python/mach/mach/config.py
-@@ -144,7 +144,7 @@ def reraise_attribute_error(func):
-     return _
-=20
-=20
--class ConfigSettings(collections.Mapping):
-+class ConfigSettings(collections.abc.Mapping):
-     """Interface for configuration settings.
-=20
-     This is the main interface to the configuration.
-@@ -190,7 +190,7 @@ class ConfigSettings(collections.Mapping):
-     will result in exceptions being raised.
-     """
-=20
--    class ConfigSection(collections.MutableMapping, object):
-+    class ConfigSection(collections.abc.MutableMapping, object):
-         """Represents an individual config section."""
-         def __init__(self, config, name, settings):
-             object.__setattr__(self, '_config', config)
-diff --git a/python/mach/mach/decorators.py b/python/mach/mach/decorators.=
py
-index 27f7f34a6..5f63271a3 100644
---- a/python/mach/mach/decorators.py
-+++ b/python/mach/mach/decorators.py
-@@ -140,7 +140,7 @@ def CommandProvider(cls):
-               'Conditions argument must take a list ' + \
-               'of functions. Found %s instead.'
-=20
--        if not isinstance(command.conditions, collections.Iterable):
-+        if not isinstance(command.conditions, collections.abc.Iterable):
-             msg =3D msg % (command.name, type(command.conditions))
-             raise MachError(msg)
-=20
-diff --git a/python/mozbuild/mozbuild/backend/configenvironment.py b/pytho=
n/mozbuild/mozbuild/backend/configenvironment.py
-index 20d1a9fa6..8747958bd 100644
---- a/python/mozbuild/mozbuild/backend/configenvironment.py
-+++ b/python/mozbuild/mozbuild/backend/configenvironment.py
-@@ -9,7 +9,8 @@ import six
- import sys
- import json
-=20
--from collections import Iterable, OrderedDict
-+from collections import OrderedDict
-+from collections.abc import Iterable
- from types import ModuleType
-=20
- import mozpack.path as mozpath
-diff --git a/python/mozbuild/mozbuild/makeutil.py b/python/mozbuild/mozbui=
ld/makeutil.py
-index 4da1a3b26..4ce56848c 100644
---- a/python/mozbuild/mozbuild/makeutil.py
-+++ b/python/mozbuild/mozbuild/makeutil.py
-@@ -7,7 +7,7 @@ from __future__ import absolute_import, print_function, un=
icode_literals
- import os
- import re
- import six
--from collections import Iterable
-+from collections.abc import Iterable
-=20
-=20
- class Makefile(object):
-diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild/u=
til.py
-index 044cf645c..98ed3ef52 100644
---- a/python/mozbuild/mozbuild/util.py
-+++ b/python/mozbuild/mozbuild/util.py
-@@ -782,7 +782,7 @@ class HierarchicalStringList(object):
-         self._strings =3D StrictOrderingOnAppendList()
-         self._children =3D {}
-=20
--    class StringListAdaptor(collections.Sequence):
-+    class StringListAdaptor(collections.abc.Sequence):
-         def __init__(self, hsl):
-             self._hsl =3D hsl
-=20
-diff --git a/testing/marionette/client/marionette_driver/wait.py b/testing=
/marionette/client/marionette_driver/wait.py
-index eeaa1e23d..c147f463f 100644
---- a/testing/marionette/client/marionette_driver/wait.py
-+++ b/testing/marionette/client/marionette_driver/wait.py
-@@ -82,7 +82,7 @@ class Wait(object):
-=20
-         exceptions =3D []
-         if ignored_exceptions is not None:
--            if isinstance(ignored_exceptions, collections.Iterable):
-+            if isinstance(ignored_exceptions, collections.abc.Iterable):
-                 exceptions.extend(iter(ignored_exceptions))
-             else:
-                 exceptions.append(ignored_exceptions)
-diff --git a/testing/mozbase/manifestparser/manifestparser/filters.py b/te=
sting/mozbase/manifestparser/manifestparser/filters.py
-index 287ee033b..b1d608003 100644
---- a/testing/mozbase/manifestparser/manifestparser/filters.py
-+++ b/testing/mozbase/manifestparser/manifestparser/filters.py
-@@ -12,7 +12,8 @@ from __future__ import absolute_import
-=20
- import itertools
- import os
--from collections import defaultdict, MutableSequence
-+from collections import defaultdict
-+from collections.abc import MutableSequence
-=20
- import six
- from six import string_types
-diff --git a/testing/mozbase/versioninfo.py b/testing/mozbase/versioninfo.=
py
-index 91d1a0473..8c1680069 100755
---- a/testing/mozbase/versioninfo.py
-+++ b/testing/mozbase/versioninfo.py
-@@ -11,7 +11,7 @@ from commit messages.
-=20
- from __future__ import absolute_import, print_function
-=20
--from collections import Iterable
-+from collections.abc import Iterable
- from distutils.version import StrictVersion
- import argparse
- import os
-diff --git a/testing/web-platform/tests/tools/manifest/vcs.py b/testing/we=
b-platform/tests/tools/manifest/vcs.py
-index 7c0feeb81..05ee19c7c 100644
---- a/testing/web-platform/tests/tools/manifest/vcs.py
-+++ b/testing/web-platform/tests/tools/manifest/vcs.py
-@@ -3,7 +3,7 @@ import json
- import os
- import stat
- from collections import deque
--from collections import MutableMapping
-+from collections.abc import MutableMapping
-=20
- from six import with_metaclass, PY2
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/h2/h2/settings.p=
y b/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
-index 3da720329..e097630e9 100644
---- a/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
-+++ b/testing/web-platform/tests/tools/third_party/h2/h2/settings.py
-@@ -88,7 +88,7 @@ class ChangedSetting:
-         )
-=20
-=20
--class Settings(collections.MutableMapping):
-+class Settings(collections.abc.MutableMapping):
-     """
-     An object that encapsulates HTTP/2 settings state.
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/html5lib/html5li=
b/_trie/_base.py b/testing/web-platform/tests/tools/third_party/html5lib/ht=
ml5lib/_trie/_base.py
-index a1158bbbf..a9295a2ba 100644
---- a/testing/web-platform/tests/tools/third_party/html5lib/html5lib/_trie=
/_base.py
-+++ b/testing/web-platform/tests/tools/third_party/html5lib/html5lib/_trie=
/_base.py
-@@ -1,6 +1,6 @@
- from __future__ import absolute_import, division, unicode_literals
-=20
--from collections import Mapping
-+from collections.abc import Mapping
-=20
-=20
- class Trie(Mapping):
-diff --git a/testing/web-platform/tests/tools/third_party/html5lib/html5li=
b/treebuilders/dom.py b/testing/web-platform/tests/tools/third_party/html5l=
ib/html5lib/treebuilders/dom.py
-index dcfac220b..818a33433 100644
---- a/testing/web-platform/tests/tools/third_party/html5lib/html5lib/treeb=
uilders/dom.py
-+++ b/testing/web-platform/tests/tools/third_party/html5lib/html5lib/treeb=
uilders/dom.py
-@@ -1,7 +1,7 @@
- from __future__ import absolute_import, division, unicode_literals
-=20
-=20
--from collections import MutableMapping
-+from collections.abc import MutableMapping
- from xml.dom import minidom, Node
- import weakref
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/comm=
on/headers.py b/testing/web-platform/tests/tools/third_party/hyper/hyper/co=
mmon/headers.py
-index 655a591ac..6454f550a 100644
---- a/testing/web-platform/tests/tools/third_party/hyper/hyper/common/head=
ers.py
-+++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/common/head=
ers.py
-@@ -10,7 +10,7 @@ import collections
- from hyper.common.util import to_bytestring, to_bytestring_tuple
-=20
-=20
--class HTTPHeaderMap(collections.MutableMapping):
-+class HTTPHeaderMap(collections.abc.MutableMapping):
-     """
-     A structure that contains HTTP headers.
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/s=
ettings.py b/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/se=
ttings.py
-index fedc5e3c4..040afea92 100755
---- a/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/settings=
.py
-+++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/h2/settings=
.py
-@@ -151,7 +151,7 @@ class ChangedSetting:
-         )
-=20
-=20
--class Settings(collections.MutableMapping):
-+class Settings(collections.abc.MutableMapping):
-     """
-     An object that encapsulates HTTP/2 settings state.
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/http=
11/connection.py b/testing/web-platform/tests/tools/third_party/hyper/hyper=
/http11/connection.py
-index 61361c358..a214311d2 100644
---- a/testing/web-platform/tests/tools/third_party/hyper/hyper/http11/conn=
ection.py
-+++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/http11/conn=
ection.py
-@@ -10,7 +10,7 @@ import os
- import socket
- import base64
-=20
--from collections import Iterable, Mapping
-+from collections.abc import Iterable, Mapping
-=20
- import collections
- from hyperframe.frame import SettingsFrame
-@@ -295,7 +295,7 @@ class HTTP11Connection(object):
-                 return
-=20
-             # Iterables that set a specific content length.
--            elif isinstance(body, collections.Iterable):
-+            elif isinstance(body, collections.abc.Iterable):
-                 for item in body:
-                     try:
-                         self._sock.send(item)
-diff --git a/testing/web-platform/tests/tools/third_party/hyper/hyper/pack=
ages/hyperframe/flags.py b/testing/web-platform/tests/tools/third_party/hyp=
er/hyper/packages/hyperframe/flags.py
-index e8f630056..8f2ea689b 100644
---- a/testing/web-platform/tests/tools/third_party/hyper/hyper/packages/hy=
perframe/flags.py
-+++ b/testing/web-platform/tests/tools/third_party/hyper/hyper/packages/hy=
perframe/flags.py
-@@ -11,7 +11,7 @@ import collections
- Flag =3D collections.namedtuple("Flag", ["name", "bit"])
-=20
-=20
--class Flags(collections.MutableSet):
-+class Flags(collections.abc.MutableSet):
-     """
-     A simple MutableSet implementation that will only accept known flags =
as elements.
-=20
-diff --git a/testing/web-platform/tests/tools/third_party/hyperframe/hyper=
frame/flags.py b/testing/web-platform/tests/tools/third_party/hyperframe/hy=
perframe/flags.py
-index 05b35017e..14c352e10 100644
---- a/testing/web-platform/tests/tools/third_party/hyperframe/hyperframe/f=
lags.py
-+++ b/testing/web-platform/tests/tools/third_party/hyperframe/hyperframe/f=
lags.py
-@@ -11,7 +11,7 @@ import collections
- Flag =3D collections.namedtuple("Flag", ["name", "bit"])
-=20
-=20
--class Flags(collections.MutableSet):
-+class Flags(collections.abc.MutableSet):
-     """
-     A simple MutableSet implementation that will only accept known flags =
as
-     elements.
-diff --git a/testing/web-platform/tests/tools/wptserve/wptserve/config.py =
b/testing/web-platform/tests/tools/wptserve/wptserve/config.py
-index 7766565fe..3c1c36d6f 100644
---- a/testing/web-platform/tests/tools/wptserve/wptserve/config.py
-+++ b/testing/web-platform/tests/tools/wptserve/wptserve/config.py
-@@ -2,7 +2,8 @@ import copy
- import logging
- import os
-=20
--from collections import defaultdict, Mapping
-+from collections import defaultdict
-+from collections.abc import Mapping
- from six import integer_types, iteritems, itervalues, string_types
-=20
- from . import sslutils
-diff --git a/testing/web-platform/tests/webdriver/tests/support/sync.py b/=
testing/web-platform/tests/webdriver/tests/support/sync.py
-index 3fc77131c..8e8f6b819 100644
---- a/testing/web-platform/tests/webdriver/tests/support/sync.py
-+++ b/testing/web-platform/tests/webdriver/tests/support/sync.py
-@@ -81,7 +81,7 @@ class Poll(object):
-=20
-         exceptions =3D []
-         if ignored_exceptions is not None:
--            if isinstance(ignored_exceptions, collections.Iterable):
-+            if isinstance(ignored_exceptions, collections.abc.Iterable):
-                 exceptions.extend(iter(ignored_exceptions))
-             else:
-                 exceptions.append(ignored_exceptions)
---=20
-2.31.1
-
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0006-use-asm-sgidefs.h.patch b/meta-oe/dynamic-layers/meta-python/reci=
pes-extended/mozjs/mozjs-78/0006-use-asm-sgidefs.h.patch
deleted file mode 100644
index b56f0b95b..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
06-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <amccurdy@gmail.com>
-Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-[Vincent:
-Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=3D21070]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- gdb/mips-linux-nat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/mfbt/RandomNum.cpp
-+++ b/mfbt/RandomNum.cpp
-@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
- #  elif defined(__s390__)
- #    define GETRANDOM_NR 349
- #  elif defined(__mips__)
--#    include <sgidefs.h>
-+#    include <asm/sgidefs.h>
- #    if _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
- #      define GETRANDOM_NR 4353
- #    elif _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0007-fix-musl-build.patch b/meta-oe/dynamic-layers/meta-python/recipes=
-extended/mozjs/mozjs-78/0007-fix-musl-build.patch
deleted file mode 100644
index c0834af58..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
07-fix-musl-build.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream: No
-Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
-https://github.com/void-linux/void-packages/issues/2598
---- a/js/src/old-configure.in
-+++ b/js/src/old-configure.in
-@@ -1072,6 +1072,9 @@ if test "$ac_cv_thread_keyword" =3D yes; t
-     *-android*|*-linuxandroid*)
-       :
-       ;;
-+    *-musl*)
-+      :
-+      ;;
-     *)
-       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
-       ;;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0008-riscv.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended=
/mozjs/mozjs-78/0008-riscv.patch
deleted file mode 100644
index 70177d003..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
08-riscv.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Add RISCV32/64 support
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- build/moz.configure/init.configure                        | 6 ++++++
- python/mozbuild/mozbuild/configure/constants.py           | 2 ++
- 2 files changed, 8 insertions(+)
-
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/init=
.configure
-index 0a6a33c..eeee87e 100644
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -755,6 +755,12 @@ def split_triplet(triplet, allow_msvc=3DFalse):
-     elif cpu.startswith('aarch64'):
-         canonical_cpu =3D 'aarch64'
-         endianness =3D 'little'
-+    elif cpu in ("riscv32", "riscv32gc"):
-+        canonical_cpu =3D "riscv32"
-+        endianness =3D "little"
-+    elif cpu in ("riscv64", "riscv64gc"):
-+        canonical_cpu =3D "riscv64"
-+        endianness =3D "little"
-     elif cpu =3D=3D 'sh4':
-         canonical_cpu =3D 'sh4'
-         endianness =3D 'little'
-diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozb=
uild/mozbuild/configure/constants.py
-index 7542dcd..de25be2 100644
---- a/python/mozbuild/mozbuild/configure/constants.py
-+++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -50,6 +50,8 @@ CPU_bitness =3D {
-     'mips64': 64,
-     'ppc': 32,
-     'ppc64': 64,
-+    'riscv32': 32,
-+    'riscv64': 64,
-     's390': 32,
-     's390x': 64,
-     'sh4': 32,
-@@ -82,6 +84,8 @@ CPU_preprocessor_checks =3D OrderedDict((
-     ('s390', '__s390__'),
-     ('ppc64', '__powerpc64__'),
-     ('ppc', '__powerpc__'),
-+    ('riscv32', '__riscv && __SIZEOF_POINTER__ =3D=3D 4'),
-+    ('riscv64', '__riscv && __SIZEOF_POINTER__ =3D=3D 8'),
-     ('Alpha', '__alpha__'),
-     ('hppa', '__hppa__'),
-     ('sparc64', '__sparc__ && __arch64__'),
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0009-riscv-Disable-atomic-operations.patch b/meta-oe/dynamic-layers/me=
ta-python/recipes-extended/mozjs/mozjs-78/0009-riscv-Disable-atomic-operati=
ons.patch
deleted file mode 100644
index ba50e10c6..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
09-riscv-Disable-atomic-operations.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 64ad80e6d95871f17be4cd01da15581f41ac0b2b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 27 May 2019 21:10:34 -0700
-Subject: [PATCH] riscv: Disable atomic operations
-
-This was ported from what was used with mozjs-60 which was
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate[old-version]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- js/src/jit/AtomicOperations.h                          | 3 ++-
- js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h | 8 ++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/js/src/jit/AtomicOperations.h b/js/src/jit/AtomicOperations.h
-index 0486cba..cf6b91c 100644
---- a/js/src/jit/AtomicOperations.h
-+++ b/js/src/jit/AtomicOperations.h
-@@ -391,7 +391,8 @@ inline bool AtomicOperations::isLockfreeJS(int32_t siz=
e) {
- #elif defined(__ppc__) || defined(__PPC__) || defined(__sparc__) ||     \
-     defined(__ppc64__) || defined(__PPC64__) || defined(__ppc64le__) || \
-     defined(__PPC64LE__) || defined(__alpha__) || defined(__hppa__) ||  \
--    defined(__sh__) || defined(__s390__) || defined(__s390x__)
-+    defined(__sh__) || defined(__s390__) || defined(__s390x__) || \
-+    defined(__riscv)
- #  include "jit/shared/AtomicOperations-feeling-lucky.h"
- #else
- #  error "No AtomicOperations support provided for this platform"
-diff --git a/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h b/js/s=
rc/jit/shared/AtomicOperations-feeling-lucky-gcc.h
-index f002cd4..14bb5f9 100644
---- a/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h
-+++ b/js/src/jit/shared/AtomicOperations-feeling-lucky-gcc.h
-@@ -77,6 +77,14 @@
- #  endif
- #endif
-=20
-+#ifdef __riscv
-+#  ifdef __riscv_xlen =3D=3D 64
-+#    define HAS_64BIT_ATOMICS
-+#    define HAS_64BIT_LOCKFREE
-+#  endif
-+#endif
-+
-+
- // The default implementation tactic for gcc/clang is to use the newer __=
atomic
- // intrinsics added for use in C++11 <atomic>.  Where that isn't availabl=
e, we
- // use GCC's older __sync functions instead.
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0010-riscv-Set-march-correctly.patch b/meta-oe/dynamic-layers/meta-pyt=
hon/recipes-extended/mozjs/mozjs-78/0010-riscv-Set-march-correctly.patch
deleted file mode 100644
index befede172..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
10-riscv-Set-march-correctly.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From c3c2d1c69859c5e567005f0c3fa07a0dbe31e4a3 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.com>
-Date: Fri, 29 Oct 2021 21:18:26 +0200
-Subject: [PATCH] riscv: Set march correctly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from leftover patch in oe-core [1]
-
-[1] https://github.com/openembedded/openembedded-core/blob/c884878f6c833b1=
8a3a95b193f5de68df5bcea48/meta/recipes-devtools/rust/files/rv64gc.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- third_party/rust/cc/src/lib.rs           | 14 ++++++++++----
- third_party/rust/cc/.cargo-checksum.json | 2 +-
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/third_party/rust/cc/src/lib.rs b/third_party/rust/cc/src/lib.=
rs
-index 621d31d..6f72e13 100644
---- a/third_party/rust/cc/src/lib.rs
-+++ b/third_party/rust/cc/src/lib.rs
-@@ -1587,14 +1587,20 @@ impl Build {
-                     let mut parts =3D target.split('-');
-                     if let Some(arch) =3D parts.next() {
-                         let arch =3D &arch[5..];
--                        cmd.args.push(("-march=3Drv".to_owned() + arch).i=
nto());
--                        // ABI is always soft-float right now, update thi=
s when this is no longer the
--                        // case:
--                        if arch.starts_with("64") {
-+                        if target.contains("linux") && arch.starts_with("=
64") {
-+                            cmd.args.push(("-march=3Drv64gc").into());
-+                            cmd.args.push("-mabi=3Dlp64d".into());
-+                        } else if target.contains("linux") && arch.starts=
_with("32") {
-+                            cmd.args.push(("-march=3Drv32gc").into());
-+                            cmd.args.push("-mabi=3Dilp32d".into());
-+                        } else if arch.starts_with("64") {
-+                            cmd.args.push(("-march=3Drv".to_owned() + arc=
h).into());
-                             cmd.args.push("-mabi=3Dlp64".into());
-                         } else {
-+                            cmd.args.push(("-march=3Drv".to_owned() + arc=
h).into());
-                             cmd.args.push("-mabi=3Dilp32".into());
-                         }
-+                        cmd.args.push("-mcmodel=3Dmedany".into());
-                     }
-                 }
-             }
-diff --git a/third_party/rust/cc/.cargo-checksum.json b/third_party/rust/c=
c/.cargo-checksum.json
-index 417fde7..70e5d02 100644
---- a/third_party/rust/cc/.cargo-checksum.json
-+++ b/third_party/rust/cc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"Cargo.lock":"3aff5f8b0a7f4d72852b11b0526f0002e6bf55f19f1ebd647=
0d7f97fbd540e60","Cargo.toml":"6ab10d9b6a9c6f0909074e6698c90c6b6a7223661ec2=
e83174d2593117cbe7f2","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"7184fbdf375a057e673257348=
f6d7584c0dd11b66318d98f3647f69eb610b097","src/bin/gcc-shim.rs":"b7790787502=
9494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcdaf1=
c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":"4=
753929dbb7b676c19d7cfa06d0a47e37003554b80c536cbf2b892d591ef61c2","src/regis=
try.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d",=
"src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b223798=
2d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19a8=
d757c48ea7ca0881c50c","src/windows_registry.rs":"388e79dcf3e84078ae0b086c6c=
dee9cf9eb7e3ffafdcbf3e2df26163661f5856","tests/cc_env.rs":"e02b3b0824ad039b=
47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f06e=
b5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxflags=
.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","te=
sts/support/mod.rs":"71620b178583b6e6e5e0d4cac14e2cef6afc62fb6841e0c72ed178=
4543abf8ac","tests/test.rs":"1605640c9b94a77f48fc92e1dc0485bdf1960da5626e2e=
00279e4703691656bc"},"package":"aa87058dce70a3ff5621797f1506cb837edd02ac4c0=
ae642b4542dce802908b8"}
-\ No newline at end of file
-+{"files":{"Cargo.lock":"3aff5f8b0a7f4d72852b11b0526f0002e6bf55f19f1ebd647=
0d7f97fbd540e60","Cargo.toml":"6ab10d9b6a9c6f0909074e6698c90c6b6a7223661ec2=
e83174d2593117cbe7f2","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"7184fbdf375a057e673257348=
f6d7584c0dd11b66318d98f3647f69eb610b097","src/bin/gcc-shim.rs":"b7790787502=
9494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcdaf1=
c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":"f=
eab2b4cc51fcfb041f83a1a689960c3c9abfbaa9580ba186244a880586ba29a","src/regis=
try.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d",=
"src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b223798=
2d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19a8=
d757c48ea7ca0881c50c","src/windows_registry.rs":"388e79dcf3e84078ae0b086c6c=
dee9cf9eb7e3ffafdcbf3e2df26163661f5856","tests/cc_env.rs":"e02b3b0824ad039b=
47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f06e=
b5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxflags=
.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","te=
sts/support/mod.rs":"71620b178583b6e6e5e0d4cac14e2cef6afc62fb6841e0c72ed178=
4543abf8ac","tests/test.rs":"1605640c9b94a77f48fc92e1dc0485bdf1960da5626e2e=
00279e4703691656bc"},"package":"aa87058dce70a3ff5621797f1506cb837edd02ac4c0=
ae642b4542dce802908b8"}
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0011-replace-include-by-code-to-fix-arm-build.patch b/meta-oe/dynamic-=
layers/meta-python/recipes-extended/mozjs/mozjs-78/0011-replace-include-by-=
code-to-fix-arm-build.patch
deleted file mode 100644
index adca9c721..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
11-replace-include-by-code-to-fix-arm-build.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fd6847c9416f9eebde636e21d794d25d1be8791d Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Sat, 1 Jun 2019 09:06:01 +0900
-Subject: [PATCH] Bug 1526653 - Include struct definitions for user_vfp and
- user_vfp_exc.
-=20
-* We need this to fix arm builds
-* Stolen from [1]
-
-[1] https://salsa.debian.org/mozilla-team/firefox/commit/fd6847c9416f9eebd=
e636e21d794d25d1be8791d
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
-Upstream-Status: Pending
----
- js/src/wasm/WasmSignalHandlers.cpp | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/js/src/wasm/WasmSignalHandlers.cpp b/js/src/wasm/WasmSignalHa=
ndlers.cpp
-index 636537f8478..383c380f04c 100644
---- a/js/src/wasm/WasmSignalHandlers.cpp
-+++ b/js/src/wasm/WasmSignalHandlers.cpp
-@@ -248,7 +248,16 @@ using mozilla::DebugOnly;
- #endif
-=20
- #ifdef WASM_EMULATE_ARM_UNALIGNED_FP_ACCESS
--#  include <sys/user.h>
-+struct user_vfp {
-+  unsigned long long fpregs[32];
-+  unsigned long fpscr;
-+};
-+
-+struct user_vfp_exc {
-+  unsigned long fpexc;
-+  unsigned long fpinst;
-+  unsigned long fpinst2;
-+};
- #endif
-=20
- #if defined(ANDROID)
---=20
-GitLab
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0012-Add-SharedArrayRawBufferRefs-to-public-API.patch b/meta-oe/dynami=
c-layers/meta-python/recipes-extended/mozjs/mozjs-78/0012-Add-SharedArrayRa=
wBufferRefs-to-public-API.patch
deleted file mode 100644
index ca37ca72c..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
12-Add-SharedArrayRawBufferRefs-to-public-API.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ccdd47cee610cb33fa5f67f856a68f5e411c79d5 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.com>
-Date: Sun, 31 Oct 2021 18:32:39 +0100
-Subject: [PATCH] Add SharedArrayRawBufferRefs to public API
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Stolen from [1]
-
-[1] https://src.fedoraproject.org/rpms/mozjs78/blob/rawhide/f/FixSharedArr=
ay.diff
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- js/public/StructuredClone.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/public/StructuredClone.h b/js/public/StructuredClone.h
-index cb3cd5b..06da4dd 100644
---- a/js/public/StructuredClone.h
-+++ b/js/public/StructuredClone.h
-@@ -381,7 +381,7 @@ enum OwnTransferablePolicy {
- namespace js {
- class SharedArrayRawBuffer;
-=20
--class SharedArrayRawBufferRefs {
-+class JS_PUBLIC_API SharedArrayRawBufferRefs {
-  public:
-   SharedArrayRawBufferRefs() =3D default;
-   SharedArrayRawBufferRefs(SharedArrayRawBufferRefs&& other) =3D default;
---=20
-2.31.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0013-util.configure-fix-one-occasionally-reproduced-confi.patch b/meta=
-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/0013-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
deleted file mode 100644
index e943cf1ba..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
13-util.configure-fix-one-occasionally-reproduced-confi.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 430fd956b91c6208f166753578234c2f5db6352f Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 11 Nov 2021 21:17:38 +0800
-Subject: [PATCH] util.configure: fix one occasionally reproduced configure=
=20
- failure
-
-error:
-| checking whether the C++ compiler supports -Wno-range-loop-analysis...
-| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
-| DEBUG: | int
-| DEBUG: | main(void)
-| DEBUG: | {
-| DEBUG: |
-| DEBUG: | ;
-| DEBUG: | return 0;
-| DEBUG: | }
-| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=3Dcortex-a53 -march=3Darmv=
8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security --sysroot=3D/mozjs/91.1.0-r0/recipe-sy=
sroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c
-| DEBUG: The command returned non-zero exit status 1.
-| DEBUG: Its error output was:
-...
-| File "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configure=
", line 239, in try_invoke_compiler
-| os.remove(path)
-| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest.j=
r1qrcw3.cpp'
-
-It should be another process that deleted this file by using
-"rm -rf conftest*" inappropriately
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1740667]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- build/moz.configure/util.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/util.configure b/build/moz.configure/util=
.configure
-index 7ee1a498ad..511e257ad9 100644
---- a/build/moz.configure/util.configure
-+++ b/build/moz.configure/util.configure
-@@ -217,7 +217,7 @@ def try_invoke_compiler(compiler, language, source, fl=
ags=3DNone, onerror=3DNone):
-         'C++': '.cpp',
-     }[language]
-=20
--    fd, path =3D mkstemp(prefix=3D'conftest.', suffix=3Dsuffix, text=3DTr=
ue)
-+    fd, path =3D mkstemp(prefix=3D'try_invoke_compiler_conftest.', suffix=
=3Dsuffix, text=3DTrue)
-     try:
-         source =3D source.encode('ascii', 'replace')
-=20
---=20
-2.17.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78/0014-rewrite-cargo-host-linker-in-python3.patch b/meta-oe/dynamic-laye=
rs/meta-python/recipes-extended/mozjs/mozjs-78/0014-rewrite-cargo-host-link=
er-in-python3.patch
deleted file mode 100644
index 7b938179c..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78/00=
14-rewrite-cargo-host-linker-in-python3.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 9eceb43dd676afe2f675bd65ab369ba4d14f6537 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 18 Nov 2021 07:16:39 +0000
-Subject: [PATCH] Rewrite cargo-host-linker in python3
-
-Mozjs compile failed with this failure:
-/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /bu=
ild/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-nativ=
e/usr/lib/libtinfo.so.5)
-
-Root Cause:
-cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
-with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh links
-libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
-host libc is older libc. So the incompatible problem occurred.
-
-Solution:
-rewrite cargo-host-linker in python3
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- build/cargo-host-linker | 24 +++++++---
- 1 file changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/build/cargo-host-linker b/build/cargo-host-linker
-index cbd0472bf7..ccd8bffec1 100755
---- a/build/cargo-host-linker
-+++ b/build/cargo-host-linker
-@@ -1,3 +1,21 @@
--#!/bin/sh
--# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
-+#!/usr/bin/env python3
-+
-+import os,sys
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
-+    binary=3Dos.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
-+else:
-+    sys.exit(0)
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.env=
iron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRAP_HO=
ST_LDFLAGS']] + sys.argv[1:]
-+    else:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.en=
viron['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
-+else:
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.env=
iron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
-+    else:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.ar=
gv[1:]
-+
-+os.execvp(binary, args)
---=20
-2.33.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s-78_78.15.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs=
/mozjs-78_78.15.0.bb
deleted file mode 100644
index 7d4e4a81f..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs-78_78=
.15.0.bb
+++ /dev/null
@@ -1,146 +0,0 @@
-SUMMARY =3D "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
-HOMEPAGE =3D "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/Sp=
iderMonkey"
-LICENSE =3D "MPL-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf23733b=
f"
-
-SRC_URI =3D " \
-    https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firef=
ox-${PV}esr.source.tar.xz \
-    file://0001-rust.configure-Skip-all-target-manipulations.patch \
-    file://0002-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch=
 \
-    file://0003-Do-not-check-binaries-after-build.patch \
-    file://0004-Cargo.toml-do-not-abort-on-panic.patch \
-    file://0005-Fixup-compatibility-of-mozbuild-with-Python-3.10.patch \
-    file://0006-use-asm-sgidefs.h.patch \
-    file://0007-fix-musl-build.patch \
-    file://0008-riscv.patch \
-    file://0009-riscv-Disable-atomic-operations.patch \
-    file://0010-riscv-Set-march-correctly.patch \
-    file://0011-replace-include-by-code-to-fix-arm-build.patch \
-    file://0012-Add-SharedArrayRawBufferRefs-to-public-API.patch \
-    file://0013-util.configure-fix-one-occasionally-reproduced-confi.patch=
 \
-    file://0014-rewrite-cargo-host-linker-in-python3.patch \
-"
-
-SRC_URI[sha256sum] =3D "a4438d84d95171a6d4fea9c9f02c2edbf0475a9c614d968ebe=
2eedc25a672151"
-S =3D "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
-
-DEPENDS =3D " \
-    autoconf-2.13-native \
-    icu-native \
-    icu \
-    cargo-native \
-    zlib \
-    python3-six \
-    python3-six-native \
-"
-
-inherit autotools pkgconfig rust python3native siteinfo
-
-JIT ?=3D ""
-JIT:mipsarch =3D "--disable-jit"
-
-EXTRA_OECONF =3D " \
-    --target=3D${RUST_TARGET_SYS} \
-    --host=3D${BUILD_SYS} \
-    --prefix=3D${prefix} \
-    --libdir=3D${libdir} \
-    --x-includes=3D${STAGING_INCDIR} \
-    --x-libraries=3D${STAGING_LIBDIR} \
-    --without-system-icu \
-    --disable-tests --disable-strip --disable-optimize \
-    --disable-jemalloc \
-    --with-system-icu \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold",=
 '--disable-gold', d)} \
-    ${JIT} \
-"
-# Note: Python with mozilla build is a mess: E.g: python-six: to get an er=
ror
-# free configure we need:
-# * python3-six-native in DEPENDS
-# * python3-six in DEPENDS
-# * path to python-six shipped by mozilla in PYTHONPATH
-prepare_python_and_rust() {
-    if [ ! -f ${B}/PYTHONPATH ]; then
-        oldpath=3D`pwd`
-        cd ${S}
-        # Add mozjs python-modules necessary
-        PYTHONPATH=3D"${S}/build:${S}/config"
-        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/distro:${S}/thir=
d_party/python/jsmin"
-        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/pytoml:${S}/thir=
d_party/python/six"
-        PYTHONPATH=3D"$PYTHONPATH:${S}/third_party/python/pyyaml/lib3:${S}=
/third_party/python/which"
-        for sub_dir in python testing/mozbase; do
-            for module_dir in `ls $sub_dir -1`;do
-                [ $module_dir =3D "virtualenv" ] && continue
-                if [ -d "${S}/$sub_dir/$module_dir" ];then
-                    PYTHONPATH=3D"$PYTHONPATH:${S}/$sub_dir/$module_dir"
-                fi
-            done
-        done
-        # looks odd but it's huge and we want to see what's in there
-        echo "$PYTHONPATH" > ${B}/PYTHONPATH
-        cd "$oldpath"
-    fi
-
-    export PYTHONPATH=3D`cat ${B}/PYTHONPATH`
-
-    export RUST_TARGET_PATH=3D"${RUST_TARGET_PATH}"
-    export RUST_TARGET=3D"${TARGET_SYS}"
-    export RUSTFLAGS=3D"${RUSTFLAGS}"
-}
-
-export HOST_CC =3D "${BUILD_CC}"
-export HOST_CXX =3D "${BUILD_CXX}"
-export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
-export HOST_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
-export HOST_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
-# otherwise we are asked for yasm...
-export AS =3D "${CC}"
-
-CPPFLAGS:append:mips:toolchain-clang =3D " -fpie"
-CPPFLAGS:append:mipsel:toolchain-clang =3D " -fpie"
-
-do_configure() {
-    prepare_python_and_rust
-
-    cd ${S}/js/src
-    autoconf213 --macrodir=3D${STAGING_DATADIR_NATIVE}/autoconf213 old-con=
figure.in > old-configure
-
-    cd ${B}
-    # * use of /tmp can causes problems on heavily loaded hosts
-    # * with mozjs-78 we get without:
-    # | Path specified in LOCAL_INCLUDES (..) resolves to the topsrcdir or=
 topobjdir (<tmpdir>/oe-core-glibc/work/cortexa72-mortsgna-linux/mozjs-78/7=
8.15.0-r0/firefox-78.15.0/js/src), which is not allowed
-    mkdir -p "${B}/lcl_tmp"
-    TMPDIR=3D"${B}/lcl_tmp"  CFLAGS=3D"${CFLAGS}" CXXFLAGS=3D"${CXXFLAGS}"=
 ${S}/js/src/configure ${EXTRA_OECONF}
-
-    # inspired by what fedora [1] does: for big endian rebuild icu dat
-    # this avoids gjs qemu crash on mips at gir creation
-    # [1] https://src.fedoraproject.org/rpms/mozjs78/blob/rawhide/f/mozjs7=
8.spec
-    if [ ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'b=
ig', d)} =3D "big" -a ! -e ${S}/config/external/icu/data/icudt67b.dat ]; th=
en
-        echo "Do big endian icu dat-convert..."
-        icupkg -tb ${S}/config/external/icu/data/icudt67l.dat ${S}/config/=
external/icu/data/icudt67b.dat
-        rm -f ${S}/config/external/icu/data/icudt*l.dat
-    fi
-}
-
-do_compile:prepend() {
-    prepare_python_and_rust
-}
-
-do_install:prepend() {
-    prepare_python_and_rust
-}
-
-do_install:append() {
-    # tidy up installation
-    chmod -x ${D}${libdir}/pkgconfig/*.pc
-    sed -i 's:\x24{includedir}/mozjs-78/js/RequiredDefines.h:js/RequiredDe=
fines.h:g' ${D}${libdir}/pkgconfig/*.pc
-
-    rm -f ${D}${libdir}/libjs_static.ajs
-}
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4 =3D "arm"
-
-DISABLE_STATIC =3D ""
-
-PACKAGES =3D+ "lib${BPN}"
-FILES:lib${BPN} +=3D "${libdir}/lib*"
--=20
2.30.2


