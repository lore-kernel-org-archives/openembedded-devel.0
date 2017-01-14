Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 21E9C60720
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2017 00:28:50 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r126so15348135wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 16:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=m+upIsEhG6BeJ0YWhKxRuhn9rIvwqcVHf1brLS6LF8o=;
	b=Pyjuo1+9WO4ecgxmZOszPdGvGunpzfKBohLYLLLZ+Wxk8M5HQgKmHtxUB+G3kE10qh
	j1Tq99uRuwBqXclH4aC9+WS0OodoFC3YqoSD50ThI4end+38lYfaW4CmmS4X6/qoVnew
	IEme8Y5eNCMTX+ySi5AuY7uRCE8ERH3x7xKxOPSgIwjxBAlf//EkE597qJ8Iqi8rmeDO
	cBK6PR+iUP+Cz2oMHd9SXwwj8Rd7bbnltXCO/8c+5LhdHvXo6Zd71NYMETUEi1WnOfmN
	AfUImvPLfmi2Tnm3MMQZG4V/QtGQK41+45yExcweQeBHfhHOwUSSa72lqhkJxc1MvKC4
	3bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=m+upIsEhG6BeJ0YWhKxRuhn9rIvwqcVHf1brLS6LF8o=;
	b=gmhsPudXDf4+JVN6fYtES/FLn+2W8OMe/r+QPYGL8tCdy6T4emG2aCNRwB72EAwWgR
	/f48kOpoWlqRxJIslDxqBe3fB3nk/cZF8QfaDnrAnz0iQCvPDou3hEXdTaM85ZrjdHtx
	Dtc6OH0r5KWu7foPBe/Gvb5p5V3H8qoYCwXYd+CGHSdCxcsIsj8UixWtb1R2eOecBg0f
	y1HbO85GDrBWCteRORqVa5ly4bb+vs3E2mBznsWMkECFTYfYU86dL7AfXKW3p8MGx5Pd
	yACJ16/Eabgw2aGOphlm6nmoUXGX66Q/i1J+pUHTCAPzlW1iJg7To8l+2oKcDM4G+GqV
	3EYw==
X-Gm-Message-State: AIkVDXIFIO4kxE+fEIm98JkUHEWmEnHeOQNcAiEz+e6x9R2WPLZePGqVU2QjCsju2Dde40Kosx0JWo9ngMzrzA==
X-Received: by 10.28.6.78 with SMTP id 75mr4457481wmg.81.1484353730522; Fri,
	13 Jan 2017 16:28:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 13 Jan 2017 16:28:49 -0800 (PST)
In-Reply-To: <1484349881-16952-1-git-send-email-armccurdy@gmail.com>
References: <1484349881-16952-1-git-send-email-armccurdy@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 14 Jan 2017 01:28:49 +0100
Message-ID: <CA+chaQevBxQ+SFcn8J-QRa6kbL0fwkf-FpEh2p_xB8zyskjo=Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v3] rapidjson: add initial recipe
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
X-List-Received-Date: Sat, 14 Jan 2017 00:28:51 -0000
Content-Type: text/plain; charset=UTF-8

It was already merged, so please resend just the EXTRA_OECMAKE part.

On Sat, Jan 14, 2017 at 12:24 AM, Andre McCurdy <armccurdy@gmail.com> wrote:

> A fast JSON parser/generator for C++ with both SAX/DOM style API.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../Fix-gcc-strict-overflow-warning.patch          | 30
> ++++++++++++++++++++
>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 33
> ++++++++++++++++++++++
>  .../recipes-devtools/rapidjson/rapidjson_1.0.2.bb  | 24 ++++++++++++++++
>  3 files changed, 87 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
> strict-overflow-warning.patch
>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
> march-native-from-CMAKE_CXX_FLAGS.patch
>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
> b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
> strict-overflow-warning.patch
> new file mode 100644
> index 0000000..6ce3933
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
> strict-overflow-warning.patch
> @@ -0,0 +1,30 @@
> +From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
> +From: Milo Yip <miloyip@gmail.com>
> +Date: Wed, 2 Mar 2016 01:01:17 +0800
> +Subject: [PATCH] Fix gcc strict-overflow warning
> +
> +Fix #566 #568
> +
> +Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + include/rapidjson/internal/dtoa.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/include/rapidjson/internal/dtoa.h
> b/include/rapidjson/internal/dtoa.h
> +index 2d8d2e4..15571e1 100644
> +--- a/include/rapidjson/internal/dtoa.h
> ++++ b/include/rapidjson/internal/dtoa.h
> +@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
> + inline char* Prettify(char* buffer, int length, int k) {
> +     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
> +
> +-    if (length <= kk && kk <= 21) {
> ++    if (0 <= k && kk <= 21) {
> +         // 1234e7 -> 12340000000
> +         for (int i = length; i < kk; i++)
> +             buffer[i] = '0';
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
> march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/
> rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
> new file mode 100644
> index 0000000..1716428
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
> march-native-from-CMAKE_CXX_FLAGS.patch
> @@ -0,0 +1,33 @@
> +From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Mon, 19 Dec 2016 01:37:11 -0800
> +Subject: [PATCH] remove -march=native from CMAKE_CXX_FLAGS
> +
> +Not appropriate when cross compiling.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + CMakeLists.txt | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 68139ba..cae7c9b 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
> + endif()
> +
> + if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
> +-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
> ++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
> + elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
> +-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
> ++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
> + elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
> +     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
> + endif()
> +--
> +1.9.1
> +
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> new file mode 100644
> index 0000000..dd6b896
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style
> API"
> +HOMEPAGE = "http://rapidjson.org/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970c
> d2"
> +
> +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> +           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
> +           file://Fix-gcc-strict-overflow-warning.patch \
> +"
> +
> +SRCREV = "3d5848a7cd3367c5cb451c6493165b7745948308"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
> +
> +# RapidJSON is a header-only C++ library, so the main package will be
> empty.
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

