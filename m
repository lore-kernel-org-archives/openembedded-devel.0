Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81065CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 11:22:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9104.1762514568009181506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 03:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdIF2byk;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-471b80b994bso6542535e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 03:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762514566; x=1763119366; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NohQH1IffKnEJGugzk7JezRIx1Wkxg5scDkApDy1B2U=;
        b=FdIF2bykZ5+yLOb81BWvjSXbUEgQE2R8jDzLKRx6dZJr/9V7LISXVTD7X6ZILaGlq6
         8kh9nxVjp0sWpJl/vEOrv9IxdY25MrRvEi1+7DZ6u2FRPI0IdNpdPWXtbVpczJQMzghB
         2ksDTW+EKvsCf5kuySJX4N8b1thLrdmSc+mZcvw5OJG1/FMd9hedVr+EKPayjt94gzkR
         6UqpqfOx2QMog+eNmRf8G84iaq3kk7dVH4GZYqkhPuq9Jyb2AlDVR1mG+xLoCN5G29Ok
         IA9flraytNFD1+p2HnQhhVWZp/llDAZzkgAWBA8yza4Qweorqp++Omyf4VEIb343CSWt
         sEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762514566; x=1763119366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NohQH1IffKnEJGugzk7JezRIx1Wkxg5scDkApDy1B2U=;
        b=G0pMiHV5qc0gohnAitjbAV+/mU+fK6ZxiISkpumF/ttZXG6Gd7T9iIHBdHhFux/lVE
         HGvOzTIzDc1Al0e6fLoHZefO+9PH/0Ap2PRgQcE5eaFg5RLZA821+5MfDn1DEWo+1JCy
         lp8P7J83jwKjwffUjea9YOp8Q9NdL/al+tOcSqNtdesVqsaQbNcwaKNar5JmLR2xaeiT
         6EIvhOP/jyva9dWrpfMqdX0CMJqjKTu+6DAIJR8ah8sjYGPYt5WcYfVTy1YERmw63ybG
         Xm1tvFuIV7c74P1yr94BBCAfTeGByR731Za25iUgyO067cF9QeeAkpNEZM+5XABh001C
         fu6A==
X-Forwarded-Encrypted: i=1; AJvYcCWLZqF+fynt/+9PJarRzptC8GGUe95iuMosveaPwhcmK/e11Dbi81Vi2AfNWrrx8yCZpN8ZAR3Kq5JzXt6ujWjTE2I=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxg9VSzbdt/3j+PclMtSy9lIwu7zUlYQSnSkqHJ5tH+c1geKHTF
	K67lorpyBgAW03yENwdKVv28L1vGm+aYc72I4P0XPP6AhwpYSL65IyXk
X-Gm-Gg: ASbGncttWcfbU+pwbWm8lBO9MQqVLG4DrM4Sy0wi4cxq6ykYxh17fpcJ2zlxgjWAaZU
	16fh+80a4ib7VHgoUDWdeIGbCT7q/ymYmvcWNBDBLWnrABc0Ui9+WAwj3j9O3mM5DY/dz0vtEmY
	ddtXQiFI/XPYD03VfFqZDaofIpoRd3P9ddbqiEP0OiM5J92ToRpSI9UlomsbgOQYwvkfVFI4y4/
	LTBHvdpwtzHlXrXnZC8wuLP9/XZRXq/uu3VaZsRNaJ2fng/PqinxNwfg9LByG8e25JEGDWFK258
	8LMi6lv88gb2bxX13m2/b69Nk1uxJWrUrPOoBRR8U5kXyfrau192DjlbazrROPNXI6e5p5BriRo
	f9xNB0lfpE2CIxYEoBI3KXuxc/n7p7iKsQZ0FNo7JKUKEMl9AJ3Qef0ErrYhBYc1wVrrQCZovIF
	syBOa8FZoG
X-Google-Smtp-Source: AGHT+IFHKd+1XJyIqxQEhqe1jQl5XsOOrfAHBYQVgpkTqiEAehNdy5tPR8PCHLainAWnoygV9FFyCA==
X-Received: by 2002:a05:600c:a41:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4776bcb5a0fmr16801425e9.26.1762514566124;
        Fri, 07 Nov 2025 03:22:46 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47763b5714dsm42597355e9.0.2025.11.07.03.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:22:45 -0800 (PST)
Message-ID: <592a566b-c5a5-44bf-bb12-f5542eed4cd0@gmail.com>
Date: Fri, 7 Nov 2025 12:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Call for patches for next Kirkstone release
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <ca2ee105-a3a2-48dc-9ad5-77676a71d8d6@gmail.com>
 <AS1PR10MB56971CBAB41937C12EDB33F8FDC3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB56971CBAB41937C12EDB33F8FDC3A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121370

On 11/7/25 12:04, Marko, Peter wrote:
> Hello Gyorgy,
> I really like this announcement; it makes planning so much easier.
>
> However, I wonder if the future PRs can be synced with oe-core dot release dates.
> For instance, the plan for 4.0.31 was to create rc1 on Monday this week, reality was the last Friday, and it included 5-week-old meta-openembedded, doh.
> Since Steve very often creates rc1 oe-core on Friday before the announced date, could meta-openembedded do it e.g. 1 week ahead say Monday or Wednesday? (not sure how long the testing takes)
> I know that the releases are not exactly tied together, but I like the extra oe-core dot release testing and always take meta-opemebedded hash used there instead of the latest one when I'm bumping Yocto version.

Yeah, I guess it's a bit of a chicken-or-egg, I also like testing with
latest oe-core... but I do see your point.
Will try your suggestion from the next cycle, and switch it a bit
around, so that meta-oe will be merged sooner, and oe-core can be tested
more widely with a more up to date version of these layers.

Thanks a lot for the feedback.

> Peter
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via
>> lists.openembedded.org
>> Sent: Friday, November 7, 2025 11:43
>> To: openembedded-devel@lists.openembedded.org
>> Subject: [oe] Call for patches for next Kirkstone release
>>
>> Hello,
>>
>> The next Kirkstone PR for meta-openembedded is planned around the end of
>> next week-ish. Anything that arrives until the end of next Tuesday
>> (11/Nov, any timezone) will be considered for this PR. Anything that
>> arrives afterwards will be part of the next merge cycle.
>>
>> To anyone's interested what's queued up so far, this is the staging repo
>> I use:
>> https://git.openembedded.org/meta-openembedded-
>> contrib/log/?h=stable/kirkstone-nut
>>
>> Thank you,
>> Gyorgy


