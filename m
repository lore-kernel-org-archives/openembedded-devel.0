Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 58DA97F83D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 15:50:12 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e15so12363553pgu.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=g65wjwWzq/qSL/Nhe6GBh4+qguKdZqssk/vy6nmDDk4=;
	b=TzSaYawgF3q8/wWXU/woVapfLA3cGDto3IuzT2oP/8Szy9wGgRuwT/nWcSs+++shy+
	r9/V0WrvWgYup+TB3o7nXH0Z2xhBa5MpeMVHUh7r2mu65Wl5hCfG6VVJx9HewlYmJACs
	WOgJRgcKM38kT3mdjoMj+WhGeYVeT5o94FzIYfWPWedcghtFZ6RsvqKZGst4WUXvmnkX
	90zuY28wCcCuboxv0ha+pcKHWIdmNDj7h6eG4o6bk+O/WyocUpesSyOL/X4w9N6d//Sz
	qJEyzWnBF3T7syKwmhNHT87DLsViJieKjyrVZk5pB947GMF2VW9lL8tf3PqgGuI48ICX
	8kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=g65wjwWzq/qSL/Nhe6GBh4+qguKdZqssk/vy6nmDDk4=;
	b=MeVdESX/YH3ta4tDB5BHejsn/UCtyTkaq8J5RZPLVUL9S4jZed/hRxAyF4LiKJVCAm
	9niixsiYcNymf/+JH97FYov9UabixrtKGPo1cSg3L0aVPov88VUNkOhr2onrcoREIsRi
	vwetg5IHbjVxBvlP37NYbPlm7JuV61PLEOG9VZJE0OGkAIJiL6AUde9v54xEWpSwqLSM
	uT6FWabpPyFqNZ8ICVpFP06Nui515SQ0H2pPoCcTeJgnpbqJIwJh4PTTdFwdQiqvEAMv
	zUU/3EVb0yvE094Pd1tAGA06OXzvB6jLC5mz8FKsWToqjcdiA/wynLczC6XO55ZihNam
	Ekww==
X-Gm-Message-State: APjAAAXGc63MELXFDovMt3tBPI5f4HkFD8fGvytrJ+lPxDXOr4PhDEr9
	kmj1TU4Z24KvariBp1PDpZypPsku
X-Google-Smtp-Source: APXvYqxrY7FANUkXpoaAXUEabm/Iu1UC2V49Sq4ApGvSYNPPAEFMr27GTgtmBt+oCFrgq3oUqCXJbg==
X-Received: by 2002:aa7:80c6:: with SMTP id a6mr11382315pfn.107.1571845813034; 
	Wed, 23 Oct 2019 08:50:13 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:d998:942e:6613:6ef4?
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	c34sm23063852pgb.35.2019.10.23.08.50.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Oct 2019 08:50:12 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20190929092956.13147-1-Qi.Chen@windriver.com>
	<20191017204414.GB1499@jama>
	<CA+chaQcpMndabwwuv+c8203ATbcwNEMJ8zjLDnqTkzkqyw4OrQ@mail.gmail.com>
	<CAMKF1sq30Y4p=7ckBc+2cQmg2-bTs9p4KG4ddOqrZibQHTCexQ@mail.gmail.com>
	<CA+chaQfNsqJJAkCXV_ZuO17mtNh4CDm7YjeuFQvh9bTTs4ad2w@mail.gmail.com>
	<20191022213718.GA2607@jama>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <afac42ea-c54b-1fd2-5b38-fcde9bf67674@gmail.com>
Date: Wed, 23 Oct 2019 08:50:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191022213718.GA2607@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Wed, 23 Oct 2019 15:50:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit



On 10/22/19 2:37 PM, Martin Jansa wrote:
> On Fri, Oct 18, 2019 at 09:06:54PM +0200, Martin Jansa wrote:
>> One more data point is that it might be fixed completely with 1.3.2 version
>> used in zeus/master and failing less often then without this patch in 1.3.1
>> used in thud/warrior.
>>
>> I was rebuilding it 300 times in thud/warrior/zeus and got 5-6 failures in
>> thud/warrior but none in zeus.
>>
>> I've started another for loop to rebuilt it 1000 time with zeus and if it
>> works then I'll retest warrior and thud with 1.3.2 upgrade backported to
>> them - if it works then we can either backport whole upgrade or check the
>> 1.3.1 1.3.2 diff to find out what else we need to backport from there.
> 1000 times in zeus = 0 failures
> 100 times in thud with 1.3.2 backported ~ 10 failures
> 1000 times in thud with 1.3.2 as well as protobuf-native 3.9.2 = 0 failures
>
> The protobuf-c upgrade isn't need to be backported to thud, there aren't
> many changes:
> https://github.com/protobuf-c/protobuf-c/compare/269771b4b45d3aba04e59569f53600003db8d9ff...1390409f4ee4e26d0635310995b516eb702c3f9e
>
> protobuf on the other hand was upgraded from 3.6.1 to 3.9.2 in zeus and
> the diff is big (1028 commits):
> https://github.com/protocolbuffers/protobuf/compare/48cb18e5c419ddd23d9badcfe4e9df7bde1979b2...52b2447247f535663ac1c292e088b4b27d2910ef
>
> quick grep in git log didn't reveal what might be causing the race
> condition, upgrading whole protobuf in warrior and thud isn't an option
> as well.
>
> Anyone interested in digging a bit deeper?
>
> I don't want to block this change, because it seems to completely fix it
> for zeus/master and partially improve it also for warrior and thud.
>
> We don't use protobuf much, so for our builds I think I'll just backport
> whole protobuf upgrade to thud once protobuf-c fix is in thud.

So is https://patchwork.openembedded.org/patch/165905/ still a go for
warrior?

- armin
> Regards,
>
>> On Fri, Oct 18, 2019 at 11:07 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Yes I have seen same build failures on master even after this fix on
>>> machine with more cpus so the fix while seems to address the problem is not
>>> fixing is completely when I get a chance I will look into the logic myself
>>> too but I think we have to delve into it a bit More
>>>
>>> On Fri, Oct 18, 2019 at 3:41 AM Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> Hmm I spoke too soon, at least rebuilding protobuf-c-native with this
>>>> change backported to thud still failed once with:
>>>>
>>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:17: error: ‘foo’
>>>> is
>>>> not a namespace-name
>>>>  using namespace foo;
>>>>                  ^~~
>>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:28:20: error:
>>>> expected
>>>> namespace-name before ‘;’ token
>>>>  using namespace foo;
>>>>                     ^
>>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>>>> ‘TestEnumSmall’ does not name a type
>>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>>>                                     ^
>>>> ../git/t/generated-code2/common-test-arrays.h:44:1: note: in expansion of
>>>> macro ‘TEST_ENUM_SMALL_TYPE_NAME’
>>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_0[] = { TEST_ENUM_SMALL(VALUE) };
>>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>>>> ‘TestEnumSmall’ does not name a type
>>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>>>                                     ^
>>>> ../git/t/generated-code2/common-test-arrays.h:45:1: note: in expansion of
>>>> macro ‘TEST_ENUM_SMALL_TYPE_NAME’
>>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_1[] = { TEST_ENUM_SMALL(OTHER_VALUE)
>>>> };
>>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>> ../git/t/generated-code2/cxx-generate-packed-data.cc:31:36: error:
>>>> ‘TestEnumSmall’ does not name a type
>>>>  #define TEST_ENUM_SMALL_TYPE_NAME  TestEnumSmall
>>>>                                     ^
>>>> ../git/t/generated-code2/common-test-arrays.h:47:1: note: in expansion of
>>>> macro ‘TEST_ENUM_SMALL_TYPE_NAME’
>>>>  TEST_ENUM_SMALL_TYPE_NAME enum_small_random[] =
>>>>
>>>> {T(0),T(1),T(1),T(0),T(0),T(1),T(1),T(1),T(0),T(0),T(0),T(0),T(0),T(1),T(1),T(1),T(1),T(1),T(1),T(0),T(1),T(1),T(0),T(1),T(1),T(0)
>>>> };
>>>>  ^~~~~~~~~~~~~~~~~~~~~~~~~
>>>> ...
>>>> so it probably doesn't fix the issue completely.
>>>>
>>>>
>>>> On Thu, Oct 17, 2019 at 10:44 PM Martin Jansa <martin.jansa@gmail.com>
>>>> wrote:
>>>>
>>>>> On Sun, Sep 29, 2019 at 05:29:56PM +0800, Chen Qi wrote:
>>>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>> ---
>>>>>>  .../0001-avoid-race-condition.patch           | 36
>>>> +++++++++++++++++++
>>>>>>  .../protobuf/protobuf-c_1.3.2.bb              |  1 +
>>>>>>  2 files changed, 37 insertions(+)
>>>>>>  create mode 100644
>>>> meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
>>>>>> diff --git
>>>> a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
>>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
>>>>>> new file mode 100644
>>>>>> index 000000000..4fc7703d8
>>>>>> --- /dev/null
>>>>>> +++
>>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00
>>>> 2001
>>>>>> +From: Chen Qi <Qi.Chen@windriver.com>
>>>>>> +Date: Sun, 29 Sep 2019 17:20:42 +0800
>>>>>> +Subject: [PATCH] avoid race condition
>>>>>> +
>>>>>> +It's possible that the cxx-generate-packed-data.cc is compiled
>>>>>> +while the t/test-full.pb.h is being generated. This will result
>>>>>> +the following error.
>>>>>> +
>>>>>> +  DEBUG:     ./t/test-full.pb.h:4:0: error: unterminated #ifndef
>>>>>> +  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
>>>>>> +
>>>>>> +Add a dependency to avoid such problem.
>>>>>> +
>>>>>> +Upstream-Status: Pending
>>>>> Thanks for this patch, it seems to indeed fix this issue, I've reported
>>>>> a while ago:
>>>>>
>>>>>
>>>> https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg64363.html
>>>>> I think the upstream would be interested in this fix as well, see:
>>>>>
>>>>>
>>>> https://github.com/protobuf-c/protobuf-c/commit/b0bb56303366e2c072ee38eb5f1f11251b07239c
>>>>> Cheers,
>>>>>
>>>>>> +
>>>>>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>>>> +---
>>>>>> + Makefile.am | 1 +
>>>>>> + 1 file changed, 1 insertion(+)
>>>>>> +
>>>>>> +diff --git a/Makefile.am b/Makefile.am
>>>>>> +index b0cb065..1608ae0 100644
>>>>>> +--- a/Makefile.am
>>>>>> ++++ b/Makefile.am
>>>>>> +@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
>>>>>> + t_generated_code2_cxx_generate_packed_data_SOURCES = \
>>>>>> +     t/generated-code2/cxx-generate-packed-data.cc \
>>>>>> +     t/test-full.pb.cc
>>>>>> ++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
>>>>>> + $(t_generated_code2_cxx_generate_packed_data_OBJECTS):
>>>> t/test-full.pb.h
>>>>>> + t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
>>>>>> +     $(AM_CXXFLAGS) \
>>>>>> +--
>>>>>> +2.17.1
>>>>>> +
>>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>>>>> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>>>>>> index 6d1ffc3f4..b92f82dec 100644
>>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.2.bb
>>>>>> @@ -15,6 +15,7 @@ DEPENDS = "protobuf-native protobuf"
>>>>>>  SRCREV = "1390409f4ee4e26d0635310995b516eb702c3f9e"
>>>>>>
>>>>>>  SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
>>>>>> +           file://0001-avoid-race-condition.patch \
>>>>>>            "
>>>>>>
>>>>>>  S = "${WORKDIR}/git"
>>>>>> --
>>>>>> 2.17.1
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>> --
>>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>


