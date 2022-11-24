Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961BAC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 17:06:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.29007.1669309572725386083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Nov 2022 09:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IcW1acHT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1667037wmi.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvcj+3o2ahLxr92qKkfOa6La/1IokK+pzU77uHzlFJk=;
        b=IcW1acHTJQgoU0gwBwqY7zP92V7pSuoz5TjGr5dM26JGGtcDuk4UbbNpgoyKFOCJgt
         ttiNIaxl7PqUmJ1WNWvH/t5jBaHSzkEHttDl2tVHrFP16iDiLBfihd5Bk4mszKrcJAYd
         X1uheiZcnB3Uf9tEP1g9vtNx9LF1x2KtojmesBdERAwuScBpzX/wEiTBh1WTLUNmXwrE
         ND14X9R4arj5paWKtYUY6DpbKGfqDq2Zx4Lz5egxcNEv/eaUZWRjmV1YljX+D8wvSTfF
         lbFQlIDCTgQYTMIGssFES4DuKjPCmmY+B9E4sWAIKcwVgJZZKWcXLXoiQfFsJsgI2BpD
         MvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wvcj+3o2ahLxr92qKkfOa6La/1IokK+pzU77uHzlFJk=;
        b=ZQ895Vh+uznqUGREA2QhTBykuOH2cdQcOnZCy50Jhj70fgQleSgpQjohDRdtdfbk0H
         vJVl5JZhdXv5GqjO/xpmr+RsVkOMALlPTVmsKIFTpjzEO6OiO6ETAzS9XOuUzS6ola9e
         tlctnS6mtvm/wctfAutcD86r4/tUu2ICfiqzRx4/VlBkv0frFb4alcZSfp208kdt2AuF
         HORNtFOf06ZMiDzSl57ITeav8WkcZGHMiJPTPuT9Y1gosX5NyQWgAl+/MTWGLmj78wZi
         aqsU6H0lefdGrCLS0bhRtGdJxG8KHfPQfzSIRQENMkofcWZu5P+aiWDvSGbfyzwfd1mq
         FTuA==
X-Gm-Message-State: ANoB5pmYKrKEd0Gh20G9EU2Kb1xvUAnh3ucb2FgSgCJmn4OwKpx/8KjP
	zKsKsh3UpTakxPpXWg3YyE2CAfD5QxK7KmuYDuM=
X-Google-Smtp-Source: AA0mqf7+c27/Ksb84cuD8i9FV8zFiF1FUkZLQ6vL6mHvduqoXdCq2pP/ppBS0uy6Uy9tjkMFRgu+BvdHEDYKT0LTxns=
X-Received: by 2002:a7b:c3c9:0:b0:3cf:5442:bbe with SMTP id
 t9-20020a7bc3c9000000b003cf54420bbemr28473995wmj.2.1669309569942; Thu, 24 Nov
 2022 09:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
In-Reply-To: <20221118182718.2548901-1-archana.polampalli@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 Nov 2022 18:05:58 +0100
Message-ID: <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
To: "Polampalli, Archana" <archana.polampalli@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com, 
	hari.gpillai@windriver.com
Content-Type: multipart/alternative; boundary="000000000000efcb1e05ee3a6b38"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 17:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99720

--000000000000efcb1e05ee3a6b38
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see this is now queued in kirkstone-next
https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&i=
d=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f

I see bunch of recipes failing since this upgrade landed in master, mostly
due to npm dependency resolution being more strict now and builds failing
with

npm ERR! code ERESOLVE
npm ERR! ERESOLVE could not resolve
...
npm ERR! Fix the upstream dependency conflict, or retry
npm ERR! this command with --force, or --legacy-peer-deps
npm ERR! to accept an incorrect (and potentially broken) dependency
resolution.

Can we please delay backporting to kirkstone and langdale a bit more?

And if others are seeing similar failures please share them here as well.

The older nodejs was using npm@8.5.0, now its npm@8.19.2 more details about
this change in behavior from 8.6.0 in https://github.com/npm/cli/issues/499=
8

Regards,

On Fri, Nov 18, 2022 at 7:27 PM Polampalli, Archana <
archana.polampalli@windriver.com> wrote:

> * Drop Openssl legacy provider patch and install both binaries patch
>   which are already available in 16.x
> * Refresh native binaries patch against 16.x base
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../oe-npm-cache                              |   0
>  ....14.bb =3D> nodejs-oe-cache-native_16.18.bb} |   0
>  ...patch =3D> 0001-Using-native-binaries.patch} |  40 +++--
>  ...Install-both-binaries-and-use-libdir.patch |  96 -----------
>  ...5-add-openssl-legacy-provider-option.patch | 151 ------------------
>  .../{nodejs_16.14.2.bb =3D> nodejs_16.18.1.bb}  |   8 +-
>  6 files changed, 27 insertions(+), 268 deletions(-)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =3D>
> nodejs-oe-cache-16.18}/oe-npm-cache (100%)
>  rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb
> =3D> nodejs-oe-cache-native_16.18.bb} (100%)
>  rename
> meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch =
=3D>
> 0001-Using-native-binaries.patch} (70%)
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use=
-libdir.patch
>  delete mode 100644
> meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-o=
ption.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb =3D>
> nodejs_16.18.1.bb} (94%)
>
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
> similarity index 100%
> rename from
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
> rename to
> meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
> diff --git a/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.18.bb
> similarity index 100%
> rename from meta-oe/recipes-devtools/nodejs/
> nodejs-oe-cache-native_16.14.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
> similarity index 70%
> rename from
> meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
> rename to
> meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
> index 8db1f1dd5..445aaf839 100644
> ---
> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
> +++
> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
> @@ -3,14 +3,17 @@ From: Guillaume Burel <guillaume.burel@stormshield.eu>
>  Date: Fri, 3 Jan 2020 11:25:54 +0100
>  Subject: [PATCH] Using native binaries
>
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
>  ---
> - node.gyp                 |  4 ++--
> - tools/v8_gypfiles/v8.gyp | 11 ++++-------
> - 2 files changed, 6 insertions(+), 9 deletions(-)
> + node.gyp                 | 2 ++
> + tools/v8_gypfiles/v8.gyp | 5 +++++
> + 2 files changed, 7 insertions(+)
>
> +diff --git a/node.gyp b/node.gyp
> +index 24505da7ba..7d41bd52db 100644
>  --- a/node.gyp
>  +++ b/node.gyp
> -@@ -294,6 +294,7 @@
> +@@ -319,6 +319,7 @@
>                 'action_name': 'run_mkcodecache',
>                 'process_outputs_as_sources': 1,
>                 'inputs': [
> @@ -18,14 +21,16 @@ Subject: [PATCH] Using native binaries
>                   '<(mkcodecache_exec)',
>                 ],
>                 'outputs': [
> -@@ -319,6 +320,7 @@
> -               'action_name': 'node_mksnapshot',
> -               'process_outputs_as_sources': 1,
> -               'inputs': [
> -+                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> -                 '<(node_mksnapshot_exec)',
> -               ],
> -               'outputs': [
> +@@ -366,6 +367,7 @@
> +                   'action_name': 'node_mksnapshot',
> +                   'process_outputs_as_sources': 1,
> +                   'inputs': [
> ++                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +                     '<(node_mksnapshot_exec)',
> +                   ],
> +                   'outputs': [
> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
> +index ed042f8829..371b8e02c2 100644
>  --- a/tools/v8_gypfiles/v8.gyp
>  +++ b/tools/v8_gypfiles/v8.gyp
>  @@ -68,6 +68,7 @@
> @@ -40,11 +45,11 @@ Subject: [PATCH] Using native binaries
>               '<@(torque_outputs_inc)',
>             ],
>             'action': [
> -+          '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
>
> '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
>               '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
>               '-v8-root', '<(V8_ROOT)',
> -@@ -225,6 +227,7 @@
> +@@ -211,6 +213,7 @@
>           {
>             'action_name': 'generate_bytecode_builtins_list_action',
>             'inputs': [
> @@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries
>
> '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXE=
CUTABLE_SUFFIX)',
>             ],
>             'outputs': [
> -@@ -415,6 +418,7 @@
> +@@ -395,6 +398,7 @@
>               ],
>             },
>             'inputs': [
> @@ -60,7 +65,7 @@ Subject: [PATCH] Using native binaries
>               '<(mksnapshot_exec)',
>             ],
>             'outputs': [
> -@@ -1548,6 +1552,7 @@
> +@@ -1513,6 +1517,7 @@
>           {
>             'action_name': 'run_gen-regexp-special-case_action',
>             'inputs': [
> @@ -68,3 +73,6 @@ Subject: [PATCH] Using native binaries
>
> '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_S=
UFFIX)',
>             ],
>             'outputs': [
> +--
> +2.34.1
> +
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch
> deleted file mode 100644
> index 5cb2e9701..000000000
> ---
> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-u=
se-libdir.patch
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00 2001
> -From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> -Date: Tue, 19 Mar 2019 23:22:40 -0400
> -Subject: [PATCH 2/2] Install both binaries and use libdir.
> -
> -This allows us to build with a shared library for other users while
> -still providing the normal executable.
> -
> -Taken from -
> https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/0002-Install-both=
-binaries-and-use-libdir.patch
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - configure.py     |  7 +++++++
> - tools/install.py | 21 +++++++++------------
> - 2 files changed, 16 insertions(+), 12 deletions(-)
> -
> -diff --git a/configure.py b/configure.py
> -index
> 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f397806753=
7abf9f0f0
> 100755
> ---- a/configure.py
> -+++ b/configure.py
> -@@ -721,10 +721,16 @@ parser.add_argument('--shared',
> -     dest=3D'shared',
> -     default=3DNone,
> -     help=3D'compile shared library for embedding node in another projec=
t.
> ' +
> -          '(This mode is not officially supported for regular
> applications)')
> -
> -+parser.add_argument('--libdir',
> -+    action=3D'store',
> -+    dest=3D'libdir',
> -+    default=3D'lib',
> -+    help=3D'a directory to install the shared library into')
> -+
> - parser.add_argument('--without-v8-platform',
> -     action=3D'store_true',
> -     dest=3D'without_v8_platform',
> -     default=3DFalse,
> -     help=3D'do not initialize v8 platform during node.js startup. ' +
> -@@ -1305,10 +1311,11 @@ def configure_node(o):
> -     o['variables']['debug_nghttp2'] =3D 'false'
> -
> -   o['variables']['node_no_browser_globals'] =3D
> b(options.no_browser_globals)
> -
> -   o['variables']['node_shared'] =3D b(options.shared)
> -+  o['variables']['libdir'] =3D options.libdir
> -   node_module_version =3D getmoduleversion.get_version()
> -
> -   if options.dest_os =3D=3D 'android':
> -     shlib_suffix =3D 'so'
> -   elif sys.platform =3D=3D 'darwin':
> -diff --git a/tools/install.py b/tools/install.py
> -index
> 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2257c2=
39a7e9263
> 100755
> ---- a/tools/install.py
> -+++ b/tools/install.py
> -@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
> -   for subdir, files_in_path in ret.items():
> -     action(files_in_path, subdir + '/')
> -
> - def files(action):
> -   is_windows =3D sys.platform =3D=3D 'win32'
> --  output_file =3D 'node'
> -   output_prefix =3D 'out/Release/'
> -+  output_libprefix =3D output_prefix
> -
> --  if 'false' =3D=3D variables.get('node_shared'):
> --    if is_windows:
> --      output_file +=3D '.exe'
> -+  if is_windows:
> -+    output_bin =3D 'node.exe'
> -+    output_lib =3D 'node.dll'
> -   else:
> --    if is_windows:
> --      output_file +=3D '.dll'
> --    else:
> --      output_file =3D 'lib' + output_file + '.' +
> variables.get('shlib_suffix')
> -+    output_bin =3D 'node'
> -+    output_lib =3D 'libnode.' + variables.get('shlib_suffix')
> -
> --  if 'false' =3D=3D variables.get('node_shared'):
> --    action([output_prefix + output_file], 'bin/' + output_file)
> --  else:
> --    action([output_prefix + output_file], 'lib/' + output_file)
> -+  action([output_prefix + output_bin], 'bin/' + output_bin)
> -+  if 'true' =3D=3D variables.get('node_shared'):
> -+    action([output_libprefix + output_lib], variables.get('libdir') +
> '/' + output_lib)
> -
> -   if 'true' =3D=3D variables.get('node_use_dtrace'):
> -     action(['out/Release/node.d'], 'lib/dtrace/node.d')
> -
> -   # behave similarly for systemtap
> ---
> -2.33.0
> -
> diff --git
> a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch
> b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch
> deleted file mode 100644
> index 4d238c03f..000000000
> ---
> a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider=
-option.patch
> +++ /dev/null
> @@ -1,151 +0,0 @@
> -From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
> -From: Daniel Bevenius <daniel.bevenius@gmail.com>
> -Date: Sat, 16 Oct 2021 08:50:16 +0200
> -Subject: [PATCH] src: add --openssl-legacy-provider option
> -
> -This commit adds an option to Node.js named --openssl-legacy-provider
> -and if specified will load OpenSSL 3.0 Legacy provider.
> -
> -$ ./node --help
> -...
> ---openssl-legacy-provider  enable OpenSSL 3.0 legacy provider
> -
> -Example usage:
> -
> -$ ./node --openssl-legacy-provider  -p 'crypto.createHash("md4")'
> -Hash {
> -  _options: undefined,
> -  [Symbol(kHandle)]: Hash {},
> -  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
> -}
> -
> -Co-authored-by: Richard Lau <rlau@redhat.com>
> -Signed-off-by: Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Upstream-Status: Backport [https://github.com/nodejs/node/issues/40455]
> ----
> - doc/api/cli.md                                         | 10 ++++++++++
> - src/crypto/crypto_util.cc                              | 10 ++++++++++
> - src/node_options.cc                                    | 10 ++++++++++
> - src/node_options.h                                     |  7 +++++++
> - .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
> - 5 files changed, 42 insertions(+)
> -
> -diff --git a/doc/api/cli.md b/doc/api/cli.md
> -index 74057706bf8d..608b9cdeddf1 100644
> ---- a/doc/api/cli.md
> -+++ b/doc/api/cli.md
> -@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Amon=
g
> other uses, this can be
> - used to enable FIPS-compliant crypto if Node.js is built
> - against FIPS-enabled OpenSSL.
> -
> -+### `--openssl-legacy-provider`
> -+<!-- YAML
> -+added: REPLACEME
> -+-->
> -+
> -+Enable OpenSSL 3.0 legacy provider. For more information please see
> -+[providers readme][].
> -+
> - ### `--pending-deprecation`
> -
> - <!-- YAML
> -@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
> - * `--no-warnings`
> - * `--node-memory-debug`
> - * `--openssl-config`
> -+* `--openssl-legacy-provider`
> - * `--pending-deprecation`
> - * `--policy-integrity`
> - * `--preserve-symlinks-main`
> -@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js
> - [emit_warning]: process.md#processemitwarningwarning-options
> - [jitless]: https://v8.dev/blog/jitless
> - [libuv threadpool documentation]:
> https://docs.libuv.org/en/latest/threadpool.html
> -+[providers readme]:
> https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
> - [remote code execution]: https://www.owasp.org/index.php/Code_Injection
> - [security warning]:
> #warning-binding-inspector-to-a-public-ipport-combination-is-insecure
> - [timezone IDs]:
> https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
> -diff <https://en.wikipedia.org/wiki/List_of_tz_database_time_zones-diff>
> --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
> -index 7e0c8ba3eb60..796ea3025e41 100644
> ---- a/src/crypto/crypto_util.cc
> -+++ b/src/crypto/crypto_util.cc
> -@@ -148,6 +148,16 @@ void InitCryptoOnce() {
> -   }
> - #endif
> -
> -+#if OPENSSL_VERSION_MAJOR >=3D 3
> -+  // --openssl-legacy-provider
> -+  if (per_process::cli_options->openssl_legacy_provider) {
> -+    OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_load(nullptr,
> "legacy");
> -+    if (legacy_provider =3D=3D nullptr) {
> -+      fprintf(stderr, "Unable to load legacy provider.\n");
> -+    }
> -+  }
> -+#endif
> -+
> -   OPENSSL_init_ssl(0, settings);
> -   OPENSSL_INIT_free(settings);
> -   settings =3D nullptr;
> -diff --git a/src/node_options.cc b/src/node_options.cc
> -index 00bdc6688a4c..3363860919a9 100644
> ---- a/src/node_options.cc
> -+++ b/src/node_options.cc
> -@@ -4,6 +4,9 @@
> - #include "env-inl.h"
> - #include "node_binding.h"
> - #include "node_internals.h"
> -+#if HAVE_OPENSSL
> -+#include "openssl/opensslv.h"
> -+#endif
> -
> - #include <errno.h>
> - #include <sstream>
> -diff --git a/src/node_options.h b/src/node_options.h
> -index fd772478d04d..1c0e018ab16f 100644
> ---- a/src/node_options.h
> -+++ b/src/node_options.h
> -@@ -11,6 +11,10 @@
> - #include "node_mutex.h"
> - #include "util.h"
> -
> -+#if HAVE_OPENSSL
> -+#include "openssl/opensslv.h"
> -+#endif
> -+
> - namespace node {
> -
> - class HostPort {
> -@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
> -   bool enable_fips_crypto =3D false;
> -   bool force_fips_crypto =3D false;
> - #endif
> -+#if OPENSSL_VERSION_MAJOR >=3D 3
> -+  bool openssl_legacy_provider =3D false;
> -+#endif
> -
> -   // Per-process because reports can be triggered outside a known V8
> context.
> -   bool report_on_fatalerror =3D false;
> -diff --git
> a/test/parallel/test-process-env-allowed-flags-are-documented.js
> b/test/parallel/test-process-env-allowed-flags-are-documented.js
> -index 64626b71f019..8a4e35997907 100644
> ---- a/test/parallel/test-process-env-allowed-flags-are-documented.js
> -+++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
> -@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines,
> ...v8OptionsLines]) {
> -   }
> - }
> -
> -+if (!common.hasOpenSSL3) {
> -+  documented.delete('--openssl-legacy-provider');
> -+}
> -+
> - // Filter out options that are conditionally present.
> - const conditionalOpts =3D [
> -   {
> -@@ -50,6 +54,7 @@ const conditionalOpts =3D [
> -     filter: (opt) =3D> {
> -       return [
> -         '--openssl-config',
> -+        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
> -         '--tls-cipher-list',
> -         '--use-bundled-ca',
> -         '--use-openssl-ca',
> -
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
> similarity index 94%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
> index 62188f94a..a67948320 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ba5b21ac7a505195ca69344d3d7a=
94a"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e54852cd826c41e80c6d80f6db00=
a85"
>
>  DEPENDS =3D "openssl"
>  DEPENDS:append:class-target =3D " qemu-native"
> @@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc =3D "null"
>
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
> -           file://0002-Install-both-binaries-and-use-libdir.patch \
>             file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> -           file://0005-add-openssl-legacy-provider-option.patch \
>             file://big-endian.patch \
>             file://mips-less-memory.patch \
>             file://system-c-ares.patch \
> @@ -29,7 +27,7 @@ SRC_URI =3D "
> http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
>             "
>  SRC_URI:append:class-target =3D " \
> -           file://0002-Using-native-binaries.patch \
> +           file://0001-Using-native-binaries.patch \
>             "
>  SRC_URI:append:toolchain-clang:x86 =3D " \
>             file://libatomic.patch \
> @@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
>  SRC_URI:append:toolchain-clang:powerpc64le =3D " \
>             file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da90ff8d1"
> +SRC_URI[sha256sum] =3D
> "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99614):
> https://lists.openembedded.org/g/openembedded-devel/message/99614
> Mute This Topic: https://lists.openembedded.org/mt/95118333/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000efcb1e05ee3a6b38
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I see this is now queued in kirkstone-next</div><div>=
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirks=
tone-next&amp;id=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f">https://git.op=
enembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D08b6b6=
846a84d9a0459f42d1d730c9ea1d50c43f</a><br></div><div><br></div>I see bunch =
of recipes failing since this upgrade landed in master, mostly due to npm d=
ependency resolution being more strict now and builds failing with<div><br>=
</div><div>npm ERR! code ERESOLVE<br>npm ERR! ERESOLVE could not resolve<br=
></div><div>...</div><div>npm ERR! Fix the upstream dependency conflict, or=
 retry<br>npm ERR! this command with --force, or --legacy-peer-deps<br>npm =
ERR! to accept an incorrect (and potentially broken) dependency resolution.=
<br></div><div><br></div><div>Can we please delay backporting to kirkstone =
and langdale a bit more?</div><div><br></div><div>And if others are seeing =
similar failures please share them here as well.</div><div><br></div><div>T=
he older nodejs was using=C2=A0npm@8.5.0, now its npm@8.19.2 more details a=
bout this change in behavior from 8.6.0 in=C2=A0<a href=3D"https://github.c=
om/npm/cli/issues/4998">https://github.com/npm/cli/issues/4998</a></div><di=
v><br></div><div>Regards,</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Nov 18, 2022 at 7:27 PM Polampalli, =
Archana &lt;<a href=3D"mailto:archana.polampalli@windriver.com">archana.pol=
ampalli@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">* Drop Openssl legacy provider patch and install both =
binaries patch<br>
=C2=A0 which are already available in 16.x<br>
* Refresh native binaries patch against 16.x base<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<b=
r>
---<br>
=C2=A0.../oe-npm-cache=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0....<a href=3D"http://14.bb" rel=3D"noreferrer" target=3D"_blank">14.=
bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-native_16.18.bb" rel=3D"no=
referrer" target=3D"_blank">nodejs-oe-cache-native_16.18.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0...patch =3D&gt; 0001-Using-native-binaries.patch} |=C2=A0 40 +++--<b=
r>
=C2=A0...Install-both-binaries-and-use-libdir.patch |=C2=A0 96 -----------<=
br>
=C2=A0...5-add-openssl-legacy-provider-option.patch | 151 -----------------=
-<br>
=C2=A0.../{<a href=3D"http://nodejs_16.14.2.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_16.14.2.bb</a> =3D&gt; <a href=3D"http://nodejs_16.18.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.18.1.bb</a>}=C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A06 files changed, 27 insertions(+), 268 deletions(-)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =3D&gt;=
 nodejs-oe-cache-16.18}/oe-npm-cache (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs-oe-c=
ache-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-=
native_16.14.bb</a> =3D&gt; <a href=3D"http://nodejs-oe-cache-native_16.18.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-native_16.18.bb</a=
>} (100%)<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-bina=
ries.patch =3D&gt; 0001-Using-native-binaries.patch} (70%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Instal=
l-both-binaries-and-use-libdir.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_16.1=
4.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.2.bb</a> =3D&gt; =
<a href=3D"http://nodejs_16.18.1.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_16.18.1.bb</a>} (94%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-c=
ache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache<b=
r>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-ca=
che<br>
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cach=
e<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-ca=
che-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-n=
ative_16.14.bb</a> b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://node=
js-oe-cache-native_16.18.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe=
-cache-native_16.18.bb</a><br>
similarity index 100%<br>
rename from meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-cac=
he-native_16.14.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-na=
tive_16.14.bb</a><br>
rename to meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs-oe-cache=
-native_16.18.bb" rel=3D"noreferrer" target=3D"_blank">nodejs-oe-cache-nati=
ve_16.18.bb</a><br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binar=
ies.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binari=
es.patch<br>
similarity index 70%<br>
rename from meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binari=
es.patch<br>
rename to meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries=
.patch<br>
index 8db1f1dd5..445aaf839 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.pat=
ch<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.pat=
ch<br>
@@ -3,14 +3,17 @@ From: Guillaume Burel &lt;<a href=3D"mailto:guillaume.bur=
el@stormshield.eu" target=3D"_blank">guillaume.burel@stormshield.eu</a>&gt;=
<br>
=C2=A0Date: Fri, 3 Jan 2020 11:25:54 +0100<br>
=C2=A0Subject: [PATCH] Using native binaries<br>
<br>
+Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli=
@windriver.com" target=3D"_blank">archana.polampalli@windriver.com</a>&gt;<=
br>
=C2=A0---<br>
- node.gyp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
- tools/v8_gypfiles/v8.gyp | 11 ++++-------<br>
- 2 files changed, 6 insertions(+), 9 deletions(-)<br>
+ node.gyp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
 ++<br>
+ tools/v8_gypfiles/v8.gyp | 5 +++++<br>
+ 2 files changed, 7 insertions(+)<br>
<br>
+diff --git a/node.gyp b/node.gyp<br>
+index 24505da7ba..7d41bd52db 100644<br>
=C2=A0--- a/node.gyp<br>
=C2=A0+++ b/node.gyp<br>
-@@ -294,6 +294,7 @@<br>
+@@ -319,6 +319,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;action_name&#3=
9;: &#39;run_mkcodecache&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;process_output=
s_as_sources&#39;: 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inputs&#39;: [=
<br>
@@ -18,14 +21,16 @@ Subject: [PATCH] Using native binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(mk=
codecache_exec)&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;outputs&#39;: =
[<br>
-@@ -319,6 +320,7 @@<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;action_name&#3=
9;: &#39;node_mksnapshot&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;process_output=
s_as_sources&#39;: 1,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;inputs&#39;: [=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT=
_DIR)/v8-qemu-wrapper.sh&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&lt;(no=
de_mksnapshot_exec)&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;outputs&#39;: =
[<br>
+@@ -366,6 +367,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
action_name&#39;: &#39;node_mksnapshot&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
process_outputs_as_sources&#39;: 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
inputs&#39;: [<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#3=
9;&lt;(PRODUCT_DIR)/v8-qemu-wrapper.sh&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;&lt;(node_mksnapshot_exec)&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
outputs&#39;: [<br>
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp<br>
+index ed042f8829..371b8e02c2 100644<br>
=C2=A0--- a/tools/v8_gypfiles/v8.gyp<br>
=C2=A0+++ b/tools/v8_gypfiles/v8.gyp<br>
=C2=A0@@ -68,6 +68,7 @@<br>
@@ -40,11 +45,11 @@ Subject: [PATCH] Using native binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;@(torque_outputs_=
inc)&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;action&#39;: [<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT_DIR)/v8-qemu-wrapper=
.sh&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT_DIR)/v8-qemu-=
wrapper.sh&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT_DIR)/&lt=
;(EXECUTABLE_PREFIX)torque&lt;(EXECUTABLE_SUFFIX)&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-o&#39;, &#39;&lt;(SH=
ARED_INTERMEDIATE_DIR)/torque-generated&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-v8-root&#39;, &#39;&=
lt;(V8_ROOT)&#39;,<br>
-@@ -225,6 +227,7 @@<br>
+@@ -211,6 +213,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;action_name&#39;: &#39;gener=
ate_bytecode_builtins_list_action&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inputs&#39;: [<br>
@@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT_DIR)/&lt=
;(EXECUTABLE_PREFIX)bytecode_builtins_list_generator&lt;(EXECUTABLE_SUFFIX)=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;outputs&#39;: [<br>
-@@ -415,6 +418,7 @@<br>
+@@ -395,6 +398,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inputs&#39;: [<br>
@@ -60,7 +65,7 @@ Subject: [PATCH] Using native binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(mksnapshot_exec)=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;outputs&#39;: [<br>
-@@ -1548,6 +1552,7 @@<br>
+@@ -1513,6 +1517,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;action_name&#39;: &#39;run_g=
en-regexp-special-case_action&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;inputs&#39;: [<br>
@@ -68,3 +73,6 @@ Subject: [PATCH] Using native binaries<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&lt;(PRODUCT_DIR)/&lt=
;(EXECUTABLE_PREFIX)gen-regexp-special-case&lt;(EXECUTABLE_SUFFIX)&#39;,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;outputs&#39;: [<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binar=
ies-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Inst=
all-both-binaries-and-use-libdir.patch<br>
deleted file mode 100644<br>
index 5cb2e9701..000000000<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and=
-use-libdir.patch<br>
+++ /dev/null<br>
@@ -1,96 +0,0 @@<br>
-From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00 2001<br>
-From: Elliott Sales de Andrade &lt;<a href=3D"mailto:quantum.analyst@gmail=
.com" target=3D"_blank">quantum.analyst@gmail.com</a>&gt;<br>
-Date: Tue, 19 Mar 2019 23:22:40 -0400<br>
-Subject: [PATCH 2/2] Install both binaries and use libdir.<br>
-<br>
-This allows us to build with a shared library for other users while<br>
-still providing the normal executable.<br>
-<br>
-Taken from - <a href=3D"https://src.fedoraproject.org/rpms/nodejs/raw/rawh=
ide/f/0002-Install-both-binaries-and-use-libdir.patch" rel=3D"noreferrer" t=
arget=3D"_blank">https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/00=
02-Install-both-binaries-and-use-libdir.patch</a><br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Elliott Sales de Andrade &lt;<a href=3D"mailto:quantum.anal=
yst@gmail.com" target=3D"_blank">quantum.analyst@gmail.com</a>&gt;<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- configure.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
- tools/install.py | 21 +++++++++------------<br>
- 2 files changed, 16 insertions(+), 12 deletions(-)<br>
-<br>
-diff --git a/configure.py b/configure.py<br>
-index 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978=
067537abf9f0f0 100755<br>
---- a/configure.py<br>
-+++ b/configure.py<br>
-@@ -721,10 +721,16 @@ parser.add_argument(&#39;--shared&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0dest=3D&#39;shared&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0default=3DNone,<br>
-=C2=A0 =C2=A0 =C2=A0help=3D&#39;compile shared library for embedding node =
in another project. &#39; +<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;(This mode is not officially suppo=
rted for regular applications)&#39;)<br>
- <br>
-+parser.add_argument(&#39;--libdir&#39;,<br>
-+=C2=A0 =C2=A0 action=3D&#39;store&#39;,<br>
-+=C2=A0 =C2=A0 dest=3D&#39;libdir&#39;,<br>
-+=C2=A0 =C2=A0 default=3D&#39;lib&#39;,<br>
-+=C2=A0 =C2=A0 help=3D&#39;a directory to install the shared library into&=
#39;)<br>
-+<br>
- parser.add_argument(&#39;--without-v8-platform&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0action=3D&#39;store_true&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0dest=3D&#39;without_v8_platform&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0default=3DFalse,<br>
-=C2=A0 =C2=A0 =C2=A0help=3D&#39;do not initialize v8 platform during node.=
js startup. &#39; +<br>
-@@ -1305,10 +1311,11 @@ def configure_node(o):<br>
-=C2=A0 =C2=A0 =C2=A0o[&#39;variables&#39;][&#39;debug_nghttp2&#39;] =3D &#=
39;false&#39;<br>
- <br>
-=C2=A0 =C2=A0o[&#39;variables&#39;][&#39;node_no_browser_globals&#39;] =3D=
 b(options.no_browser_globals)<br>
- <br>
-=C2=A0 =C2=A0o[&#39;variables&#39;][&#39;node_shared&#39;] =3D b(options.s=
hared)<br>
-+=C2=A0 o[&#39;variables&#39;][&#39;libdir&#39;] =3D options.libdir<br>
-=C2=A0 =C2=A0node_module_version =3D getmoduleversion.get_version()<br>
- <br>
-=C2=A0 =C2=A0if options.dest_os =3D=3D &#39;android&#39;:<br>
-=C2=A0 =C2=A0 =C2=A0shlib_suffix =3D &#39;so&#39;<br>
-=C2=A0 =C2=A0elif sys.platform =3D=3D &#39;darwin&#39;:<br>
-diff --git a/tools/install.py b/tools/install.py<br>
-index 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2=
257c239a7e9263 100755<br>
---- a/tools/install.py<br>
-+++ b/tools/install.py<br>
-@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):<br>
-=C2=A0 =C2=A0for subdir, files_in_path in ret.items():<br>
-=C2=A0 =C2=A0 =C2=A0action(files_in_path, subdir + &#39;/&#39;)<br>
- <br>
- def files(action):<br>
-=C2=A0 =C2=A0is_windows =3D sys.platform =3D=3D &#39;win32&#39;<br>
--=C2=A0 output_file =3D &#39;node&#39;<br>
-=C2=A0 =C2=A0output_prefix =3D &#39;out/Release/&#39;<br>
-+=C2=A0 output_libprefix =3D output_prefix<br>
- <br>
--=C2=A0 if &#39;false&#39; =3D=3D variables.get(&#39;node_shared&#39;):<br=
>
--=C2=A0 =C2=A0 if is_windows:<br>
--=C2=A0 =C2=A0 =C2=A0 output_file +=3D &#39;.exe&#39;<br>
-+=C2=A0 if is_windows:<br>
-+=C2=A0 =C2=A0 output_bin =3D &#39;node.exe&#39;<br>
-+=C2=A0 =C2=A0 output_lib =3D &#39;node.dll&#39;<br>
-=C2=A0 =C2=A0else:<br>
--=C2=A0 =C2=A0 if is_windows:<br>
--=C2=A0 =C2=A0 =C2=A0 output_file +=3D &#39;.dll&#39;<br>
--=C2=A0 =C2=A0 else:<br>
--=C2=A0 =C2=A0 =C2=A0 output_file =3D &#39;lib&#39; + output_file + &#39;.=
&#39; + variables.get(&#39;shlib_suffix&#39;)<br>
-+=C2=A0 =C2=A0 output_bin =3D &#39;node&#39;<br>
-+=C2=A0 =C2=A0 output_lib =3D &#39;libnode.&#39; + variables.get(&#39;shli=
b_suffix&#39;)<br>
- <br>
--=C2=A0 if &#39;false&#39; =3D=3D variables.get(&#39;node_shared&#39;):<br=
>
--=C2=A0 =C2=A0 action([output_prefix + output_file], &#39;bin/&#39; + outp=
ut_file)<br>
--=C2=A0 else:<br>
--=C2=A0 =C2=A0 action([output_prefix + output_file], &#39;lib/&#39; + outp=
ut_file)<br>
-+=C2=A0 action([output_prefix + output_bin], &#39;bin/&#39; + output_bin)<=
br>
-+=C2=A0 if &#39;true&#39; =3D=3D variables.get(&#39;node_shared&#39;):<br>
-+=C2=A0 =C2=A0 action([output_libprefix + output_lib], variables.get(&#39;=
libdir&#39;) + &#39;/&#39; + output_lib)<br>
- <br>
-=C2=A0 =C2=A0if &#39;true&#39; =3D=3D variables.get(&#39;node_use_dtrace&#=
39;):<br>
-=C2=A0 =C2=A0 =C2=A0action([&#39;out/Release/node.d&#39;], &#39;lib/dtrace=
/node.d&#39;)<br>
- <br>
-=C2=A0 =C2=A0# behave similarly for systemtap<br>
--- <br>
-2.33.0<br>
-<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy=
-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-op=
enssl-legacy-provider-option.patch<br>
deleted file mode 100644<br>
index 4d238c03f..000000000<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provid=
er-option.patch<br>
+++ /dev/null<br>
@@ -1,151 +0,0 @@<br>
-From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001<br>
-From: Daniel Bevenius &lt;<a href=3D"mailto:daniel.bevenius@gmail.com" tar=
get=3D"_blank">daniel.bevenius@gmail.com</a>&gt;<br>
-Date: Sat, 16 Oct 2021 08:50:16 +0200<br>
-Subject: [PATCH] src: add --openssl-legacy-provider option<br>
-<br>
-This commit adds an option to Node.js named --openssl-legacy-provider<br>
-and if specified will load OpenSSL 3.0 Legacy provider.<br>
-<br>
-$ ./node --help<br>
-...<br>
---openssl-legacy-provider=C2=A0 enable OpenSSL 3.0 legacy provider<br>
-<br>
-Example usage:<br>
-<br>
-$ ./node --openssl-legacy-provider=C2=A0 -p &#39;crypto.createHash(&quot;m=
d4&quot;)&#39;<br>
-Hash {<br>
-=C2=A0 _options: undefined,<br>
-=C2=A0 [Symbol(kHandle)]: Hash {},<br>
-=C2=A0 [Symbol(kState)]: { [Symbol(kFinalized)]: false }<br>
-}<br>
-<br>
-Co-authored-by: Richard Lau &lt;<a href=3D"mailto:rlau@redhat.com" target=
=3D"_blank">rlau@redhat.com</a>&gt;<br>
-Signed-off-by: Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.va=
lek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/nodejs/node/issue=
s/40455" rel=3D"noreferrer" target=3D"_blank">https://github.com/nodejs/nod=
e/issues/40455</a>]<br>
----<br>
- doc/api/cli.md=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 10 ++++++++++<br>
- src/crypto/crypto_util.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<br=
>
- src/node_options.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 10 ++++++++++<br>
- src/node_options.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 +++++++<br>
- .../test-process-env-allowed-flags-are-documented.js=C2=A0 =C2=A0|=C2=A0 =
5 +++++<br>
- 5 files changed, 42 insertions(+)<br>
-<br>
-diff --git a/doc/api/cli.md b/doc/api/cli.md<br>
-index 74057706bf8d..608b9cdeddf1 100644<br>
---- a/doc/api/cli.md<br>
-+++ b/doc/api/cli.md<br>
-@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among =
other uses, this can be<br>
- used to enable FIPS-compliant crypto if Node.js is built<br>
- against FIPS-enabled OpenSSL.<br>
- <br>
-+### `--openssl-legacy-provider`<br>
-+&lt;!-- YAML<br>
-+added: REPLACEME<br>
-+--&gt;<br>
-+<br>
-+Enable OpenSSL 3.0 legacy provider. For more information please see<br>
-+[providers readme][].<br>
-+<br>
- ### `--pending-deprecation`<br>
- <br>
- &lt;!-- YAML<br>
-@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:<br>
- * `--no-warnings`<br>
- * `--node-memory-debug`<br>
- * `--openssl-config`<br>
-+* `--openssl-legacy-provider`<br>
- * `--pending-deprecation`<br>
- * `--policy-integrity`<br>
- * `--preserve-symlinks-main`<br>
-@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js<br>
- [emit_warning]: process.md#processemitwarningwarning-options<br>
- [jitless]: <a href=3D"https://v8.dev/blog/jitless" rel=3D"noreferrer" tar=
get=3D"_blank">https://v8.dev/blog/jitless</a><br>
- [libuv threadpool documentation]: <a href=3D"https://docs.libuv.org/en/la=
test/threadpool.html" rel=3D"noreferrer" target=3D"_blank">https://docs.lib=
uv.org/en/latest/threadpool.html</a><br>
-+[providers readme]: <a href=3D"https://github.com/openssl/openssl/blob/op=
enssl-3.0.0/README-PROVIDERS.md" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md</a><br=
>
- [remote code execution]: <a href=3D"https://www.owasp.org/index.php/Code_=
Injection" rel=3D"noreferrer" target=3D"_blank">https://www.owasp.org/index=
.php/Code_Injection</a><br>
- [security warning]: #warning-binding-inspector-to-a-public-ipport-combina=
tion-is-insecure<br>
- [timezone IDs]: <a href=3D"https://en.wikipedia.org/wiki/List_of_tz_datab=
ase_time_zones-diff" rel=3D"noreferrer" target=3D"_blank">https://en.wikipe=
dia.org/wiki/List_of_tz_database_time_zones<br>
-diff</a> --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc<br>
-index 7e0c8ba3eb60..796ea3025e41 100644<br>
---- a/src/crypto/crypto_util.cc<br>
-+++ b/src/crypto/crypto_util.cc<br>
-@@ -148,6 +148,16 @@ void InitCryptoOnce() {<br>
-=C2=A0 =C2=A0}<br>
- #endif<br>
- <br>
-+#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
-+=C2=A0 // --openssl-legacy-provider<br>
-+=C2=A0 if (per_process::cli_options-&gt;openssl_legacy_provider) {<br>
-+=C2=A0 =C2=A0 OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_load(nullp=
tr, &quot;legacy&quot;);<br>
-+=C2=A0 =C2=A0 if (legacy_provider =3D=3D nullptr) {<br>
-+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unable to load legacy provider=
.\n&quot;);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 }<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0OPENSSL_init_ssl(0, settings);<br>
-=C2=A0 =C2=A0OPENSSL_INIT_free(settings);<br>
-=C2=A0 =C2=A0settings =3D nullptr;<br>
-diff --git a/src/node_options.cc b/src/node_options.cc<br>
-index 00bdc6688a4c..3363860919a9 100644<br>
---- a/src/node_options.cc<br>
-+++ b/src/node_options.cc<br>
-@@ -4,6 +4,9 @@<br>
- #include &quot;env-inl.h&quot;<br>
- #include &quot;node_binding.h&quot;<br>
- #include &quot;node_internals.h&quot;<br>
-+#if HAVE_OPENSSL<br>
-+#include &quot;openssl/opensslv.h&quot;<br>
-+#endif<br>
- <br>
- #include &lt;errno.h&gt;<br>
- #include &lt;sstream&gt;<br>
-diff --git a/src/node_options.h b/src/node_options.h<br>
-index fd772478d04d..1c0e018ab16f 100644<br>
---- a/src/node_options.h<br>
-+++ b/src/node_options.h<br>
-@@ -11,6 +11,10 @@<br>
- #include &quot;node_mutex.h&quot;<br>
- #include &quot;util.h&quot;<br>
- <br>
-+#if HAVE_OPENSSL<br>
-+#include &quot;openssl/opensslv.h&quot;<br>
-+#endif<br>
-+<br>
- namespace node {<br>
- <br>
- class HostPort {<br>
-@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {<br>
-=C2=A0 =C2=A0bool enable_fips_crypto =3D false;<br>
-=C2=A0 =C2=A0bool force_fips_crypto =3D false;<br>
- #endif<br>
-+#if OPENSSL_VERSION_MAJOR &gt;=3D 3<br>
-+=C2=A0 bool openssl_legacy_provider =3D false;<br>
-+#endif<br>
- <br>
-=C2=A0 =C2=A0// Per-process because reports can be triggered outside a kno=
wn V8 context.<br>
-=C2=A0 =C2=A0bool report_on_fatalerror =3D false;<br>
-diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.j=
s b/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
-index 64626b71f019..8a4e35997907 100644<br>
---- a/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
-+++ b/test/parallel/test-process-env-allowed-flags-are-documented.js<br>
-@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLi=
nes]) {<br>
-=C2=A0 =C2=A0}<br>
- }<br>
- <br>
-+if (!common.hasOpenSSL3) {<br>
-+=C2=A0 documented.delete(&#39;--openssl-legacy-provider&#39;);<br>
-+}<br>
-+<br>
- // Filter out options that are conditionally present.<br>
- const conditionalOpts =3D [<br>
-=C2=A0 =C2=A0{<br>
-@@ -50,6 +54,7 @@ const conditionalOpts =3D [<br>
-=C2=A0 =C2=A0 =C2=A0filter: (opt) =3D&gt; {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--openssl-config&#39;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 common.hasOpenSSL3 ? &#39;--openssl-legacy-pr=
ovider&#39; : &#39;&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--tls-cipher-list&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--use-bundled-ca&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;--use-openssl-ca&#39;,<br>
-<br>
diff --git a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14=
.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.2.bb</a> b/meta-oe=
/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.18.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">nodejs_16.18.1.bb</a><br>
similarity index 94%<br>
rename from meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.=
2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.2.bb</a><br>
rename to meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.18.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_16.18.1.bb</a><br>
index 62188f94a..a67948320 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.14.2.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.14.2.bb</a><br>
+++ b/meta-oe/recipes-devtools/nodejs/<a href=3D"http://nodejs_16.18.1.bb" =
rel=3D"noreferrer" target=3D"_blank">nodejs_16.18.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0DESCRIPTION =3D &quot;nodeJS Evented I/O for V8 JavaScript&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://nodejs.org" rel=3D"noreferrer" t=
arget=3D"_blank">http://nodejs.org</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT &amp; ISC &amp; BSD-2-Clause &amp; BSD-3-Clause=
 &amp; Artistic-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6ba5b21ac7a505195ca69344d3=
d7a94a&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D6e54852cd826c41e80c6d80f6d=
b00a85&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;openssl&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; qemu-native&quot;<br>
@@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc =3D &quot;null&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://nodejs.org/dist/v$%7BPV%7D/node-v=
$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://nodejs.org/di=
st/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disable-running-gyp-f=
iles-for-bundled-deps.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Install-both-binaries=
-and-use-libdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-v8-don-t-override-ARM=
-CFLAGS.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-add-openssl-legacy-pr=
ovider-option.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://big-endian.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mips-less-memory.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://system-c-ares.patch \<br>
@@ -29,7 +27,7 @@ SRC_URI =3D &quot;<a href=3D"http://nodejs.org/dist/v$%7B=
PV%7D/node-v$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://n=
odejs.org/dist/v${PV}/node-v${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mips-Use-32bit-cast-f=
or-operand-on-mips32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-target =3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Using-native-binaries=
.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Using-native-binaries=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:toolchain-clang:x86 =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libatomic.patch \<br>
@@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 =3D &quot; \<br>
=C2=A0SRC_URI:append:toolchain-clang:powerpc64le =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ppc64-Do-not-use-mmin=
imal-toc-with-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600=
ab955d3822da90ff8d1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;1f8051a88f86f42064f4415fe7a980e59b0a502ecc8de=
f583f6303bc4d445238&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/node-v${PV}&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99614): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99614" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99614</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95118333/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95118333/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000efcb1e05ee3a6b38--

