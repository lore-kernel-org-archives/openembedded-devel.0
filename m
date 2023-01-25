Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577DBC54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:31:36 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.44853.1674653494845083565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m12NqBVP;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id p19-20020a4a8e93000000b004fe1e423feaso3129042ook.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXflhj+YG9ISeKeC7Pi4VoT7wooR48hbs/fAUEARo8U=;
        b=m12NqBVPceUFSbUyduyr51bvJ7zbRrc4Y3Ypu7lkJZgbFZ2nM1DT9mrcKacJb5fx1C
         x7vzjI+PDtVtEjU/6w24HnkIEWM4WPEyww9VJEECsmXwtMuBeZVSn+PWaFpjnfK7MZOK
         usBZo2AHF7YurnAlG7U532VSK6eKaitfaM8yCJ7ZjhZxyRd26U4xelxqhRDTrD4Uh4Dq
         31w/G+nRb2r8i94cCGyhZsQFVUSViaVnrx4jJvtzaoRq7Hhn4s4E1wFfW3hUHMB67dI5
         7zkLb7JozC2O5Zq39+LL2D76f6oyixMBC/h9l/+9haTykIOBxbByLfafJl4ZrktQIE//
         UILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXflhj+YG9ISeKeC7Pi4VoT7wooR48hbs/fAUEARo8U=;
        b=hHeo1cYIVnPu8gNRJqx2g226GQYJE+dA3wGGpEDcDWep/4/jPhbZ7upCGosqQ3JCCA
         ucWjFTiHI5RCXks5f63OcjjYt/V8Rn4NHi8dmADCGPHe8LyrWTMwIbD2XF0yhfX2jAvS
         g7mRJbv4nU6kEFIMzN3Uwb7bKBijVThS4KikKRSbC636plTzo9lYntgcJtHn2eVD8/gT
         B6jfCu32nxHtg1//26ZFT3uOC/t7u/bQgPoosjuZSTmG59DPt9A7tV6v2Yyjhdv8bHDl
         EvpxNzUw0cTka0hrQwHAFQ1W8lwaevBckaed8EwKF/Pdn4JD5oR7M0geRN+kW76TPuqx
         D28A==
X-Gm-Message-State: AFqh2krhzPC4sXhOOzD33fBy5eB5qecX6NEUmeLc9QYhwkVIalJOseCK
	U95IGntjuk7vip6l9O/d2X1uLmzkT4s=
X-Google-Smtp-Source: AMrXdXunFZTuMl5UD5Fk+JOWPAEHOds0C4Hf2CPxI5LMeXq9+/u2zafMU9ijf00s+xnb52Pgjx2+4g==
X-Received: by 2002:a4a:a98d:0:b0:4f5:2ae5:1926 with SMTP id w13-20020a4aa98d000000b004f52ae51926mr14455764oom.1.1674653493697;
        Wed, 25 Jan 2023 05:31:33 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 08/41] Nodejs - Upgrade to 16.18.1
Date: Wed, 25 Jan 2023 08:30:50 -0500
Message-Id: <45f9f9d4030f6267a8b8feeacf60a3f0b336a9b3.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100743

From: Archana Polampalli <archana.polampalli@windriver.com>

* Drop Openssl legacy provider patch and install both binaries patch
  which are already available in 16.x
* Refresh native binaries patch against 16.x base

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../oe-npm-cache                              |   0
 ....14.bb => nodejs-oe-cache-native_16.18.bb} |   0
 ...patch => 0001-Using-native-binaries.patch} |  40 +++--
 ...Install-both-binaries-and-use-libdir.patch |  96 -----------
 ...5-add-openssl-legacy-provider-option.patch | 151 ------------------
 .../{nodejs_16.14.2.bb => nodejs_16.18.1.bb}  |   8 +-
 6 files changed, 27 insertions(+), 268 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 => nodejs-oe-cache-16.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb => nodejs-oe-cache-native_16.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binaries.patch => 0001-Using-native-binaries.patch} (70%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb => nodejs_16.18.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
similarity index 70%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
index 8db1f1dd54..445aaf8398 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
@@ -3,14 +3,17 @@ From: Guillaume Burel <guillaume.burel@stormshield.eu>
 Date: Fri, 3 Jan 2020 11:25:54 +0100
 Subject: [PATCH] Using native binaries
 
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 |  4 ++--
- tools/v8_gypfiles/v8.gyp | 11 ++++-------
- 2 files changed, 6 insertions(+), 9 deletions(-)
+ node.gyp                 | 2 ++
+ tools/v8_gypfiles/v8.gyp | 5 +++++
+ 2 files changed, 7 insertions(+)
 
+diff --git a/node.gyp b/node.gyp
+index 24505da7ba..7d41bd52db 100644
 --- a/node.gyp
 +++ b/node.gyp
-@@ -294,6 +294,7 @@
+@@ -319,6 +319,7 @@
                'action_name': 'run_mkcodecache',
                'process_outputs_as_sources': 1,
                'inputs': [
@@ -18,14 +21,16 @@ Subject: [PATCH] Using native binaries
                  '<(mkcodecache_exec)',
                ],
                'outputs': [
-@@ -319,6 +320,7 @@
-               'action_name': 'node_mksnapshot',
-               'process_outputs_as_sources': 1,
-               'inputs': [
-+                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-                 '<(node_mksnapshot_exec)',
-               ],
-               'outputs': [
+@@ -366,6 +367,7 @@
+                   'action_name': 'node_mksnapshot',
+                   'process_outputs_as_sources': 1,
+                   'inputs': [
++                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
+                     '<(node_mksnapshot_exec)',
+                   ],
+                   'outputs': [
+diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
+index ed042f8829..371b8e02c2 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
 @@ -68,6 +68,7 @@
@@ -40,11 +45,11 @@ Subject: [PATCH] Using native binaries
              '<@(torque_outputs_inc)',
            ],
            'action': [
-+	    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
-@@ -225,6 +227,7 @@
+@@ -211,6 +213,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
-@@ -415,6 +418,7 @@
+@@ -395,6 +398,7 @@
              ],
            },
            'inputs': [
@@ -60,7 +65,7 @@ Subject: [PATCH] Using native binaries
              '<(mksnapshot_exec)',
            ],
            'outputs': [
-@@ -1548,6 +1552,7 @@
+@@ -1513,6 +1517,7 @@
          {
            'action_name': 'run_gen-regexp-special-case_action',
            'inputs': [
@@ -68,3 +73,6 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
deleted file mode 100644
index 5cb2e97015..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-and-use-libdir.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 62ddf8499747fb1e366477d666c0634ad50039a9 Mon Sep 17 00:00:00 2001
-From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
-Date: Tue, 19 Mar 2019 23:22:40 -0400
-Subject: [PATCH 2/2] Install both binaries and use libdir.
-
-This allows us to build with a shared library for other users while
-still providing the normal executable.
-
-Taken from - https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/0002-Install-both-binaries-and-use-libdir.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.py     |  7 +++++++
- tools/install.py | 21 +++++++++------------
- 2 files changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/configure.py b/configure.py
-index 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f3978067537abf9f0f0 100755
---- a/configure.py
-+++ b/configure.py
-@@ -721,10 +721,16 @@ parser.add_argument('--shared',
-     dest='shared',
-     default=None,
-     help='compile shared library for embedding node in another project. ' +
-          '(This mode is not officially supported for regular applications)')
- 
-+parser.add_argument('--libdir',
-+    action='store',
-+    dest='libdir',
-+    default='lib',
-+    help='a directory to install the shared library into')
-+
- parser.add_argument('--without-v8-platform',
-     action='store_true',
-     dest='without_v8_platform',
-     default=False,
-     help='do not initialize v8 platform during node.js startup. ' +
-@@ -1305,10 +1311,11 @@ def configure_node(o):
-     o['variables']['debug_nghttp2'] = 'false'
- 
-   o['variables']['node_no_browser_globals'] = b(options.no_browser_globals)
- 
-   o['variables']['node_shared'] = b(options.shared)
-+  o['variables']['libdir'] = options.libdir
-   node_module_version = getmoduleversion.get_version()
- 
-   if options.dest_os == 'android':
-     shlib_suffix = 'so'
-   elif sys.platform == 'darwin':
-diff --git a/tools/install.py b/tools/install.py
-index 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ace2257c239a7e9263 100755
---- a/tools/install.py
-+++ b/tools/install.py
-@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
-   for subdir, files_in_path in ret.items():
-     action(files_in_path, subdir + '/')
- 
- def files(action):
-   is_windows = sys.platform == 'win32'
--  output_file = 'node'
-   output_prefix = 'out/Release/'
-+  output_libprefix = output_prefix
- 
--  if 'false' == variables.get('node_shared'):
--    if is_windows:
--      output_file += '.exe'
-+  if is_windows:
-+    output_bin = 'node.exe'
-+    output_lib = 'node.dll'
-   else:
--    if is_windows:
--      output_file += '.dll'
--    else:
--      output_file = 'lib' + output_file + '.' + variables.get('shlib_suffix')
-+    output_bin = 'node'
-+    output_lib = 'libnode.' + variables.get('shlib_suffix')
- 
--  if 'false' == variables.get('node_shared'):
--    action([output_prefix + output_file], 'bin/' + output_file)
--  else:
--    action([output_prefix + output_file], 'lib/' + output_file)
-+  action([output_prefix + output_bin], 'bin/' + output_bin)
-+  if 'true' == variables.get('node_shared'):
-+    action([output_libprefix + output_lib], variables.get('libdir') + '/' + output_lib)
- 
-   if 'true' == variables.get('node_use_dtrace'):
-     action(['out/Release/node.d'], 'lib/dtrace/node.d')
- 
-   # behave similarly for systemtap
--- 
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
deleted file mode 100644
index 4d238c03f4..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-provider-option.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From 86d1c0cc6a5dcf57e413a1cc1c29203e87cf9a14 Mon Sep 17 00:00:00 2001
-From: Daniel Bevenius <daniel.bevenius@gmail.com>
-Date: Sat, 16 Oct 2021 08:50:16 +0200
-Subject: [PATCH] src: add --openssl-legacy-provider option
-
-This commit adds an option to Node.js named --openssl-legacy-provider
-and if specified will load OpenSSL 3.0 Legacy provider.
-
-$ ./node --help
-...
---openssl-legacy-provider  enable OpenSSL 3.0 legacy provider
-
-Example usage:
-
-$ ./node --openssl-legacy-provider  -p 'crypto.createHash("md4")'
-Hash {
-  _options: undefined,
-  [Symbol(kHandle)]: Hash {},
-  [Symbol(kState)]: { [Symbol(kFinalized)]: false }
-}
-
-Co-authored-by: Richard Lau <rlau@redhat.com>
-Signed-off-by: Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Backport [https://github.com/nodejs/node/issues/40455]
----
- doc/api/cli.md                                         | 10 ++++++++++
- src/crypto/crypto_util.cc                              | 10 ++++++++++
- src/node_options.cc                                    | 10 ++++++++++
- src/node_options.h                                     |  7 +++++++
- .../test-process-env-allowed-flags-are-documented.js   |  5 +++++
- 5 files changed, 42 insertions(+)
-
-diff --git a/doc/api/cli.md b/doc/api/cli.md
-index 74057706bf8d..608b9cdeddf1 100644
---- a/doc/api/cli.md
-+++ b/doc/api/cli.md
-@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Among other uses, this can be
- used to enable FIPS-compliant crypto if Node.js is built
- against FIPS-enabled OpenSSL.
- 
-+### `--openssl-legacy-provider`
-+<!-- YAML
-+added: REPLACEME
-+-->
-+
-+Enable OpenSSL 3.0 legacy provider. For more information please see
-+[providers readme][].
-+
- ### `--pending-deprecation`
- 
- <!-- YAML
-@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
- * `--no-warnings`
- * `--node-memory-debug`
- * `--openssl-config`
-+* `--openssl-legacy-provider`
- * `--pending-deprecation`
- * `--policy-integrity`
- * `--preserve-symlinks-main`
-@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=1536 index.js
- [emit_warning]: process.md#processemitwarningwarning-options
- [jitless]: https://v8.dev/blog/jitless
- [libuv threadpool documentation]: https://docs.libuv.org/en/latest/threadpool.html
-+[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0.0/README-PROVIDERS.md
- [remote code execution]: https://www.owasp.org/index.php/Code_Injection
- [security warning]: #warning-binding-inspector-to-a-public-ipport-combination-is-insecure
- [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
-diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
-index 7e0c8ba3eb60..796ea3025e41 100644
---- a/src/crypto/crypto_util.cc
-+++ b/src/crypto/crypto_util.cc
-@@ -148,6 +148,16 @@ void InitCryptoOnce() {
-   }
- #endif
- 
-+#if OPENSSL_VERSION_MAJOR >= 3
-+  // --openssl-legacy-provider
-+  if (per_process::cli_options->openssl_legacy_provider) {
-+    OSSL_PROVIDER* legacy_provider = OSSL_PROVIDER_load(nullptr, "legacy");
-+    if (legacy_provider == nullptr) {
-+      fprintf(stderr, "Unable to load legacy provider.\n");
-+    }
-+  }
-+#endif
-+
-   OPENSSL_init_ssl(0, settings);
-   OPENSSL_INIT_free(settings);
-   settings = nullptr;
-diff --git a/src/node_options.cc b/src/node_options.cc
-index 00bdc6688a4c..3363860919a9 100644
---- a/src/node_options.cc
-+++ b/src/node_options.cc
-@@ -4,6 +4,9 @@
- #include "env-inl.h"
- #include "node_binding.h"
- #include "node_internals.h"
-+#if HAVE_OPENSSL
-+#include "openssl/opensslv.h"
-+#endif
- 
- #include <errno.h>
- #include <sstream>
-diff --git a/src/node_options.h b/src/node_options.h
-index fd772478d04d..1c0e018ab16f 100644
---- a/src/node_options.h
-+++ b/src/node_options.h
-@@ -11,6 +11,10 @@
- #include "node_mutex.h"
- #include "util.h"
- 
-+#if HAVE_OPENSSL
-+#include "openssl/opensslv.h"
-+#endif
-+
- namespace node {
- 
- class HostPort {
-@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
-   bool enable_fips_crypto = false;
-   bool force_fips_crypto = false;
- #endif
-+#if OPENSSL_VERSION_MAJOR >= 3
-+  bool openssl_legacy_provider = false;
-+#endif
- 
-   // Per-process because reports can be triggered outside a known V8 context.
-   bool report_on_fatalerror = false;
-diff --git a/test/parallel/test-process-env-allowed-flags-are-documented.js b/test/parallel/test-process-env-allowed-flags-are-documented.js
-index 64626b71f019..8a4e35997907 100644
---- a/test/parallel/test-process-env-allowed-flags-are-documented.js
-+++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
-@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8OptionsLines]) {
-   }
- }
- 
-+if (!common.hasOpenSSL3) {
-+  documented.delete('--openssl-legacy-provider');
-+}
-+
- // Filter out options that are conditionally present.
- const conditionalOpts = [
-   {
-@@ -50,6 +54,7 @@ const conditionalOpts = [
-     filter: (opt) => {
-       return [
-         '--openssl-config',
-+        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
-         '--tls-cipher-list',
-         '--use-bundled-ca',
-         '--use-openssl-ca',
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
index 62188f94a7..a67948320d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba5b21ac7a505195ca69344d3d7a94a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6e54852cd826c41e80c6d80f6db00a85"
 
 DEPENDS = "openssl"
 DEPENDS:append:class-target = " qemu-native"
@@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
-           file://0002-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
-           file://0005-add-openssl-legacy-provider-option.patch \
            file://big-endian.patch \
            file://mips-less-memory.patch \
            file://system-c-ares.patch \
@@ -29,7 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            "
 SRC_URI:append:class-target = " \
-           file://0002-Using-native-binaries.patch \
+           file://0001-Using-native-binaries.patch \
            "
 SRC_URI:append:toolchain-clang:x86 = " \
            file://libatomic.patch \
@@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab955d3822da90ff8d1"
+SRC_URI[sha256sum] = "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def583f6303bc4d445238"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.25.1


