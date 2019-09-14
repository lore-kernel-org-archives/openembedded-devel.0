Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id A115B7ED03
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Sep 2019 02:14:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id u40so36243346qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2019 19:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OUW4osNO5V5Fq93BNPP/kb+mtaDYwyt5OuqVVcfGMrc=;
	b=Zj8uANKlF1uA51rHOG9EVBhTKDwPp4/4K4wfV1a3S9+9nFeuXjkUw92wb+M/5iTQ+n
	3PB436A+fcZ0h+ljMHJ5n4HbW4CFrJ7Lqnicfi9QOq2JRE+5Sruckx2uU9IjfAqePrfV
	KE9QQNrMZyZkRccrf1GOj8lXL/IVLCaP38LGn50BqXL9hMQZpWvIWaDD8A9rDvhtbxq2
	a0Id1khB7p5Y+xVbDEyMYA21F+ht+HGsHbKoYneBmcFHahL1sxRVExkxmxsSIWCuBA9J
	8hr1+ZgJ+vfurIt82N5dHDDvO89hbp2fGapYwtU54KtYykqGGpDu4MuzAggqqvEmp4CR
	4nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OUW4osNO5V5Fq93BNPP/kb+mtaDYwyt5OuqVVcfGMrc=;
	b=Pbsw5It56HBG0i3VXeAXph5QU3IYnIQt9BYu1oEtu7IqcKj+H/d26Vw53odV8Ev2m3
	xMhS/rCjLCspHlnNRqAwxjbTFyLaWS/8oRkKvFvABvzRJTtzks4sUM/Afov+87Oby4qE
	FXfWeaTbwp8NRKHvrHlYXWyxfJ1Ox4o0jWLgen8UyVQRIfRcvPiTzenrN9KtCmjFwsP5
	WIl5h9V6SIhf/dkNO/B1MJwHWag4sRbHkaRHE7sun/sCu+nj6BoBQsdVedv52K99rFue
	pt4+Lv0XwBiJ01rVqFw7zEawr04SbO1SOAwtSELj5SdOytmi0iMxOZOW6gCBNIBFNvaE
	UROw==
X-Gm-Message-State: APjAAAWh2TJfl1keNO4NeHAKh+WKsmCv4BAgNDj8r13wQ1qnKa7pzMoo
	/0Z7jCngz+om7Q+g1hyR9G2BKUgdu+IjzlRQ3lpcJk3x4Gs=
X-Google-Smtp-Source: APXvYqwa9XIK/4hfPbLKCSfvh6k+dxx9Ql74wBlPWxbmWXQ8DAhfKnW/ryJfh1Cu8pOEQZofLMbJyUZwq1oZ5lXZRvA=
X-Received: by 2002:ac8:1103:: with SMTP id c3mr6460678qtj.88.1568427256292;
	Fri, 13 Sep 2019 19:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190913192745.1825-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190913192745.1825-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Sep 2019 19:13:50 -0700
Message-ID: <CAMKF1sodyWcm24H5fosyPC7scGK-+uabJqcvhuhhJa2zWdUheA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-oe] avro-c: update to 1.9.1
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
X-List-Received-Date: Sat, 14 Sep 2019 02:14:15 -0000
Content-Type: text/plain; charset="UTF-8"

Fails with musl still

lang/c/src/avro_generic_internal.h:63:39: error: 'ssize_t' undeclared
(first use in this function); did you mean 'size_t'?
01:28:42 |    63 |     ((gcls)->instance_size == NULL ? (ssize_t)-1 :
(ssize_t)(gcls)->instance_size(&(gcls)->parent))

I think it needs to pass -D_GNU_SOURCE via compiler cmdline

On Fri, Sep 13, 2019 at 12:28 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Removed patch was upstreamed.
>
> License checksum changed since http links were replaced with https ones
> (see b83441d5d5a88c3ea6e9f7df9746e3060beb4512).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  ...avro-c-Fix-build-with-clang-compiler.patch | 37 -------------------
>  .../avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} |  8 ++--
>  2 files changed, 3 insertions(+), 42 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
>  rename meta-oe/recipes-support/avro/{avro-c_1.8.1.bb => avro-c_1.9.1.bb} (50%)
>
> diff --git a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch b/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
> deleted file mode 100644
> index 01235d8ef..000000000
> --- a/meta-oe/recipes-support/avro/avro-c/0001-avro-c-Fix-build-with-clang-compiler.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 518bb8ccfb3f3fc143fbd571782f3e40573d01b5 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 10 Apr 2017 09:15:04 -0700
> -Subject: [PATCH] avro-c: Fix build with clang compiler
> -
> -Clang advertizes itself to be compatible with gcc 4.2.1
> -while that was true several years ago, it now supports
> -a lot more newer features, the test to just check gcc
> -version should be supplanted with clang check as well
> -so atomic support in clang can be asserted as well
> -
> -Fixes
> -
> -lang/c/src/avro/refcount.h:301:2: error: "No atomic implementation!"
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - lang/c/src/avro/refcount.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/lang/c/src/avro/refcount.h b/lang/c/src/avro/refcount.h
> -index 69afa4fc..d76ba057 100644
> ---- a/lang/c/src/avro/refcount.h
> -+++ b/lang/c/src/avro/refcount.h
> -@@ -118,7 +118,8 @@ avro_refcount_dec(volatile int *refcount)
> -  * GCC intrinsics
> -  */
> -
> --#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500
> -+#elif (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__) > 40500 \
> -+|| defined(__clang__)
> -
> - static inline void
> - avro_refcount_set(volatile int *refcount, int value)
> ---
> -2.12.2
> -
> diff --git a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> similarity index 50%
> rename from meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> rename to meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> index 276fe2b5a..05cb46e0f 100644
> --- a/meta-oe/recipes-support/avro/avro-c_1.8.1.bb
> +++ b/meta-oe/recipes-support/avro/avro-c_1.9.1.bb
> @@ -3,15 +3,13 @@ HOMEPAGE = "http://apr.apache.org/"
>  SECTION = "libs"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=73bdf70f268f0b3b9c5a83dd7a6f3324"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
>
>  DEPENDS = "jansson zlib xz"
>  PV .= "+git${SRCPV}"
>
> -SRCREV = "4b3677c32b879e0e7f717eb95f9135ac654da760"
> -SRC_URI = "git://github.com/apache/avro \
> -           file://0001-avro-c-Fix-build-with-clang-compiler.patch;patchdir=../../ \
> -"
> +SRCREV = "89218262cde62e98fcb3778b86cd3f03056c54f3"
> +SRC_URI = "git://github.com/apache/avro;branch=branch-1.9"
>
>  S = "${WORKDIR}/git/lang/c"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

