Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D54771CB3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 15:47:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b198so6625638qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 08:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ivy9gtvoT8cgQk/f/yfQAd5nPdejypVf5PyjtML2OXw=;
	b=P1uTSnZ3cDUqWm1aew2ygGyzhppLboAbUc9pMIadOJXIDXD3UXZ6g6+jHd+QwUVDlR
	GAlYVI2mUQC/KJch8DUhvevJwWfMEj9mSB7Cjunk2a3ymizWrbqwlVM7MqfajQd7m6cc
	Vn1sxoEEf5LbB7Ux6nUy6hHdbRRcKLxSGfi2U9DgPbp3bXg38AXjrGzSL5evQInEhRqY
	8nbfHoLmm+ctrhShR8aWJ1QiEAlDb+kXTKX+j7ICQKiszV4wzFBMq1hgfhuj9R+2LjFJ
	oL2qGY7JeacqGbnlm73gPQjz0dLIz5k0qt6PzQ+gDMBtqOLDFjtl7Y9xFssxxkCY5IyD
	rqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ivy9gtvoT8cgQk/f/yfQAd5nPdejypVf5PyjtML2OXw=;
	b=A+UHpvwOXradAovrANE3UmnEyrCbI4VmAPtbAdXyBdxT1IX9Hi82BItUm4hopg1Hvn
	IkFj1QO8hhviNTIoDrBhf3Huglqq22uSEjuUTnpFYFIFIwmqri4xUhsIjkWOdC2ZZljs
	PrGK98EgoAs0YvMIS18ebiOOAttJXf0rECIrwRPDfAX1JXIVwMJkPbR6dEosZcN5QH0p
	tioSocmhVv2IEJs6gXiY/Sc/6UxdS5kWZb1N96yQdESBf9zCWmTEKQzJu3hWdbMMYIVr
	NVHug6BoRla99vrx8GTTWOaEDiCNtW97MNT5xazsXgFASDkND2RjO3O9j25F3b44AMFO
	S2aw==
X-Gm-Message-State: ALQs6tCu0RX+aD8iCuDJS7Ydu6HmGNqbT6/zPvap/k8GF/kNU1AwWJAa
	8fuXkRATt5oCp64R2aMvK2tPsA==
X-Google-Smtp-Source: AIpwx48e2Oi6KN7lbTCrbFmS+AF166tlOBF9cCEon5gXy3/ZP+B3oH0X8Tu1tVJIY274tgCZYgdl+g==
X-Received: by 10.55.212.18 with SMTP id l18mr44389918qki.5.1523202451590;
	Sun, 08 Apr 2018 08:47:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	q100sm11860137qkh.43.2018.04.08.08.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 08:47:31 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
	<1523170729-26321-20-git-send-email-akuster808@gmail.com>
	<4eea1fd1-1c41-ad76-b158-c7831499bc9c@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <aa0c958a-1ece-8db1-9bdb-14ef5ddcca0b@gmail.com>
Date: Sun, 8 Apr 2018 08:47:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <4eea1fd1-1c41-ad76-b158-c7831499bc9c@intel.com>
Subject: Re: [meta-oe][PATCH 20/37] libdbus-c++: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 15:47:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/08/2018 01:12 AM, Anuj Mittal wrote:
> On 04/08/2018 02:58 PM, Armin Kuster wrote:
>> WARNING:
>> Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
>> The context lines in the patches can be updated with devtool:
>>
>>     devtool modify <recipe>
>>     devtool finish --force-patch-refresh <recipe> <layer_path>
>>
>> Then the updated patches and the source tree (in devtool's workspace)
>> should be reviewed to make sure the patches apply in the correct place
>> and don't introduce duplicate lines (which can, and does happen
>> when some of the context is ignored). Further information:
>> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
>> Details:
>> checking file include/dbus-c++/eventloop-integration.h
>> Hunk #1 succeeded at 26 with fuzz 2 (offset -1 lines).
>>
>> and others
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../0001-pipe.c-Use-a-string-instead-of-char.patch |  6 ++----
>>  ...op.cpp-use-portable-method-for-initializi.patch | 10 +--------
>>  ...ate_proxy.cpp-avoid-possibly-undefined-ui.patch | 10 +--------
>>  ...efined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch | 10 +--------
>>  ...04-use-POSIX-poll.h-instead-of-sys-poll.h.patch | 16 +++++++-------
>>  .../fix-missing-unistd.h-include.patch             | 20 ++++++++---------
>>  .../remove-CXX_FOR_BUILD-stuff.patch               | 25 +++++++++++++++-------
>>  7 files changed, 39 insertions(+), 58 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
>> index 6883f9a..b98e6ec 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
>> @@ -1,4 +1,4 @@
>> -From 6bcb58bd69c38b9200e8ec6c382247167571189d Mon Sep 17 00:00:00 2001
>> +From 1a37e254562cd1c254ccd1dd25d44578588dd039 Mon Sep 17 00:00:00 2001
>>  From: Khem Raj <raj.khem@gmail.com>
>>  Date: Sat, 1 Jul 2017 16:44:15 -0700
>>  Subject: [PATCH] pipe.c: Use a string instead of char
>> @@ -7,6 +7,7 @@ Fixes
>>  error: invalid conversion from 'char' to 'const void*' [-fpermissive]
>>  
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>>  ---
>>   src/pipe.cpp | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> @@ -22,6 +23,3 @@ index 45c2ba6..1303c2d 100644
>>  -  ::write(_fd_write, '\0', 1);
>>  +  ::write(_fd_write, "", 1);
>>   }
>> --- 
>> -2.13.2
>> -
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
>> index eed84e4..d97249a 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-src-eventloop.cpp-use-portable-method-for-initializi.patch
>> @@ -1,15 +1,10 @@
>> -From 93fd4868d71aa7a26cdfd382d1e4c85112f069f9 Mon Sep 17 00:00:00 2001
>> +From 6443d4a5d2a636a9c76a0ed21b31b1465c6950d6 Mon Sep 17 00:00:00 2001
>>  From: Peter Williams <peter@newton.cx>
>>  Date: Sat, 19 Dec 2015 21:07:37 -0500
>>  Subject: [PATCH] src/eventloop.cpp: use portable method for initializing
>>   recursive mutex
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>>  
>>  ---
>> -Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/cdaeaa825db191bd65aad3aaaeb3178738727f05]
>> -Signed-off-by: André Draszik <adraszik@tycoint.com>
> This refresh with devtool is unfortunately removing this useful
> information from this patch.
thanks for the feedback. v2 shortly.

- armin
>>   src/eventloop.cpp | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>  
>> @@ -31,6 +26,3 @@ index 7fb06a3..f622812 100644
>>     }
>>     else
>>     {
>> --- 
>> -2.10.2
>> -
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
>> index 65cd939..8725be9 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch
>> @@ -1,15 +1,10 @@
>> -From c673a76857cbe0ca82fa11aea9b70f94c3e5b041 Mon Sep 17 00:00:00 2001
>> +From c9fdcd2d93acdc68062aa408b0e949ebaa3d71cf Mon Sep 17 00:00:00 2001
>>  From: Peter Williams <peter@newton.cx>
>>  Date: Sat, 19 Dec 2015 21:08:46 -0500
>>  Subject: [PATCH] tools/generate_proxy.cpp: avoid possibly undefined 'uint'
>>   type
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>>  
>>  ---
>> -Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/43f119a2b3fe951c0f1d88cc61170d4c81a88880]
>> -Signed-off-by: André Draszik <adraszik@tycoint.com>
> Same here.
>
>>   tools/generate_proxy.cpp | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>  
>> @@ -53,6 +48,3 @@ index bf1094a..ebb75fa 100644
>>           }
>>   
>>           if (arg_object.length())
>> --- 
>> -2.10.2
>> -
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
>> index f69cefd..a6767a4 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch
>> @@ -1,14 +1,9 @@
>> -From 465d98dbcdcb72375c198010a50b80b953e7d5a6 Mon Sep 17 00:00:00 2001
>> +From c792eec913e76c98badde5760eb8d598c940490a Mon Sep 17 00:00:00 2001
>>  From: Yuri <yuri@tsoft.com>
>>  Date: Sat, 28 May 2016 13:20:10 -0700
>>  Subject: [PATCH] Fixed undefined ssize_t for clang-3.8.0 on FreeBSD.
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>>  
>>  ---
>> -Upstream-Status: Backport [https://github.com/andreas-volz/dbus-cplusplus/commit/463f5a4400d494b831c3b3348c0a21f0faf14f39]
>> -Signed-off-by: André Draszik <adraszik@tycoint.com>
>>   include/dbus-c++/pipe.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>  
>> @@ -25,6 +20,3 @@ index 999f042..682646c 100644
>>   namespace DBus
>>   {
>>   
>> --- 
>> -2.10.2
>> -
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
>> index 0c2c487..08e0d1f 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch
>> @@ -1,4 +1,4 @@
>> -From 12de53b0f24c478ea4ff6b4e2c55366dbd2f02b1 Mon Sep 17 00:00:00 2001
>> +From 68907973adf98087aa27f01a38235402b16073b2 Mon Sep 17 00:00:00 2001
>>  From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
>>  Date: Fri, 25 Nov 2016 09:33:20 +0000
>>  Subject: [PATCH] use POSIX poll.h instead of sys/poll.h
>> @@ -6,6 +6,10 @@ MIME-Version: 1.0
>>  Content-Type: text/plain; charset=UTF-8
>>  Content-Transfer-Encoding: 8bit
>>  
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>>  POSIX specifies that <poll.h> is the correct header to
>>  include for poll()
>>    http://pubs.opengroup.org/onlinepubs/009695399/functions/poll.html
>> @@ -25,16 +29,15 @@ compiling against the musl C-library such as:
>>  |   ^~~~~~~
>>  
>>  Signed-off-by: André Draszik <git@andred.net>
>> +
>>  ---
>> -Upstream-Status: Submitted [https://github.com/andreas-volz/dbus-cplusplus/pull/3]
>> -Signed-off-by: André Draszik <adraszik@tycoint.com>
>>   src/eventloop-integration.cpp | 2 +-
>>   src/eventloop.cpp             | 2 +-
>>   src/pipe.cpp                  | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>  
>>  diff --git a/src/eventloop-integration.cpp b/src/eventloop-integration.cpp
>> -index 5776971..271b503 100644
>> +index 0cc65c3..1c57cd8 100644
>>  --- a/src/eventloop-integration.cpp
>>  +++ b/src/eventloop-integration.cpp
>>  @@ -36,7 +36,7 @@
>> @@ -44,8 +47,8 @@ index 5776971..271b503 100644
>>  -#include <sys/poll.h>
>>  +#include <poll.h>
>>   #include <fcntl.h>
>> - #include <unistd.h>
>>   
>> + using namespace DBus;
>>  diff --git a/src/eventloop.cpp b/src/eventloop.cpp
>>  index f622812..7790e1e 100644
>>  --- a/src/eventloop.cpp
>> @@ -72,6 +75,3 @@ index 01211b3..45c2ba6 100644
>>   #include <fcntl.h>
>>   #include <errno.h>
>>   #include <cassert>
>> --- 
>> -2.10.2
>> -
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
>> index 903a720..3e9ad75 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/fix-missing-unistd.h-include.patch
>> @@ -1,13 +1,12 @@
>> +From 5abd60e2ef701dde2b75272cf89b93123ff54323 Mon Sep 17 00:00:00 2001
>> +From: Han Shen <shenhan@google.com>
>> +Date: Thu, 31 May 2012 16:49:35 -0700
>> +Subject: [PATCH] Fixed dbus-c++ gcc 4.7 building problem.
>>  
>>  sniped from ChromiumOS
>>  
>>  https://bugs.gentoo.org/424707
>>  
>> -From 154f7861d19a2bd5c79c488f9989610971db451b Mon Sep 17 00:00:00 2001
>> -From: Han Shen <shenhan@google.com>
>> -Date: Thu, 31 May 2012 16:49:35 -0700
>> -Subject: [PATCH] Fixed dbus-c++ gcc 4.7 building problem.
>> -
>>  Just add "unistd.h" inclusion to eventloop-integration.h.
>>  
>>  BUG=None
>> @@ -20,21 +19,20 @@ Reviewed-by: Yunlian Jiang <yunlian@chromium.org>
>>  Commit-Ready: Han Shen <shenhan@chromium.org>
>>  Upstream-Status: Inappropriate [ not author, no upstream ]
>>  Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
>> +
>>  ---
>> - include/dbus-c++/eventloop-integration.h |    1 +
>> + include/dbus-c++/eventloop-integration.h | 1 +
>>   1 file changed, 1 insertion(+)
>>  
>>  diff --git a/include/dbus-c++/eventloop-integration.h b/include/dbus-c++/eventloop-integration.h
>> -index 5108340..1b56ab5 100644
>> +index 1b0302e..3e44304 100644
>>  --- a/include/dbus-c++/eventloop-integration.h
>>  +++ b/include/dbus-c++/eventloop-integration.h
>> -@@ -27,6 +27,7 @@
>> +@@ -26,6 +26,7 @@
>> + #define __DBUSXX_EVENTLOOP_INTEGRATION_H
>>   
>> - #include <cstring>
>>   #include <errno.h>
>>  +#include <unistd.h>
>>   #include "api.h"
>>   #include "dispatcher.h"
>>   #include "util.h"
>> --- 
>> -1.7.9.7
>> diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
>> index fa29d3c..c2bbe91 100644
>> --- a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
>> +++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/remove-CXX_FOR_BUILD-stuff.patch
>> @@ -1,16 +1,24 @@
>> +From 43dff44cbb30799dbd3291c3560b30446605aed9 Mon Sep 17 00:00:00 2001
>>  From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
>>  Date: Fri, 18 Nov 2016 10:23:07 +0100
>> -Subject: Build libdbus-c++ tools for target platform rather than enforced for
>> +Subject: [PATCH] Build libdbus-c++ tools for target platform rather than
>> + enforced for
>> +
>>  host platform.
>>  
>>  Upstream-Status: Inappropriate [no upstream]
>>  Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
>> +
>>  ---
>> + configure.ac      | 3 ---
>> + tools/Makefile.am | 2 --
>> + 2 files changed, 5 deletions(-)
>>  
>> -diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
>> ---- libdbus-c++-0.9.0.ori/configure.ac	2016-11-15 14:25:36.085882774 +0100
>> -+++ libdbus-c++-0.9.0/configure.ac	2016-11-15 14:27:08.814568717 +0100
>> -@@ -64,9 +64,6 @@
>> +diff --git a/configure.ac b/configure.ac
>> +index f487786..8e05fb1 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -64,9 +64,6 @@ AC_LANG_CPLUSPLUS
>>   AC_PROG_CC
>>   AC_PROG_CXX
>>   
>> @@ -20,9 +28,10 @@ diff -Naur libdbus-c++-0.9.0.ori/configure.ac libdbus-c++-0.9.0/configure.ac
>>   AM_PROG_LIBTOOL
>>   
>>   PKG_PROG_PKG_CONFIG
>> -diff -Naur libdbus-c++-0.9.0.ori/tools/Makefile.am libdbus-c++-0.9.0/tools/Makefile.am
>> ---- libdbus-c++-0.9.0.ori/tools/Makefile.am	2016-11-15 14:25:36.089882803 +0100
>> -+++ libdbus-c++-0.9.0/tools/Makefile.am	2016-11-15 14:26:19.454203583 +0100
>> +diff --git a/tools/Makefile.am b/tools/Makefile.am
>> +index c025cd1..85df1f5 100644
>> +--- a/tools/Makefile.am
>> ++++ b/tools/Makefile.am
>>  @@ -1,7 +1,5 @@
>>   # hacky, but ...
>>   
>>


