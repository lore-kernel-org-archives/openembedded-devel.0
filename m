Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA0A7C727
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 14:41:18 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a15so5835837qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Feb 2019 06:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8NlnXBMYfqgVr2HWzSImY4NxkSNXzIRM104EnDUsu1M=;
	b=cfBSkYUm+Xd3LrW78l1jpGzsuTBBl/M1xgjennhqujTF8WOhZPnb6M5HlOdfrMDwAA
	dOJxibpmsHpSXkjJe1nLbtKpmkh3BeUiXwBQKW/rLP3y0JqIMbxRQLCa+8EeR8S/pABW
	qiKdJQzobNPYPy8G1smGp6PLlDYjeHXDDWL918riL0cL7ENPVTALtDabZUj+Z9xt0cuy
	mPr9uoGQT9uruK7DlZ+FZtg5e0c6FzTG6MoyqArSAY4mYTaD5wfxNk3QtIAu/H0wu0JE
	O8N0Ca4DqQeKUJPAdm0QKEvC71e8rZxnMSR75tO0pL1WIjRfEg3LGouZICy1cQ0nNesq
	iNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8NlnXBMYfqgVr2HWzSImY4NxkSNXzIRM104EnDUsu1M=;
	b=LZjHxJSHnAL9wV/Ge5LmwzMOVPQZ6u64rONvuQEF3K8v6SwXz+1qsTpevJWQ5iiewF
	l7eWhvZKcDUAsm+v+Z2wW1Hd9A6UB0Gcoaq5i2wrfj5lCTnZ34lIhe4MkoUse/n+GXyl
	e/GJAxoGJn7HcPdfx/DwbdK6YG2FAib96F2/ngal8UJvVn/tyud5aE9rUl6iOLBC6pWt
	5W0nuHng+zomUQl/hnQ2JayP07RfH1Ok86SMJ4orUWr5ugP5AD+xiu+zWkd3mYeV2EWA
	dyOJ0Q2cLrJpd7NMIXDrJhktKKYvQxgxqm5SX7cHygeVBM66zG2B9l4PTKRKyiuWTK4v
	Xj3Q==
X-Gm-Message-State: AHQUAuYFsAgo0pzSXB1bg7heQ3rvkDtxlx03OL2qAGcf5C0OkQuQhdqN
	sH/Z8/59+vHOXV94icq0B/7UE+8CGGxqmJ0qtJc=
X-Google-Smtp-Source: AHgI3IbG1x3ApGue8xAfc9fS5zYXNhgfaUIzGRO+D1sF8eehLtNnMIbOVGWYFfzrRXVWEvRzkZUYynSPrdL+g0iBS1o=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr7195537qka.206.1550241679706; 
	Fri, 15 Feb 2019 06:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20190214073243.8342-1-andrej.valek@siemens.com>
	<20190214145313.5406-1-andrej.valek@siemens.com>
In-Reply-To: <20190214145313.5406-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 06:40:52 -0800
Message-ID: <CAMKF1soUy+bmcB0m-0AseMc-29hnK=Ez4_ZULRjps_Cyu6a5WQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nodejs 8.15.0 -> 10.15.1
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
X-List-Received-Date: Fri, 15 Feb 2019 14:41:19 -0000
Content-Type: text/plain; charset="UTF-8"

fail on mips missing atomics probabbly need to link
libatomics
https://errors.yoctoproject.org/Errors/Details/228061/

On Thu, Feb 14, 2019 at 6:53 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Update nodejs to active 10.x LTS release 10.15.1.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...isable-running-gyp-files-for-bundled-deps.patch | 23 ++++++--------
>  .../nodejs/nodejs/0002-Using-native-torque.patch   | 36 ++++++++++++++++++++++
>  .../nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} | 17 +++++++---
>  3 files changed, 59 insertions(+), 17 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_8.15.0.bb => nodejs_10.15.1.bb} (87%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> index 324a4683d..5d0dc03b6 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
> @@ -4,26 +4,23 @@ Date: Thu, 27 Apr 2017 14:25:42 +0200
>  Subject: [PATCH] Disable running gyp on shared deps
>
>  ---
> - Makefile | 7 +++----
> - 1 file changed, 3 insertions(+), 4 deletions(-)
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/Makefile b/Makefile
> -index 0a217bd893..e1229ad07f 100644
> +index a98772f..f5663e2 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -79,10 +79,9 @@ $(NODE_G_EXE): config.gypi out/Makefile
> -       $(MAKE) -C out BUILDTYPE=Debug V=$(V)
> -       if [ ! -r $@ -o ! -L $@ ]; then ln -fs out/Debug/$(NODE_EXE) $@; fi
> +@@ -123,8 +123,8 @@ with-code-cache:
> + test-code-cache: with-code-cache
> +       $(PYTHON) tools/test.py $(PARALLEL_ARGS) --mode=$(BUILDTYPE_LOWER) code-cache
>
>  -out/Makefile: common.gypi deps/uv/uv.gyp deps/http_parser/http_parser.gyp \
>  -              deps/zlib/zlib.gyp deps/v8/gypfiles/toolchain.gypi \
> --              deps/v8/gypfiles/features.gypi deps/v8/src/v8.gyp node.gyp \
> --              config.gypi
>  +out/Makefile: common.gypi deps/http_parser/http_parser.gyp \
> -+              deps/v8/gypfiles/toolchain.gypi deps/v8/gypfiles/features.gypi \
> -+                        deps/v8/src/v8.gyp node.gyp config.gypi
> ++              deps/v8/gypfiles/toolchain.gypi \
> +               deps/v8/gypfiles/features.gypi deps/v8/gypfiles/v8.gyp node.gyp \
> +               config.gypi
>         $(PYTHON) tools/gyp_node.py -f make
> -
> - config.gypi: configure
>  --
> -2.12.2
> +2.19.2
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
> new file mode 100644
> index 000000000..e9035f9eb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Using-native-torque.patch
> @@ -0,0 +1,36 @@
> +From 4bbee5e3d58bc4911999f3ec2cc5aab8ded6717b Mon Sep 17 00:00:00 2001
> +From: "Winker Matthias (TT-CA/ENG1)" <Matthias.Winker@de.bosch.com>
> +Date: Tue, 11 Dec 2018 10:44:29 +0100
> +Subject: [PATCH] Using native torque
> +
> +---
> + deps/v8/gypfiles/v8.gyp | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/v8/gypfiles/v8.gyp b/deps/v8/gypfiles/v8.gyp
> +index 8c78f02255..434168844e 100644
> +--- a/deps/v8/gypfiles/v8.gyp
> ++++ b/deps/v8/gypfiles/v8.gyp
> +@@ -2831,7 +2831,6 @@
> +         {
> +           'action_name': 'run_torque',
> +           'inputs': [  # Order matters.
> +-            '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
> +             '../src/builtins/base.tq',
> +             '../src/builtins/array.tq',
> +             '../src/builtins/typed-array.tq',
> +@@ -2845,7 +2844,10 @@
> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.cc',
> +             '<(SHARED_INTERMEDIATE_DIR)/torque-generated/builtins-typed-array-from-dsl-gen.h',
> +           ],
> +-          'action': ['<@(_inputs)', '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> ++          'action': [
> ++            'torque',
> ++            '<@(_inputs)',
> ++            '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated'],
> +         },
> +       ],
> +     }, # torque
> +--
> +2.19.2
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> index 44eaee974..e961af329 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.15.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> @@ -1,9 +1,10 @@
>  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE = "http://nodejs.org"
>  LICENSE = "MIT & BSD & Artistic-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fde91d5c5bbd1e0389623e1ac018d9e8"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9ceeba79eb2ea1067b7b3ed16fff8bab"
>
>  DEPENDS = "openssl zlib icu"
> +DEPENDS_append_class-target = " nodejs-native"
>
>  inherit pkgconfig
>
> @@ -13,9 +14,13 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
>
>  SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
> -"
> -SRC_URI[md5sum] = "bfc5da493c72ded3a7f43b5662bfc53c"
> -SRC_URI[sha256sum] = "968523333947cc3f769d73dedc6c9c60580826d8714bc0e62ca4589de6a7c633"
> +           "
> +SRC_URI_append_class-target = " \
> +           file://0002-Using-native-torque.patch \
> +           "
> +
> +SRC_URI[md5sum] = "1cad7963255de53509bfa560221bdc88"
> +SRC_URI[sha256sum] = "1a55f7b9fb80442182d9e1eba4fca4dac3c781cdcb25d6be37b24d253f61c858"
>
>  S = "${WORKDIR}/node-v${PV}"
>
> @@ -74,6 +79,10 @@ do_install_append_class-native() {
>      # use sed on npm-cli.js because otherwise symlink is replaced with normal file and
>      # npm-cli.js continues to use old shebang
>      sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js
> +
> +    # Install the native torque to provide it within sysroot for the target compilation
> +    install -d ${D}${bindir}
> +    install -m 0755 ${S}/out/Release/torque ${D}${bindir}/torque
>  }
>
>  do_install_append_class-target() {
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

