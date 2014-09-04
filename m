Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id AFF51713D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 19:57:42 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id at20so12012406iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=8yjKkbVJ9liqKBJsY2E6leg/lEZl1Qwc8gIyuLuLj44=;
	b=eer0kGiYvt0xFBWnaYQNJcz0OlIRldqdco7h0zc9c51qFw67fm74CGQdmGbsUhd8xw
	sEcqGmV7bfS7bu7ZwxcLyE295YZ8cP46pGhB2bTzhgHlX20J6e2s838U7hECQDvkiBPt
	YyuIKNhrulqaQvhkvGlj0wsv5x3DFFbYeW0JWDHAy5BM8BJlPNNydevW1VEgrT4/xPTO
	clWl+RWZd6Ne7NbtKNMQGTO/cRvlfbNRMUC0O4oWoABLY2gYl2RnObdYXuVLrbTbVtCZ
	CTv6trtEByTFpUUJsH+eyYkFtJuZ7PDE0KoxdWIqR9qgZjBrxd8SWfDh416bwjQfPper
	IzBg==
MIME-Version: 1.0
X-Received: by 10.50.111.112 with SMTP id ih16mr10632431igb.30.1409860662975; 
	Thu, 04 Sep 2014 12:57:42 -0700 (PDT)
Received: by 10.50.102.67 with HTTP; Thu, 4 Sep 2014 12:57:42 -0700 (PDT)
In-Reply-To: <1409609700-13719-1-git-send-email-andrea.adami@gmail.com>
References: <1409609700-13719-1-git-send-email-andrea.adami@gmail.com>
Date: Thu, 4 Sep 2014 12:57:42 -0700
Message-ID: <CAMKF1so5eBfgKzF+xoWzS=H656DM9L+MVGM+5mxUayTrXdS+uQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-initramfs][PATCH] klibc: klcc: consider --sysroot option and override gcc-cross encoded sysroot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Sep 2014 19:57:50 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, September 1, 2014, Andrea Adami <andrea.adami@gmail.com> wrote:

> For the recipes built with klcc-cross it is necessary to
> pass --sysroot otherwise we default to the one encoded in gcc-cross which
> actually is the 'first one' built.
> The issue was revealed when building for armv4 after having built for
> armv5te:
> the produced binaries did contain Illegal Instruction (bx lr).
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com <javascript:;>>
> ---
>  meta-initramfs/classes/klibc.bbclass                       |  4 ++--
>  .../klibc/klibc-2.0.4/klcc-consider-sysroot.patch          | 14
> ++++++++++++++
>  meta-initramfs/recipes-devtools/klibc/klibc.inc            |  1 +
>  3 files changed, 17 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
>
> diff --git a/meta-initramfs/classes/klibc.bbclass
> b/meta-initramfs/classes/klibc.bbclass
> index ca741cd..8690472 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -4,8 +4,8 @@ DEPENDS =+ "klcc-cross"
>  # Default for klcc is to build static binaries.
>  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
>
> -export CC = "${TARGET_PREFIX}klcc"
> -export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4
> -mthumb-interwork"
> +export CC = "${TARGET_PREFIX}klcc --sysroot=${STAGING_DIR_TARGET}"
> +export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc
> --sysroot=${STAGING_DIR_TARGET} -march=armv4 -mthumb-interwork"
>
> May be you can use TOOLCHAIN_OPTIONS
here


 export CPP = "${CC} -E"
>
> diff --git
> a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
> new file mode 100644
> index 0000000..9bc4835
> --- /dev/null
> +++
> b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
> @@ -0,0 +1,14 @@
> +diff --git a/klcc/klcc.in b/klcc/klcc.in
> +index 43d0984..61e9385 100644
> +--- a/klcc/klcc.in
> ++++ b/klcc/klcc.in
> +@@ -204,6 +204,9 @@ while ( defined($a = shift(@ARGV)) ) {
> +       # Libraries
> +       push(@libs, $a);
> +       push(@libs, shift(@ARGV)) if ( $2 eq '' );
> ++    } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
> ++      # Override gcc encoded sysroot
> ++      push(@ccopt, $a);
> +     } else {
> +       die "$0: unknown option: $a\n";
> +     }
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> index 0209b20..f3e9972 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -16,6 +16,7 @@ SRC_URI_append_linux-uclibceabi = "
> file://klibc-config-eabi.patch \
>                                      "
>  SRC_URI += "file://klibc-linux-libc-dev.patch \
>              file://staging.patch \
> +            file://klcc-consider-sysroot.patch \
>              "
>
>  S = "${WORKDIR}/git"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

