Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id D63B060AE1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:17:45 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l20so19543186qtp.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3AH7o6xIaITi/21paqmphvC4hxrIneE+Hhz42R7vq9k=;
	b=IbAXaFPKNdbRvoJKOAp+rVL48iw/Bxp/TTY4O5oSlU268zhr5x6eegaUBG+ZWZXNuQ
	NLf9qG75IQiCUOhq/tM7k3Ld2n+eXJEkAy5HdA1FPNBBmCZQKMHWM76wWX2irFsReqOO
	DUtfl5/hE2yassHhkDnFEczAnHms1mMGbf11O80V9jyC/d/6nY4pDon5X1dUwcs3JUWz
	Jamfo1LGfPoQ9Uo3F/a4i+rxAKcQyXrk7PhEVoiu0GbAjq6IkguSGkcwynAU8bEFn5eT
	1vmk089fjFITVkItL/VuOUQ3jrnB0s2DKU+r9rBS5gcGlAC6+esUs/dg9k+TBx4Sxblg
	2M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3AH7o6xIaITi/21paqmphvC4hxrIneE+Hhz42R7vq9k=;
	b=XMYpbrTfBrz9X4FxNoX5I+HNmoKQYCHq6/oZlCqPQkNYAfXMpb5z21mj32+4dRxiCd
	dXAxkAZaw9+hR0mx5M1C5ZnJRB+3b81VpUC+MphSQvyns1qzfofTRNxEtAuYkwxhPa/W
	jQ3j9fWQyTDjtcVws9hheAJdc6q/x9cJEIGC1pVut1J9aAyGQYjbiyq+pezJ6xbcDkGV
	EoE8yakfaC+gishifvwlk4uesgfZ9zkC5FOv7aRyrF7iyjkflbiJnird2NRU9gYWcD09
	1BQUxM2gipkz+ckWlgaB5U2lt5t8EXBfvUA5ITSDyWr8hkTZmiiexPJ+Q9dFCHFI/CA6
	h93A==
X-Gm-Message-State: ANhLgQ3vaJ6LMquGuFU4Ps/C7PrWIZyNS5TfuM9Ftj+0FguuWAZcko66
	CiwOIHKJHszCMiQijUQMi45i+dCIKOdPwnaQuNk=
X-Google-Smtp-Source: ADFU+vsAVMIEkBVilWQhVxH4pQyYCarGeDyaKExkxke3qLkPdkugDPbTRaQvjlBdJFdxXOYSPd3rzuxQHqaCWKR7EzY=
X-Received: by 2002:ac8:5351:: with SMTP id d17mr2435920qto.190.1584501465661; 
	Tue, 17 Mar 2020 20:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584515992-22564-2-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1584515992-22564-2-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2020 20:17:18 -0700
Message-ID: <CAMKF1soCXB9xkvmWCiyBA5Qmws1E5AgW3TO3iXLuYvvbAa3nTQ@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] flatbuffers: upgrade 1.11.0 -> 1.12.0
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
X-List-Received-Date: Wed, 18 Mar 2020 03:17:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 6:50 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> 0001-Add-detection-of-strtoull_l-function.patch
> removed since it is included in 1.12.0
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...Add-detection-of-strtoull_l-function.patch | 38 -------------------
>  ...uffers_1.11.0.bb => flatbuffers_1.12.0.bb} |  8 ++--
>  2 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
>  rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.11.0.bb => flatbuffers_1.12.0.bb} (72%)
>
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch b/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
> deleted file mode 100644
> index f3e82101b..000000000
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From bff7ffbc5130cd46caf33b76b4bb0593fcd15066 Mon Sep 17 00:00:00 2001
> -From: Vladimir Glavnyy <31897320+vglavnyy@users.noreply.github.com>
> -Date: Fri, 10 May 2019 00:15:29 +0700
> -Subject: [PATCH] Add detection of strtoull_l function (#5333) (#5337)
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/google/flatbuffers/commit/bff7ffbc5130cd46caf33b76b4bb0593fcd15066]
> ----
> - CMakeLists.txt | 12 +++++++++---
> - 1 file changed, 9 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 0640c37b5..30be238fe 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -42,12 +42,18 @@ if(DEFINED FLATBUFFERS_MAX_PARSING_DEPTH)
> -   message(STATUS "FLATBUFFERS_MAX_PARSING_DEPTH: ${FLATBUFFERS_MAX_PARSING_DEPTH}")
> - endif()
> -
> --# Auto-detect locale-narrow 'strtod_l' function.
> -+# Auto-detect locale-narrow 'strtod_l' and  'strtoull_l' functions.
> - if(NOT DEFINED FLATBUFFERS_LOCALE_INDEPENDENT)
> -+  set(FLATBUFFERS_LOCALE_INDEPENDENT 0)
> -   if(MSVC)
> --    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
> -+    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
> -+    check_cxx_symbol_exists(_strtoui64_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
> -   else()
> --    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
> -+    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
> -+    check_cxx_symbol_exists(strtoull_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
> -+  endif()
> -+  if(FLATBUFFERS_HAS_STRTOF_L AND FLATBUFFERS_HAS_STRTOULL_L)
> -+    set(FLATBUFFERS_LOCALE_INDEPENDENT 1)
> -   endif()
> - endif()
> - add_definitions(-DFLATBUFFERS_LOCALE_INDEPENDENT=$<BOOL:${FLATBUFFERS_LOCALE_INDEPENDENT}>)
> diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> similarity index 72%
> rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> index 529441de1..c31cef63c 100644
> --- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
> +++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
> @@ -8,13 +8,11 @@ PACKAGE_BEFORE_PN = "${PN}-compiler"
>  RDEPENDS_${PN}-compiler = "${PN}"
>  RDEPENDS_${PN}-dev += "${PN}-compiler"
>
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>

what changed here ?
Please add a description under
Licence-Update: ....
in commit msg

> -SRCREV = "9e7e8cbe9f675123dd41b7c62868acad39188cae"
> +SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
>
> -SRC_URI = "git://github.com/google/flatbuffers.git \
> -           file://0001-Add-detection-of-strtoull_l-function.patch \
> -          "
> +SRC_URI = "git://github.com/google/flatbuffers.git"
>
>  # Make sure C++11 is used, required for example for GCC 4.9
>  CXXFLAGS += "-std=c++11 -fPIC"
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

