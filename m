Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f176.google.com (mail-wj0-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2673177240
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:11:29 +0000 (UTC)
Received: by mail-wj0-f176.google.com with SMTP id v7so149369580wjy.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=jVdkWXuwOBZfOqIQDG3TfL7clkJzaQAzVDK/JhnTiuc=;
	b=nPg46PQsScfSKB1KgXrD8NOytzyCGuhDBkZiiqCfgZP2Xe4dkCRRLAI/J3jJbEvhhm
	pF+oPgWYFIT33M7xbjxRa5cnN24bnhyHHQ5/AlQPVC/SRtHVx0dvA+T1R3V8/cfvsoWW
	EkCwIz1Ql5RASXNGZjWuXECcxCgk4if+Vu+70635RDqf3JUb4+XXHnlwkRQ8NrMvf+0c
	WB7h6XsEUoFnDSUAToL9gwnoz63dfxsxfFmEqv/MUG6LZlfXrGuklwj8P4wGYpruKrzb
	BV7hTD50WoFvluHUrv0BN2a/PAP+tsu1E1C4+ArDwW3UBPXI6uoUN+eXSApbxzDkMJKD
	OiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=jVdkWXuwOBZfOqIQDG3TfL7clkJzaQAzVDK/JhnTiuc=;
	b=XoQ8Adz2RLJP5cKn/y8pZHOf2/lajaXLDbVcU9mNzcBeTIoRTZfDHHW/yEO2GlfXzB
	Kz0qT5e0tjQ4bttkRfhMnMknwpz5nmnajlRVhnElBGN7urh4khvMTT0sSUgaPl7W2cVo
	EqPBXoHdKl3NfX6OiHh0K9Uw9sx1nu8s4W9c64e7mPryim3rrWIv/l7r0tKCh3859Si2
	mDrxdc6p1pJ0CGgq6ykCpED1u22U+UzBPLg3EbUi4Mcqdk2Oyk4fWK1h9SEwgDZkrFWy
	e0H+ivnWVcZQ6iZq5yWKkPlGazqAZhM5p4OwprqUq0MDCLj7LtT6bnB05ERnvrtYIQPQ
	1xWg==
X-Gm-Message-State: AIkVDXK8wJbvjREWsqHrdftWRgj6HFRaUK4Bz0DoZKyBrLNge4gLc8oZmakollJZGmYKejMvChZ2Gf9Pqye1EA==
X-Received: by 10.194.141.239 with SMTP id rr15mr13147647wjb.144.1482153090388;
	Mon, 19 Dec 2016 05:11:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Mon, 19 Dec 2016 05:11:30 -0800 (PST)
In-Reply-To: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Dec 2016 14:11:30 +0100
Message-ID: <CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 13:11:31 -0000
Content-Type: text/plain; charset=UTF-8

Please don't use github archives.

On Mon, Dec 19, 2016 at 1:01 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> A fast JSON parser/generator for C++ with both SAX/DOM style API.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  .../Fix-gcc-strict-overflow-warning.patch          | 30
> ++++++++++++++++++++
>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 33
> ++++++++++++++++++++++
>  .../recipes-devtools/rapidjson/rapidjson_1.0.2.bb  | 23 +++++++++++++++
>  3 files changed, 86 insertions(+)
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
> index 0000000..1dcd8e0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style
> API"
> +HOMEPAGE = "http://rapidjson.org/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970c
> d2"
> +
> +SRC_URI = "https://github.com/miloyip/rapidjson/archive/v${PV}.tar.gz \
> +           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
> +           file://Fix-gcc-strict-overflow-warning.patch \
> +"
> +
> +SRC_URI[md5sum] = "97cc60d01282a968474c97f60714828c"
> +SRC_URI[sha256sum] = "c3711ed2b3c76a5565ee9f0128bb4e
> c6753dbcc23450b713842df8f236d08666"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF"
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

