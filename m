Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C37C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 18:25:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.976.1668795936173514485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 10:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=UzKukVZb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=832165193f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIFimoE003073
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 18:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=FAMXi8Sonniy55OcbeJO9UNwkY83lHx6Qr+1fXTp05c=;
 b=UzKukVZbwOa4DZHXNff9bySLB8t42JelIW8Q7m23fiSIMHe6PZ4J8r2U3AoIPNhDByAn
 3HgAfZhs0/5yQu0OzY1w8Ios/Qqn2sNuzaWnZO5x5vpTm6U/p+krxzbujGI76AiLkqmi
 kVbw3L49O9jLZ6JiOe4ZSVa8qq5tobIO/tMjUYu3faNFl8V85ydXRcUuiPhlvAK1acM1
 n7Ca6sfmaHyYQFd4gur4FoBaY9BVD9ymkWdT3Y/CXS2992Nn+Cx9KkYU+HVGEJ30UeJy
 B43xOIG1wu8+Iw5oaJ8ykdjoeX4g0yc5vpliTDNdEm3ViZBiPLmjFgziuMZXvDwskCuB 4g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kx0s90n19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 18:25:35 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 18 Nov 2022 10:25:33 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Fri, 18 Nov 2022 10:25:32 -0800
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <hari.gpillai@windriver.com>,
        "Archana
 Polampalli" <archana.polampalli@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] Nodejs - Upgrade to 16.18.1
Date: Fri, 18 Nov 2022 18:25:27 +0000
Message-ID: <20221118182527.2548091-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
X-Proofpoint-ORIG-GUID: fzPEgGIH1nGcFszH1ItVRC3UiZJvK6On
X-Proofpoint-GUID: fzPEgGIH1nGcFszH1ItVRC3UiZJvK6On
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211180109
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2AIFimoE003073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Nov 2022 18:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99613

* Drop Openssl legacy provider patch and install both binaries patch
  which are already available in 16.x
* Refresh native binaries patch against 16.x base

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../oe-npm-cache                              |   0
 ....14.bb =3D> nodejs-oe-cache-native_16.18.bb} |   0
 ...patch =3D> 0001-Using-native-binaries.patch} |  40 +++--
 ...Install-both-binaries-and-use-libdir.patch |  96 -----------
 ...5-add-openssl-legacy-provider-option.patch | 151 ------------------
 .../{nodejs_16.14.2.bb =3D> nodejs_16.18.1.bb}  |   8 +-
 6 files changed, 27 insertions(+), 268 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-16.14 =3D> nodej=
s-oe-cache-16.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_16.14.bb =
=3D> nodejs-oe-cache-native_16.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/nodejs/{0002-Using-native-binarie=
s.patch =3D> 0001-Using-native-binaries.patch} (70%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-b=
oth-binaries-and-use-libdir.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-add-opens=
sl-legacy-provider-option.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_16.14.2.bb =3D> nodejs_16=
.18.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm=
-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-cac=
he
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.14/oe-npm-=
cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-16.18/oe-npm-ca=
che
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14=
.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.14.=
bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_16.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-bin=
aries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-bi=
naries.patch
similarity index 70%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-bina=
ries.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binari=
es.patch
index 8db1f1dd5..445aaf839 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.p=
atch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.p=
atch
@@ -3,14 +3,17 @@ From: Guillaume Burel <guillaume.burel@stormshield.eu>
 Date: Fri, 3 Jan 2020 11:25:54 +0100
 Subject: [PATCH] Using native binaries
=20
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
 ---
- node.gyp                 |  4 ++--
- tools/v8_gypfiles/v8.gyp | 11 ++++-------
- 2 files changed, 6 insertions(+), 9 deletions(-)
+ node.gyp                 | 2 ++
+ tools/v8_gypfiles/v8.gyp | 5 +++++
+ 2 files changed, 7 insertions(+)
=20
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
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFF=
IX)',
              '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
              '-v8-root', '<(V8_ROOT)',
-@@ -225,6 +227,7 @@
+@@ -211,6 +213,7 @@
          {
            'action_name': 'generate_bytecode_builtins_list_action',
            'inputs': [
@@ -52,7 +57,7 @@ Subject: [PATCH] Using native binaries
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_=
generator<(EXECUTABLE_SUFFIX)',
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
              '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case=
<(EXECUTABLE_SUFFIX)',
            ],
            'outputs': [
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-bin=
aries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-=
Install-both-binaries-and-use-libdir.patch
deleted file mode 100644
index 5cb2e9701..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Install-both-binaries-a=
nd-use-libdir.patch
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
-Taken from - https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/000=
2-Install-both-binaries-and-use-libdir.patch
-
-Upstream-Status: Pending
-
-Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.py     |  7 +++++++
- tools/install.py | 21 +++++++++------------
- 2 files changed, 16 insertions(+), 12 deletions(-)
-
-diff --git a/configure.py b/configure.py
-index 6efb98c2316f089f3167e486282593245373af3f..a6d2ec939e4480dfae703f39=
78067537abf9f0f0 100755
---- a/configure.py
-+++ b/configure.py
-@@ -721,10 +721,16 @@ parser.add_argument('--shared',
-     dest=3D'shared',
-     default=3DNone,
-     help=3D'compile shared library for embedding node in another projec=
t. ' +
-          '(This mode is not officially supported for regular applicatio=
ns)')
-=20
-+parser.add_argument('--libdir',
-+    action=3D'store',
-+    dest=3D'libdir',
-+    default=3D'lib',
-+    help=3D'a directory to install the shared library into')
-+
- parser.add_argument('--without-v8-platform',
-     action=3D'store_true',
-     dest=3D'without_v8_platform',
-     default=3DFalse,
-     help=3D'do not initialize v8 platform during node.js startup. ' +
-@@ -1305,10 +1311,11 @@ def configure_node(o):
-     o['variables']['debug_nghttp2'] =3D 'false'
-=20
-   o['variables']['node_no_browser_globals'] =3D b(options.no_browser_gl=
obals)
-=20
-   o['variables']['node_shared'] =3D b(options.shared)
-+  o['variables']['libdir'] =3D options.libdir
-   node_module_version =3D getmoduleversion.get_version()
-=20
-   if options.dest_os =3D=3D 'android':
-     shlib_suffix =3D 'so'
-   elif sys.platform =3D=3D 'darwin':
-diff --git a/tools/install.py b/tools/install.py
-index 41cc1cbc60a9480cc08df3aa0ebe582c2becc3a2..11208f9e7166ab60da46d5ac=
e2257c239a7e9263 100755
---- a/tools/install.py
-+++ b/tools/install.py
-@@ -128,26 +128,23 @@ def subdir_files(path, dest, action):
-   for subdir, files_in_path in ret.items():
-     action(files_in_path, subdir + '/')
-=20
- def files(action):
-   is_windows =3D sys.platform =3D=3D 'win32'
--  output_file =3D 'node'
-   output_prefix =3D 'out/Release/'
-+  output_libprefix =3D output_prefix
-=20
--  if 'false' =3D=3D variables.get('node_shared'):
--    if is_windows:
--      output_file +=3D '.exe'
-+  if is_windows:
-+    output_bin =3D 'node.exe'
-+    output_lib =3D 'node.dll'
-   else:
--    if is_windows:
--      output_file +=3D '.dll'
--    else:
--      output_file =3D 'lib' + output_file + '.' + variables.get('shlib_=
suffix')
-+    output_bin =3D 'node'
-+    output_lib =3D 'libnode.' + variables.get('shlib_suffix')
-=20
--  if 'false' =3D=3D variables.get('node_shared'):
--    action([output_prefix + output_file], 'bin/' + output_file)
--  else:
--    action([output_prefix + output_file], 'lib/' + output_file)
-+  action([output_prefix + output_bin], 'bin/' + output_bin)
-+  if 'true' =3D=3D variables.get('node_shared'):
-+    action([output_libprefix + output_lib], variables.get('libdir') + '=
/' + output_lib)
-=20
-   if 'true' =3D=3D variables.get('node_use_dtrace'):
-     action(['out/Release/node.d'], 'lib/dtrace/node.d')
-=20
-   # behave similarly for systemtap
---=20
-2.33.0
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-lega=
cy-provider-option.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-ad=
d-openssl-legacy-provider-option.patch
deleted file mode 100644
index 4d238c03f..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0005-add-openssl-legacy-prov=
ider-option.patch
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
-@@ -687,6 +687,14 @@ Load an OpenSSL configuration file on startup. Amon=
g other uses, this can be
- used to enable FIPS-compliant crypto if Node.js is built
- against FIPS-enabled OpenSSL.
-=20
-+### `--openssl-legacy-provider`
-+<!-- YAML
-+added: REPLACEME
-+-->
-+
-+Enable OpenSSL 3.0 legacy provider. For more information please see
-+[providers readme][].
-+
- ### `--pending-deprecation`
-=20
- <!-- YAML
-@@ -1544,6 +1552,7 @@ Node.js options that are allowed are:
- * `--no-warnings`
- * `--node-memory-debug`
- * `--openssl-config`
-+* `--openssl-legacy-provider`
- * `--pending-deprecation`
- * `--policy-integrity`
- * `--preserve-symlinks-main`
-@@ -1933,6 +1942,7 @@ $ node --max-old-space-size=3D1536 index.js
- [emit_warning]: process.md#processemitwarningwarning-options
- [jitless]: https://v8.dev/blog/jitless
- [libuv threadpool documentation]: https://docs.libuv.org/en/latest/thre=
adpool.html
-+[providers readme]: https://github.com/openssl/openssl/blob/openssl-3.0=
.0/README-PROVIDERS.md
- [remote code execution]: https://www.owasp.org/index.php/Code_Injection
- [security warning]: #warning-binding-inspector-to-a-public-ipport-combi=
nation-is-insecure
- [timezone IDs]: https://en.wikipedia.org/wiki/List_of_tz_database_time_=
zones
-diff --git a/src/crypto/crypto_util.cc b/src/crypto/crypto_util.cc
-index 7e0c8ba3eb60..796ea3025e41 100644
---- a/src/crypto/crypto_util.cc
-+++ b/src/crypto/crypto_util.cc
-@@ -148,6 +148,16 @@ void InitCryptoOnce() {
-   }
- #endif
-=20
-+#if OPENSSL_VERSION_MAJOR >=3D 3
-+  // --openssl-legacy-provider
-+  if (per_process::cli_options->openssl_legacy_provider) {
-+    OSSL_PROVIDER* legacy_provider =3D OSSL_PROVIDER_load(nullptr, "leg=
acy");
-+    if (legacy_provider =3D=3D nullptr) {
-+      fprintf(stderr, "Unable to load legacy provider.\n");
-+    }
-+  }
-+#endif
-+
-   OPENSSL_init_ssl(0, settings);
-   OPENSSL_INIT_free(settings);
-   settings =3D nullptr;
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
-=20
- #include <errno.h>
- #include <sstream>
-diff --git a/src/node_options.h b/src/node_options.h
-index fd772478d04d..1c0e018ab16f 100644
---- a/src/node_options.h
-+++ b/src/node_options.h
-@@ -11,6 +11,10 @@
- #include "node_mutex.h"
- #include "util.h"
-=20
-+#if HAVE_OPENSSL
-+#include "openssl/opensslv.h"
-+#endif
-+
- namespace node {
-=20
- class HostPort {
-@@ -251,6 +255,9 @@ class PerProcessOptions : public Options {
-   bool enable_fips_crypto =3D false;
-   bool force_fips_crypto =3D false;
- #endif
-+#if OPENSSL_VERSION_MAJOR >=3D 3
-+  bool openssl_legacy_provider =3D false;
-+#endif
-=20
-   // Per-process because reports can be triggered outside a known V8 co=
ntext.
-   bool report_on_fatalerror =3D false;
-diff --git a/test/parallel/test-process-env-allowed-flags-are-documented=
.js b/test/parallel/test-process-env-allowed-flags-are-documented.js
-index 64626b71f019..8a4e35997907 100644
---- a/test/parallel/test-process-env-allowed-flags-are-documented.js
-+++ b/test/parallel/test-process-env-allowed-flags-are-documented.js
-@@ -43,6 +43,10 @@ for (const line of [...nodeOptionsLines, ...v8Options=
Lines]) {
-   }
- }
-=20
-+if (!common.hasOpenSSL3) {
-+  documented.delete('--openssl-legacy-provider');
-+}
-+
- // Filter out options that are conditionally present.
- const conditionalOpts =3D [
-   {
-@@ -50,6 +54,7 @@ const conditionalOpts =3D [
-     filter: (opt) =3D> {
-       return [
-         '--openssl-config',
-+        common.hasOpenSSL3 ? '--openssl-legacy-provider' : '',
-         '--tls-cipher-list',
-         '--use-bundled-ca',
-         '--use-openssl-ca',
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_16.18.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
index 62188f94a..a67948320 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.18.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE =3D "http://nodejs.org"
 LICENSE =3D "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6ba5b21ac7a505195ca69344d3d7a=
94a"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e54852cd826c41e80c6d80f6db00=
a85"
=20
 DEPENDS =3D "openssl"
 DEPENDS:append:class-target =3D " qemu-native"
@@ -19,9 +19,7 @@ COMPATIBLE_HOST:powerpc =3D "null"
=20
 SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
-           file://0002-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
-           file://0005-add-openssl-legacy-provider-option.patch \
            file://big-endian.patch \
            file://mips-less-memory.patch \
            file://system-c-ares.patch \
@@ -29,7 +27,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
            "
 SRC_URI:append:class-target =3D " \
-           file://0002-Using-native-binaries.patch \
+           file://0001-Using-native-binaries.patch \
            "
 SRC_URI:append:toolchain-clang:x86 =3D " \
            file://libatomic.patch \
@@ -37,7 +35,7 @@ SRC_URI:append:toolchain-clang:x86 =3D " \
 SRC_URI:append:toolchain-clang:powerpc64le =3D " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] =3D "e922e215cc68eb5f94d33e8a0b61e2c863b7731cc8600ab9=
55d3822da90ff8d1"
+SRC_URI[sha256sum] =3D "1f8051a88f86f42064f4415fe7a980e59b0a502ecc8def58=
3f6303bc4d445238"
=20
 S =3D "${WORKDIR}/node-v${PV}"
=20
--=20
2.34.1


