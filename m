Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37EFC6FA8B
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 03:38:30 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.3936.1663904294254708532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=asUiNKDx;
 spf=pass (domain: mvista.com, ip: 209.85.160.181,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-qt1-f181.google.com with SMTP id w2so7679111qtv.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xTwKD1YBUD7fy823y1yw/eS4pgtwA0bQIAiPO5DKEo8=;
        b=asUiNKDx+BH06v4bCE62KIy5UVQe7CYga6rdUyBMEb4dTGOdA6z1FWVw/2kHUTvbld
         su1d/JwHa7tYsjn1PIwqhESnIdFnKb48gZOrTD7HVfPzw7TOw91n+eh3B8l/pOYiODaO
         AjBuVkLZ942Tbci8NrnHXST3Gb56xW+XoHrsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xTwKD1YBUD7fy823y1yw/eS4pgtwA0bQIAiPO5DKEo8=;
        b=AYKJgrLL4SdRwg3dtvHBXr/W42EMfo06Zaw4MX0MTTY3qkDTa2f1mQNQrsTLLNMrWm
         mIUriel/CJR9vIDQTuNUgG7XfN7afwYvgSvHa7s5mSU8kBPpd+HUfy8qqWxQHzMEa6PF
         6QHn9EheqTK97fZLmj1agS05lay6AP9IFvjp+wUFpyYd7sKPJgRUZelbeP+yq3GKhNX9
         PBwBoJ9dW+knsOj0L1prvWlxdibFcirUXHzGgMBMlHabEXxgXRR6Flsx5UoQiU7Duv7u
         9ESsUXdf7+wVJP1QK7KRjAE/lTr5rynJyWoAUC+AB7kMtIoDv98B8xXCBSdYSxIB1ta9
         kA9Q==
X-Gm-Message-State: ACrzQf2APM/jj2PWbpXNeowKudyMdQQipaoC1jcJImJRaHZtXYLVpWdS
	MY+0fMq/ImpDrLXtyNIFuJD5dOIVTGF17Q==
X-Google-Smtp-Source: 
 AMsMyM78XMQ1JcQW2v2ap7Fc72fCyqg3CxrW57inc8e+JM6wp5eKdRKuZ1KbtUo+HykDkrA0d7LfbA==
X-Received: by 2002:a05:622a:614:b0:35d:1ad7:4ebb with SMTP id
 z20-20020a05622a061400b0035d1ad74ebbmr3692688qta.176.1663904293313;
        Thu, 22 Sep 2022 20:38:13 -0700 (PDT)
Received: from [192.168.1.33] (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 b25-20020ac86799000000b00341a807ed21sm4450719qtp.72.2022.09.22.20.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 20:38:12 -0700 (PDT)
Message-ID: <cf167e15-dc26-8204-a9be-acac1845dcb8@mvista.com>
Date: Thu, 22 Sep 2022 20:38:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] audit: Install audit.h from
 audit package.
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220923021317.1987661-1-jpuhlman@mvista.com>
 <CAMKF1soPiM5Tvd3EDkp0v++BM8SJ9i0M0iuP7gRF8KBuNgWbMQ@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: 
 <CAMKF1soPiM5Tvd3EDkp0v++BM8SJ9i0M0iuP7gRF8KBuNgWbMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Sep 2022 03:38:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98936

Yup.

On 9/22/2022 8:25 PM, Khem Raj wrote:
> does this backport fix it for you
>
> https://patchwork.yoctoproject.org/project/oe/patch/20220921081916.17313-1-mikko.rapeli@linaro.org/
>
> On Thu, Sep 22, 2022 at 10:13 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>> Source: MontaVista Software, LLC
>> MR: 121884
>> Type: Defect Fix
>> Disposition: Submitted to meta-oe
>> ChangeID: 2708329947da5ec2f96a8478771f56cfce95f616
>> Description:
>>
>> The last upgrade to audit, changed libaudit.h to use "audit.h", which
>> makes the build work for this package, but breaks any other package
>> trying to use libaudit.h, like libsemanage.
>>
>> build/tmp/work/aarch64-montavista-linux/libsemanage/3.3-r0/recipe-sysroot/usr/include/libaudit.h:30:10: fatal error: audit.h: No such file or directory
>>     30 | #include "audit.h"
>>        |          ^~~~~~~~~
>> compilation terminated.
>>
>> Install audit.h so other applications can use it.
>>
>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>> ---
>>   meta-oe/recipes-security/audit/audit_3.0.8.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
>> index 3dbfc9e60..6195b6749 100644
>> --- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
>> +++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
>> @@ -110,4 +110,5 @@ do_install:append() {
>>
>>          # Create /var/spool/audit directory for audisp-remote
>>          install -m 0700 -d ${D}${localstatedir}/spool/audit
>> +       install -m 644 ${S}/lib/audit.h ${D}${includedir}/audit.h
>>   }
>> --
>> 2.35.4
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#98934): https://lists.openembedded.org/g/openembedded-devel/message/98934
>> Mute This Topic: https://lists.openembedded.org/mt/93862901/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


