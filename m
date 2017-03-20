Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0E160685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 21:39:39 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so20070181wrg.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8CRDmB9Et6bK2F7nQn6yq7w2kdF9DlfBi1VeFFfpf+0=;
	b=Y7wYBScGkQTd+kL61yMwo6uYclczLqZ/J+pm7UmAi1ZGlw+623+PBrY7x8M2Ikfs29
	HFEw6Z/UqAL/6WNSxpxeDcQ7YhVnd+KjrD3zk6QQ8pqfWCx5j6JHrPZjZw7QvTrpApYD
	ID0kNG5t1+dSOT5P0wsJ+9Rzb9btvFPU+b7qwUEr0StR1gaFrchLtOFqt+U1yZFmC0ym
	U7LnfiHbrnSqE6bCqqq8z9Uu+Skm633/LRQ0byc6xMDPiHeQRoz1pQJcqJ8yMBnkmOUs
	L4XJBiquntBt0228JA6YJ/iWqxIbAEJrmJNgnDaMZbwoeKA8viVOzdeu4v5TP2p2HG6b
	cZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8CRDmB9Et6bK2F7nQn6yq7w2kdF9DlfBi1VeFFfpf+0=;
	b=e6OZgpBUzcz67fUZJG/duLaZqb7/+IvR/PGyBtrv7jqXJ3Y4V3cgpPKhMfMJHEGdIK
	jlGecjLvITjyhWGgVpUmEm3yiU9/m0oPesrBRCFgUUVpIdTfMIe+KxmspNR6c0gDSRlm
	HGeQQ1bc2QRgz11dYaw7qRffSk+8/eCr5y04JG0+BKi/pk77K4Shh9tciieMa1cpabae
	I+XSsjYMo5X3AUSWO8sNlfMkncqa9BYcPj527xAibZGcrik+2/v7aYEFeJcMw0wdWBJ0
	frbxWlWjhVNyNmWTuEGg2nU+LEvGKdKt6h5GLnzm7/KkXVA4yV5nnOwSYbKTSAYeCoc7
	A0eQ==
X-Gm-Message-State: AFeK/H3RO+6Ui5DEQgLTMTFNFwkuZr2FPPiopvzFktCsXF/FM+vx0r5sBJU279pwDY2TLdJ5X9KTk11y5GledA==
X-Received: by 10.223.164.201 with SMTP id h9mr25864851wrb.175.1490045980122; 
	Mon, 20 Mar 2017 14:39:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Mon, 20 Mar 2017 14:39:09 -0700 (PDT)
In-Reply-To: <CAJ86T=VauVPqXpuEukNa52uxBj9XbMac8wmErsQ16iV2fVD12w@mail.gmail.com>
References: <20170320053152.29352-1-raj.khem@gmail.com>
	<20170320053152.29352-2-raj.khem@gmail.com>
	<CAJ86T=VauVPqXpuEukNa52uxBj9XbMac8wmErsQ16iV2fVD12w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Mar 2017 14:39:09 -0700
Message-ID: <CAMKF1so39ssEyVdO1acWHxqKtKTjchfLb1s8pCQ8YWLZWyYBCg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Mon, 20 Mar 2017 21:39:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 20, 2017 at 2:30 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Sun, Mar 19, 2017 at 10:31 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Drop backports
>> Adjust the license checksums to match the changes to file especially
>>
>> https://github.com/miloyip/rapidjson/commit/b4b1a39937fbd168ef72ea477f90f626773d56fc
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../Fix-gcc-strict-overflow-warning.patch          | 30 ----------------
>>  .../remove-march-native-from-CMAKE_CXX_FLAGS.patch | 41 +++++++++++++---------
>>  .../{rapidjson_1.0.2.bb => rapidjson_git.bb}       |  9 ++---
>>  3 files changed, 29 insertions(+), 51 deletions(-)
>>  delete mode 100644 meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
>>  rename meta-oe/recipes-devtools/rapidjson/{rapidjson_1.0.2.bb => rapidjson_git.bb} (73%)
>>
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
>> deleted file mode 100644
>> index 6ce3933ce..000000000
>> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson/Fix-gcc-strict-overflow-warning.patch
>> +++ /dev/null
>> @@ -1,30 +0,0 @@
>> -From f5560d9557ee48fb79810180ddfd3ec386e2a7b5 Mon Sep 17 00:00:00 2001
>> -From: Milo Yip <miloyip@gmail.com>
>> -Date: Wed, 2 Mar 2016 01:01:17 +0800
>> -Subject: [PATCH] Fix gcc strict-overflow warning
>> -
>> -Fix #566 #568
>> -
>> -Upstream-Status: Backport [Partial merge of upstream commit 928caf92e]
>> -
>> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ----
>> - include/rapidjson/internal/dtoa.h | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/include/rapidjson/internal/dtoa.h b/include/rapidjson/internal/dtoa.h
>> -index 2d8d2e4..15571e1 100644
>> ---- a/include/rapidjson/internal/dtoa.h
>> -+++ b/include/rapidjson/internal/dtoa.h
>> -@@ -148,7 +148,7 @@ inline char* WriteExponent(int K, char* buffer) {
>> - inline char* Prettify(char* buffer, int length, int k) {
>> -     const int kk = length + k;  // 10^(kk-1) <= v < 10^kk
>> -
>> --    if (length <= kk && kk <= 21) {
>> -+    if (0 <= k && kk <= 21) {
>> -         // 1234e7 -> 12340000000
>> -         for (int i = length; i < kk; i++)
>> -             buffer[i] = '0';
>> ---
>> -1.9.1
>> -
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
>> index 17164283c..cf3e16ea5 100644
>> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
>> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson/remove-march-native-from-CMAKE_CXX_FLAGS.patch
>> @@ -12,22 +12,29 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>   CMakeLists.txt | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> -diff --git a/CMakeLists.txt b/CMakeLists.txt
>> -index 68139ba..cae7c9b 100644
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -26,9 +26,9 @@ if(RAPIDJSON_HAS_STDSTRING)
>> - endif()
>> +Index: git/CMakeLists.txt
>> +===================================================================
>> +--- git.orig/CMakeLists.txt
>> ++++ git/CMakeLists.txt
>> +@@ -51,10 +51,10 @@ endif(CCACHE_FOUND)
>>
>>   if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
>> --    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
>> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
>> - elseif (CMAKE_CXX_COMPILER_ID MATCHES "Clang")
>> --    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native -Wall -Wextra")
>> -+    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra")
>> - elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
>> -     add_definitions(-D_CRT_SECURE_NO_WARNINGS=1)
>> - endif()
>> ---
>> -1.9.1
>> -
>> +     if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "powerpc" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64" OR ${CMAKE_SYSTEM_PROCESSOR} STREQUAL "ppc64le")
>> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
>> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
>> +     else()
>> +       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
>> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
>> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
>> +     endif()
>> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")
>> +     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wsign-conversion)
>> +@@ -84,7 +84,7 @@ elseif (CMAKE_CXX_COMPILER_ID MATCHES "C
>> +       set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=native")
>> +     else()
>> +       #FIXME: x86 is -march=native, but doesn't mean every arch is this option. To keep original project's compatibility, I leave this except POWER.
>> +-      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=native")
>> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
>> +     endif()
>> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror -Wno-missing-field-initializers")
>> +     set(EXTRA_CXX_FLAGS -Weffc++ -Wswitch-default -Wfloat-equal -Wconversion -Wimplicit-fallthrough -Weverything)
>> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
>> similarity index 73%
>> rename from meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>> rename to meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
>> index dd6b89698..4cded0720 100644
>> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_1.0.2.bb
>> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
>> @@ -2,20 +2,21 @@ SUMMARY = "A fast JSON parser/generator for C++ with both SAX/DOM style API"
>>  HOMEPAGE = "http://rapidjson.org/"
>>  SECTION = "libs"
>>  LICENSE = "MIT"
>> -LIC_FILES_CHKSUM = "file://license.txt;md5=cff54e417a17b4b77465198254970cd2"
>> +LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
>>
>>  SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
>>             file://remove-march-native-from-CMAKE_CXX_FLAGS.patch \
>> -           file://Fix-gcc-strict-overflow-warning.patch \
>>  "
>>
>> -SRCREV = "3d5848a7cd3367c5cb451c6493165b7745948308"
>> +SRCREV = "e5635fb27feab7f6e8d7b916aa20ad799045a641"
>> +
>> +PV = "1.1.0+git${SRCPV}"
>>
>>  S = "${WORKDIR}/git"
>>
>>  inherit cmake
>>
>> -EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF"
>> +EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
>
> Did you see an issue building the examples?
>

yes, they do not build for musl, I disabled it in general to keep
metadata common

> If the examples aren't built then
> remove-march-native-from-CMAKE_CXX_FLAGS.patch can be dropped.

>>  # RapidJSON is a header-only C++ library, so the main package will be empty.
>>
>> --
>> 2.12.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

