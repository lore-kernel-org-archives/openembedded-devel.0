Return-Path: <akuster808@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id A902760248
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 22:01:16 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id h129so37232606ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=F13+CS0Z/933t3MPhj7uxKkksEKzr9vpvB4b7y6qFKQ=;
	b=bQnHtWMQEyGNrXETwbCqkxx4OycHgv0tWDpqmgWVcJ8freIB0ZDUSZ+zJtaXfjf7oj
	82jtRJMW6cz+Hr0Chvm2rReEwEXoI6jajl8XptRKIJPBFyhkFUkC7UfjpA2P8EJRY39h
	8/Fr7N5vQSqbLQtHr+XWVx8ITVctlh3EPO8NhlZUcGh3A1XKWd+320CCUv2X7guDZIrk
	LF3Og7trpI4vOVBT+/D6aUu8TTMJGqzStnaM/3iVbsMViMoiL4quQRHv7/FsmDEYYwD7
	v8h8qkSgE3YacEtI/Xsn7nredvyHBfsT3eNN7gky+k7uhbs1pFlneluT58v6+cQnuBNE
	dYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=F13+CS0Z/933t3MPhj7uxKkksEKzr9vpvB4b7y6qFKQ=;
	b=QS9BgWrMZmWlkOUd+Wk7+WM7y1KsCCVsf1XpPtGJz6uiJN6mGBUJE+d4iTMR5nkABh
	y6oKmMaRikGJBkBiptAxoFptOLXFa/VQSquVWssvleg1f80PwncxoYeb/jW7jBvzLVxP
	wTo6KRP/lvFGdNrZv8SQ7K7rQEbELNcfj0Ep/j8LdXCaNjn5NLaSScKVBElJA1vgo4E/
	f3aJ0pvDqRrWHmfAo/4Do9eR+EYvxGJUiDDJg5vZG3M0JeQBebpMmlwnCU8T2tjGfvnD
	Y+9swrD1/GtY4LoyPdFoCQcFZwSaOY2eV6v+Eb/T6xBoydgo3HvDWHs1iOK862+e97aI
	8ZZg==
X-Gm-Message-State: AD7BkJLMdyuqAOKu2cR22WPCAUlJYzrORKKhDYhH4Z8QAWWlgjFwczPcfX9s/8cvT7G5Yw==
X-Received: by 10.129.9.214 with SMTP id 205mr2591048ywj.53.1458770477354;
	Wed, 23 Mar 2016 15:01:17 -0700 (PDT)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	e62sm2649535ywb.26.2016.03.23.15.01.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2016 15:01:16 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20160309195049.GJ2542@jama> <20160317214927.GK2553@jama>
	<56F2C274.8070105@gmail.com> <20160323184544.GE2565@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56F3122A.5080303@gmail.com>
Date: Wed, 23 Mar 2016 15:01:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20160323184544.GE2565@jama>
Subject: Re: python-cryptography failing to build since openssl upgrade
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
X-List-Received-Date: Wed, 23 Mar 2016 22:01:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/23/2016 11:45 AM, Martin Jansa wrote:
> On Wed, Mar 23, 2016 at 09:21:08AM -0700, akuster808 wrote:
>>
>>
>> On 03/17/2016 02:49 PM, Martin Jansa wrote:
>>> On Wed, Mar 09, 2016 at 08:50:49PM +0100, Martin Jansa wrote:
>>>> Do we really need to use that version script for openssl?
>>>>
>>>> Here is another failure:
>>>> http://errors.yoctoproject.org/Errors/Details/54984/
>>>>
>>>> in our local builds we use couple prebuild binaries from 3rdparty, which
>>>> now aren't compatible with openssl ABI (possibly because of
>>>> version-script update:
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118433.html
>>>> )
>>>
>>> Still failing:
>>> http://errors.yoctoproject.org/Errors/Details/56595/
>>
>> will look into it today.
> 
> Thanks, I've tried to upgrade it to 1.2.3 (patch is on ML), but that also fails, just
> with different error:
> http://errors.yoctoproject.org/Errors/Details/57058/

I sent a patch that fixes the current version 1.1 in meta-python.

- armin
> 
>>
>> - armin
>>>
>>>
>>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 
> 

