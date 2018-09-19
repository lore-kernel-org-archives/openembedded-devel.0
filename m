Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36FE074A35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 10:34:59 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t140-v6so4677647lff.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 03:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=2FHehyonjm1fm75JUA2byQVopIR7uH6MmdWgjEaQf9Q=;
	b=08EnLe9Ng8huLQBdLX0FvwcvVuRrItNClLESkv/GgTrdWU5qcOXV+I64bByjU0VqHt
	kPKIlTvIvMRqCK7V6e2/M7n/6YkEacFf03wApkM/t+wyiVHDTLqVn9Uckd0gnmjKlzJN
	PZim6p2WUs1w4Ozq2dEpCqIrjAsG9r6sPfw0+DXtM+nE2hi/WurePN4AgqFggT7otNFj
	Cp2RQocoqto2jIj/RN1lssXFYv3V+FCi1q3hasBpclTx+L5ejxUbf6JpOdRrtMAMWq37
	TVYgP314XICYQexOPcGFeampviay/qGK52tLwjieweeoRwl+/Rb7rsHCmxKlV3hUYcFa
	wnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2FHehyonjm1fm75JUA2byQVopIR7uH6MmdWgjEaQf9Q=;
	b=k/wA3o8L5TNBibAaDrgyBVMvs7OGSqUSTew19qKxIjFViNt0J/1ZkfxzNrGFMhCG1P
	RQnnW8HjuS08iV2wWou3VX208dSyEOAimCOVcD8NOcVyp6YJePcqjmWgTeJOoslh524X
	B5qu4U1DEk2Ec+XbDBLl93v+jDCS7BkQfDmYd6tn5Dtt6Kc3WSIVgff+ah4YlszbT+wU
	V2qRsZvjUPmmR5ayU9zF04gq5Q7J3rCxr0pJa7aPGOhze1E6VgOK5L7zCmMC4CYlsTB8
	f5y6teHupnHKnMiLB54vYE3Gk8dYcfM/qTuM6aFnxWKfm7LyOOCVW/hyspX1SIb7PBOu
	/z1w==
X-Gm-Message-State: APzg51BSjwsD8Dc4Us+TyKpFrMNOyM8DuP/l6+dbhVeB1nt7tI30Zgeq
	U2XNMG8S5HUI6rueACiJFeWUz0NyTIc=
X-Google-Smtp-Source: ANB0VdZTh8GnEddYOQYAxCb/BOWUEPjd5qdvtOaVFK88ooNfdgIbzh7QgTysKTj4PsDgqwL24/J2Hg==
X-Received: by 2002:a19:9113:: with SMTP id
	t19-v6mr7762581lfd.98.1537353300082; 
	Wed, 19 Sep 2018 03:35:00 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm490070lff.34.2018.09.19.03.34.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 03:34:59 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>,
	openembedded-devel@lists.openembedded.org
References: <1536341102-83842-1-git-send-email-yevgenyp@pointgrab.com>
	<abf6bb3ad6d546998bed6ac677d97304806921b9.camel@andred.net>
	<aafe7f68-76ee-6d67-e5c2-ce959c270dcb@skidata.com>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <9a2c4f96-d851-fd3b-d104-c2c5d905d9ea@pointgrab.com>
Date: Wed, 19 Sep 2018 13:34:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <aafe7f68-76ee-6d67-e5c2-ce959c270dcb@skidata.com>
Subject: Re: [meta-java][PATCH] cacao: class-native: RPROVIDE virtual/java-native
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
X-List-Received-Date: Wed, 19 Sep 2018 10:35:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/18/2018 06:19 PM, Richard Leitner wrote:
> Hi Andé,
> thanks for reviewing this patch!
> 
> On 9/17/18 4:20 PM, André Draszik wrote:
>> On Fri, 2018-09-07 at 20:25 +0300, Yevgeny Popovych wrote:
>>> This will allow other native recipes RDEPEND on virtual/java-native.
>>
>> I don't understand, can you please explain why a target package would ever
>> want to runtime depend on a native package?

There is no _target_ package in question, it is all about native stuff.
Patch is about cacao-native providing runtime dependency under "virtual/java-native" name.
This, for example, will satisfy ca-certificates-java-native dependency
(line "RDEPENDS_${PN}_append_class-native = " virtual/java-native"").

Otherwise, there is no recipe that is able to satisfy the aforementioned dependency
of ca-certificates-java-native.


> 
> I've totally overlooked that... You're right, it makes no sense in any
> situation I can imagine...
> 
> Therefore I'll remove that patch from master-next soon.

Richard, it would be great if we could agree on a solution first..

> 
> regards;Richard.L
> 
>>
>> How did you test this?

By having a recipe that DEPENDS on ca-certificates-java-native.
This recipe would be able to use 'java' then.

The truth is that I also pull in openjdk-8-native to actually run the hook,
so this is more about being able to satisfy formal dependency of ca-certificates recipe.

>>
>> Also, the virtual/ namespace is usually used in PROVIDES, not in RPROVIDES.
>>
>>
>> Cheers,
>> Andre'
>>
>>>
>>> Change-Id: I85fcd012d09441867fa5f359463cbe8fff702fbe
>>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>>> ---
>>>  recipes-core/cacao/cacao_1.6.1.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-
>>> core/cacao/cacao_1.6.1.bb
>>> index 1074ff5..ead0e2f 100644
>>> --- a/recipes-core/cacao/cacao_1.6.1.bb
>>> +++ b/recipes-core/cacao/cacao_1.6.1.bb
>>> @@ -6,6 +6,7 @@ SECTION  = "interpreters"
>>>  
>>>  DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native
>>> fastjar-native classpath-initial-native classpath-native bdwgc-native
>>> virtual/java-initial-native"
>>>  PROVIDES_class-native = "virtual/java-native"
>>> +RPROVIDES_${PN}_class-native = "virtual/java-native"
>>>  
>>>  DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
>>>  RPROVIDES_${PN} = "java2-runtime"
>>> -- 
>>> 2.7.4
>>>
>>

-- 
Sincerely,
Yevgeny Popovych

