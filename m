Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBC0795B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 16:47:14 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id m77-v6so2927158pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=o7bUfa4DHRKibgkdjkhChEJjZd0O3brrpgKDTbM7vV4=;
	b=Z7HX/p7vVSlzwIoIQo9JtmPSLT1TzYhAiez+ElYWgOBk7Mnzz8iPtG8UGCCJXXP5vo
	mQWIJch93KMKKfXA2dh6Xt1Zs4qKH24SeVNIMiESU2X39vi4LtAD/tGuJkocBUGHQC0b
	UnfKAgRv8xI09Ji2f14yEG4cN4RNAWYHFMc9Yuq0R9NhQb7F2pTIddLkQKF/WZ/42+BI
	iSEGClBDo21266O4r4BiPpo7+DcOM47FMDT+87EiYTpwICdG5CViSOZ/L3vSQD7o38rI
	DJNDXgQhwR2+RCFQQfBwOL/wFkBJrFi+Dh0oh4gO2N0zX9HPsWgUPhJzfEpOaSo2XhhZ
	iCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=o7bUfa4DHRKibgkdjkhChEJjZd0O3brrpgKDTbM7vV4=;
	b=KP9MlpXuXXnkImQ+E/F82jxDZZ1QojgrW/IE1lyzZWbM4DeDqrh9Zr+rVQU+7oZUD9
	IWy2DjVKUDoocbDcMQ+vWbH8d7a4tE96sfQlagBQYLP3u5HL4axbfmsodRCrOLl07QwO
	WIRu4Jj4KwpEK9OHNRdPd5UOMmX+clvqtHYU1o32gNvaENTOVCUGOBxMcEnN3g5nUK8k
	LNz2evnCWC958VFP9PTLtEk0yQ5cQDjom2vDwjkcf45y2YpUeN3/YyLP23IVV7ByUz43
	kaW/WbLK92cp7Bfpna/x+LME5xyKiaRWo00Q3XUCV7L9KNspM9VHp5wngFI0CyTtOTVb
	RnZA==
X-Gm-Message-State: ABuFfoh+XU4RcUk0NDb+Tin2spfmfl4b5nIf+qv8AyjPmXVlEIAcnO8M
	J+v7QkflPEENw3/IAphQR3nq4swm
X-Google-Smtp-Source: ACcGV62r5vJP6KiBdJY45/Quu26YJnWOY4bJgTGH3WsMTH1E0noJgP7QDxhslvNJMEl1rMc/jJ2epQ==
X-Received: by 2002:a62:83ca:: with SMTP id
	h193-v6mr1988486pfe.123.1537894035616; 
	Tue, 25 Sep 2018 09:47:15 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:c8c4:7964:650b:a068?
	([2601:646:877f:9499:c8c4:7964:650b:a068])
	by smtp.gmail.com with ESMTPSA id
	q2-v6sm4285950pfc.17.2018.09.25.09.47.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 09:47:15 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	akuster808 <akuster808@gmail.com>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<2100274.NFsm02Mysr@localhost.localdomain>
	<98342371-c064-7866-1ea1-14819d88a71f@gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <b2d0cfc5-5856-9c1d-5d82-2dd5c7e47546@gmail.com>
Date: Tue, 25 Sep 2018 09:47:13 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Tue, 25 Sep 2018 16:47:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/25/18 2:43 AM, Nicolas Dechesne wrote:
> hi Armin,
> 
> On Tue, Sep 25, 2018 at 8:59 AM Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>>
>> On Mon, Sep 24, 2018 at 11:51 PM akuster808 <akuster808@gmail.com> wrote:
>>>
>>>
>>>
>>> On 09/24/2018 02:03 PM, Paul Eggleton wrote:
>>>> Hi Nicolas,
>>>>
>>>> On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
>>>>> hi Armin, Paul, Richard,
>>>>>
>>>>> I was looking at getting the compliance report for meta-oe (sumo
>>>>> branch), and I have found a few issues.
>>>>>
>>>>> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
>>>>> depends on meta-networking (c-ares). It was fixes in master, with
>>>>> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
>>>>> this fix needs to be backported to sumo as well if we want the YP 2.0
>>>>> compliance script to even work. If agreed, once merged, please let me
>>>>> know so that I can try again to generate a compliance report.
>>>> Is it appropriate to make such moves in a stable branch? I wouldn't have
>>>> thought so.
>>>>
>>>
>>> We have to. Per my understanding and why I tried very hard to make
>>> meta-openembedded clean ( appears I failed) is that if you want to be
>>> Yocto Compliant and include any layer that does not pass this test, you
>>> can not become Yocto Compliant.
>>
>> I believe that we want meta-openembedded to be compliant, and a good
>> example in general. I will send a backport your way for this change.
> 
> Running the compliance script on meta-oe turned out to be an
> interesting exercise ;)
> 
> I have found several issues, which I have mentioned in a few different
> threads, so I will summary here.
> 
> * oe-core: fix the yocto-check-layer for dependency loop
> * I have the following local commits in meta-oe:
> meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)
> grpc: move it from oe to networking layer
> meta-multimedia: fixup LAYERDEPENDS (for dos2unix issue)
> 
> With all changes above, the compliance script finds another issue with
> meta-xfce:
> 
> AssertionError: Adding layer meta-xfce changed signatures.
> 7 signatures changed, initial differences (first hash before, second after):
>    vim:do_install: 588d445122dccf317f15b0dd852f3888 ->
> ec086472d75d663c2fe836b935517810
> 
> This is definitely a violation of one our rule since adding meta-xfce
> changed changes vim recipe.

yes vim changes should be looked at and consolidated in one layer if
possible.

> 
>>
>>>
>>> Or relax your rules!!!.
>>>
>>> - armin
>>>>> * in order to run the compliance report, i locally added
>>>>> networking-layer in meta-oe/conf/layer.conf, and it creates a
>>>>> dependency loop since meta-oe <-> meta-networking. I found out that
>>>>> yocto-check-layer doesn't like that too much, and brutally fails. The
>>>>> following patch makes yocto-check-layer work again even with
>>>>> dependency loop. I am going to do a few more tests and send that over
>>>>> as a patch.
>>>>>
>>>>> diff --git a/scripts/lib/checklayer/__init__.py
>>>>> b/scripts/lib/checklayer/__init__.py
>>>>> index 2618416fab..0cc9bf3b6d 100644
>>>>> --- a/scripts/lib/checklayer/__init__.py
>>>>> +++ b/scripts/lib/checklayer/__init__.py
>>>>> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf, layer,
>>>>> layers, logger):
>>>>>          logger.debug('Processing dependencies %s for layer %s.' % \
>>>>>                      (depends, layer['name']))
>>>>>
>>>>> +        # To avoid never ending recursion, we keep track of layers while
>>>>> +        # they are being processed in this 'static' attribute.
>>>>> +        if not hasattr(recurse_dependencies, "layers"):
>>>>> +            recurse_dependencies.layers = []
>>>>> +
>>>>>          for depend in depends.split():
>>>>>              # core (oe-core) is suppose to be provided
>>>>>              if depend == 'core':
>>>>>                  continue
>>>>>
>>>>> +            if depend in recurse_dependencies.layers:
>>>>> +                continue
>>>>> +
>>>>> +            recurse_dependencies.layers.append(depend)
>>>>> +
>>>>>              layer_depend = _find_layer_depends(depend, layers)
>>>>>              if not layer_depend:
>>>>>                  logger.error('Layer %s depends on %s and isn\'t found.' % \
>>>> Patch looks reasonable to me FWIW.
>>>>
>>>> Cheers,
>>>> Paul
>>>>
>>>>
>>>


