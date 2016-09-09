Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 574DB6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 22:03:59 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id v189so3374826vkv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2016 15:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=e1gJhyDffHsJxGNBKDMQl1wUM0TTDgIz2PqmdHvkGP4=;
	b=fdt/TxstWHYMXzyioxhiAp5IH5q3/5tOEPmOnG+A9Zji1kWBX/DO5R77mM7WmThj3g
	6VGp8WA54EhpX7ip2RB+tm6dgXayUgRSb7JAgaOkc9rccpwx/Vm2DTh/B+LigOvyq+BE
	eISaKdEHF00dtiXI98lJXqXwAcxwMb2942Uijh3bSABs9Rqyns3e0SeG5n7rCApe6ui0
	epyfK4Rmd+u4i3o2kEIOpoFdPqHtIZL5+3hvuZSDWRkwW50RkkkRZJyyI9SZU6j6pyc+
	ceAAtSf3eIYH3XlG4Bm/uvR718sHu7IxMERyTdRFlFnhx7PCxQP80l5eGAE2RxZP/6DJ
	8F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=e1gJhyDffHsJxGNBKDMQl1wUM0TTDgIz2PqmdHvkGP4=;
	b=YAn9gpyqbtp1u3+7LFXPxY3709x66CL/nrWqCByXyUlWRBrN+yjtaq44todSJJbcOi
	eAs7SZ+8NF8xFQisMrtuyWCzdEJ7pN/ZCyYzrFIT6NtomT06XsgFUfLyRNWLmr3Jrgtc
	hoM/ksg2hcnI7SOooUyqNAjL1ITw48inZ4ptD2eySMo9CCsRoPi9HW+bPxMnqFEogMLg
	ENYdmJzcx9oQdXj1mgR3xTIl4Ro66jjXVPEG/JVVHS4ikDvVjt1igThVHVfPqP0BZix2
	RXiSkpTJMNvRLvaPsi7HHNOlgMVI6hAatCRBtkM7g++cOnk3FJ9jCC8wxkhMaLPmvUS7
	Iczg==
X-Gm-Message-State: AE9vXwMEvAoN5UPoB4E0y20EjHisb9MHlgLRbmQCVcfHcy/yRX/bLJ1P3XpIJVHDr2KjvFOZIXeGzGxQGGqPbw==
X-Received: by 10.31.199.67 with SMTP id x64mr4072061vkf.124.1473458639402;
	Fri, 09 Sep 2016 15:03:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Fri, 9 Sep 2016 15:03:59 -0700 (PDT)
In-Reply-To: <20160909204446.GB5631@mentor.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
	<b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
	<20160909204446.GB5631@mentor.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 10 Sep 2016 00:03:59 +0200
Message-ID: <CALbNGRSRPaVEkYqD8sQoD07Mv7Mk4eFB-VHFzJt12haS3KdMpA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only
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
X-List-Received-Date: Fri, 09 Sep 2016 22:03:59 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 9, 2016 at 10:44 PM, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:
> [[oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only] On 16.09.09 (Fri 10:34) jackie.huang@windriver.com wrote:
>
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> It builds fine except for arm now, and the do_package
>> and libpam issue is fixed by:
>> "waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"
>
> Did you confirm that you're still seeing the failure for arm?
>
> -J.
>
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> index 042203e..c34adcb 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
>> @@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append = " perl"
>>  FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
>>
>>  # http://errors.yoctoproject.org/Errors/Details/81004/
>> -# before this issue it was also failing in do_package and
>> -# autodetecting libpam dependency
>> -PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
>> +BLACKLIST_REASON ?= ""
>> +BLACKLIST_REASON_arm = "BROKEN: fails to build with new binutils-2.27"
>> +PNBLACKLIST[samba] ?= "${BLACKLIST_REASON}"
>> --
>> 2.8.3
>>
> --
> -Joe MacDonald.
> :wq
>
Did you see [1] - it fixes build for arm.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/108972.html


Andreas

