Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3D377577
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 21:30:58 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11so17097368wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Uk+8KBuTYPNGpUDygIiPeMQ2JpkuqgpCgtPQnvkvOxM=;
	b=JThk5v01autd76Jy9c+AguZJfk3rKoQT3dTG5LPTux/15STNBcB2Kx5iSEtOvL0DPc
	McPPocYuJmCbdPalVDEquzl5iBbjaa01qoGNhnhP3/zFrlD4za6v0efaEXcE6Ll0K5/H
	YX+wg+Eta+Vic30xnErAVWw5+PUbZYxDO+BA5lp3r5BrgcxUtkhxlg0MA15dUu3qyyCS
	dKAcURx4ePc88L+XjF/O9PS7RTCLEg136GfCMjEV0/cEWBwRWnrQSNwqqKpRRYUX2VRx
	NR6NZcQDDP5AYqlNaDX0ATFYZ4N3iT86cS4a/34CdNGIhu9RUq/uyVizxYNMdJbTaC++
	5gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Uk+8KBuTYPNGpUDygIiPeMQ2JpkuqgpCgtPQnvkvOxM=;
	b=Hgx3KHYsVvW3c3tvGaZpL9ee5+yI17xl/015edQsNbtpqspCqbKavc1uOpgJtdZwV5
	4q8ju3nvu3XVV/jjqzxU1khqcxzENEAX5aSOtpsvl1j1J0pRiBn19bChdZRfWeI/wxB8
	n9KjaEZvPfdYy9ZQ0YzwTDpNNQyxc0mobKTUTcz9ajhqd35K0EWouKBmVNHybwOVX0FZ
	516M7YeJREGnrhpsmXnqgi6M4ffesGJ+PLiyAhkhBgLCOw8UPniaFbTqrXaga776OLcf
	K9VhwmzmCtLd14ieQN7mivCcZFgVvEytibqBI3gv7K3brqllSa4+lgMEAWB7n4/KArSE
	0jgQ==
X-Gm-Message-State: AFeK/H1CSdg0g8kgbr19gFv81n6sAJsc77rTipvJe73EWcdv8xE9zR/7aPilBJ8gJd76v8jZknbHbzQsIla7YQ==
X-Received: by 10.28.224.11 with SMTP id x11mr12567693wmg.98.1490045459417;
	Mon, 20 Mar 2017 14:30:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.179.24 with HTTP; Mon, 20 Mar 2017 14:30:58 -0700 (PDT)
In-Reply-To: <20170320053152.29352-2-raj.khem@gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-2-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 20 Mar 2017 14:30:58 -0700
Message-ID: <CAJ86T=VauVPqXpuEukNa52uxBj9XbMac8wmErsQ16iV2fVD12w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 02/16] rapidjson: Update to 1.1.0 + git
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
X-List-Received-Date: Mon, 20 Mar 2017 21:31:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 19, 2017 at 10:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Drop backports
> Adjust the license checksums to match the changes to file especially
>
> https://github.com/miloyip/rapidjson/commit/b4b1a39937fbd168ef72ea477f90f626773d56fc
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../Fix-gcc-strict-overflow-warning.patch          | 30 ----------------
>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 41 +++++++++++++---------
>  .../{rapidjson_1.0.2.bb => rapidjson_git.bb}       |  9 ++---
>  3 files changed, 29 insertions(+), 51 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
>  rename meta-oe/recipes-devtools/rapidjson/{rapidjson_1.0.2.bb => rapidjson_git.bb} (73%)
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
> deleted file mode 100644
> index 6ce3933ce..000000000
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
> -From: Milo Yip <miloyip@gmail.com>
> -Date: Wed, 2 Mar 2016 01:01:17 +0800
> -Subject: [PATCH] Fix gcc strict-overflow warning
> -
> -Fix #566 #568
> -
> -Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ----
> - include/rapidjson/internal/dtoa.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/include/rapidjson/internal/dtoa.h b/include/rapidjson/internal/dtoa.h
> -index 2d8d2e4..15571e1 100644
> ---- a/include/rapidjson/internal/dtoa.h
> -+++ b/include/rapidjson/internal/dtoa.h
> -@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
> - inline char* Prettify(char* buffer, int length, int k) {
> -     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
> -
> --    if (length <= kk && kk <= 21) {
> -+    if (0 <= k && kk <= 21) {
> -         // 1234e7 -> 12340000000
> -         for (int i = length; i < kk; i++)
> -             buffer[i] = '0';
> ---
> -1.9.1
> -
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> index 17164283c..cf3e16ea5 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> @@ -12,22 +12,29 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>   CMakeLists.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 68139ba..cae7c9b 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
> - endif()
> +Index: git/CMakeLists.txt
> +===================================================================
> +--- git.orig/CMakeLists.txt
> ++++ git/CMakeLists.txt
> +@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
>
>   if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
> --    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
> - elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
> --    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
> - elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
> -     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
> - endif()
> ---
> -1.9.1
> -
> +     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> +     else()
> +       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> +     endif()
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
> +     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wsign-conversion)
> +@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
> +       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
> +     else()
> +       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
> +     endif()
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-missing-field-initializers")
> +     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wimplicit-fallthrough -Weverything)
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> similarity index 73%
> rename from meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> rename to meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index dd6b89698..4cded0720 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -2,20 +2,21 @@ SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
>  HOMEPAGE = "http://rapidjson.org/"
>  SECTION = "libs"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970cd2"
> +LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
>
>  SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
>             file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
> -           file://Fix-gcc-strict-overflow-warning.patch \
>  "
>
> -SRCREV = "3d5848a7cd3367c5cb451c6493165b7745948308"
> +SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
> +
> +PV = "1.1.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
>  inherit cmake
>
> -EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"

Did you see an issue building the examples?

If the examples aren't built then
remove-march-native-from-CMAKE_CXX_FLAGS.patch can be dropped.

>  # RapidJSON is a header-only C++ library, so the main package will be empty.
>
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

