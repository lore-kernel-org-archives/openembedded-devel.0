Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D71497469C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 08:22:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6K8MHi4000446
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Jul 2018 01:22:18 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Fri, 20 Jul 2018 01:22:17 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1531980780-138112-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spShdTYnsMubxu=nGSOcZSk9mcD4JeK512Rgm+MmUgryQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <4001df0b-edea-9ee4-be1a-0f10d1469b06@windriver.com>
Date: Fri, 20 Jul 2018 16:22:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spShdTYnsMubxu=nGSOcZSk9mcD4JeK512Rgm+MmUgryQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] protobuf: upgrade 3.5.1 -> 3.6.0.1
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
X-List-Received-Date: Fri, 20 Jul 2018 08:22:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 07/20/2018 01:12 AM, Khem Raj wrote:
> On Wed, Jul 18, 2018 at 11:13 PM <changqing.li@windriver.com> wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> License-Update: copyright year updated and clean some useless content
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   .../0001-protobuf-fix-configure-error.patch        | 33 ++++++++++++++++++++++
>>   .../{protobuf_3.5.1.bb => protobuf_3.6.0.1.bb}     | 14 ++++++---
>
> my host has gcc8 and it failed to build native version
> NOTE: Running task 13158 of 33598
> (virtual:native:/mnt/a/oe/sources/meta-openembedded/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb:do_compile)
> |                                ^
> |    vector<pair<string, string> > options;
> |                      ^
> | ../git/protoc-c/c_generator.cc:108:29: error: expected
> primary-expression before ‘>’ token
> |    vector<pair<string, string> > options;
> |                              ^
> | ../git/protoc-c/c_generator.cc:108:31: error: expected
> primary-expression before ‘>’ token
> |    vector<pair<string, string> > options;
> |                                ^
> | ../git/protoc-c/c_generator.cc:108:33: error: ‘options’ was not
> declared in this scope
> |    vector<pair<string, string> > options;
> |                                  ^~~~~~~
> | ../git/protoc-c/c_generator.cc:152:5: error: ‘scoped_ptr’ was not
> declared in this scope
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |      ^~~~~~~~~~
> | ../git/protoc-c/c_generator.cc:152:5: note: suggested alternative:
> ‘sched_param’
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |      ^~~~~~~~~~
> |      sched_param
> | ../git/protoc-c/c_generator.cc:152:40: error: expected
> primary-expression before ‘>’ token
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                         ^
> | ../git/protoc-c/c_generator.cc:152:42: error: ‘output’ was not
> declared in this scope
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                           ^~~~~~
> | ../git/protoc-c/c_generator.cc:152:42: note: suggested alternative: ‘getpt’
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                           ^~~~~~
> |                                           getpt
> | ../git/protoc-c/c_generator.cc:160:5: error: ‘scoped_ptr’ was not
> declared in this scope
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |      ^~~~~~~~~~
> | ../git/protoc-c/c_generator.cc:160:5: note: suggested alternative:
> ‘sched_param’
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |      ^~~~~~~~~~
> |      sched_param
> | ../git/protoc-c/c_generator.cc:160:40: error: expected
> primary-expression before ‘>’ token
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                         ^
> | ../git/protoc-c/c_generator.cc:160:42: error: ‘output’ was not
> declared in this scope
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                           ^~~~~~
> | ../git/protoc-c/c_generator.cc:160:42: note: suggested alternative: ‘getpt’
> |      scoped_ptr<io::ZeroCopyOutputStream> output(
> |                                           ^~~~~~
> |                                           getpt
> | make: *** [Makefile:1497: protoc-c/protoc_gen_c-c_primitive_field.o] Error 1
> | make: *** [Makefile:1441: protoc-c/protoc_gen_c-c_generator.o] Error 1
> | ERROR: oe_runmake failed

I have send a patch for protobuf-c to fix this problem and have cc to 
you. Thanks.

//sandy
>
>>   2 files changed, 43 insertions(+), 4 deletions(-)
>>   create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch
>>   rename meta-oe/recipes-devtools/protobuf/{protobuf_3.5.1.bb => protobuf_3.6.0.1.bb} (86%)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch
>> new file mode 100644
>> index 0000000..a2f7a4b
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-protobuf-fix-configure-error.patch
>> @@ -0,0 +1,33 @@
>> +From 52959e8e01e39139d18f752e97283e45b4b7a426 Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 18 Jul 2018 17:52:34 +0800
>> +Subject: [PATCH] protobuf: fix configure error
>> +
>> +fix below error:
>> +gnu-configize: 'configure.ac' or 'configure.in' is required
>> +
>> +third_party/googletest is git submodule of protobuf. Above error
>> +caused by missing submodule googletest.
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + configure.ac | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/configure.ac b/configure.ac
>> +index aec10cf..7fbe57d 100644
>> +--- a/configure.ac
>> ++++ b/configure.ac
>> +@@ -214,7 +214,6 @@ AX_CXX_COMPILE_STDCXX([11], [noext], [mandatory])
>> + #   too.
>> + export CFLAGS
>> + export CXXFLAGS
>> +-AC_CONFIG_SUBDIRS([third_party/googletest])
>> +
>> + AC_CONFIG_FILES([Makefile src/Makefile benchmarks/Makefile conformance/Makefile protobuf.pc protobuf-lite.pc])
>> + AC_OUTPUT
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
>> similarity index 86%
>> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
>> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
>> index 8cef391..5850744 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.5.1.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.6.0.1.bb
>> @@ -5,18 +5,19 @@ all of its internal RPC protocols and file formats."
>>   HOMEPAGE = "https://github.com/google/protobuf"
>>   SECTION = "console/tools"
>>   LICENSE = "BSD-3-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=35953c752efc9299b184f91bef540095"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>>
>>   DEPENDS = "zlib"
>>   DEPENDS_append_class-target = " protobuf-native"
>>
>>   PV .= "+git${SRCPV}"
>> -SRCREV = "106ffc04be1abf3ff3399f54ccf149815b287dd9"
>>
>> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.5.x \
>> +SRCREV = "ce044817c7ba0aea27c3fd8e496635d94d20a755"
>> +
>> +SRC_URI = "git://github.com/google/protobuf.git;branch=3.6.x \
>>              file://run-ptest \
>> +           file://0001-protobuf-fix-configure-error.patch \
>>   "
>> -
>>   S = "${WORKDIR}/git"
>>
>>   inherit autotools-brokensep pkgconfig ptest
>> @@ -82,3 +83,8 @@ RDEPENDS_${PN}-ptest = "bash python-protobuf"
>>   MIPS_INSTRUCTION_SET = "mips"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>> +
>> +LDFLAGS_append_arm = " -latomic"
>> +LDFLAGS_append_mips = " -latomic"
>> +LDFLAGS_append_powerpc = " -latomic"
>> +LDFLAGS_append_mipsel = " -latomic"
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)
+861084778653


