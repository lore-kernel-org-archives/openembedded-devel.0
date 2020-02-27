Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 34B48612E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 15:27:48 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id e16so3487235qkl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lYPSG9IDbvABUAKKly19SQ4dtI6URno+hLZY1ZO0wJE=;
	b=Dk5FR1VbsJ22ivJKdeQV0PHhb2adiHwMGISKc9k+6VeCBMFUyNs8Mv4hKub1NYesOs
	joRu3Nn57DwkHfR2VZApnMMO+7IWRsMRg0kO3mY/btC77xCQeVEf+nz77KrsUzQvmyK6
	+grHdpVwqZzd0FciOmQ9dXNCV/+nnEIXUbJ1tV1esZBxe/iMXjrrEpB5/6EMl3rd5a7v
	3YbiRomUAvWdZfTXrHH9N/wQ5ZPWZi3C+lCavvwdBLIgMo9gTQPvXkvUr26jFXQwR2fh
	oaGIcZLlo1H+Ee8874yX8jKKT1FkfXHTaa0+SULsq+Ta9Yi73agl3DoWQWuk/zUkQxYi
	TwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lYPSG9IDbvABUAKKly19SQ4dtI6URno+hLZY1ZO0wJE=;
	b=V9ZBUdiLEfbf+Mv5QmrPdGAZwF+BveLhB3lf6cYkESjVTlGH0IrEzuX6ZlgrzTVmmJ
	jHEWxZOCf4NbV2+WePx0MRvKc4d1YXkyr8TfGiP0vO+6fK33TGPqWY5McrSAeGHWDYYf
	KlcmsY3wwFpv29ANSlrG4TYlJN4h9KKxHNYTveyJ2Jq7jsLFvGLhP2+7RFNoimpbEApQ
	OihIth/sWra7pKObLCFQzCMoHJj8l6kMSMdD2zi5W/1e+qkhmJNkrPQu7kc6gwtjAV6t
	ITzlPSj8LG+On9RbJiWGDkioNJ69FB31LVEY+oIWRP7PWxbw4aDSQqqOWYoYnJNHm42b
	1dPg==
X-Gm-Message-State: APjAAAV9qTrsCUxCJ6VpWuascSroasf2fQ16DT0S4erFfgXdjrsuvbjl
	fla83riYtRlvZZKjqcRz3skzC6it7RADTThggXs=
X-Google-Smtp-Source: APXvYqwqUh4Reu2XwRM3Jsv5z3Jg8Xp8IUtIz6751YoGPdRROgo5C3N3TfHZwISpXM8a7B2x/gPqIvXzbQkte7sPGek=
X-Received: by 2002:a37:e317:: with SMTP id y23mr5871261qki.431.1582817268694; 
	Thu, 27 Feb 2020 07:27:48 -0800 (PST)
MIME-Version: 1.0
References: <20200226122622.33171-1-leo.yan@linaro.org>
In-Reply-To: <20200226122622.33171-1-leo.yan@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2020 07:27:21 -0800
Message-ID: <CAMKF1sq3DnDjXNyyUs5g3rbQp295gEP3xrYteL3adUOOy3Nkug@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v4] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Thu, 27 Feb 2020 15:27:48 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing version going backward errors still

luajit-2.0.5+2.1.0-beta3: Package version for package luajit-src went
backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dbg went
backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-staticdev
went backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-dev went
backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-doc went
backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-locale
went backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit went
backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]
luajit-2.0.5+2.1.0-beta3: Package version for package luajit-common
went backwards which would break package feeds (from
0:2.0.5+git0+02b521981a-r0.7 to 0:2.0.5+2.1.0-beta3-r0.0)
[version-going-backwards]

On Wed, Feb 26, 2020 at 4:26 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
>
> Also updated clang.patch to dismiss patch warning: "Hunk #1 succeeded
> at 436 with fuzz 1 (offset 123 lines)."
>
> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  meta-oe/recipes-devtools/luajit/luajit/clang.patch  |  4 ++--
>  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}       | 13 ++++++-------
>  2 files changed, 8 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (90%)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit/clang.patch b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> index c39ef6fd4..807cc4417 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> +++ b/meta-oe/recipes-devtools/luajit/luajit/clang.patch
> @@ -8,8 +8,8 @@ Index: LuaJIT-2.0.5/src/lj_arch.h
>  ===================================================================
>  --- LuaJIT-2.0.5.orig/src/lj_arch.h
>  +++ LuaJIT-2.0.5/src/lj_arch.h
> -@@ -313,7 +313,7 @@
> - #error "Need at least GCC 4.2 or newer"
> +@@ -436,7 +436,7 @@
> + #endif
>   #endif
>   #elif !LJ_TARGET_PS3
>  -#if (__GNUC__ < 4) || ((__GNUC__ == 4) && __GNUC_MINOR__ < 3)
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> similarity index 90%
> rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> index 93128dda8..2a7243842 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> @@ -1,14 +1,14 @@
>  SUMMARY = "Just-In-Time Compiler for Lua"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d739bb9250a55c124a545b588fd76771"
>  HOMEPAGE = "http://luajit.org"
>
> -PV .= "+git${SRCPV}"
> -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> +PV = "2.0.5+2.1.0-beta3"
> +SRCREV = "0ad60ccbc3768fa8e3e726858adf261950edbc22"
> +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
>             file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
>             file://clang.patch \
> -"
> +           "
>
>  S = "${WORKDIR}/git"
>
> @@ -90,8 +90,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
>  "
>  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
>
> -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> -COMPATIBLE_HOST_aarch64 = "null"
> +# mips64/ppc/ppc64/riscv64 is not supported in this release
>  COMPATIBLE_HOST_mipsarchn32 = "null"
>  COMPATIBLE_HOST_mipsarchn64 = "null"
>  COMPATIBLE_HOST_powerpc = "null"
> --
> 2.17.1
>

