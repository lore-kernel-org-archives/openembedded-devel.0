Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EA4177F639
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 12:19:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f2so2090963wrs.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 04:19:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mawqM9XJ0O5VWadAI0aFHuf/617eacmUjpEyMp0cuAM=;
	b=gXorieU4VpcLOqUzeIkTLHyxoc4p97fHky9SMXa31bmN+TcWHN+oPdIvQPEb0P7i+B
	n1rkHBo9XxnYFVX54Xf0eCollOmr+4hg7+xVXe2PX+Fe5tX52RJjpipNMLhOzrRS7FEe
	4VtIGXV83uGUootb372fa0mvPqK5p36qOqqlkzoop1JRmIiXFVvlB848bcbizY4K7hHu
	5SMcpNoX0yOH+dR/OKTTjQc/GjsGaKFgyxI7bWyAesqiInb29CQWPqjhXrfX2wKUMbPs
	kqg+GXEaXVSas2TJxWK2t/mUZtKtQcFTke0STsGJhK8rYshCKdTibmA0rNEmecDPYdLt
	VKiw==
X-Gm-Message-State: APjAAAUC96zu0gXREyr4uEGPt9Ss1xlHPz5rT7XrrjVeqWhnwRbqqMKQ
	OTOSvuj/nk54Rb1W95tx/Yw=
X-Google-Smtp-Source: APXvYqyuVibLUmJ3KdtyOjmdGSP9UulKbQg5LGyITrRBj51+4T04XxlaYIIzoG/UWhEBwpksHfo0Yw==
X-Received: by 2002:a5d:5687:: with SMTP id f7mr2574142wrv.384.1573647563551; 
	Wed, 13 Nov 2019 04:19:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id o5sm2544745wrx.15.2019.11.13.04.19.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 04:19:22 -0800 (PST)
Message-ID: <ce628d72e8512b493003f72dac66237576dace19.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Nov 2019 12:19:22 +0000
In-Reply-To: <20191113095811.14815-1-git@andred.net>
References: <20191110220510.10077-1-git@andred.net>
	<20191113095811.14815-1-git@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] nodejs: ensure to use correct compiler & flags always
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
X-List-Received-Date: Wed, 13 Nov 2019 12:19:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Khem,

This is a rev2, as v1 is still in master-next, only.
I forgot to set the subject line right...

Cheers,
Andre'

On Wed, 2019-11-13 at 09:58 +0000, André Draszik wrote:
> NodeJS comes with an embedded, patched, version of gyp.
> 
> Normally, gyp supports compiling for the build machine, e.g.
> native tools that need to be compiled to run during the build,
> and for the host, using different variables, e.g. CC and
> CC.host, etc.
> Most of this has been patched out in the NodeJS version of gyp,
> and essentially it only supports compiling using one compiler -
> ${CC}. This modification excludes LDFLAGS for native tools, and
> those still evaluate LDFLAGS.host (only).
> 
> While this modified behaviour is OK for the OE use-case of building
> native and target tools separately, it means that this recipe can
> not work as-is with standard gyp, and wrong LDFLAGS are being used
> for some of the tools compiled (torque) in either case.
> 
> By setting the make variables that gyp-generated makefiles inspect,
> we support use of unpatched gyp, and we ensure that all tools
> are compiled with correct LDFLAGS in either case.
> 
> This now also allows us to drop the patch that had been applied to
> work-around this problem.
> 
> Signed-off-by: André Draszik <git@andred.net>
> 
> ---
> v2: _append not needed for EXTRA_OEMAKE
> ---
>  .../nodejs/0006-Use-target-ldflags.patch      | 24 -------------------
>  .../recipes-devtools/nodejs/nodejs_10.17.0.bb | 13 +++++++++-
>  2 files changed, 12 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch b/meta-oe/recipes-
> devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
> deleted file mode 100644
> index f6569cd57..000000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -The target LDFLAGS have been ignored. Tools like torque
> -have been loaded from system libraries, even if a native
> -one was the target.
> -|$ ldd torque 
> -|    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1
> -|    libcrypto.so.1.1 => /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
> -|    libssl.so.1.1 => /usr/lib/x86_64-linux-gnu/libssl.so.1.1
> -|    libicui18n.so.63 => not found
> -|    libicuuc.so.63 => not found
> -...
> -
> -Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> -
> -diff -Naur node-v10.15.1/deps/v8/gypfiles/toolchain.gypi node-v10.15.1/deps/v8/gypfiles/toolchain.gypi
> ---- node-v10.15.1/deps/v8/gypfiles/toolchain.gypi	2019-03-18 15:01:39.000000000 +0100
> -+++ node-v10.15.1/deps/v8/gypfiles/toolchain.gypi	2019-03-18 15:04:08.628361308 +0100
> -@@ -1106,6 +1106,7 @@
> -             'cflags': [ '-fno-strict-aliasing' ],
> -           }],
> -         ],  # conditions
> -+        'ldflags+': [ '$(LDFLAGS)' ],
> -       }],
> -       ['OS=="solaris"', {
> -         'defines': [ '__C99FEATURES__=1' ],  # isinf() etc.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> index 4013c6931..9af0d998c 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.17.0.bb
> @@ -19,7 +19,6 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
>             file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
>             file://0004-Make-compatibility-with-gcc-4.8.patch \
>             file://0005-Link-atomic-library.patch \
> -           file://0006-Use-target-ldflags.patch \
>             "
>  SRC_URI_append_class-target = " \
>             file://0002-Using-native-torque.patch \
> @@ -58,6 +57,18 @@ PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
>  PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
>  PACKAGECONFIG[zlib] = "--shared-zlib,,zlib"
>  
> +# We don't want to cross-compile during target compile,
> +# and we need to use the right flags during host compile,
> +# too.
> +EXTRA_OEMAKE = "\
> +    CC.host='${CC}' \
> +    CFLAGS.host='${CPPFLAGS} ${CFLAGS}' \
> +    CXX.host='${CXX}' \
> +    CXXFLAGS.host='${CPPFLAGS} ${CXXFLAGS}' \
> +    LDFLAGS.host='${LDFLAGS}' \
> +    AR.host='${AR}' \
> +"
> +
>  # Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to
> workaround gypi
>  do_configure () {
>      rm -rf ${S}/deps/openssl


