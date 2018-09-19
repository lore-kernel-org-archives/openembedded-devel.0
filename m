Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 345D679309
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:49:44 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id g24-v6so4535671lfb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=QU8M43d8zTqNdPPjxnTiJBYc0iDBnUKRtEbhR5Magdg=;
	b=vMmX8hmcpuKOTxjSpIsm9EujUb1lMI/23AjHDQifyWRVfAy91i2Kn5RlBqwYElDzFM
	WufQwOm0RZs9qLrQhzScgT5DBW3shtlWploDiKdrnb0LIgdbM4PrgzYrpAzwyh5+cJ/X
	5wtxZRKCuT6mlukIuuyYNUMkwz3RvWLF1reUTZ1Q6uUBr0ZQmO0GNLnsG0SQ4c6+47Vl
	KoCCAW88d735iybSbLj125RkSQbZNlOBzEeC7yIw8MOx4FzFB0vR5EwwoCVEbYW+e0rz
	A485OrgGz8kOGmykOs0h7l7IbVK+k+pGdPrfyQ+A3KuOl/DpwcMlDXmvV3PTtYExcjn0
	8YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QU8M43d8zTqNdPPjxnTiJBYc0iDBnUKRtEbhR5Magdg=;
	b=sznUIdovoAiMkmVcW2XVObFvX/TQbzlSTL8+6LQQUZwNHqqBjyGk6+hdSNTEJ6s0TP
	q8SHTgZ/7BS6IiKgiSFjtl+bpXOP6F4MA+0L+2FWQs2y1Y3l3kBKtGRaAmQ1FytbzsUs
	37FhQ6K31IkG4nW+tjtZ0C1R2ySc8BDcxl0TJe83mLxbfTWuGvOxEbioiPRBvunaHXlJ
	CgppoyJNLZvd2cIj3VlSQu8omwYW1zlMJVtQGG8OKdDvurOg9UHrrkuc+xSiHhoKkL8J
	/LxHuq6L839gP98dPwgifBGdkY8tMY7gKf1DB/Nx6+AN/x+2EIqOnPk186kSiXcDxUuC
	QbGQ==
X-Gm-Message-State: APzg51AhUV/1x7+ff0FP2+xKOEFMdO/TgkBZGnX5AqpwCbJMdDZUUFqj
	R6HB4MCTAVlPQojpr1D0WnYtKytbEQw=
X-Google-Smtp-Source: ANB0Vdbs/eidRl7AdzWvry/sFq/wcP0gMZKwDmRv7BYWSZwDaHT877oTpzmFpjVsfbk7d9csLzG3tg==
X-Received: by 2002:a19:16d8:: with SMTP id
	85-v6mr23833847lfw.142.1537350584459; 
	Wed, 19 Sep 2018 02:49:44 -0700 (PDT)
Received: from [192.168.225.135] ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	o72-v6sm1009423lfg.31.2018.09.19.02.49.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 02:49:43 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
	<1536343810-87649-3-git-send-email-yevgenyp@pointgrab.com>
	<9ebbdc41bb7ebce99e013df00ec5ab9d58c6e4b7.camel@andred.net>
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
Message-ID: <178584fe-2379-0e22-8622-b545d5401ed5@pointgrab.com>
Date: Wed, 19 Sep 2018 12:49:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9ebbdc41bb7ebce99e013df00ec5ab9d58c6e4b7.camel@andred.net>
Subject: Re: [meta-java][PATCH 2/3] ca-certificates-java: Don't fail when called via hook on do_rootfs
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
X-List-Received-Date: Wed, 19 Sep 2018 09:49:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09/17/2018 05:44 PM, André Draszik wrote:
> On Fri, 2018-09-07 at 21:10 +0300, Yevgeny Popovych wrote:
>> It is possible that ca-certificates-java hook will be called via
>> update-ca-certificates hook during do_roofs (the case when D is set
>> and JVM_LIBDIR is not).
>> This is a valid case so don't fail.
>>
>> Change-Id: I908e2f0acec487c41499543014014e29919bd6ab
>> Signed-off-by: Yevgeny Popovych <yevgenyp@pointgrab.com>
>> ---
>>  .../ca-certificates-java/ca-certificates-java.hook.in               | 6
>> +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in b/recipes-core/ca-certificates-java/ca-
>> certificates-java/ca-certificates-java.hook.in
>> index 89c764f..611a4ef 100755
>> --- a/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in
>> +++ b/recipes-core/ca-certificates-java/ca-certificates-java/ca-
>> certificates-java.hook.in
>> @@ -14,9 +14,9 @@ jvm_libdir="@@libdir_jvm@@"
>>  if [ -n "${D:-}" ] ; then
>>      # called from postinst as part of image build on host
>>      if [ -z "${JVM_LIBDIR:-}" ] ; then
>> -        # should never happen, this is supposed to be passed in
>> -        echo "$0: no JVM_LIBDIR specified" >&2
>> -        false
>> +        # if JVM_LIBDIR is not present - we were called as a hook
>> +        echo "called as a hook of ca-certificates on do_rootfs, exiting"
>> +        exit 0
> 
> I don't understand how silently not creating / updating the Java certificate
> store any more is good? True, there is an issue here, but I'd say that this
> should actually do something useful, not just pretend to have done
> something.

I have explained the issue in cover letter thread, quick summary:

I don't like how it is now, but this patch is just a fix.
IMO (as outlined in cover letter thread),
it would be nicer to have the ca-certificates call the hook,
and make postinst of this recipe a no-op.
I can implement this if you agree (either instead of this change or on top of it - I would prefer on top).

> 
> Cheers,
> Andre'
> 
> 

-- 
Sincerely,
Yevgeny Popovych

