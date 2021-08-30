Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.2941.1630356313656377796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Aug 2021 13:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CilDA1ub;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id x4so14639396pgh.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Aug 2021 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aMfPxtlxhlLRPkvpCOfDw1f2dR5e7D6V6qDYcGwPN3w=;
        b=CilDA1ubxpxubu8J7mXUbor7eHRHzJlaMKjoJCC2Nub5YmNML/zzFEILod56r/yrvD
         DWf3sFWspnscSRwrg+4ksidw5k2ocQZr9bcOm/RrfN0qdB/FMAcukTXMuHE+MVIIr4L6
         MC91tO/Vo/MjVLO6xyN3m3N1B1dJgBDWxjTR86Xc8/PvH+U+gvnNQ0OirI4DLQPFYFl/
         mnKIK7x/NbwWqSf8suZVinJmP0ns+ZmzrAgGj3L641PJZJ8I6EB7QQDQtWhDvGt2wcDX
         c6MvWU7Pa/5K+fmIBefakvbTmorxxNSkOVaz2+ET/CK9/uc2GuasaSYJnl9hlzMDQcgd
         TOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=aMfPxtlxhlLRPkvpCOfDw1f2dR5e7D6V6qDYcGwPN3w=;
        b=aDz/BkCbvg56pTf7GoTcYbe+rMMvoUfT8zwx09gIwn1ygjgrFhh8ngY3DNu+dzZbnh
         zERAphQsRsD6LzMrgOafvV7XJoNcXevQVj2nCVVVH0wxvSD5cjQowQu3agCEMJohctV4
         801xN95PoowYiJQlhEQS9E/geqfxD00DglOKnIFEPs3x2u1yY4GhJ7KNMG2IijdWsz07
         pq3M6DAhWaCmSN/pcsu3PXltzG1lYvfUcsOiA+p/u6mVSvyfo4DPV8XK2SQ01peKsu+R
         5TY6HEpBD1XByCDZHZg1ToNVY34mmu8fiB3biC3MNL9Va3ZMMN5Bkei8KRAEh4AHEo94
         H+SA==
X-Gm-Message-State: AOAM533lMABeLof89u+BXbcH8nbNF7UgphhNfJhqQO8b3cvcO0LG3PWU
	nBCwjjDWF2S2hQyraqf2Ux8=
X-Google-Smtp-Source: ABdhPJzxS63XFRvtJ1wj8UVqge4/OoyX9L1W1RZVFy1X2DKuKeK9Ub+A9ZD2UVWEreic9Ip5d2glRg==
X-Received: by 2002:a63:ff5e:: with SMTP id s30mr23810503pgk.390.1630356313048;
        Mon, 30 Aug 2021 13:45:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:f5c4:30bc:bcdc:7d1f? ([2601:646:9200:a0f0:f5c4:30bc:bcdc:7d1f])
        by smtp.gmail.com with ESMTPSA id k4sm15206354pff.12.2021.08.30.13.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 13:45:12 -0700 (PDT)
Message-ID: <6911b68f-03f7-a1e7-0ba0-a3bdb538ba6f@gmail.com>
Date: Mon, 30 Aug 2021 13:45:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-oe][PATCH] image_types_sparse: stop using ext2simg
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210818153932.3365328-1-dmitry.baryshkov@linaro.org>
 <CAMKF1sqL1aaJrNr4Fj1kkSb0+Ctd5sC8sUkDYiqKMYvJ3cyLUA@mail.gmail.com>
 <CALT56yMBWzhbyH_exaKPgBZFceYfJFviLd1nX2d+tSs0U0MwqA@mail.gmail.com>
 <CAMKF1sqmXR2xAc=3SOXKODvaO9BPbe52Y8Ct42V99FcV5Dma5A@mail.gmail.com>
 <CALT56yPOQh2Qi-KxBDj7UhLZP+e1oYBw0dboue_P_A+LQuV1dw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CALT56yPOQh2Qi-KxBDj7UhLZP+e1oYBw0dboue_P_A+LQuV1dw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/30/21 1:36 PM, Dmitry Baryshkov wrote:
> пт, 20 авг. 2021 г. в 21:03, Khem Raj <raj.khem@gmail.com>:
>>
>>
>>
>> On Fri, Aug 20, 2021 at 7:43 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>>>
>>> ср, 18 авг. 2021 г. в 21:23, Khem Raj <raj.khem@gmail.com>:
>>>>
>>>> On Wed, Aug 18, 2021 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>>>>>
>>>>> Under some conditions ext2simg can corrupt the file system (see
>>>>> https://lore.kernel.org/linux-ext4/CAP71WjwVdqmLEq1NGWK36JkEd-i05YcAu4jeY6GFjsk6TS=Mtg@mail.gmail.com/).
>>>>> This has been reproduced with the ext2simg currently found meta-oe's
>>>>> android-tools-native). Stop using ext2simg and always use img2simg. This
>>>>> results in bigger images, but without the risk of image corruption.
>>>>
>>>> how big are the images ?
>>>
>>> Just checked. I've 1GB (964 MB) ext4 image. gzipped it takes 227 MB.
>>> Given that I got:
>>> ext2simg - 518MB
>>> img2simg - 655 MB
>>
>>
>> Hmm so Choice is corrupted at times and small or big but not corrupted I guess we should take the second option as it seems more stable
> 
> Gracious ping.
> 

thanks for reminder, it fell through cracks. I have it in master-next now.

>>>
>>>
>>>
>>>>
>>>>>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>   meta-oe/classes/image_types_sparse.bbclass | 12 ++----------
>>>>>   1 file changed, 2 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
>>>>> index 65d980fd913f..4263593a8dd1 100644
>>>>> --- a/meta-oe/classes/image_types_sparse.bbclass
>>>>> +++ b/meta-oe/classes/image_types_sparse.bbclass
>>>>> @@ -2,15 +2,7 @@ inherit image_types
>>>>>
>>>>>   CONVERSIONTYPES += "sparse"
>>>>>   CONVERSION_CMD:sparse = " \
>>>>> -    case "${type}" in \
>>>>> -        ext*) \
>>>>> -            ext2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>>>>> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
>>>>> -            ;; \
>>>>> -        *) \
>>>>> -            img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>>>>> -                     "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
>>>>> -            ;; \
>>>>> -    esac \
>>>>> +    img2simg "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" \
>>>>> +             "${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse" \
>>>>>   "
>>>>>   CONVERSION_DEPENDS_sparse = "android-tools-native"
>>>>> --
>>>>> 2.30.2
>>>>>
>>>>>
>>>>> 
>>>>>
>>>
>>>
>>>
>>> --
>>> With best wishes
>>> Dmitry
> 
> 
> 
