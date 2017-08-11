Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id AF2F66FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 16:02:18 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u185so3452259pgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fna/F+DII2gf5zenyZ5EVL8kaqu7MJgBkd04RE7evZg=;
	b=OZ68F1rivsRd0jteZ9WL6Qg+5r/K8ORmLRZUTfQd5caX3BgMYsHt6FloSr1qeCkV9U
	OJAJPTFIWPh634+Dtuu6YZJBDfBxYiINW/nTlGAocsylbW9vNZx8oyA43/68+aRkWqYJ
	YG8VKX70OusxK6kx6ogciQya35pJU+eWH2JI1J5XbggxIhk8JLyQlJERSVs1oJmA6dlm
	Et13USpgZypWeptopKvLdPEnKo69lBqrq1oUBf3tcu06TsYX491wNqvqu0Sh3CEjOeFa
	VfHjl2QqiQHusHC7Bd32wjoy6VdgL42hsEevB7mmphaAeUZgJqRqnYltrFerHL6YU40g
	KZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fna/F+DII2gf5zenyZ5EVL8kaqu7MJgBkd04RE7evZg=;
	b=I0esC65XiQfqR90hVuiY8DD1h09vavMyvG9WINNbvE5xMQo2cp8hirk4ZcLtoCefKP
	zIbBHzgSSAeWhE5saFYyFxauUWVgYi7JJtejXmXLONkxCbMDnjMGzE9MGi+dkfeXi3J2
	Prkv/xadXtR0ILVXtHfq2y4BpNsr+QitY4FRRDnxSTGiBr4E/yXGtPXYSpJiWaXvqv1h
	Dp6z2XGXZgfzfQy9JNr3OTLCdqsiCEVe+8YNXMj6+SlI7gmnU5fPahB6cUeTxTQZac3c
	fGJ5K1IzW3qsceC0kddk7q0u2QehwYf8WZ6cfxpObcW6d4RBYiaB+OH8O1YFgjHvoasT
	VvqA==
X-Gm-Message-State: AHYfb5ikP9zkQllPWva/dtwNB9C+GZAhl0E67nVC6I/D19AgI6r4Y3Mu
	p905hu4EKKO9WMcQMoM5LCNp5m1bPA==
X-Received: by 10.98.33.84 with SMTP id h81mr13639291pfh.302.1502467339900;
	Fri, 11 Aug 2017 09:02:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 11 Aug 2017 09:01:49 -0700 (PDT)
In-Reply-To: <80c1b89e-5ff1-db03-586a-a941884dd647@windriver.com>
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
	<2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
	<CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
	<CAMKF1srNfV-EksvqJXpHTFDkC78svRf5VoVt3mau3cG6+JT9MQ@mail.gmail.com>
	<80c1b89e-5ff1-db03-586a-a941884dd647@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Aug 2017 09:01:49 -0700
Message-ID: <CAMKF1sp_4k+8R1-ORjq8-mOWrmb2KXgNVjPS5WXpaEjOm=XZnA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Fri, 11 Aug 2017 16:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 11, 2017 at 8:52 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-08-10 11:58 AM, Khem Raj wrote:
>>
>> On Thu, Aug 10, 2017 at 8:36 AM, Ming Liu <liu.ming50@gmail.com> wrote:
>>>
>>> Hi, Khem:
>>>
>>> I added that since I observed the error only on a armv5e machine, error
>>> did
>>> not show up on cortexa8/x86_64 machines, so I attempted to guess that
>>> option
>>> would not be always needed, for instance, if some ARCH support atomic
>>> instructions.
>>
>>
>> We should add it for armv5 alone then, for other arches, gcc does provide
>> needed atomics.
>
>
> Is that a design decision for the armv5 BSP or gcc or is it a bug?

Its just missing implementation and applications should have detected that
in configure and taken actions accordingly.

> A pointer to what code determines that would be nice if easy.
>
> ../Randy
>
>>
>>>
>>> //Ming Liu
>>>
>>> 2017-08-10 17:19 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>>>>
>>>>
>>>> On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
>>>>>
>>>>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>>
>>>>> This fixes following errors when compiling with clang:
>>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>>> '__atomic_load_4'
>>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>>> '__atomic_compare_exchange_4'
>>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>>> '__atomic_fetch_sub_4'
>>>>> | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
>>>>> '__atomic_fetch_add_4'
>>>>>
>>>>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>>>>> ---
>>>>>   meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>>> b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>>> index 53bbf7e..2f456bf 100644
>>>>> --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>>> +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
>>>>> @@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
>>>>>
>>>>>   DEPENDS = "boost"
>>>>>
>>>>> +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
>>>>
>>>>
>>>> Do we need --as-needed
>>>>
>>>>> +
>>>>>   inherit cmake
>>>>>
>>>>>   FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
>>>>>
>>>>
>>>>
>>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada,
> K2K 2W5

