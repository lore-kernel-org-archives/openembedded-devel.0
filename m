Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id E59637FDF4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 17:32:14 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l8so3850903edw.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 09:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o/EgJbgjx7u7teOwmm2lT0OUlb4BZjUsoFIMLd1fs58=;
	b=RzlLOjWk32wkn2dQQKJwd1a3MF2smW+cayRbeBsedZADckZvL0vwBEWG9r9NgQxXmL
	+cScSvmSbuxaJw0dp69iY0K9gSr/RNkVHfXX9vlmCqNyw9qXLh/wdl2YPWQ4+lZHa3Dg
	TGUz1hxOksVazvWHwTR16hbp+y+m7bJlxf+oYVPnYingNsmFm1RGVEojjOMscApRKK1N
	rXHKCRkPWFK5QnyU+JALIoOAHmPz7Uxw6fys9mATs07InwCLyZFhBdk17AS9hKqCcFH9
	AhwkmYu1uaDIMWfrVblk8gP2UxyhhsP7GqxNm41PZXYjfr9/dLgWIfw59TDGvpBdvNQy
	CWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o/EgJbgjx7u7teOwmm2lT0OUlb4BZjUsoFIMLd1fs58=;
	b=CZ3oyez7MnwzpFCCmBMVUWSh/LPZVk9qaSpbKbLh5Z7nDg5HT7X2lZ5vy9F/6V0UTd
	bc901nQVRDiITEGAm7O59DDh0KfWpMKIAPRs3C0FStzwVLEdUzU84g/+Anc1s/gnVEaD
	ZvxQiS0QROTCtqyNVsxsEK94qGONwERmb7p/xOgSTMhNrPM4nB/7U1J8WiE90X4BYM2t
	Pj3zfNZTsE0WdobPPer6m0c5oNEZ/lbB6q/wRLctCP1sSFBtVRLo+kfW4+5AA2KhQqDn
	LYvYro4CsYuTSy+Y5EtdGRIzVnaAYF0VwNplFtQz/gtvwM3shjzr17h3zcQxEj9sFUED
	Ti9w==
X-Gm-Message-State: APjAAAWiQZYd7AM1RtcjUoHzDc4IBHkzdRoZt3UR6pn3FBOjFNupM8lt
	Bo2TSMBBk6WrtvkGUHIJvovFI2rDXRQnq1VyMoc=
X-Google-Smtp-Source: APXvYqxqU+lJOvF11fpKPefrQ/kwMsB1xjD15+5mWqEX7IPgcyShjrDk3w9zqmc20gplaPmyCGft78XXFWPpNFDZ5XM=
X-Received: by 2002:aa7:d04f:: with SMTP id n15mr4982640edo.76.1579627935454; 
	Tue, 21 Jan 2020 09:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20200120170426.15131-1-guillaume.burel@stormshield.eu>
	<CA+chaQc-rJqr-q8MvpyJbYnwn_URHs8iM1Q2RNaR2erSrGiBmA@mail.gmail.com>
	<f6ffda47-cfab-2efa-fa98-6d92765989ce@stormshield.eu>
In-Reply-To: <f6ffda47-cfab-2efa-fa98-6d92765989ce@stormshield.eu>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Jan 2020 18:32:02 +0100
Message-ID: <CA+chaQe+Zq920qOAT96-YSXQy3K0N++8u9L9=OudVD8_FqT0Og@mail.gmail.com>
To: Guillaume Burel <guillaume.burel@stormshield.eu>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs: 10.17.0 -> 12.14.0
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
X-List-Received-Date: Tue, 21 Jan 2020 17:32:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Release branches like zeus don't receive new versions (unless it's bugfix
only release), so backporting upgrade from 10.x to 12.x won't happen in
zeus.

And because meta-oe/master currently doesn't have python2 nor plans to
depend on meta-python2, this recipe won't build in Khem's builds to merge
it.

Maybe 12.x should be added to some other layer (which might not object to
depend on meta-python2, there is e.g.
https://github.com/imyller/meta-nodejs already)
and nodejs in meta-oe/master could be upgraded all the way to 13.x?

On Tue, Jan 21, 2020 at 12:02 PM Guillaume Burel <
guillaume.burel@stormshield.eu> wrote:

> Node.js v12.x uses python2 as part of its build process. Starting from
> Node v13.x, python3 might be enough.
> Perhaps should we discard the patch or backport it to zeus, and switch to
> Node v13.x on master ?
>
> AFAIK, npm does not require python anymore.
>
> On 1/20/20 6:17 PM, Martin Jansa wrote:
>
> Does npm still depend on python2 in this release? python2 was removed fro=
m
> oe-core yesterday, so nodejs doesn't build anymore in meta-oe.
>
> Please describe in commit message what changed in license (to explain
> LIC_FILES_CHKSUM change).
>
> On Mon, Jan 20, 2020 at 6:12 PM Guillaume Burel <
> guillaume.burel@stormshield.eu> wrote:
>
>> - update Node.js to active 12.x LTS release 12.14.0.
>> - remove compatibility with gcc 4.8 (has been removed upstream)
>>
>> Signed-off-by: Guillaume Burel <guillaume.burel@stormshield.eu>
>> ---
>>  ...e-running-gyp-files-for-bundled-deps.patch | 25 ++++---
>>  .../nodejs/0002-Using-native-binaries.patch   | 71 +++++++++++++++++++
>>  .../nodejs/0002-Using-native-torque.patch     | 36 ----------
>>  ...Install-both-binaries-and-use-libdir.patch | 17 +++--
>>  ...0004-Make-compatibility-with-gcc-4.8.patch | 69 ------------------
>>  ...> 0004-v8-don-t-override-ARM-CFLAGS.patch} | 16 ++---
>>  .../nodejs/0005-Link-atomic-library.patch     | 20 ------
>>  .../{nodejs_10.17.0.bb =3D> nodejs_12.14.0.bb}  | 18 ++---
>>  8 files changed, 109 insertions(+), 163 deletions(-)
>>  create mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patch
>>  delete mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>>  delete mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gcc-=
4.8.patch
>>  rename
>> meta-oe/recipes-devtools/nodejs/nodejs/{0007-v8-don-t-override-ARM-CFLAG=
S.patch
>> =3D> 0004-v8-don-t-override-ARM-CFLAGS.patch} (92%)
>>  delete mode 100644
>> meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.patch
>>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.17.0.bb =3D>
>> nodejs_12.14.0.bb} (87%)
>>
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-=
for-bundled-deps.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-=
for-bundled-deps.patch
>> index 5d0dc03b6..4dd121f48 100644
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-=
for-bundled-deps.patch
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-=
for-bundled-deps.patch
>> @@ -4,23 +4,22 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>>  Subject: [PATCH] Disable running gyp on shared deps
>>
>>  ---
>> - Makefile | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> + Makefile | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>  diff --git a/Makefile b/Makefile
>> -index a98772f..f5663e2 100644
>> +index 0947300f24..6c98691984 100644
>>  --- a/Makefile
>>  +++ b/Makefile
>> -@@ -123,8 +123,8 @@ with-code-cache:
>> - test-code-cache: with-code-cache
>> -       $(PYTHON) tools/test.py $(PARALLEL_ARGS)
>> --mode=3D$(BUILDTYPE_LOWER) code-cache
>> +@@ -141,7 +141,7 @@ test-code-cache: with-code-cache
>> +       echo "'test-code-cache' target is a noop"
>>
>> --out/Makefile: common.gypi deps/uv/uv.gyp
>> deps/http_parser/http_parser.gyp \
>> --              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
>> -+out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
>> -+              deps/v8/gypfiles/toolchain.gypi \
>> -               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp
>> node.gyp \
>> -               config.gypi
>> + out/Makefile: config.gypi common.gypi node.gyp \
>> +-      deps/uv/uv.gyp deps/http_parser/http_parser.gyp
>> deps/zlib/zlib.gyp \
>> ++      deps/http_parser/http_parser.gyp \
>> +       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi=
 \
>> +       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
>>         $(PYTHON) tools/gyp_node.py -f make
>>  --
>> -2.19.2
>> +2.20.1
>> +
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patc=
h
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patc=
h
>> new file mode 100644
>> index 000000000..b5142dc9c
>> --- /dev/null
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.patc=
h
>> @@ -0,0 +1,71 @@
>> +From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 2001
>> +From: Guillaume Burel <guillaume.burel@stormshield.eu>
>> +Date: Fri, 3 Jan 2020 11:25:54 +0100
>> +Subject: [PATCH] Using native binaries
>> +
>> +---
>> + node.gyp                 |  4 ++--
>> + tools/v8_gypfiles/v8.gyp | 11 ++++-------
>> + 2 files changed, 6 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/node.gyp b/node.gyp
>> +index 8f4dc518..d9389190 100644
>> +--- a/node.gyp
>> ++++ b/node.gyp
>> +@@ -446,7 +446,7 @@
>> +                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
>> +               ],
>> +               'action': [
>> +-                '<@(_inputs)',
>> ++                'mkcodecache',
>> +                 '<@(_outputs)',
>> +               ],
>> +             },
>> +@@ -471,7 +471,7 @@
>> +                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
>> +               ],
>> +               'action': [
>> +-                '<@(_inputs)',
>> ++                'node_mksnapshot',
>> +                 '<@(_outputs)',
>> +               ],
>> +             },
>> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
>> +index a506a67d..c91f7dde 100644
>> +--- a/tools/v8_gypfiles/v8.gyp
>> ++++ b/tools/v8_gypfiles/v8.gyp
>> +@@ -140,7 +140,8 @@
>> +             '<@(torque_outputs)',
>> +           ],
>> +           'action': [
>> +-            '<@(_inputs)',
>> ++            'torque',
>> ++            '<@(torque_files)',
>> +             '-o', '<(torque_output_root)/torque-generated',
>> +             '-v8-root', '<(V8_ROOT)'
>> +           ],
>> +@@ -247,9 +248,7 @@
>> +             '<(generate_bytecode_builtins_list_output)',
>> +           ],
>> +           'action': [
>> +-            'python',
>> +-            '<(V8_ROOT)/tools/run.py',
>> +-            '<@(_inputs)',
>> ++            'bytecode_builtins_list_generator',
>> +             '<@(_outputs)',
>> +           ],
>> +         },
>> +@@ -1396,9 +1395,7 @@
>> +             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
>> +           ],
>> +           'action': [
>> +-            'python',
>> +-            '<(V8_ROOT)/tools/run.py',
>> +-            '<@(_inputs)',
>> ++            'gen-regexp-special-case',
>> +             '<@(_outputs)',
>> +           ],
>> +         },
>> +--
>> +2.20.1
>> +
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>> deleted file mode 100644
>> index e9035f9eb..000000000
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
>> -From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
>> -Date: Tue, 11 Dec 2018 10:44:29 +0100
>> -Subject: [PATCH] Using native torque
>> -
>> ----
>> - deps/v8/gypfiles/v8.gyp | 6 ++++--
>> - 1 file changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
>> -index 8c78f02255..434168844e 100644
>> ---- a/deps/v8/gypfiles/v8.gyp
>> -+++ b/deps/v8/gypfiles/v8.gyp
>> -@@ -2831,7 +2831,6 @@
>> -         {
>> -           'action_name': 'run_torque',
>> -           'inputs': [  # Order matters.
>> --
>> '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
>> -             '../src/builtins/base.tq',
>> -             '../src/builtins/array.tq',
>> -             '../src/builtins/typed-array.tq',
>> -@@ -2845,7 +2844,10 @@
>> -
>>  '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-=
dsl-gen.cc',
>> -
>>  '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-=
dsl-gen.h',
>> -           ],
>> --          'action': ['<@(_inputs)', '-o',
>> '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
>> -+          'action': [
>> -+            'torque',
>> -+            '<@(_inputs)',
>> -+            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
>> -         },
>> -       ],
>> -     }, # torque
>> ---
>> -2.19.2
>> -
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-=
use-libdir.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-=
use-libdir.patch
>> index 7aa70fec9..599f742b2 100644
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-=
use-libdir.patch
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-and-=
use-libdir.patch
>> @@ -15,17 +15,16 @@ Stolen from [1]
>>  Upstream-Status: Pending
>>
>>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> -
>>  ---
>>   configure.py     |  7 +++++++
>>   tools/install.py | 31 ++++++++++++++-----------------
>>   2 files changed, 21 insertions(+), 17 deletions(-)
>>
>>  diff --git a/configure.py b/configure.py
>> -index cfd4207..eb26f7d 100755
>> +index 20cce214db..e2d78a2a51 100755
>>  --- a/configure.py
>>  +++ b/configure.py
>> -@@ -552,6 +552,12 @@ parser.add_option('--shared',
>> +@@ -559,6 +559,12 @@ parser.add_option('--shared',
>>       help=3D'compile shared library for embedding node in another proje=
ct.
>> ' +
>>            '(This mode is not officially supported for regular
>> applications)')
>>
>> @@ -38,19 +37,19 @@ index cfd4207..eb26f7d 100755
>>   parser.add_option('--without-v8-platform',
>>       action=3D'store_true',
>>       dest=3D'without_v8_platform',
>> -@@ -1095,6 +1101,7 @@ def configure_node(o):
>> -   if options.code_cache_path:
>> -     o['variables']['node_code_cache_path'] =3D options.code_cache_path
>> +@@ -1103,6 +1109,7 @@ def configure_node(o):
>> +   if o['variables']['want_separate_host_toolset'] =3D=3D 0:
>> +     o['variables']['node_code_cache'] =3D 'yes' # For testing
>>     o['variables']['node_shared'] =3D b(options.shared)
>>  +  o['variables']['libdir'] =3D options.libdir
>>     node_module_version =3D getmoduleversion.get_version()
>>
>>     if sys.platform =3D=3D 'darwin':
>>  diff --git a/tools/install.py b/tools/install.py
>> -index 028c32e..bf443c4 100755
>> +index 655802980a..fe4723bf15 100755
>>  --- a/tools/install.py
>>  +++ b/tools/install.py
>> -@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
>> +@@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
>>
>>   def files(action):
>>     is_windows =3D sys.platform =3D=3D 'win32'
>> @@ -92,5 +91,5 @@ index 028c32e..bf443c4 100755
>>     if 'true' =3D=3D variables.get('node_use_dtrace'):
>>       action(['out/Release/node.d'], 'lib/dtrace/node.d')
>>  --
>> -2.23.0
>> +2.20.1
>>
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gc=
c-4.8.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gc=
c-4.8.patch
>> deleted file mode 100644
>> index 925c085e9..000000000
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with-gc=
c-4.8.patch
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -Implement function as wrapper for std::make_unique
>> -method to be compatible with gcc < 4.9 .
>> -"error::make_unique is not a member of 'std'"
>> -
>> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> -Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> -
>> -diff -Naur node-v10.15.1/src/cares_wrap.cc
>> node-v10.15.1/src/cares_wrap.cc
>> ---- node-v10.15.1/src/cares_wrap.cc    2019-01-29 08:20:50.000000000
>> +0100
>> -+++ node-v10.15.1/src/cares_wrap.cc    2019-02-21 16:22:25.489131665
>> +0100
>> -@@ -52,6 +52,16 @@
>> - # define AI_V4MAPPED 0
>> - #endif
>> -
>> -+#ifndef __cpp_lib_make_unique
>> -+namespace std {
>> -+  /// make_unique implementation
>> -+  template<typename T, typename... Args>
>> -+  std::unique_ptr<T> make_unique(Args&&... args) {
>> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
>> -+  }
>> -+}
>> -+#endif
>> -+
>> - namespace node {
>> - namespace cares_wrap {
>> -
>> -diff -Naur node-v10.15.1/src/inspector_agent.cc
>> node-v10.15.1/src/inspector_agent.cc
>> ---- node-v10.15.1/src/inspector_agent.cc       2019-01-29
>> 08:20:50.000000000 +0100
>> -+++ node-v10.15.1/src/inspector_agent.cc       2019-02-21
>> 16:22:09.000185992 +0100
>> -@@ -24,6 +24,16 @@
>> - #include <pthread.h>
>> - #endif  // __POSIX__
>> -
>> -+#ifndef __cpp_lib_make_unique
>> -+namespace std {
>> -+  /// make_unique implementation
>> -+  template<typename T, typename... Args>
>> -+  std::unique_ptr<T> make_unique(Args&&... args) {
>> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
>> -+  }
>> -+}
>> -+#endif
>> -+
>> - namespace node {
>> - namespace inspector {
>> - namespace {
>> -
>> -diff --git a/src/inspector/main_thread_interface.cc
>> b/src/inspector/main_thread_interface.cc
>> -index e374c0fd70..05d7d8c60f 100644
>> ---- a/src/inspector/main_thread_interface.cc
>> -+++ b/src/inspector/main_thread_interface.cc
>> -@@ -6,6 +6,16 @@
>> - #include <functional>
>> - #include <unicode/unistr.h>
>> -
>> -+#ifndef __cpp_lib_make_unique
>> -+namespace std {
>> -+  /// make_unique implementation
>> -+  template<typename T, typename... Args>
>> -+  std::unique_ptr<T> make_unique(Args&&... args) {
>> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
>> -+  }
>> -+}
>> -+#endif
>> -+
>> - namespace node {
>> - namespace inspector {
>> - namespace {
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLA=
GS.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLA=
GS.patch
>> similarity index 92%
>> rename from
>> meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLAGS=
.patch
>> rename to
>> meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS=
.patch
>> index eb2cbfb8b..97ed972ce 100644
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-CFLA=
GS.patch
>> +++
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLA=
GS.patch
>> @@ -24,14 +24,14 @@ problems have been noted during compilation or
>> runtime.
>>  Upstream-Status: Inappropriate [oe-specific]
>>  Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>>  ---
>> - deps/v8/gypfiles/toolchain.gypi | 52 ++-------------------------------
>> + tools/v8_gypfiles/toolchain.gypi | 52 ++------------------------------
>>   1 file changed, 2 insertions(+), 50 deletions(-)
>>
>> -diff --git a/deps/v8/gypfiles/toolchain.gypi
>> b/deps/v8/gypfiles/toolchain.gypi
>> -index 910a212..1390b15 100644
>> ---- a/deps/v8/gypfiles/toolchain.gypi
>> -+++ b/deps/v8/gypfiles/toolchain.gypi
>> -@@ -199,31 +199,7 @@
>> +diff --git a/tools/v8_gypfiles/toolchain.gypi
>> b/tools/v8_gypfiles/toolchain.gypi
>> +index 264b3e478e..0b41848145 100644
>> +--- a/tools/v8_gypfiles/toolchain.gypi
>> ++++ b/tools/v8_gypfiles/toolchain.gypi
>> +@@ -211,31 +211,7 @@
>>           'target_conditions': [
>>             ['_toolset=3D=3D"host"', {
>>               'conditions': [
>> @@ -64,7 +64,7 @@ index 910a212..1390b15 100644
>>                   # Host not built with an Arm CXX compiler (simulator
>> build).
>>                   'conditions': [
>>                     [ 'arm_float_abi=3D=3D"hard"', {
>> -@@ -242,31 +218,7 @@
>> +@@ -254,31 +230,7 @@
>>             }],  # _toolset=3D=3D"host"
>>             ['_toolset=3D=3D"target"', {
>>               'conditions': [
>> @@ -98,5 +98,5 @@ index 910a212..1390b15 100644
>>                   'conditions': [
>>                     [ 'arm_float_abi=3D=3D"hard"', {
>>  --
>> -2.23.0.rc1
>> +2.20.1
>>
>> diff --git
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.patch
>> b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.patch
>> deleted file mode 100644
>> index 66ff18b4a..000000000
>> ---
>> a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -Link atomic library to fix missing undefined referrences
>> -like "undefined reference to `__atomic_fetch_add_8'"
>> -
>> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
>> -
>> -diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp
>> node-v10.15.1/deps/v8/gypfiles/v8.gyp
>> ---- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13
>> 09:02:21.000000000 +0100
>> -+++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15
>> 21:27:11.755679660 +0100
>> -@@ -452,6 +452,11 @@
>> -         '<(DEPTH)',
>> -         '<(SHARED_INTERMEDIATE_DIR)'
>> -       ],
>> -+      'link_settings': {
>> -+        'libraries': [
>> -+          '-latomic'
>> -+        ],
>> -+      },
>> -       'sources': [
>> -         '<@(inspector_all_sources)',
>> -         '../include//v8-inspector-protocol.h',
>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>> b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>> similarity index 87%
>> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>> rename to meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>> index 71a47636b..abe4be632 100644
>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
>> @@ -1,7 +1,7 @@
>>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>>  HOMEPAGE =3D "http://nodejs.org"
>>  LICENSE =3D "MIT & BSD & Artistic-2.0"
>> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe980eb7ccafe287cb438076a65e=
888c"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe4d5107c64dc3d7c57e3797e1a0=
674b"
>>
>>  DEPENDS =3D "openssl"
>>  DEPENDS_append_class-target =3D " nodejs-native"
>> @@ -18,16 +18,14 @@ COMPATIBLE_HOST_riscv32 =3D "null"
>>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch
>> \
>>             file://0003-Install-both-binaries-and-use-libdir.patch \
>> -           file://0004-Make-compatibility-with-gcc-4.8.patch \
>> -           file://0007-v8-don-t-override-ARM-CFLAGS.patch \
>> +           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>>             "
>>  SRC_URI_append_class-target =3D " \
>> -           file://0002-Using-native-torque.patch \
>> -           file://0005-Link-atomic-library.patch \
>> +           file://0002-Using-native-binaries.patch \
>>             "
>>
>> -SRC_URI[md5sum] =3D "d5a56d0abf764a91f627f0690cd4b9f3"
>> -SRC_URI[sha256sum] =3D
>> "412667d76bd5273c07cb69c215998109fd5bb35c874654f93e6a0132d666c58e"
>> +SRC_URI[md5sum] =3D "6762f5629f6f68fb9bdf83a741cba038"
>> +SRC_URI[sha256sum] =3D
>> "088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596bbc2cdea9df9be71"
>>
>>  S =3D "${WORKDIR}/node-v${PV}"
>>
>> @@ -129,9 +127,13 @@ do_install_append_class-native() {
>>      # npm-cli.js continues to use old shebang
>>      sed "1s^.*^#\!/usr/bin/env node^g" -i
>> ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
>>
>> -    # Install the native torque to provide it within sysroot for the
>> target compilation
>> +    # Install the native binaries to provide it within sysroot for the
>> target compilation
>>      install -d ${D}${bindir}
>>      install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
>> +    install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator
>> ${D}${bindir}/bytecode_builtins_list_generator
>> +    install -m 0755 ${S}/out/Release/gen-regexp-special-case
>> ${D}${bindir}/gen-regexp-special-case
>> +    install -m 0755 ${S}/out/Release/mkcodecache
>> ${D}${bindir}/mkcodecache
>> +    install -m 0755 ${S}/out/Release/node_mksnapshot
>> ${D}${bindir}/node_mksnapshot
>>  }
>>
>>  do_install_append_class-target() {
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

