Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9D67FF02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:48:07 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j5so34757qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YGvvXf9O329zJk28/pV7vF+G4+mOmVU2eKjs4hMdL+k=;
	b=j+JQICITmpg4tf3VixvTE7GsuzPHRsEjq6D/9AlXp22YloAk2F/KpyEsrPYZrO/HoT
	6uujVNfHs+BbUU5Yf6YBcFikPo+lPMvjnPMvZofEsUdSW2gamvXaNB+A8B8EtAU5xHMp
	nvBK9WFHdMj/YMEh8DswXuAvzcighpXlJ+Gao0n5f8B4aJb5CGSZQ6Qso0vVPZnyJbdr
	5LJ9yL7bh05EhG1K2TVeryOPlanEppz5BpK0Pn5V/rqAY9Cywbt3nq5wn+t9h+fplAN2
	AfoDXYdBcCcJb1ny6tntkAIIaajgjj4DBm9ECeriCtTka519eS8H0n9C+KnZ1l42W0H8
	kRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YGvvXf9O329zJk28/pV7vF+G4+mOmVU2eKjs4hMdL+k=;
	b=EoyD7+I09kFOnuenDjjd9yLOfD4200/1NM4hXncdukMZMX3jXQ+DdF6fIh3rU/Ar6E
	BKpnIuSjPSlzhMYRzQ7TMnkZwXdrKESb2Uut0SnXEaYXiIaxe3ZQw+Ft6UyugL77nwmh
	vMnIw/kC9qnaNdIhVVcp8wv7D3WFjjkPWqkVc/T2jcFE8q3B12G3CzUO6WblUs4RDNx3
	tXHOPAsv/Ajnq4aMzFpCdtCE68hS11SEBipK5x18m1x9fC5/3w7iJ8sgobejkez6uJVv
	985M52zsvDBCTJe/z0szNZnifJq+WawZTL65KF2udZLrQfhkmpidd4TtI4Zn+jIhH0/D
	JeNA==
X-Gm-Message-State: APjAAAVeXSFcUNkppnnrtXbZyGcULkYwK/OTC4AUhL3NvB2rfZlWF8lx
	0hbE1wfees+aiOPZtfQyLZ/rSwocdotfe/4Lw48=
X-Google-Smtp-Source: APXvYqzXBxJUnIU9F8EuCInSzJFiTvOZ8A4udKCbBuT6iMooHfM1YyrV3ie0/UfZL2D4nkjS5aVlQFcwjjzlBU7Q/Yc=
X-Received: by 2002:ac8:5257:: with SMTP id y23mr11216742qtn.88.1579711687892; 
	Wed, 22 Jan 2020 08:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20200120170426.15131-1-guillaume.burel@stormshield.eu>
In-Reply-To: <20200120170426.15131-1-guillaume.burel@stormshield.eu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 08:47:45 -0800
Message-ID: <CAMKF1sr5PW1hchbP7NekWT+OfbNXeT7ds5p+rGe-z_B8qzmdhw@mail.gmail.com>
To: Guillaume Burel <guillaume.burel@stormshield.eu>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 22 Jan 2020 16:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build on mips
https://errors.yoctoproject.org/Errors/Details/307685/

On Mon, Jan 20, 2020 at 9:12 AM Guillaume Burel
<guillaume.burel@stormshield.eu> wrote:
>
> - update Node.js to active 12.x LTS release 12.14.0.
> - remove compatibility with gcc 4.8 (has been removed upstream)
>
> Signed-off-by: Guillaume Burel <guillaume.burel@stormshield.eu>
> ---
>  ...e-running-gyp-files-for-bundled-deps.patch | 25 ++++---
>  .../nodejs/0002-Using-native-binaries.patch   | 71 +++++++++++++++++++
>  .../nodejs/0002-Using-native-torque.patch     | 36 ----------
>  ...Install-both-binaries-and-use-libdir.patch | 17 +++--
>  ...0004-Make-compatibility-with-gcc-4.8.patch | 69 ------------------
>  ...> 0004-v8-don-t-override-ARM-CFLAGS.patch} | 16 ++---
>  .../nodejs/0005-Link-atomic-library.patch     | 20 ------
>  .../{nodejs_10.17.0.bb =3D> nodejs_12.14.0.bb}  | 18 ++---
>  8 files changed, 109 insertions(+), 163 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-nat=
ive-binaries.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-nat=
ive-torque.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-comp=
atibility-with-gcc-4.8.patch
>  rename meta-oe/recipes-devtools/nodejs/nodejs/{0007-v8-don-t-override-AR=
M-CFLAGS.patch =3D> 0004-v8-don-t-override-ARM-CFLAGS.patch} (92%)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atom=
ic-library.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_10.17.0.bb =3D> nodejs_12=
.14.0.bb} (87%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-=
gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0=
001-Disable-running-gyp-files-for-bundled-deps.patch
> index 5d0dc03b6..4dd121f48 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps.patch
> @@ -4,23 +4,22 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>  Subject: [PATCH] Disable running gyp on shared deps
>
>  ---
> - Makefile | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/Makefile b/Makefile
> -index a98772f..f5663e2 100644
> +index 0947300f24..6c98691984 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -123,8 +123,8 @@ with-code-cache:
> - test-code-cache: with-code-cache
> -       $(PYTHON) tools/test.py $(PARALLEL_ARGS) --mode=3D$(BUILDTYPE_LOW=
ER) code-cache
> +@@ -141,7 +141,7 @@ test-code-cache: with-code-cache
> +       echo "'test-code-cache' target is a noop"
>
> --out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.g=
yp \
> --              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
> -+out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
> -+              deps/v8/gypfiles/toolchain.gypi \
> -               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp no=
de.gyp \
> -               config.gypi
> + out/Makefile: config.gypi common.gypi node.gyp \
> +-      deps/uv/uv.gyp deps/http_parser/http_parser.gyp deps/zlib/zlib.gy=
p \
> ++      deps/http_parser/http_parser.gyp \
> +       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi =
\
> +       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
>         $(PYTHON) tools/gyp_node.py -f make
>  --
> -2.19.2
> +2.20.1
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-bin=
aries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-bina=
ries.patch
> new file mode 100644
> index 000000000..b5142dc9c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries.p=
atch
> @@ -0,0 +1,71 @@
> +From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 2001
> +From: Guillaume Burel <guillaume.burel@stormshield.eu>
> +Date: Fri, 3 Jan 2020 11:25:54 +0100
> +Subject: [PATCH] Using native binaries
> +
> +---
> + node.gyp                 |  4 ++--
> + tools/v8_gypfiles/v8.gyp | 11 ++++-------
> + 2 files changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/node.gyp b/node.gyp
> +index 8f4dc518..d9389190 100644
> +--- a/node.gyp
> ++++ b/node.gyp
> +@@ -446,7 +446,7 @@
> +                 '<(SHARED_INTERMEDIATE_DIR)/node_code_cache.cc',
> +               ],
> +               'action': [
> +-                '<@(_inputs)',
> ++                'mkcodecache',
> +                 '<@(_outputs)',
> +               ],
> +             },
> +@@ -471,7 +471,7 @@
> +                 '<(SHARED_INTERMEDIATE_DIR)/node_snapshot.cc',
> +               ],
> +               'action': [
> +-                '<@(_inputs)',
> ++                'node_mksnapshot',
> +                 '<@(_outputs)',
> +               ],
> +             },
> +diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
> +index a506a67d..c91f7dde 100644
> +--- a/tools/v8_gypfiles/v8.gyp
> ++++ b/tools/v8_gypfiles/v8.gyp
> +@@ -140,7 +140,8 @@
> +             '<@(torque_outputs)',
> +           ],
> +           'action': [
> +-            '<@(_inputs)',
> ++            'torque',
> ++            '<@(torque_files)',
> +             '-o', '<(torque_output_root)/torque-generated',
> +             '-v8-root', '<(V8_ROOT)'
> +           ],
> +@@ -247,9 +248,7 @@
> +             '<(generate_bytecode_builtins_list_output)',
> +           ],
> +           'action': [
> +-            'python',
> +-            '<(V8_ROOT)/tools/run.py',
> +-            '<@(_inputs)',
> ++            'bytecode_builtins_list_generator',
> +             '<@(_outputs)',
> +           ],
> +         },
> +@@ -1396,9 +1395,7 @@
> +             '<(SHARED_INTERMEDIATE_DIR)/src/regexp/special-case.cc',
> +           ],
> +           'action': [
> +-            'python',
> +-            '<(V8_ROOT)/tools/run.py',
> +-            '<@(_inputs)',
> ++            'gen-regexp-special-case',
> +             '<@(_outputs)',
> +           ],
> +         },
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-tor=
que.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque=
.patch
> deleted file mode 100644
> index e9035f9eb..000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.pat=
ch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
> -From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
> -Date: Tue, 11 Dec 2018 10:44:29 +0100
> -Subject: [PATCH] Using native torque
> -
> ----
> - deps/v8/gypfiles/v8.gyp | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
> -index 8c78f02255..434168844e 100644
> ---- a/deps/v8/gypfiles/v8.gyp
> -+++ b/deps/v8/gypfiles/v8.gyp
> -@@ -2831,7 +2831,6 @@
> -         {
> -           'action_name': 'run_torque',
> -           'inputs': [  # Order matters.
> --            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFF=
IX)',
> -             '../src/builtins/base.tq',
> -             '../src/builtins/array.tq',
> -             '../src/builtins/typed-array.tq',
> -@@ -2845,7 +2844,10 @@
> -             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed=
-array-from-dsl-gen.cc',
> -             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed=
-array-from-dsl-gen.h',
> -           ],
> --          'action': ['<@(_inputs)', '-o', '<(SHARED_INTERMEDIATE_DIR)/t=
orque-generated'],
> -+          'action': [
> -+            'torque',
> -+            '<@(_inputs)',
> -+            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> -         },
> -       ],
> -     }, # torque
> ---
> -2.19.2
> -
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-bin=
aries-and-use-libdir.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-In=
stall-both-binaries-and-use-libdir.patch
> index 7aa70fec9..599f742b2 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-a=
nd-use-libdir.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-a=
nd-use-libdir.patch
> @@ -15,17 +15,16 @@ Stolen from [1]
>  Upstream-Status: Pending
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> -
>  ---
>   configure.py     |  7 +++++++
>   tools/install.py | 31 ++++++++++++++-----------------
>   2 files changed, 21 insertions(+), 17 deletions(-)
>
>  diff --git a/configure.py b/configure.py
> -index cfd4207..eb26f7d 100755
> +index 20cce214db..e2d78a2a51 100755
>  --- a/configure.py
>  +++ b/configure.py
> -@@ -552,6 +552,12 @@ parser.add_option('--shared',
> +@@ -559,6 +559,12 @@ parser.add_option('--shared',
>       help=3D'compile shared library for embedding node in another projec=
t. ' +
>            '(This mode is not officially supported for regular applicatio=
ns)')
>
> @@ -38,19 +37,19 @@ index cfd4207..eb26f7d 100755
>   parser.add_option('--without-v8-platform',
>       action=3D'store_true',
>       dest=3D'without_v8_platform',
> -@@ -1095,6 +1101,7 @@ def configure_node(o):
> -   if options.code_cache_path:
> -     o['variables']['node_code_cache_path'] =3D options.code_cache_path
> +@@ -1103,6 +1109,7 @@ def configure_node(o):
> +   if o['variables']['want_separate_host_toolset'] =3D=3D 0:
> +     o['variables']['node_code_cache'] =3D 'yes' # For testing
>     o['variables']['node_shared'] =3D b(options.shared)
>  +  o['variables']['libdir'] =3D options.libdir
>     node_module_version =3D getmoduleversion.get_version()
>
>     if sys.platform =3D=3D 'darwin':
>  diff --git a/tools/install.py b/tools/install.py
> -index 028c32e..bf443c4 100755
> +index 655802980a..fe4723bf15 100755
>  --- a/tools/install.py
>  +++ b/tools/install.py
> -@@ -117,26 +117,23 @@ def subdir_files(path, dest, action):
> +@@ -121,26 +121,23 @@ def subdir_files(path, dest, action):
>
>   def files(action):
>     is_windows =3D sys.platform =3D=3D 'win32'
> @@ -92,5 +91,5 @@ index 028c32e..bf443c4 100755
>     if 'true' =3D=3D variables.get('node_use_dtrace'):
>       action(['out/Release/node.d'], 'lib/dtrace/node.d')
>  --
> -2.23.0
> +2.20.1
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibili=
ty-with-gcc-4.8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-co=
mpatibility-with-gcc-4.8.patch
> deleted file mode 100644
> index 925c085e9..000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0004-Make-compatibility-with=
-gcc-4.8.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -Implement function as wrapper for std::make_unique
> -method to be compatible with gcc < 4.9 .
> -"error::make_unique is not a member of 'std'"
> -
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
> -
> -diff -Naur node-v10.15.1/src/cares_wrap.cc node-v10.15.1/src/cares_wrap.=
cc
> ---- node-v10.15.1/src/cares_wrap.cc    2019-01-29 08:20:50.000000000 +01=
00
> -+++ node-v10.15.1/src/cares_wrap.cc    2019-02-21 16:22:25.489131665 +01=
00
> -@@ -52,6 +52,16 @@
> - # define AI_V4MAPPED 0
> - #endif
> -
> -+#ifndef __cpp_lib_make_unique
> -+namespace std {
> -+  /// make_unique implementation
> -+  template<typename T, typename... Args>
> -+  std::unique_ptr<T> make_unique(Args&&... args) {
> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> -+  }
> -+}
> -+#endif
> -+
> - namespace node {
> - namespace cares_wrap {
> -
> -diff -Naur node-v10.15.1/src/inspector_agent.cc node-v10.15.1/src/inspec=
tor_agent.cc
> ---- node-v10.15.1/src/inspector_agent.cc       2019-01-29 08:20:50.00000=
0000 +0100
> -+++ node-v10.15.1/src/inspector_agent.cc       2019-02-21 16:22:09.00018=
5992 +0100
> -@@ -24,6 +24,16 @@
> - #include <pthread.h>
> - #endif  // __POSIX__
> -
> -+#ifndef __cpp_lib_make_unique
> -+namespace std {
> -+  /// make_unique implementation
> -+  template<typename T, typename... Args>
> -+  std::unique_ptr<T> make_unique(Args&&... args) {
> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> -+  }
> -+}
> -+#endif
> -+
> - namespace node {
> - namespace inspector {
> - namespace {
> -
> -diff --git a/src/inspector/main_thread_interface.cc b/src/inspector/main=
_thread_interface.cc
> -index e374c0fd70..05d7d8c60f 100644
> ---- a/src/inspector/main_thread_interface.cc
> -+++ b/src/inspector/main_thread_interface.cc
> -@@ -6,6 +6,16 @@
> - #include <functional>
> - #include <unicode/unistr.h>
> -
> -+#ifndef __cpp_lib_make_unique
> -+namespace std {
> -+  /// make_unique implementation
> -+  template<typename T, typename... Args>
> -+  std::unique_ptr<T> make_unique(Args&&... args) {
> -+    return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
> -+  }
> -+}
> -+#endif
> -+
> - namespace node {
> - namespace inspector {
> - namespace {
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-overrid=
e-ARM-CFLAGS.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-o=
verride-ARM-CFLAGS.patch
> similarity index 92%
> rename from meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override=
-ARM-CFLAGS.patch
> rename to meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-A=
RM-CFLAGS.patch
> index eb2cbfb8b..97ed972ce 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0007-v8-don-t-override-ARM-C=
FLAGS.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-C=
FLAGS.patch
> @@ -24,14 +24,14 @@ problems have been noted during compilation or runtim=
e.
>  Upstream-Status: Inappropriate [oe-specific]
>  Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>  ---
> - deps/v8/gypfiles/toolchain.gypi | 52 ++-------------------------------
> + tools/v8_gypfiles/toolchain.gypi | 52 ++------------------------------
>   1 file changed, 2 insertions(+), 50 deletions(-)
>
> -diff --git a/deps/v8/gypfiles/toolchain.gypi b/deps/v8/gypfiles/toolchai=
n.gypi
> -index 910a212..1390b15 100644
> ---- a/deps/v8/gypfiles/toolchain.gypi
> -+++ b/deps/v8/gypfiles/toolchain.gypi
> -@@ -199,31 +199,7 @@
> +diff --git a/tools/v8_gypfiles/toolchain.gypi b/tools/v8_gypfiles/toolch=
ain.gypi
> +index 264b3e478e..0b41848145 100644
> +--- a/tools/v8_gypfiles/toolchain.gypi
> ++++ b/tools/v8_gypfiles/toolchain.gypi
> +@@ -211,31 +211,7 @@
>           'target_conditions': [
>             ['_toolset=3D=3D"host"', {
>               'conditions': [
> @@ -64,7 +64,7 @@ index 910a212..1390b15 100644
>                   # Host not built with an Arm CXX compiler (simulator bu=
ild).
>                   'conditions': [
>                     [ 'arm_float_abi=3D=3D"hard"', {
> -@@ -242,31 +218,7 @@
> +@@ -254,31 +230,7 @@
>             }],  # _toolset=3D=3D"host"
>             ['_toolset=3D=3D"target"', {
>               'conditions': [
> @@ -98,5 +98,5 @@ index 910a212..1390b15 100644
>                   'conditions': [
>                     [ 'arm_float_abi=3D=3D"hard"', {
>  --
> -2.23.0.rc1
> +2.20.1
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-libr=
ary.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library=
.patch
> deleted file mode 100644
> index 66ff18b4a..000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0005-Link-atomic-library.pat=
ch
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -Link atomic library to fix missing undefined referrences
> -like "undefined reference to `__atomic_fetch_add_8'"
> -
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff -Naur node-v10.15.1/deps/v8/gypfiles/v8.gyp node-v10.15.1/deps/v8/g=
ypfiles/v8.gyp
> ---- node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-13 09:02:21.00000=
0000 +0100
> -+++ node-v10.15.1/deps/v8/gypfiles/v8.gyp      2019-02-15 21:27:11.75567=
9660 +0100
> -@@ -452,6 +452,11 @@
> -         '<(DEPTH)',
> -         '<(SHARED_INTERMEDIATE_DIR)'
> -       ],
> -+      'link_settings': {
> -+        'libraries': [
> -+          '-latomic'
> -+        ],
> -+      },
> -       'sources': [
> -         '<@(inspector_all_sources)',
> -         '../include//v8-inspector-protocol.h',
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.14.0.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
> index 71a47636b..abe4be632 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.0.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe980eb7ccafe287cb438076a65e8=
88c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbe4d5107c64dc3d7c57e3797e1a06=
74b"
>
>  DEPENDS =3D "openssl"
>  DEPENDS_append_class-target =3D " nodejs-native"
> @@ -18,16 +18,14 @@ COMPATIBLE_HOST_riscv32 =3D "null"
>  SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch =
\
>             file://0003-Install-both-binaries-and-use-libdir.patch \
> -           file://0004-Make-compatibility-with-gcc-4.8.patch \
> -           file://0007-v8-don-t-override-ARM-CFLAGS.patch \
> +           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
>             "
>  SRC_URI_append_class-target =3D " \
> -           file://0002-Using-native-torque.patch \
> -           file://0005-Link-atomic-library.patch \
> +           file://0002-Using-native-binaries.patch \
>             "
>
> -SRC_URI[md5sum] =3D "d5a56d0abf764a91f627f0690cd4b9f3"
> -SRC_URI[sha256sum] =3D "412667d76bd5273c07cb69c215998109fd5bb35c874654f9=
3e6a0132d666c58e"
> +SRC_URI[md5sum] =3D "6762f5629f6f68fb9bdf83a741cba038"
> +SRC_URI[sha256sum] =3D "088a217ba2af641b8cc15be29f6e2956b8a33e6badb85596=
bbc2cdea9df9be71"
>
>  S =3D "${WORKDIR}/node-v${PV}"
>
> @@ -129,9 +127,13 @@ do_install_append_class-native() {
>      # npm-cli.js continues to use old shebang
>      sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_mo=
dules/npm/bin/npm-cli.js
>
> -    # Install the native torque to provide it within sysroot for the tar=
get compilation
> +    # Install the native binaries to provide it within sysroot for the t=
arget compilation
>      install -d ${D}${bindir}
>      install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> +    install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator ${=
D}${bindir}/bytecode_builtins_list_generator
> +    install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}${bindi=
r}/gen-regexp-special-case
> +    install -m 0755 ${S}/out/Release/mkcodecache ${D}${bindir}/mkcodecac=
he
> +    install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/node_=
mksnapshot
>  }
>
>  do_install_append_class-target() {
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

