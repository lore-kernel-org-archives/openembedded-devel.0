Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1424C77290
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 14:08:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g23so18888957wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=NZjbBWD26w70zx9mHb5T+WBX8XjET/6Y5Br2KEuBicE=;
	b=bmEfIb9xROrXpCQ1/U2KjjPGfXrU2t3FjlS0pUnrJ8y2Nnu51feFntfGxoxT2s75Q0
	K7w5RoNJEcHpqpcbbI1wbwu6Ejkv8nvk78v4PZPYj99Pz7wRutMYbNLTQrrUboizaalP
	pA4tJhILPkz+V+sl/JZh4Mw69F+IgbTwWcpppbBW+uMuhKTB2XZDuTilVpsaHWNsekGH
	gsgAu+ke61q0rg/MQnhnASpfAS0uRY2NKxmEiwXux41HNyTBRCJ3kGpKoFa7xZvmISZf
	2LyFmgr2dolJj3Mwpc5XZrG5rXOhWZ0GNo2N9rWwCJKFDGmR17ZU+GmQrYcpCOXMh4js
	1idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=NZjbBWD26w70zx9mHb5T+WBX8XjET/6Y5Br2KEuBicE=;
	b=XvAnLz/VaP7ZJYcRDdovzAyBHeIdUMJdj/sRr1sVmJWOldpnXn/BNJy2A4jQppFnnb
	Ij8AziNBCtkRHdE/JjQXFDyJp9IYdx4D1JGYsrbPpq83ooKz7fCcDjn0ulzrAMYdzyVP
	FNuc36b25RTtaph3vtqw11dNDp16qenDf8V1gXD2UZXGY3EijzU3EA4p02T/+p6sKcTw
	n7L0o46VnvinlSYblDuBj4/E9/iSbT3yPuE/0V4rIUUTFwZmKnBzRttGD15/jLWkJcKX
	EgJkjr65PpAz8dPT2iv6k5fb4YgX8iunnJrTHhqypXqlEbccRaAQqcvDafzTdMaE1/XV
	g50A==
X-Gm-Message-State: AIkVDXIj5OSPu4QHBJTtOXY7Y1K1zGJ953Ou7vgHSLjp07wpAR3akt5tA7myZu85PJ4rtnmn3BQC0l+Zy1IW9w==
X-Received: by 10.28.157.137 with SMTP id g131mr12749934wme.29.1482156514510; 
	Mon, 19 Dec 2016 06:08:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 06:08:33 -0800 (PST)
In-Reply-To: <CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 06:08:33 -0800
Message-ID: <CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 19 Dec 2016 14:08:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Please don't use github archives.
>
> On Mon, Dec 19, 2016 at 1:01 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> A fast JSON parser/generator for C++ with both SAX/DOM style API.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  .../Fix-gcc-strict-overflow-warning.patch          | 30
>> ++++++++++++++++++++
>>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 33
>> ++++++++++++++++++++++
>>  .../recipes-devtools/rapidjson/rapidjson_1.0.2.bb  | 23 +++++++++++++++
>>  3 files changed, 86 insertions(+)
>>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
>> strict-overflow-warning.patch
>>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
>> march-native-from-CMAKE_CXX_FLAGS.patch
>>  create mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>>
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
>> b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
>> strict-overflow-warning.patch
>> new file mode 100644
>> index 0000000..6ce3933
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-
>> strict-overflow-warning.patch
>> @@ -0,0 +1,30 @@
>> +From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
>> +From: Milo Yip <miloyip@gmail.com>
>> +Date: Wed, 2 Mar 2016 01:01:17 +0800
>> +Subject: [PATCH] Fix gcc strict-overflow warning
>> +
>> +Fix #566 #568
>> +
>> +Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
>> +
>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> +---
>> + include/rapidjson/internal/dtoa.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/include/rapidjson/internal/dtoa.h
>> b/include/rapidjson/internal/dtoa.h
>> +index 2d8d2e4..15571e1 100644
>> +--- a/include/rapidjson/internal/dtoa.h
>> ++++ b/include/rapidjson/internal/dtoa.h
>> +@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
>> + inline char* Prettify(char* buffer, int length, int k) {
>> +     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
>> +
>> +-    if (length <= kk && kk <= 21) {
>> ++    if (0 <= k && kk <= 21) {
>> +         // 1234e7 -> 12340000000
>> +         for (int i = length; i < kk; i++)
>> +             buffer[i] = '0';
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
>> march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/
>> rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
>> new file mode 100644
>> index 0000000..1716428
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-
>> march-native-from-CMAKE_CXX_FLAGS.patch
>> @@ -0,0 +1,33 @@
>> +From 827155e5e659b2a5065b00d701bc59b57feab2bf Mon Sep 17 00:00:00 2001
>> +From: Andre McCurdy <armccurdy@gmail.com>
>> +Date: Mon, 19 Dec 2016 01:37:11 -0800
>> +Subject: [PATCH] remove -march=native from CMAKE_CXX_FLAGS
>> +
>> +Not appropriate when cross compiling.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> +---
>> + CMakeLists.txt | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 68139ba..cae7c9b 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
>> + endif()
>> +
>> + if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
>> +-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
>> ++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
>> + elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
>> +-    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
>> ++    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
>> + elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
>> +     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
>> + endif()
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>> b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>> new file mode 100644
>> index 0000000..1dcd8e0
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style
>> API"
>> +HOMEPAGE = "http://rapidjson.org/"
>> +SECTION = "libs"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970c
>> d2"
>> +
>> +SRC_URI = "https://github.com/miloyip/rapidjson/archive/v${PV}.tar.gz \
>> +           file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
>> +           file://Fix-gcc-strict-overflow-warning.patch \
>> +"
>> +
>> +SRC_URI[md5sum] = "97cc60d01282a968474c97f60714828c"
>> +SRC_URI[sha256sum] = "c3711ed2b3c76a5565ee9f0128bb4e
>> c6753dbcc23450b713842df8f236d08666"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF"
>> +
>> +# RapidJSON is a header-only C++ library, so the main package will be
>> empty.
>> +
>> +FILES_${PN}-dev += "${libdir}/cmake"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

