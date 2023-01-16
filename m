Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A1EC46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 14:26:48 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.167670.1673879201416780525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 06:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aN5Bf/CO;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: akuster808@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id n190so25283872vsc.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PhawVpiRn3jcROpBTr3PrwNhVn0UAIg6I74sj6mF7PI=;
        b=aN5Bf/CO5lrymg7sdKBIKZ+Qq16IS4JaIkrlbGywW3CZAgz4bOdiWGfn8bfzm5WA19
         l79YH3lDRl2Cp2VlYGQBqv534Fdp8K7XYxQl3Acup4YL7VjfBGRG0kszuCZKOyVFnc73
         /hi6x2E/0fPfvOY+fC408BRvi0GwIZSmO3UeEOMGm0JEV2wqMVhzORxcyXpqlfTvczfM
         OKbgIVDEyV4HBW2XeZ+6+U4qMi8W/RPjwaCmnOeh8pvKcrAsWig+szjo//ET8LvqdnW5
         BTuxVjTEL6lfS57tN59cIoGfpO5V9CA9Y4z3mwqJxfyrX7732pBDQk8tud5HIyOUWJYb
         FMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhawVpiRn3jcROpBTr3PrwNhVn0UAIg6I74sj6mF7PI=;
        b=3CPpWvi/8WFAbibG69Huyff/teifkezWNGgdVksiD+um9sKL35T811IKAq4M6bElGO
         wjAk+urt8IUj6JuCd/asT2HUvFbol/IT6PHpmO+QtrWfKbVeXBE4LOKAzZmFSKz2tN0S
         sXmeRj+D5cjM4dtwVfYFpL7nLcgO/4ModPBKl+BzEDtnNfiB00/nPdDU7+gIjbinyNYr
         D8tf7o7FjZQJET0TvjKB6/t/v+oYvf06pH+XEvU4blA9c0RjzyfPjhODcwGrQ8avQPsj
         pBOlXWtlbY5LT3fVPiUHPDMoIFOzkjBTYiWdVUi+BEpCbcvTCrrZ6UocXHDDIayExr36
         1r4A==
X-Gm-Message-State: AFqh2krAE41wi8Sv2pz4I2wuKh8Y9sqnjMZF9ICPLRhAxzdK5qRNnzEI
	xeXUwSbLLaH9ANtfM3taa9s=
X-Google-Smtp-Source: AMrXdXt5iHr6JabpOPXzYwAE6fFBVOhiiONHZaWZHn/xbzugIAt2hcJcjXj/4M0gc5PRGrpPHB9SrQ==
X-Received: by 2002:a67:ead5:0:b0:3d3:f105:7f57 with SMTP id s21-20020a67ead5000000b003d3f1057f57mr175755vso.16.1673879200258;
        Mon, 16 Jan 2023 06:26:40 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:2d5:b305:eab2:30c1? ([2600:1700:9190:ba10:2d5:b305:eab2:30c1])
        by smtp.gmail.com with ESMTPSA id bj3-20020a05620a190300b00705975d0054sm18363407qkb.19.2023.01.16.06.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 06:26:39 -0800 (PST)
Message-ID: <5ca8dd73-289c-fed1-eb44-51d03c68a968@gmail.com>
Date: Mon, 16 Jan 2023 09:26:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] gRPC
To: "Valek, Andrej" <andrej.valek@siemens.com>,
 "raj.khem@gmail.com" <raj.khem@gmail.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
 "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <7b00f80d33fc4d77eafcddb8ba46b992d713df25.camel@siemens.com>
 <CAOSpxdapG_z_H0DrcRc=N6AczcPykLLBd+zfHbLCqTFGvOC0Lw@mail.gmail.com>
 <CAMKF1so06NJLbWAY-XnCQSNoksGOHZ=3XhT+Mbqzz7tJ6FdA_Q@mail.gmail.com>
 <39bd49a5-910a-6f48-0bb9-d59424b2bb46@windriver.com>
 <355cb47d9174b4186a381fa04c957b6a4e46eb90.camel@siemens.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <355cb47d9174b4186a381fa04c957b6a4e46eb90.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Jan 2023 14:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100585



On 1/16/23 6:53 AM, Valek, Andrej wrote:
> Hi all,
>
> The reason, why I'm asking especially like this, is that the problem is
> inside the bundled zlib library. The "official" solution for fixing
> (https://nvd.nist.gov/vuln/detail/CVE-2022-37434) is to update the
> bundled zlib (https://github.com/grpc/grpc/pull/31595) library, which
> shouldn't be done with easy patch, I guess.
>
> So how to proceed with that?

The gRPC folks did backport the fix to 1.46.6.
The zlib version in 1.45.2 appears to be 1.2.11 and the version updated 
to fix the CVE is 1.2.13. But that would then be an untested configuration.

Giving this a bit more thought, I think the cleanest path forward it to 
update to 1.46.6. It appears to have 257 changes and seems to be still 
active.

- armin
>
> Regards,
> Andrej
>
> On Wed, 2023-01-11 at 21:24 -0500, Randy MacLeod via
> lists.openembedded.org wrote:
>> On 2023-01-11 13:27, Khem Raj via lists.openembedded.org wrote:
>>> On Wed, Jan 11, 2023 at 10:07 AM Steve Sakoman <steve@sakoman.com>
>>> wrote:
>>>> Hi Andrej,
>>>>
>>>> I'm the maintainer for openembedded-core, and gRPC is in
>>>> meta-openmebedded. So this isn't my call to make.
>>>>
>>>> However we typically only take version bumps if they are
>>>> security/bug
>>>> fix only releases.  So if this is the case, you can submit a patch.6
>>>> But please be sure to include either release notes or change log so
>>>> the meta-openembedded maintainer can verify that it is suitable for
>>>> a
>>>> stable release.
>>> Thanks Steve, policy is same for all OE layers. I will wait for Armin
>>> ( Release Maintainer for meta-openembedded )
>>> take the final call.
>>
>> I vote for no update based on a quickish look.
>>
>> Armin,
>>
>> To save you some review, see the data below that indicates that there's
>> an appartly stable release maintenance scheme and
>> 1.50.x is > 1200 commits ahead and *likely* breaks ABI.
>>
>> Andrei,
>>
>> Is your CVE covered by any fixes on the stable release?
>> If not, best to get it merged upstream in addition to backporting
>> the fix as a patch in meta-oe.
>>
>> ../Randy
>>
>>
>> $ git clone https://github.com/grpc/grpc.git
>> $ cd gprc
>>
>> $ git log --oneline v1.45.2..v1.50.1 | wc -l
>> 1259
>>
>> $ git diff v1.45.2..v1.50.1 |  diffstat | tail -1
>>    3763 files changed, 198007 insertions(+), 213762 deletions(-)
>>
>> $ git checkout v1.45.x
>> ...
>>
>> # oh, I forgot to show the stable branches:
>> $ git branch -a | rg v1.[45][0-9]
>> * v1.45.x
>>     remotes/origin/v1.40.x
>>     remotes/origin/v1.41.x
>>     remotes/origin/v1.42.x
>>     remotes/origin/v1.43.x
>>     remotes/origin/v1.44.x
>>     remotes/origin/v1.45.x
>>     remotes/origin/v1.46.x
>>     remotes/origin/v1.47.x
>>     remotes/origin/v1.48.x
>>     remotes/origin/v1.49.x
>>     remotes/origin/v1.50.x
>>     remotes/origin/v1.51.x
>>
>>
>> # What's not included in our 1.45.2?
>> $ git log --oneline v1.45.2...
>> 4af1fe173d (HEAD -> v1.45.x, origin/v1.45.x) xDS interop: resume
>> circuit_breaking test (#32038) (#32056)
>> 60863b633e [CPP] xDS interop GCE framework: pin grpcio-tools to use
>> protobuf 3.x (#31214) (#31221)
>> 0a1c8d3c5c xDS interop GCE framework: pin grpcio-tools to use protobuf
>> 3.x (#31191) (#31201)
>> 129dd25c33 xDS interop: buildscripts: fix run_test return status
>> (#30768) (#30879)
>> (#30735) (#30860)
>> d19a439577 xDS interop: Python LB tests build and use the python server
>> (#30637) (#30658)
>> (#30520) (#30532)
>> 12df388e8b xds interop: choose correct cluster in
>> grpc_xds_k8s_lb_python.sh (#30309) (#30332)
>> ea0f9b29f7 xds-k8s jobs: standardize TESTING_VERSION (#30027) (#30050)
>> 14afb3a3ea Disable layering check for Objective-C (#29375)
>>
>>
>> # When were those commits made?
>> $ git log v1.45.2... | rg Date:
>> Date:   Tue Jan 10 13:35:42 2023
>> Date:   Mon Oct 3 15:23:06 2022
>> Date:   Mon Oct 3 13:35:02 2022
>> Date:   Thu Sep 8 16:57:24 2022
>> Date:   Tue Sep 6 20:47:18 2022
>> Date:   Fri Aug 19 17:22:21 2022
>> Date:   Mon Aug 8 21:33:59 2022
>> Date:   Tue Jul 19 17:31:09 2022
>> Date:   Fri Jun 17 18:37:56 2022
>> Date:   Tue Apr 19 14:45:30 2022
>>
>>
>> so it looks like there's a stable branching strategy.
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#100559):
>> https://lists.openembedded.org/g/openembedded-devel/message/100559
>> Mute This Topic: https://lists.openembedded.org/mt/96195679/3619876
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> andrej.valek@siemens.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


