Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA96C433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 15:42:36 +0000 (UTC)
Received: from smtp2.emailarray.com (smtp2.emailarray.com [69.28.212.198])
 by mx.groups.io with SMTP id smtpd.web11.20425.1636213355164463497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Nov 2021 08:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: balister.org, ip: 69.28.212.198, mailfrom: philip@balister.org)
Received: (qmail 3881 invoked by uid 89); 6 Nov 2021 15:42:31 -0000
Received: from unknown (HELO ?10.8.0.6?)
 (cGhpbGlwQG9wZW5zZHIuY29tQDczLjI1MS4xMC4xNDM=) (POLARISLOCAL)  
  by smtp2.emailarray.com with SMTP; 6 Nov 2021 15:42:31 -0000
Message-ID: <b857de72-1bfa-a15a-b48a-119f8ef1a620@balister.org>
Date: Sat, 6 Nov 2021 11:42:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] Depending on other package's features.
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "maxims@google.com" <maxims@google.com>,
 openembedded-devel <openembedded-devel@lists.openembedded.org>
References: 
 <CAFR_W8rkzPWCN9BnHXjZTcu58sBYfGOsOAT-rUyUKB1_k59X4w@mail.gmail.com>
 <654beb1c1d7d449e8d6f85e427b8f2eb@axis.com>
From: Philip Balister <philip@balister.org>
In-Reply-To: <654beb1c1d7d449e8d6f85e427b8f2eb@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Nov 2021 15:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93855

Or even openembedded-architecture

On 11/5/21 12:33, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Maxim Sloyko via
>> lists.openembedded.org
>> Sent: den 4 november 2021 22:46
>> To: openembedded-devel <openembedded-devel@lists.openembedded.org>
>> Subject: [oe] Depending on other package's features.
> 
> This type of questions belong on the
> openembedded-core@lists.openembedded.org mailing list.
> 
>>
>> Hi all,
>>
>> The recipe that I'm working on for our system (let's call it A) has a
>> dependency on a certain feature being enabled in another package (B).
>> So, in B, we have:
>>
>> PACKAGECONFIG[nice-feature] = "..."
>>
>> and my recipe (or rather, the tool built by the recipe), needs that
>> feature to be enabled to work properly. What's worse, is that this is
>> a runtime dependency, so if somebody just forgets to enable that
>> feature, the image will build fine, but the tool won't work. I would
>> like this to be a build time failure.
>>
>> My plan is to change recipe A, so that if the "nice-feature" is
>> enabled, the package will PROVIDE one more thing:
>>
>> PROVIDES += "${PN}-nice-feature"
>>
>> and in my recipe B, I'll declare this as a dependency:
>>
>> RDEPENDS:${PN} += "package-a-nice-feature".
> 
> PROVIDES is for build time provides of recipes. You cannot mix it
> with RDEPENDS:${PN} which is for runtime dependencies for packages.
> 
>> Now I'm thinking, wouldn't it be great if package A could specify
>> extra PROVIDES when the feature is configured? This would be similar
>> to the way it's done for package's R?DEPENDS:
>>
>>       PACKAGECONFIG ??= "f1 f2 f3 ..."
>>       PACKAGECONFIG[f1] = "\
>>                            --with-f1, \
>>                            --without-f1, \
>>                            build-deps-for-f1, \
>>                            runtime-deps-for-f1, \
>>                            runtime-recommends-for-f1, \
>>                            packageconfig-conflicts-for-f1 \
>>                            provides-for-f1 \
>>                            "
>>
>> The last line would be a change that I propose. It looks like it would
>> be relatively easy to implement this in base.bbclass
>>
>> What do you think? Will this be useful? Did I miss an existing way to do
>> this?
>>
>> Thanks,
>>
>> --
>> -MS
> 
> //Peter
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93845): https://lists.openembedded.org/g/openembedded-devel/message/93845
> Mute This Topic: https://lists.openembedded.org/mt/86827516/384425
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

