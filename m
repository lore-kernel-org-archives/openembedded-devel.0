Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C78C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 03:57:03 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.50885.1683777420696502857
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 20:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gTpzhbDT;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-547303fccefso5404229eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 20:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683777420; x=1686369420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6lTSPF38223WHfwC4/QqSGtFj8O3Tly2sTTSmR0qhE=;
        b=gTpzhbDTf88VSLgBkZtb3kBKUpsqFRINjlYZ014PmePK034QQxjZCx1FFawEtYd4g3
         4Qds3H4RoEwACPGzJ23sZoTIZxgb7Vx0EIiZQOMC4DgOL40U0zzMPkwYjLnC2z9OkOP4
         zyod2npKQLSdJiALoyYNhINjs3M8JwVP0QqTPplMDpw8cZqwvM36Qb3lsodKnG1ip1eq
         Lb0hhdqqrDLBHJSH/6it0OM/S/86T9YXGk3l3OxkBMLHU3QsenF9cROEaDaQck753oxA
         KaFOn+QSGo3jusa8Vo1EPUP8ZBZjb4MZdOHKyQXskgspezC6vYKuM0C+1hBBmzo7HkCn
         Q0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683777420; x=1686369420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6lTSPF38223WHfwC4/QqSGtFj8O3Tly2sTTSmR0qhE=;
        b=VoypUpSWCk/1D8TS6Y3y1TC9zlD1QUZtpIst7VTqTTidTJ0DeGbCsgdTd4HwVhUjYP
         cYI0pI+3f8sqaqqJ+wlwmtM5uADJivmhy0T6moJCnZ0zv+N8MMjHAFxGBC3wscIg4joU
         oUrFNAYxhbs3jGrOHz2Sp3S9rHMftIisgozwzIZNtamjtytlySXY8GwSD2O1ffGurM5O
         4wMX0NAsn1bfdbZilmTM3aue+UsUDoaW5aEUn+tftfM+CW3E4FCueq+xmZlzkNF5KNXv
         Qxg38fUdR8ySJOIo/ZhjXQCpMW8flAvnywNHuEHzby2oabywE2zJXhXt6xBbj6cRnmHZ
         pytw==
X-Gm-Message-State: AC+VfDxZcD5Qvki1q18z/I6AkOo/MeJdRbb3BoErMUFPlh9qQqANTdcU
	GTISul/mQrzXlc5JeECzozF2qqLl8AVSR1O2ZnQ=
X-Google-Smtp-Source: ACHHUZ79y+lueVafVNFss0d8OF2F/HIia+xmrivymW65AmbUvfRtmKUPLAeUDGG4Nm9X7y7AkCdxOYQOFBnxpcW2ULo=
X-Received: by 2002:a54:4419:0:b0:389:8dad:782b with SMTP id
 k25-20020a544419000000b003898dad782bmr4298895oiw.21.1683777419631; Wed, 10
 May 2023 20:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230510183353.2724978-1-narpat.mali@windriver.com>
In-Reply-To: <20230510183353.2724978-1-narpat.mali@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2023 20:56:33 -0700
Message-ID: <CAMKF1spkCT=yxDsQPLnMbXTGVTEx0db1OoJC3=3b5n24OL_vvw@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH 1/1] nodejs: make 14.18.1 available but
 not default
To: nmali <narpat.mali@windriver.com>
Cc: openembedded-devel@lists.openembedded.org, akuster808@gmail.com, 
	max@igalia.com, raphael.kubo.da.costa@intel.com, Randy.MacLeod@windriver.com, 
	hari.gpillai@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 03:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102538

On Wed, May 10, 2023 at 11:34=E2=80=AFAM nmali <narpat.mali@windriver.com> =
wrote:
>
> From: Narpat Mali <narpat.mali@windriver.com>
>
> Chromium 112 needs nodejs-native version 14 or later.
> Add the nodejs_14.18.1 recipe from kirkstone:
>    246b20b92 nodejs: Upgrade to 14.18.1
> but, use PREFERRED_VERSION to make sure that the default version of nodej=
s
> remains 12.x.
>
> 7 patches which were modified between nodejs 12 & nodejs 14 were renamed =
by
> adding the suffix "-nodejs14". Note there are some common patches used by
> nodejs 12 & 14 so, that will require attention during future maintenance.
> In addition, there were 3 CVE-2022* patches which applied cleanly to node=
js
> 14 so, they were added to the nodejs 14 recipe. One patch, CVE-llhttp.pat=
ch
> conflicted so, it has not been applied in nodejs 14 yet.
>
> Nodejs 14 compile for qemux86-64 but, no run-time testing has been perfor=
med.
>
> For chromium, we would either require users to modify the local.conf file=
 or
> we may create a dunfell specific branch in meta-browser.
> See: https://github.com/OSSystems/meta-browser/pull/709
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  meta-oe/conf/layer.conf                       |   3 +
>  ...-gyp-files-for-bundled-deps-nodejs14.patch |  22 ++
>  ...ja-tests.py-add-py-3.10-fix-nodejs14.patch |  41 ++++
>  ...use-mminimal-toc-with-clang-nodejs14.patch |  28 +++
>  .../0002-Using-native-binaries-nodejs14.patch |  62 ++++++
>  ...oth-binaries-and-use-libdir-nodejs14.patch |  84 ++++++++
>  .../nodejs/nodejs/libatomic-nodejs14.patch    |  21 ++
>  .../nodejs/mips-less-memory-nodejs14.patch    |  32 +++
>  .../recipes-devtools/nodejs/nodejs_14.18.1.bb | 203 ++++++++++++++++++
>  9 files changed, 496 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-r=
unning-gyp-files-for-bundled-deps-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tes=
ts.py-add-py-3.10-fix-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-=
not-use-mminimal-toc-with-clang-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-nat=
ive-binaries-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-b=
oth-binaries-and-use-libdir-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/libatomic-node=
js14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memo=
ry-nodejs14.patch
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index adcec8302..ed3f67857 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -42,6 +42,9 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>
>  PREFERRED_RPROVIDER_libdevmapper =3D "lvm2"
>
> +PREFERRED_VERSION_nodejs ?=3D "12.%"
> +PREFERRED_VERSION_nodejs-native ?=3D "12.%"
> +

I think it might be better to add

DEFAULT_PREFERENCE =3D "-1"

in the 14.x recipe and you can avoid doing above.

>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    mplayer-common \
>    fbset-modes \
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-=
gyp-files-for-bundled-deps-nodejs14.patch b/meta-oe/recipes-devtools/nodejs=
/nodejs/0001-Disable-running-gyp-files-for-bundled-deps-nodejs14.patch
> new file mode 100644
> index 000000000..d6e439ba2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-fil=
es-for-bundled-deps-nodejs14.patch
> @@ -0,0 +1,22 @@
> +From 7d94bfe53beeb2d25eb5f2ff6b1d509df7e6ab80 Mon Sep 17 00:00:00 2001
> +From: Zuzana Svetlikova <zsvetlik@redhat.com>
> +Date: Thu, 27 Apr 2017 14:25:42 +0200
> +Subject: [PATCH] Disable running gyp on shared deps
> +
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 93d63110..79caaec2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -138,7 +138,7 @@ with-code-cache test-code-cache:
> +       $(warning '$@' target is a noop)
> +
> + out/Makefile: config.gypi common.gypi node.gyp \
> +-      deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
> ++      deps/llhttp/llhttp.gyp \
> +       tools/v8_gypfiles/toolchain.gypi tools/v8_gypfiles/features.gypi =
\
> +       tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
> +       $(PYTHON) tools/gyp_node.py -f make
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-a=
dd-py-3.10-fix-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001=
-jinja-tests.py-add-py-3.10-fix-nodejs14.patch
> new file mode 100644
> index 000000000..b2a2da959
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-jinja-tests.py-add-py-3=
.10-fix-nodejs14.patch
> @@ -0,0 +1,41 @@
> +From e1d838089cd461d9efcf4d29d9f18f65994d2d6b Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Sun, 3 Oct 2021 22:48:39 +0200
> +Subject: [PATCH] jinja/tests.py: add py 3.10 fix
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + deps/v8/third_party/jinja2/tests.py      | 2 +-
> + tools/inspector_protocol/jinja2/tests.py | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/v8/third_party/jinja2/tests.py b/deps/v8/third_party/j=
inja2/tests.py
> +index 0adc3d4..b14f85f 100644
> +--- a/deps/v8/third_party/jinja2/tests.py
> ++++ b/deps/v8/third_party/jinja2/tests.py
> +@@ -10,7 +10,7 @@
> + """
> + import operator
> + import re
> +-from collections import Mapping
> ++from collections.abc import Mapping
> + from jinja2.runtime import Undefined
> + from jinja2._compat import text_type, string_types, integer_types
> + import decimal
> +diff --git a/tools/inspector_protocol/jinja2/tests.py b/tools/inspector_=
protocol/jinja2/tests.py
> +index 0adc3d4..b14f85f 100644
> +--- a/tools/inspector_protocol/jinja2/tests.py
> ++++ b/tools/inspector_protocol/jinja2/tests.py
> +@@ -10,7 +10,7 @@
> + """
> + import operator
> + import re
> +-from collections import Mapping
> ++from collections.abc import Mapping
> + from jinja2.runtime import Undefined
> + from jinja2._compat import text_type, string_types, integer_types
> + import decimal
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use=
-mminimal-toc-with-clang-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/n=
odejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14.patch
> new file mode 100644
> index 000000000..00b2e9baa
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminim=
al-toc-with-clang-nodejs14.patch
> @@ -0,0 +1,28 @@
> +From 0976af0f3b328436ea44a74a406f311adb2ab211 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 15 Jun 2021 19:01:31 -0700
> +Subject: [PATCH] ppc64: Do not use -mminimal-toc with clang
> +
> +clang does not support this option
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + common.gypi | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/common.gypi b/common.gypi
> +index ee91fb1d..049c8f8c 100644
> +--- a/common.gypi
> ++++ b/common.gypi
> +@@ -413,7 +413,7 @@
> +             'ldflags': [ '-m32' ],
> +           }],
> +           [ 'target_arch=3D=3D"ppc64" and OS!=3D"aix"', {
> +-            'cflags': [ '-m64', '-mminimal-toc' ],
> ++            'cflags': [ '-m64' ],
> +             'ldflags': [ '-m64' ],
> +           }],
> +           [ 'target_arch=3D=3D"s390x"', {
> +--
> +2.32.0
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-bin=
aries-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-na=
tive-binaries-nodejs14.patch
> new file mode 100644
> index 000000000..c6fc2dcd7
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-binaries-n=
odejs14.patch
> @@ -0,0 +1,62 @@
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
> +--- a/node.gyp
> ++++ b/node.gyp
> +@@ -487,6 +487,7 @@
> +               'action_name': 'run_mkcodecache',
> +               'process_outputs_as_sources': 1,
> +               'inputs': [
> ++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +                 '<(mkcodecache_exec)',
> +               ],
> +               'outputs': [
> +@@ -512,6 +513,7 @@
> +               'action_name': 'node_mksnapshot',
> +               'process_outputs_as_sources': 1,
> +               'inputs': [
> ++                '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +                 '<(node_mksnapshot_exec)',
> +               ],
> +               'outputs': [
> +--- a/tools/v8_gypfiles/v8.gyp
> ++++ b/tools/v8_gypfiles/v8.gyp
> +@@ -220,6 +220,7 @@
> +         {
> +           'action_name': 'run_torque_action',
> +           'inputs': [  # Order matters.
> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFF=
IX)',
> +             '<@(torque_files)',
> +           ],
> +@@ -351,6 +352,7 @@
> +         {
> +           'action_name': 'generate_bytecode_builtins_list_action',
> +           'inputs': [
> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_=
generator<(EXECUTABLE_SUFFIX)',
> +           ],
> +           'outputs': [
> +@@ -533,6 +535,7 @@
> +             ],
> +           },
> +           'inputs': [
> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +             '<(mksnapshot_exec)',
> +           ],
> +           'outputs': [
> +@@ -1448,6 +1451,7 @@
> +         {
> +           'action_name': 'run_gen-regexp-special-case_action',
> +           'inputs': [
> ++            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
> +             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case=
<(EXECUTABLE_SUFFIX)',
> +           ],
> +           'outputs': [
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-bin=
aries-and-use-libdir-nodejs14.patch b/meta-oe/recipes-devtools/nodejs/nodej=
s/0003-Install-both-binaries-and-use-libdir-nodejs14.patch
> new file mode 100644
> index 000000000..622392099
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Install-both-binaries-a=
nd-use-libdir-nodejs14.patch
> @@ -0,0 +1,84 @@
> +From 5b22fac923d1ca3e9fefb97f5a171124a88f5e22 Mon Sep 17 00:00:00 2001
> +From: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> +Date: Tue, 19 Mar 2019 23:22:40 -0400
> +Subject: [PATCH] Install both binaries and use libdir.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This allows us to build with a shared library for other users while
> +still providing the normal executable.
> +
> +Taken from - https://src.fedoraproject.org/rpms/nodejs/raw/rawhide/f/000=
2-Install-both-binaries-and-use-libdir.patch
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Elliott Sales de Andrade <quantum.analyst@gmail.com>
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.py     |  7 +++++++
> + tools/install.py | 21 +++++++++------------
> + 2 files changed, 16 insertions(+), 12 deletions(-)
> +
> +diff --git a/configure.py b/configure.py
> +index e6f7e4db..6cf5c45d 100755
> +--- a/configure.py
> ++++ b/configure.py
> +@@ -626,6 +626,12 @@ parser.add_option('--shared',
> +     help=3D'compile shared library for embedding node in another projec=
t. ' +
> +          '(This mode is not officially supported for regular applicatio=
ns)')
> +
> ++parser.add_option('--libdir',
> ++    action=3D'store',
> ++    dest=3D'libdir',
> ++    default=3D'lib',
> ++    help=3D'a directory to install the shared library into')
> ++
> + parser.add_option('--without-v8-platform',
> +     action=3D'store_true',
> +     dest=3D'without_v8_platform',
> +@@ -1202,6 +1208,7 @@ def configure_node(o):
> +   o['variables']['node_no_browser_globals'] =3D b(options.no_browser_gl=
obals)
> +
> +   o['variables']['node_shared'] =3D b(options.shared)
> ++  o['variables']['libdir'] =3D options.libdir
> +   node_module_version =3D getmoduleversion.get_version()
> +
> +   if options.dest_os =3D=3D 'android':
> +diff --git a/tools/install.py b/tools/install.py
> +index 729b416f..9bfc6234 100755
> +--- a/tools/install.py
> ++++ b/tools/install.py
> +@@ -121,22 +121,19 @@ def subdir_files(path, dest, action):
> +
> + def files(action):
> +   is_windows =3D sys.platform =3D=3D 'win32'
> +-  output_file =3D 'node'
> +   output_prefix =3D 'out/Release/'
> ++  output_libprefix =3D output_prefix
> +
> +-  if 'false' =3D=3D variables.get('node_shared'):
> +-    if is_windows:
> +-      output_file +=3D '.exe'
> ++  if is_windows:
> ++    output_bin =3D 'node.exe'
> ++    output_lib =3D 'node.dll'
> +   else:
> +-    if is_windows:
> +-      output_file +=3D '.dll'
> +-    else:
> +-      output_file =3D 'lib' + output_file + '.' + variables.get('shlib_=
suffix')
> ++    output_bin =3D 'node'
> ++    output_lib =3D 'libnode.' + variables.get('shlib_suffix')
> +
> +-  if 'false' =3D=3D variables.get('node_shared'):
> +-    action([output_prefix + output_file], 'bin/' + output_file)
> +-  else:
> +-    action([output_prefix + output_file], 'lib/' + output_file)
> ++  action([output_prefix + output_bin], 'bin/' + output_bin)
> ++  if 'true' =3D=3D variables.get('node_shared'):
> ++    action([output_libprefix + output_lib], variables.get('libdir') + '=
/' + output_lib)
> +
> +   if 'true' =3D=3D variables.get('node_use_dtrace'):
> +     action(['out/Release/node.d'], 'lib/dtrace/node.d')
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.pa=
tch b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
> new file mode 100644
> index 000000000..cdf6bc8e2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/libatomic-nodejs14.patch
> @@ -0,0 +1,21 @@
> +Link mksnapshot with libatomic on x86
> +
> +Clang-12 on x86 emits atomic builtins
> +
> +Fixes
> +| module-compiler.cc:(.text._ZN2v88internal4wasm12_GLOBAL__N_123ExecuteC=
ompilationUnitsERKSt10shared_ptrINS2_22BackgroundCompileTokenEEPNS0_8Counte=
rsEiNS2_19CompileBaselineOnlyE+0x558): un
> +defined reference to `__atomic_load'
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/tools/v8_gypfiles/v8.gyp
> ++++ b/tools/v8_gypfiles/v8.gyp
> +@@ -1336,6 +1336,7 @@
> +     {
> +       'target_name': 'mksnapshot',
> +       'type': 'executable',
> ++      'libraries': [ '-latomic' ],
> +       'dependencies': [
> +         'v8_base_without_compiler',
> +         'v8_compiler_for_mksnapshot',
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-node=
js14.patch b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-nodejs=
14.patch
> new file mode 100644
> index 000000000..56e93c50c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/mips-less-memory-nodejs14.pa=
tch
> @@ -0,0 +1,32 @@
> +Description: mksnapshot uses too much memory on 32-bit mipsel
> +Author: J=C3=A9r=C3=A9my Lal <kapouer@melix.org>
> +Last-Update: 2020-06-03
> +Forwarded: https://bugs.chromium.org/p/v8/issues/detail?id=3D10586
> +
> +This ensures that we reserve 500M instead of 2G range for codegen
> +ensures that qemu-mips can allocate such large ranges
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/deps/v8/src/common/globals.h
> ++++ b/deps/v8/src/common/globals.h
> +@@ -224,7 +224,7 @@ constexpr size_t kMinimumCodeRangeSize =3D
> + constexpr size_t kMinExpectedOSPageSize =3D 64 * KB;  // OS page on PPC=
 Linux
> + #elif V8_TARGET_ARCH_MIPS
> + constexpr bool kPlatformRequiresCodeRange =3D false;
> +-constexpr size_t kMaximalCodeRangeSize =3D 2048LL * MB;
> ++constexpr size_t kMaximalCodeRangeSize =3D 512 * MB;
> + constexpr size_t kMinimumCodeRangeSize =3D 0 * MB;
> + constexpr size_t kMinExpectedOSPageSize =3D 4 * KB;  // OS page.
> + #else
> +--- a/deps/v8/src/codegen/mips/constants-mips.h
> ++++ b/deps/v8/src/codegen/mips/constants-mips.h
> +@@ -140,7 +140,7 @@ const uint32_t kLeastSignificantByteInIn
> + namespace v8 {
> + namespace internal {
> +
> +-constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 4096;
> ++constexpr size_t kMaxPCRelativeCodeRangeInMB =3D 1024;
> +
> + // --------------------------------------------------------------------=
---------
> + // Registers and FPURegisters.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_14.18.1.bb
> new file mode 100644
> index 000000000..b3b1ae445
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_14.18.1.bb
> @@ -0,0 +1,203 @@
> +DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> +HOMEPAGE =3D "http://nodejs.org"
> +LICENSE =3D "MIT & BSD & Artistic-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6768abdfc4dae4fde59d6b4df9693=
0f3"
> +
> +DEPENDS =3D "openssl"
> +DEPENDS:append:class-target =3D " qemu-native"
> +DEPENDS:append:class-native =3D " c-ares-native"
> +
> +inherit pkgconfig python3native qemu
> +
> +COMPATIBLE_MACHINE:armv4 =3D "(!.*armv4).*"
> +COMPATIBLE_MACHINE:armv5 =3D "(!.*armv5).*"
> +COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
> +
> +COMPATIBLE_HOST:riscv64 =3D "null"
> +COMPATIBLE_HOST:riscv32 =3D "null"
> +
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
> +           file://0001-Disable-running-gyp-files-for-bundled-deps-nodejs=
14.patch \
> +           file://0003-Install-both-binaries-and-use-libdir-nodejs14.pat=
ch \
> +           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
> +           file://big-endian.patch \
> +           file://mips-warnings.patch \
> +           file://mips-less-memory-nodejs14.patch \
> +           file://0001-jinja-tests.py-add-py-3.10-fix-nodejs14.patch \
> +           file://CVE-2022-32212.patch \
> +           file://CVE-2022-35255.patch \
> +           file://CVE-2022-43548.patch \
> +           "
> +SRC_URI:append:class-target =3D " \
> +           file://0002-Using-native-binaries-nodejs14.patch \
> +           "
> +SRC_URI:append:toolchain-clang:x86 =3D " \
> +           file://libatomic-nodejs14.patch \
> +           "
> +SRC_URI:append:toolchain-clang:powerpc64le =3D " \
> +           file://0001-ppc64-Do-not-use-mminimal-toc-with-clang-nodejs14=
.patch \
> +           "
> +SRC_URI[sha256sum] =3D "3fa1d71adddfab2f5e3e41874b4eddbdf92b65cade4a4392=
2fb1e437afcf89ed"
> +
> +S =3D "${WORKDIR}/node-v${PV}"
> +
> +# v8 errors out if you have set CCACHE
> +CCACHE =3D ""
> +
> +def map_nodejs_arch(a, d):
> +    import re
> +
> +    if   re.match('i.86$', a): return 'ia32'
> +    elif re.match('x86_64$', a): return 'x64'
> +    elif re.match('aarch64$', a): return 'arm64'
> +    elif re.match('(powerpc64|powerpc64le|ppc64le)$', a): return 'ppc64'
> +    elif re.match('powerpc$', a): return 'ppc'
> +    return a
> +
> +ARCHFLAGS:arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconvention=
-hard', '--with-arm-float-abi=3Dhard', '--with-arm-float-abi=3Dsoftfp', d)}=
 \
> +                 ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-a=
rm-fpu=3Dneon', \
> +                    bb.utils.contains('TUNE_FEATURES', 'vfpv3d16', '--wi=
th-arm-fpu=3Dvfpv3-d16', \
> +                    bb.utils.contains('TUNE_FEATURES', 'vfpv3', '--with-=
arm-fpu=3Dvfpv3', \
> +                    '--with-arm-fpu=3Dvfp', d), d), d)}"
> +GYP_DEFINES:append:mipsel =3D " mips_arch_variant=3D'r1' "
> +ARCHFLAGS ?=3D ""
> +
> +PACKAGECONFIG ??=3D "brotli icu zlib"
> +
> +PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> +PACKAGECONFIG[brotli] =3D "--shared-brotli,,brotli"
> +PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
> +PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
> +PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
> +PACKAGECONFIG[shared] =3D "--shared"
> +PACKAGECONFIG[zlib] =3D "--shared-zlib,,zlib"
> +
> +# We don't want to cross-compile during target compile,
> +# and we need to use the right flags during host compile,
> +# too.
> +EXTRA_OEMAKE =3D "\
> +    CC.host=3D'${CC}' \
> +    CFLAGS.host=3D'${CPPFLAGS} ${CFLAGS}' \
> +    CXX.host=3D'${CXX}' \
> +    CXXFLAGS.host=3D'${CPPFLAGS} ${CXXFLAGS}' \
> +    LDFLAGS.host=3D'${LDFLAGS}' \
> +    AR.host=3D'${AR}' \
> +    \
> +    builddir_name=3D./ \
> +"
> +
> +python do_unpack() {
> +    import shutil
> +
> +    bb.build.exec_func('base_do_unpack', d)
> +
> +    if 'ares' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/cares', True)
> +    if 'brotli' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/brotli', True)
> +    if 'libuv' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/uv', True)
> +    if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/nghttp2', True)
> +    if 'zlib' in d.getVar('PACKAGECONFIG'):
> +        shutil.rmtree(d.getVar('S') + '/deps/zlib', True)
> +}
> +
> +# V8's JIT infrastructure requires binaries such as mksnapshot and
> +# mkpeephole to be run in the host during the build. However, these
> +# binaries must have the same bit-width as the target (e.g. a x86_64
> +# host targeting ARMv6 needs to produce a 32-bit binary). Instead of
> +# depending on a third Yocto toolchain, we just build those binaries
> +# for the target and run them on the host with QEMU.
> +python do_create_v8_qemu_wrapper () {
> +    """Creates a small wrapper that invokes QEMU to run some target V8 b=
inaries
> +    on the host."""
> +    qemu_libdirs =3D [d.expand('${STAGING_DIR_HOST}${libdir}'),
> +                    d.expand('${STAGING_DIR_HOST}${base_libdir}')]
> +    qemu_cmd =3D qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST', Tr=
ue),
> +                                    qemu_libdirs)
> +    wrapper_path =3D d.expand('${B}/v8-qemu-wrapper.sh')
> +    with open(wrapper_path, 'w') as wrapper_file:
> +        wrapper_file.write("""#!/bin/sh
> +
> +# This file has been generated automatically.
> +# It invokes QEMU to run binaries built for the target in the host durin=
g the
> +# build process.
> +
> +%s "$@"
> +""" % qemu_cmd)
> +    os.chmod(wrapper_path, 0o755)
> +}
> +
> +do_create_v8_qemu_wrapper[dirs] =3D "${B}"
> +addtask create_v8_qemu_wrapper after do_configure before do_compile
> +
> +LDFLAGS:append:x86 =3D " -latomic"
> +
> +# Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
> +do_configure () {
> +    export LD=3D"${CXX}"
> +    GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
> +    # $TARGET_ARCH settings don't match --dest-cpu settings
> +    python3 configure.py --prefix=3D${prefix} --cross-compiling \
> +               --without-dtrace \
> +               --without-etw \
> +               --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'),=
 d)}" \
> +               --dest-os=3Dlinux \
> +               --libdir=3D${D}${libdir} \
> +               ${ARCHFLAGS} \
> +               ${PACKAGECONFIG_CONFARGS}
> +}
> +
> +do_compile () {
> +    export LD=3D"${CXX}"
> +    install -Dm 0755 ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wr=
apper.sh
> +    oe_runmake BUILDTYPE=3DRelease
> +}
> +
> +do_install () {
> +    oe_runmake install DESTDIR=3D${D}
> +
> +    # wasn't updated since 2009 and is the only thing requiring python2 =
in runtime
> +    # ERROR: nodejs-12.14.1-r0 do_package_qa: QA Issue: /usr/lib/node_mo=
dules/npm/node_modules/node-gyp/gyp/samples/samples contained in package no=
dejs-npm requires /usr/bin/python, but no providers found in RDEPENDS:nodej=
s-npm? [file-rdeps]
> +    rm -f ${D}${exec_prefix}/lib/node_modules/npm/node_modules/node-gyp/=
gyp/samples/samples
> +}
> +
> +do_install:append:class-native() {
> +    # use node from PATH instead of absolute path to sysroot
> +    # node-v0.10.25/tools/install.py is using:
> +    # shebang =3D os.path.join(node_prefix, 'bin/node')
> +    # update_shebang(link_path, shebang)
> +    # and node_prefix can be very long path to bindir in native sysroot =
and
> +    # when it exceeds 128 character shebang limit it's stripped to incor=
rect path
> +    # and npm fails to execute like in this case with 133 characters sho=
w in log.do_install:
> +    # updating shebang of /home/jenkins/workspace/build-webos-nightly/de=
vice/qemux86/label/open-webos-builder/BUILD-qemux86/work/x86_64-linux/nodej=
s-native/0.10.15-r0/image/home/jenkins/workspace/build-webos-nightly/device=
/qemux86/label/open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/b=
in/npm to /home/jenkins/workspace/build-webos-nightly/device/qemux86/label/=
open-webos-builder/BUILD-qemux86/sysroots/x86_64-linux/usr/bin/node
> +    # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli.j=
s
> +    # use sed on npm-cli.js because otherwise symlink is replaced with n=
ormal file and
> +    # npm-cli.js continues to use old shebang
> +    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_mo=
dules/npm/bin/npm-cli.js
> +
> +    # Install the native binaries to provide it within sysroot for the t=
arget compilation
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
> +    install -m 0755 ${S}/out/Release/bytecode_builtins_list_generator ${=
D}${bindir}/bytecode_builtins_list_generator
> +    if ${@bb.utils.contains('PACKAGECONFIG','icu','true','false',d)}; th=
en
> +        install -m 0755 ${S}/out/Release/gen-regexp-special-case ${D}${b=
indir}/gen-regexp-special-case
> +    fi
> +    install -m 0755 ${S}/out/Release/mkcodecache ${D}${bindir}/mkcodecac=
he
> +    install -m 0755 ${S}/out/Release/node_mksnapshot ${D}${bindir}/node_=
mksnapshot
> +}
> +
> +do_install:append:class-target() {
> +    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node_m=
odules/npm/bin/npm-cli.js
> +}
> +
> +PACKAGES =3D+ "${PN}-npm"
> +FILES:${PN}-npm =3D "${exec_prefix}/lib/node_modules ${bindir}/npm ${bin=
dir}/npx"
> +RDEPENDS:${PN}-npm =3D "bash python3-core python3-shell python3-datetime=
 \
> +    python3-misc python3-multiprocessing"
> +
> +PACKAGES =3D+ "${PN}-systemtap"
> +FILES:${PN}-systemtap =3D "${datadir}/systemtap"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.40.0
>

