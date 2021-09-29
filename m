Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828F3C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:32:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.9715.1632925926954767655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZtEWQltR;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c4so1660894pls.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=f5b9BQGoeXglqDz+SJ2CZjaaucf7JSdpWcKXU6/ewV4=;
        b=ZtEWQltRBeck9IUF4RVSvCSvl1VkBPO0Gau0m7dlcQxYO/YqgSJoRWB1l07mIcEav9
         S3tOxumLWEJ782Fop27IYu/T3REF8CZuV1l8MlQQ5hInYQo0FHJoCoSzg/MRbfpLuIng
         Gsi2+Roul46bbU9Oz01JsprF2aoYLQQeVxMrk1eMLLxlZqwaiUte7mpr44Wntz52BGYd
         bYPENDs5Holz+qD/r1+ph4Rnf50zwfkfr2X8/ws2kI6gyuw3ZQ82OhYHfmMDcIfWVUDd
         V/xiE6VPzZhm4TQxa4yC5su7pqfRT7rmw2tKxrP/MpWxRwbnrOfXFTV3vQ/y3T+Oa8dt
         yjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=f5b9BQGoeXglqDz+SJ2CZjaaucf7JSdpWcKXU6/ewV4=;
        b=IheS9dvzBf9IAiwnbD5J/iqYX2lXQOeVHuFWdgrKUevBtswO6mHN+Ktmz6erXIxIV/
         kpROPYijwg5GM9mPysOuYGN2A/GFe2sbnVUppWAf/eEcxK+VFsvHjNdXnYEVGjnoC4th
         c1RUgTKT+Dx8aLTf8M8z7Jjp1CU374z3xThLOLjLyOOQlz5aIXf7ml8UInIRaB7JFm87
         fzS3rSgihzXGQQkJj7AALgrW4APzyzhpnw2MG82nU5GlFgiMlNBjM86S/CaHcdsWCw9J
         E2W7X421o1xhZBdrim45Ma6xEd0WfgUj3lPiYTMJz1f1L8LHu/VT3YLUs0b1a2t7V48v
         u4SQ==
X-Gm-Message-State: AOAM533a/uynEI4TnCADmOPB5/i6AP8DyW0fhwho7U7nLN9i/3kKhpBR
	/SdBBCEP5H+ltb53Q2oQMcSG9D1BLU5Qrw==
X-Google-Smtp-Source: 
 ABdhPJzOIYiFE0Cs7VIINedAen4P88dPFOzukhrOt56z84YdvM3jQy3Ww1qJLHsCEdi7KX6ok6uw0A==
X-Received: by 2002:a17:902:a60d:b0:13b:7dad:9a5 with SMTP id
 u13-20020a170902a60d00b0013b7dad09a5mr10613875plq.41.1632925926344;
        Wed, 29 Sep 2021 07:32:06 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::d11e? ([2601:646:9200:a0f0::d11e])
        by smtp.gmail.com with ESMTPSA id
 m7sm2989164pgn.32.2021.09.29.07.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:32:06 -0700 (PDT)
Message-ID: <baaa4ada-a069-64d8-d14a-b8f12c09b3ba@gmail.com>
Date: Wed, 29 Sep 2021 07:32:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.17.3 -> 3.18.0
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>
Cc: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1632407510-15664-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <CA+chaQd=SMxM__MgS2fSEHo4-QHLo5ECikYuc1srRzbT4_hTxg@mail.gmail.com>
 <eb937949-2f47-dfb3-a91f-4984a9c7d452@gmail.com>
 <CA+chaQf2j+7zKpQkOV+uq2+ACPgo+_ed+Yjj5++q-+DxAc4tzQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CA+chaQf2j+7zKpQkOV+uq2+ACPgo+_ed+Yjj5++q-+DxAc4tzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 14:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93173



On 9/29/21 07:29, Martin Jansa wrote:
> On Wed, Sep 29, 2021 at 4:22 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 9/29/21 06:26, Martin Jansa wrote:
>      > FYI: this breaks opencv build, I'll send fix shortly.
>      >
> 
>     interesting, why dont we see the failure in OE world builds I wonder.
> 
> 
> It happens only with dnn PACKAGECONFIG enabled, which isn't by default.

I see ok.

