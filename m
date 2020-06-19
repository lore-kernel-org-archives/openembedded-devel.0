Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.10373.1592582719608887748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 09:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b/0MnhIz;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id x207so4615631pfc.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jun 2020 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IuhsxqCV/JR+cDii8+KcMundrZFlQKyebHxmic0TD+c=;
        b=b/0MnhIzZukIFWDVymUrYWOqr1XMegUbqVUcR9oyKk1GLe4qoLITncESW1cB2EL5jC
         S8r5FVK27CpBxHnixUMQu2Xj1Qbi6t/6gZhhC8/WkZCw7cARyNLzSb5QLqrhJHB3kkN6
         AKSWfiQBkPElC3eLpEKAGhou2zgv88yaiT8LByVeeii/nd+jC39RSYCme4W9EKXbjdqm
         BJYnzjavDj90oAqMq1Ps54OObMaRkYBVTvXQIqiph8J9V6GYKpQ7pufN8FCV34LReaw1
         nIVPpCJMmquKvaWCBYQK+lGm7DW8kT2HDAmJ9uvxQV1AH0LE9gajElRrvzba/NhalBUG
         T+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=IuhsxqCV/JR+cDii8+KcMundrZFlQKyebHxmic0TD+c=;
        b=dGpHcYoc6ZQ1HEbpKLVuC+AZr67DcwE4mFNG9XN/y7K0sdl2UTxG8FqDpNbbsLv8jj
         Xt4hyp6UPKAumnNmO0Xb9keB+ZEO556GD7bgSLtSb5ctfPcdAZspAi5GhDOzXG6gR8El
         x+9ZLDg1HqHCteBI1GKn1TzjSVIGaNvij6qgZbcp04iwduUhftGcC4NtOcbOoFqjD5nA
         MWH6wY1Ymn7CUR7LED+lpDV51FOFulyVnuiBL4LCdBFvxsK/eSSaKqOLFX6z8VwXOeXH
         KWfOBlFgVbFoEf0Oiq+R9pDRQAX34ewwtY8SUqXKKzbQlOuEHmCdHlOpHgWjtLeidh0N
         GGag==
X-Gm-Message-State: AOAM5327m8bacVA3Z6dM/c7Y7iV9fn1cjmXMjCSvamQ6kmU90Q7tvwVF
	t+EbRCU6LnEyNrxL8nm8JiiwNBl8MP4=
X-Google-Smtp-Source: ABdhPJzAwZfslzVtfGaOnNbjpW3TazUYdSBUJxXz3rB5ggOW3kUCdQfCOFFHA3Fe1dDI8UK1wC3fxQ==
X-Received: by 2002:aa7:8490:: with SMTP id u16mr8354937pfn.259.1592582718731;
        Fri, 19 Jun 2020 09:05:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id r7sm6338187pfl.117.2020.06.19.09.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2020 09:05:18 -0700 (PDT)
Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
 <20200619113201.2811033-10-schnitzeltony@gmail.com>
 <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
 <CALbNGRR3bTe4ATHS-2505iGUOsQq+H3YPqRoLc-+cHCYvNmNLg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <079febc3-4665-d650-22af-03f6fac48454@gmail.com>
Date: Fri, 19 Jun 2020 09:05:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRR3bTe4ATHS-2505iGUOsQq+H3YPqRoLc-+cHCYvNmNLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/19/20 8:55 AM, Andreas Müller wrote:
> On Fri, Jun 19, 2020 at 5:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 6/19/20 4:32 AM, Andreas Müller wrote:
>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>> ---
>>>  .../libgit2/{libgit2_1.0.0.bb => libgit2_git.bb}               | 3 ++-
>>
>> I think we have been preferring to use PV via recipe names if possible.
>> which this recipe is already doing, is there any benefit of renaming it
>> to _git ?
> Renaming:
> * needs extra efforts to create diff while working on a recipe
> * might cause issues on huge diffs
> 
> Shall I switch back to old scheme and send V2?
> 

So one easy problem you run into with _git recipes is that SRCREV gets
updated but PV does not, the issues with renaming recipes is as you
described and also git history tracking is a bit painful too, I am not
hard opined either way.

Lets keep the _PV version if its a proper release SRCREV that we are
jumping to.

> Andreas
> 
