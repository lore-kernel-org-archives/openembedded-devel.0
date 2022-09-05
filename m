Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D003EECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 19:02:24 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.28379.1662404543447067734
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 12:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ekuXPO5n;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w28so6612529qtc.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Sep 2022 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dcmQcPaCD6ITIoVra+nUwY1ODjopacZ2uKdbJOax5vo=;
        b=ekuXPO5noPE/BGGNZQTGqTlP0vfCO66gqV/PjAu7Kik1wC4SR4KmUFsYbkQgIayRB1
         VdDAdzWdwk6EH2XB7nKbaiINBZ9AjJK6W1rfziYaoy5f6JeHFXoG53uyclmOOFqwRW+b
         MNG4bfskFlHfw/2OK4+TCDU9e9Hm0oblCZOBo/LUKDCR5vlhr1Jvbh+UcrTzyD6dc8iR
         ilv+QH6sswwABkxOwMuqVn8zUDVNtaHKo3P0F3etA8we8T+p3p1mBpEPOpgv8ERK0MEl
         PQFwbnjdrJRkOhbAdbD58YVe59dQeMr9RjW/8k6hfenIM2xk+o7s3tOVWCsTn7Nl5VMh
         +9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dcmQcPaCD6ITIoVra+nUwY1ODjopacZ2uKdbJOax5vo=;
        b=2VFNfj2/XW4SPNlFvbCNWNhogC0nSuue0mNucQAZLI0a2L2ISGoptL7MnVKTTPOJp1
         eXgTNNRIJXKKLK9j13BRYQrEj7vD6/FcZuMoyMLuvpXeFfmr5AZvSqiDo2XJu+0G1yTs
         xGK2rmgnQw9YJBGU9fKSiqs1t4rLk+3ak+SUcGEashzpGT7tEL89oUGYc495cxCpNZmI
         2JjTjyJdZj/weAsuKz5n+QB7hedQxsDfQAyDmdCoZ17falD31B5qqjecXoj2/O+ueYna
         nLB5LEaJ4K/R7zSSjHaxomWwfAu3A1Ulb7xnZYBwFws74rE3WkRl5a0eC/VtwF+ApQ1+
         VQCw==
X-Gm-Message-State: ACgBeo1G0haq2+eoKEkiCwIKV2h5UKUQvhocc3H7uo3aEOBTuc0nly+N
	2DcPqAhMnjTQPkN0fmD3pLc=
X-Google-Smtp-Source: 
 AA6agR71rLVfzQC4SW1jKYxLgTAAWNdCp/x0lKbTD1izvT45NjxaLN5976Xq68C1E3PDqtvGwCHY4w==
X-Received: by 2002:ac8:5dd4:0:b0:342:fbfa:4a9b with SMTP id
 e20-20020ac85dd4000000b00342fbfa4a9bmr40319623qtx.229.1662404542400;
        Mon, 05 Sep 2022 12:02:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:dee3:eaf1:9872:fe7f?
 ([2600:1700:9190:ba10:dee3:eaf1:9872:fe7f])
        by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a440500b006b9a89d408csm9358181qkp.100.2022.09.05.12.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 12:02:21 -0700 (PDT)
Message-ID: <17ff540b-c471-f14e-980f-3c9ecb3872b3@gmail.com>
Date: Mon, 5 Sep 2022 15:02:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [meta-oe][dunfell][PATCH] cryptsetup: upgrade 2.3.2 -> 2.3.7
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>
References: <20220819140057.12010-1-jandryuk@gmail.com>
 <CAKf6xptpZGoKTfoEtLPnwGjgL0G5jea6J-_jK+2ANo7-pYPt8Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: 
 <CAKf6xptpZGoKTfoEtLPnwGjgL0G5jea6J-_jK+2ANo7-pYPt8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Sep 2022 19:02:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98670



On 8/31/22 09:31, Jason Andryuk wrote:
> Hi,
>
> Is the patch acceptable for dunfell, or is a change needed?

Its sitting in my test branch. My build system was relocated over these 
last three weeks so there was a planned delay in processing changes.

-armin
>
> Thanks,
> Jason
>
>
> On Fri, Aug 19, 2022 at 10:02 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>> From: Yi Zhao <yi.zhao@windriver.com>
>>
>> Stable security bug-fix release that fixes CVE-2021-4122.
>>
>> ReleaseNotes:
>> https://kernel.org/pub/linux/utils/cryptsetup/v2.3/v2.3.7-ReleaseNotes
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> (cherry picked from commit 5dca16b451abf80b1bfacfc533daf447ff4dad7c)
>> This is just the rename and SRC_URI hash updates made to apply
>> to dunfell.
>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>> ---
>>   .../cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb}   | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.2.bb => cryptsetup_2.3.7.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
>> similarity index 96%
>> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
>> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
>> index 3c1c8b0be..d303f27eb 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.2.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.7.bb
>> @@ -21,8 +21,8 @@ RDEPENDS_${PN} = " \
>>   "
>>
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
>> -SRC_URI[md5sum] = "6e4ffb6d35a73f7539a5d0c1354654cd"
>> -SRC_URI[sha256sum] = "a89e13dff0798fd0280e801d5f0cc8cfdb2aa5b1929bec1b7322e13d3eca95fb"
>> +SRC_URI[md5sum] = "9c5952cebb836ee783b0b76c5380a964"
>> +SRC_URI[sha256sum] = "61835132a5986217af17b8943013aa3fe6d47bdc1a07386343526765e2ce27a9"
>>
>>   inherit autotools gettext pkgconfig
>>
>> --
>> 2.20.1
>>


