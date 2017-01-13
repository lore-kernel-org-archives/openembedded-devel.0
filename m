Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A444871DD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 16:06:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so12670206wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 08:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CxYMrp84Aow8DABf6Xto6WiKfhsct4Uk4zNpEGIVXZ4=;
	b=XWwGsuHmmuCns/dLgggo5+kHOSvGdevxLe2KjviH/VF+DcMdQrTpucDE5bO7HlI1F6
	53RoGlaTQ8YQcN4lCadhtG8p8K+ohJ9gu5KkaOQqRO272S9iyNoRKk9f2GdANLc0B9WI
	QqaNfEoXalfeXv/h0G364X0qWCyRgSQsSBu+nf//rc54uspGoUhco5sfOaPU6LxB/L8x
	2r197KH2YJOo5N1Xb4HceVWqR5mfZ4ix2vkeOx0MB++OGeY0bpF9IfhHj0whtY7czOB9
	FX89T+MuPV9MSLp9XNQxP61U9m6OebDmQWqOFB7IAP4pHdB2LcBXkQohlptUE4RtJ2Iz
	JeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CxYMrp84Aow8DABf6Xto6WiKfhsct4Uk4zNpEGIVXZ4=;
	b=Rq2COmYLU13YiZKCiwPHQKiOqhCvlsFiBV1arNapcegYYGE4dKEl9QEfvvPI11gE+i
	dMSOYPbfKCWS8fpSvTKk1nYhrvs7YvVHwH5ve/JPjpNRIdGHsgEic09KEcUBFC7Qphkl
	o7mEthvzoKvDBDIwBSHeNH1lYZz186A8aNpGaenQaWzMAWimuqbyqZDL1PRdT3U1e/CK
	X91jdut6Xr1RfkkZ1F+Osu2JuWwCYeycYE8DchmD4MaKFiTot1ywxs/jPVYrtgZiYRo8
	fWIgMC2iP6XKxQMSxo61lU6dbTOE/qt/9rYXN1+4briMCKJVo7B0H1tO9SF+AhCJR2LB
	pvjg==
X-Gm-Message-State: AIkVDXIHN1USvzEeW428ygBfft0TApTb7N8nrCK626KEjdzbWp3kzxWYOqZeDbXf5yjFxFPvavN8ZMUaM1guiQ==
X-Received: by 10.28.18.194 with SMTP id 185mr2749856wms.124.1484323585526;
	Fri, 13 Jan 2017 08:06:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Fri, 13 Jan 2017 08:06:25 -0800 (PST)
In-Reply-To: <1482166593-14228-1-git-send-email-armccurdy@gmail.com>
References: <1482166593-14228-1-git-send-email-armccurdy@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 13 Jan 2017 17:06:25 +0100
Message-ID: <CA+chaQeef99dR4hF4psmfncu_yO3=ZhxYS8812Sy4acLoJzvLQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH v2] rapidjson: add initial recipe
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
X-List-Received-Date: Fri, 13 Jan 2017 16:06:27 -0000
Content-Type: text/plain; charset=UTF-8

Fails to build here with:

rapidjson/1.0.2-r0/git/test/unittest/unittest.h
<https://anaconda.lgsvl.com/jenkins/job/webos-pro-jansa-master-test-dependencies-qemux86/ws/build/BUILD/work/qemux86-webos-linux/rapidjson/1.0.2-r0/git/test/unittest/unittest.h>>:92:83:
error: throw will always call terminate() [-Werror=terminate]
|  #define RAPIDJSON_ASSERT(x) if (!(x)) throw
AssertException(RAPIDJSON_STRINGIFY(x))
|

On Mon, Dec 19, 2016 at 5:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

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
> index 0000000..1a9abc8
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

