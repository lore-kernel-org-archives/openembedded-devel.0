Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D59BC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:14:20 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.13702.1647972859531655551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YC8p+KqT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso2864603pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=8FsoM7G5+1jnpTBpInDrHePJGiMDcjdcsW+VGUA+HJ4=;
        b=YC8p+KqTdxCb0P1ObnpecEzSXyOH4/8kk8iB5qxpptzFboVAc8D4NqDsIZR17AX08y
         phQTeIXxxrTHVtFQhFZNDfGl7j0dz2ayuHFYGtjSlzovHMd8mzGdOl1qdSXYR2VD459W
         d2zEzYVuNUFP3Nrmn2vvbxKutTMWeSJcshXJuNm+phlShJPm4TH2X2eEJ/zm4105mRk6
         K4uXZadDqOvzjnk1I197rWGxeslD4sQkI0mzJFM/S99wFMVhQPMSMvadUsFbdFPvM7sH
         CkkDFJeVjSFXR+Bax8XBejTXXWGIffoDB1i8rcJziQfP7V51MlseDVHsOsjOrmeRBfVQ
         Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8FsoM7G5+1jnpTBpInDrHePJGiMDcjdcsW+VGUA+HJ4=;
        b=kVt/4xqjPxUZtTuf3Ex7ySigM0Nb07iviGnM9GdIjjUQKkdXXSQ905a+ASNCbpuTTF
         E0w7OOLVmcWfVhqNGmogCFy8isCwePKxmRW4i1wdSHPIZDtGC1y4UwjcErGy9DOe6PKv
         TUyz9qZHzi96M3EMDQmsON0BBaMaE0M0tgqAOcMUjwd7VBBSlc7ktzuYhDoLlbArsatY
         l2bkCIMF5nfNiXZQur4yv7UinWBN4MGwfzpPp2BdGwwhYnugk+CWrywxTpmFgVm8nFBO
         7oCzab2Iy2g2G4PXarfncXVKpWrWFk3tVtx1/QhWj+06elXBLpaWQ2V4f0r7PJ7eQ8v3
         0fug==
X-Gm-Message-State: AOAM532T8xodVdOuJoezCAbtHtSt3T1yp93fBCL54kIePCsIFYosb+wG
	Codc8M6zWpav7jKLD+XsGpA=
X-Google-Smtp-Source: 
 ABdhPJw9qU9/0MHnIfUFQcDMMSMMRhvImnHkmlhPtF5QRUKMv6dBqtlMHBFozh5HSjYhRhF0wczyuA==
X-Received: by 2002:a17:902:724c:b0:154:67d1:f56c with SMTP id
 c12-20020a170902724c00b0015467d1f56cmr9341086pll.23.1647972858845;
        Tue, 22 Mar 2022 11:14:18 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:cbeb:b220:70ab:871d?
 ([2601:202:4180:a5c0:cbeb:b220:70ab:871d])
        by smtp.gmail.com with ESMTPSA id
 a32-20020a631a20000000b003756899829csm17866126pga.58.2022.03.22.11.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 11:14:18 -0700 (PDT)
Message-ID: <b37193fb-6051-59e1-7113-5ebbac752185@gmail.com>
Date: Tue, 22 Mar 2022 11:14:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][dunfell][PATCH] p7zip: Fix for CVE-2016-9296
Content-Language: en-US
To: akash.hadke@kpit.com, openembedded-devel@lists.openembedded.org
References: <20220113135432.5987-1-thakur.virendra1810@gmail.com>
 <5677.1647413071739537247@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <5677.1647413071739537247@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 18:14:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96149



On 3/15/22 23:44, akash hadke via lists.openembedded.org wrote:
> Hello,
>
> Any update on this?
its in the testing branch.

thanks for the ping.

-armin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96006): https://lists.openembedded.org/g/openembedded-devel/message/96006
> Mute This Topic: https://lists.openembedded.org/mt/88396742/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


