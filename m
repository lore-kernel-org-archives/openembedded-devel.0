Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id DA20C77395
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 23:51:36 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id kp2so19050069wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 15:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=RkNJ3lmHFdxns5mdyiOm5H02dsQTRmnV13USi19Y5fw=;
	b=svt3mkUx+h32XKgE+D8MoRU5lWWK3yzWEft5WKSWJQysTRxnB/CJzq2f6hRw177lAX
	rCuhcFqLO2xOpA9J/PQ22jk6SzSopcaPzkj2CPDa1I6jV9KPKxNz2GEbN42VdO+bIV+w
	q5M0aEzc/OwL8U6hOuvZRcq+JI5kBfxa5+D2W/pUG32VsOutLHvpBVlMu3Y59TLWDWbw
	v20wwa8N2VQeak+wW4grgsK6E/uSpJ7fdLMJbTD6LSGVQrRCMlt+C2NYvFhrKYzeiWVd
	GxC6DvRRTpLEwHCEB07R0GT9CrNAFzf1OiS2QNX52ZO0w4kxoiKBQA5VhuEf5bPTcU78
	JRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=RkNJ3lmHFdxns5mdyiOm5H02dsQTRmnV13USi19Y5fw=;
	b=f8PHR8dcpSImM+IeqS+7aoSqEGSUooOxEaLb6+ygKIKxb2sRAI+sGQHHNiGS0SfVa1
	LLBbQJL/jqCDGl0LzVS1vjsslNNeDo+qmOiRpewggpwn5TsIoYVzKjJ5D7nQV27lqXyb
	i1pS0457+E46IXh1VaNQYqGPFOB1FqHdSDDCMg9M69EbpLXIRJPQHf8QQo3kZqHoM+gC
	aZZBz1TyetAH2b/Rl+JrhGjL6MlJjk/EG1JBcr8rZ+vd99kHQ+f4ClF85JPWFHpaduyg
	yP1pxYt6yQSTnHCKAce85C73nNwfzAoIsCKV6WNLW4D9EMSPziw63eJFSyqVNqo8Tuv3
	F9bw==
X-Gm-Message-State: AIkVDXLmq3HjKepc7OaHOtjMjjkb9nxGLd4PmZ0ZE9Z1+hzH6081sMBhVFZutvLE5fQZbq4rh57zG10ZTf+VUw==
X-Received: by 10.194.41.163 with SMTP id g3mr7860527wjl.162.1482018697676;
	Sat, 17 Dec 2016 15:51:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Sat, 17 Dec 2016 15:51:37 -0800 (PST)
In-Reply-To: <20161215020940.10105-3-raj.khem@gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
	<20161215020940.10105-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Dec 2016 00:51:37 +0100
Message-ID: <CA+chaQckEo=6jbW19-Fvv1Uy_pMminwEVg=3PSyCdXA3imOh7w@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH V2 3/6] zbar: Add recipe
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
X-List-Received-Date: Sat, 17 Dec 2016 23:51:40 -0000
Content-Type: text/plain; charset=UTF-8

gst-plugins-bad-0.10.23: gst-plugins-bad-zbar rdepends on zbar, but it
isn't a build dependency, missing zbar in DEPENDS or PACKAGECONFIG?
[build-deps]


On Thu, Dec 15, 2016 at 3:09 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../zbar/0001-make-relies-GNU-extentions.patch     | 32 ++++++++++++++
>  .../zbar/zbar/0001-undefine-__va_arg_pack.patch    | 51
> ++++++++++++++++++++++
>  meta-oe/recipes-support/zbar/zbar_0.10.bb          | 28 ++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 meta-oe/recipes-support/zbar/
> zbar/0001-make-relies-GNU-extentions.patch
>  create mode 100644 meta-oe/recipes-support/zbar/
> zbar/0001-undefine-__va_arg_pack.patch
>  create mode 100644 meta-oe/recipes-support/zbar/zbar_0.10.bb
>
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-GNU-extentions.patch
> new file mode 100644
> index 0000000..04239ba
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0001-make-relies-
> GNU-extentions.patch
> @@ -0,0 +1,32 @@
> +From 224507bc4b6e58f7a6e445bfebfb59d6b8d78bd6 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Dec 2016 17:38:51 -0800
> +Subject: [PATCH] make relies GNU extentions
> +
> +We get errors like
> +`%'-style pattern rules are a GNU make extension
> +
> +Disable this warning, since we use gmake with OE
> +anyway
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 56d3dd0..9f85fd7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3,7 +3,7 @@ AC_PREREQ([2.61])
> + AC_INIT([zbar], [0.10], [spadix@users.sourceforge.net])
> + AC_CONFIG_AUX_DIR(config)
> + AC_CONFIG_MACRO_DIR(config)
> +-AM_INIT_AUTOMAKE([1.10 -Wall -Werror foreign subdir-objects std-options
> dist-bzip2])
> ++AM_INIT_AUTOMAKE([1.10 -Wall -Werror -Wno-portability foreign
> subdir-objects std-options dist-bzip2])
> + AC_CONFIG_HEADERS([include/config.h])
> + AC_CONFIG_SRCDIR(zbar/scanner.c)
> + LT_PREREQ([2.2])
> +--
> +2.10.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
> b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
> new file mode 100644
> index 0000000..f7d8ba1
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar/0001-undefine-__va_arg_pack.patch
> @@ -0,0 +1,51 @@
> +From f842872244219d9881fbec77054702412b1e16f8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 2 Dec 2016 16:41:27 -0800
> +Subject: [PATCH] undefine __va_arg_pack
> +
> +dprintf() is also a libc function. This fixes
> +the compile errors
> +
> +/usr/include/bits/stdio2.h:140:1: error: expected identifier or '('
> before '{' token
> +|  {
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + zbar/debug.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/zbar/debug.h b/zbar/debug.h
> +index 482ca8d..68948f6 100644
> +--- a/zbar/debug.h
> ++++ b/zbar/debug.h
> +@@ -23,6 +23,7 @@
> +
> + /* varargs variations on compile time debug spew */
> +
> ++#undef __va_arg_pack
> + #ifndef DEBUG_LEVEL
> +
> + # ifdef __GNUC__
> +@@ -36,15 +37,14 @@
> + #else
> +
> + # include <stdio.h>
> +-
> + # ifdef __GNUC__
> +-#  define dprintf(level, args...) \
> ++#  define dprintf(level, format, args...) \
> +     if((level) <= DEBUG_LEVEL)    \
> +-        fprintf(stderr, args)
> ++        fprintf(stderr, format, args)
> + # else
> +-#  define dprintf(level, ...)     \
> ++#  define dprintf(level, format, ...)     \
> +     if((level) <= DEBUG_LEVEL)    \
> +-        fprintf(stderr, __VA_ARGS__)
> ++        fprintf(stderr, format, __VA_ARGS__)
> + # endif
> +
> + #endif /* DEBUG_LEVEL */
> +--
> +2.10.2
> +
> diff --git a/meta-oe/recipes-support/zbar/zbar_0.10.bb
> b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> new file mode 100644
> index 0000000..77733aa
> --- /dev/null
> +++ b/meta-oe/recipes-support/zbar/zbar_0.10.bb
> @@ -0,0 +1,28 @@
> +DESRIPTION = "2D barcode scanner toolkit."
> +SECTION = "graphics"
> +LICENSE = "LGPL-2.1"
> +
> +DEPENDS = "pkgconfig intltool-native libpng jpeg"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=42bafded1b380c6fefbeb6c5cd5448d9"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2 \
> +           file://0001-undefine-__va_arg_pack.patch \
> +           file://0001-make-relies-GNU-extentions.patch \
> +"
> +
> +SRC_URI[md5sum] = "0fd61eb590ac1bab62a77913c8b086a5"
> +SRC_URI[sha256sum] = "234efb39dbbe5cef4189cc76f37afb
> e3cfcfb45ae52493bfe8e191318bdbadc6"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGECONFIG = "${@bb.utils.contains("DISTRO_FEATURES", "x11", "x11",
> "", d)}"
> +
> +PACKAGECONFIG[x11] = "--with-x,-without-x,libxcb libx11 libsm libxau
> libxext libxv libice libxdmcp"
> +
> +EXTRA_OECONF = " --without-imagemagick --without-qt --without-python
> --disable-video --without-gtk"
> +
> +do_install_append() {
> +    #remove usr/bin if empty
> +    rmdir ${D}${bindir}
> +}
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

