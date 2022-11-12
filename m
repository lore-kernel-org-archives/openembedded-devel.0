Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7589C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 20:08:56 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web12.595.1668283728819109332
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 12:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pmNOGten;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso4587725ota.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 12:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zY+1DwuIu8tt/H2qfqioJfd7jzaD8+bgumrf6jvKM9E=;
        b=pmNOGtenx8VT4o+IpotHaLms+KSOXYabp37Azxj+yw0xcF2BFtGgpjFUyu/JfQcyWC
         NqwfFEXYWuhy+KQLXiv1uJ+nIgPfjjcTjiaS7GJFLoDy4Fz7peJBPB0x/+KkbpKi7LxN
         mnJQcaMiCKGP6w/vczuBXSgJcLzHso6BL6veNuRKrH4nj12IT8seoUzQt033BvRSHG7z
         oXLLsfcYLkmw/bJ8vxmOljD9MBSZa9AGB/bImgd7N7WW2BEQkS5b7EluI2gN/g5mD/63
         HxgrgIBJ0gcNXDLF6wcaiQ67ybW+IDKZoXR2FTs+zsboYOL8ex1qoWxfDpAKqnQnBfey
         R2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zY+1DwuIu8tt/H2qfqioJfd7jzaD8+bgumrf6jvKM9E=;
        b=ElZt9w9OqI47DvZr9s3h8e7gjbWtgP3fTrmMBEem6ugPsQKAzlx6kArf4mrOAG6HUt
         6rmuKGFcdrM24hkigw3i2x9h+i3XnulZd6qjxy3WUU7PDdTau17uPYh09FXDOn0DK8tY
         Q8Y2e3f0oav31q7A/Avd/d0SaaZxQ0+69fhL4PCA20xpPL/cOyAll3YXQMu7cX6CVFm/
         8WBuB67Z/aqez0TDxWttshEKjcIx4IBOiQ5cGnJEDnCp50YnPdMRsIH4JQVRfn1GesVf
         YBhIg/fpZOEQqX1BxweDSFm+orJKbEKYtWWSLXIUo7wLb8gYBiV1zY/plN2Qb8+BBHTT
         TJZA==
X-Gm-Message-State: ANoB5pkBMex5p/MiPAQBZ9ARBmVr/LnYKMGCJPg5vQIXaMhFVCtQm9R/
	8sxKvFIB+u3/GObWTWOH5Fw=
X-Google-Smtp-Source: AA0mqf6mdorxAN62e7a7E7qEjYTL11Y12cFHIOZTFIUtpULpuGk2rMdv/H6VXDdHYQmgguONuDroeg==
X-Received: by 2002:a9d:d88:0:b0:66d:6611:614e with SMTP id 8-20020a9d0d88000000b0066d6611614emr3079915ots.13.1668283727944;
        Sat, 12 Nov 2022 12:08:47 -0800 (PST)
Received: from ?IPV6:2600:1700:9190:ba10:5dbd:990c:5828:4a83? ([2600:1700:9190:ba10:5dbd:990c:5828:4a83])
        by smtp.gmail.com with ESMTPSA id g37-20020a9d2da8000000b0066cacb8343bsm2437818otb.41.2022.11.12.12.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Nov 2022 12:08:47 -0800 (PST)
Message-ID: <00a9cc3a-6388-8e7d-6b44-f14816d4455d@gmail.com>
Date: Sat, 12 Nov 2022 15:08:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] dhcp: Fix CVE-2022-2928
 & CVE-2022-2929
Content-Language: en-US
To: Hitendra Prajapati <hpprajapati@mvista.com>,
 openembedded-devel@lists.openembedded.org
References: <20221010045826.87924-1-hprajapati@mvista.com>
 <6976.1667798947630482909@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <6976.1667798947630482909@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 20:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99566



On 11/7/22 12:29 AM, Hitendra Prajapati wrote:
> Hi Team,
> Any update or comments on that patches ??

thanks for the reminder. I got it now.

-armin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99440): https://lists.openembedded.org/g/openembedded-devel/message/99440
> Mute This Topic: https://lists.openembedded.org/mt/94230529/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


