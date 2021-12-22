Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F8FC433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 02:44:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.14733.1640141052852591581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWP/n1wM;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id gj24so986868pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 18:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=r5T7RTMgMi+jPeHO+k68YLdcXDXWwsRgjBp/m/2quy0=;
        b=mWP/n1wMGFPW9GDG01mgBhQ/6mWdWF4LsPTIqxFEXZf1CV9Tm6P/WocG1lXZJNaFh0
         /xV3l5dWxfCJBTj8iXVWL+z0JX2zlADgnYeWKyd+YFRumTKVd7mJj2lHCoJSev1ZEhRh
         bSPCPcIpeCd074b0WEbeVBb6/CjWTo2wdK+zsqkQo+f5JBAg+AwVLv2qZKhyQyMof27H
         ZVJXlVCjbKsolkKCXSMlxCR4jmaeFQy8LGM6YvNFKsVCR2dochThHDC097wiR1ilntvy
         3VXfpOmujOFPf7YesiSWGrr2pCCOu2fwSoKGUEUXTd1IcxstHFJ0y0a6A3GVsZKvm68F
         BuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=r5T7RTMgMi+jPeHO+k68YLdcXDXWwsRgjBp/m/2quy0=;
        b=tnueTj0hWDHwQ4hpEiybVnXFCvcdEejA1S6WfE63cYjW4Vo2ai+qw4kmI+Gqzk0gpu
         tbXt8elw8/oOFDfdvCN6GM20EDiD+VGuifw6+bi31Gn1nqQ2eMsBrlZc1Ai/gybYacxU
         tbVAsnReG8KUT88cwyUDErBoEXA3aqq7smatyFcmq6iiTUU+v3zSv1wcBhuSxN541enw
         W/ZNyCCtnbqRVQgmKg7CdfiCNUJMJCwqEv/KKM0IzCdZn7N3Q3dVBLSdz6TtJpmMWxz6
         AtIPP3bZFOpcVBut+0QQWstrIfKuIlZILsoOBgNpPqOUMxRcvvKtGIypVrBMd9qeMdRv
         iyAA==
X-Gm-Message-State: AOAM532Qq+NhHI2iuHO/W5dKBkf5WGe9aPrCV9Cb0lG2MCbG+ZH4KeTA
	kFhiFTBliKus4zeP43AyQGY=
X-Google-Smtp-Source: 
 ABdhPJyxGEL4N1cEGZCTzA2BdX0D5h8deuNBXrc402tmSGBAClRZcob+7bMK2gMS1vadqSwXuwzGJw==
X-Received: by 2002:a17:902:b210:b0:143:789a:7418 with SMTP id
 t16-20020a170902b21000b00143789a7418mr1023400plr.38.1640141052070;
        Tue, 21 Dec 2021 18:44:12 -0800 (PST)
Received: from [192.168.147.134] (rrcs-98-153-100-131.west.biz.rr.com.
 [98.153.100.131])
        by smtp.gmail.com with ESMTPSA id
 nu18sm4086969pjb.15.2021.12.21.18.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 18:44:11 -0800 (PST)
Message-ID: <b0fc66bb-db59-11df-9eb9-a11718062af7@gmail.com>
Date: Tue, 21 Dec 2021 18:44:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [meta-oe]
Content-Language: en-US
To: Claus Stovgaard <claus.stovgaard@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: nerdboy@gentoo.org
References: <c27eabd5b0c9c7606367152cc3dc8e3ac7e1dc8e.camel@gmail.com>
 <cfbfdc6b-6ddb-2e04-ff4a-7ded6dc5a2fc@gmail.com>
 <e94238ed4ece4b751421484d23195f84cfbcc0a6.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <e94238ed4ece4b751421484d23195f84cfbcc0a6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Dec 2021 02:44:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94476



On 12/21/21 2:04 PM, Claus Stovgaard wrote:
> Hi Khem.
> 
> Thanks for your reply
> 
> On Mon, 2021-12-20 at 20:15 -0800, Khem Raj wrote:
>>
>>
>> On 12/20/21 1:37 PM, Claus Stovgaard wrote:
>>>
>>> Looking forward to feedback on this.
>>>
>>> Do you prefer to include patch text in the request-pull?
>>
>>
>> this looks good. Also check at layers.openembedded.org to see if some
>> other layer is maintaining them already. If not then send it as patches
> 
> usbip-tools and gutenprint is not provided by any other layers as far
> as I can see.
> 
> pycups is also available in meta-printing.
> https://github.com/rossburton/meta-printing
> 
> Though it seems to be discontinued, and only support zeus and dunfell
> so would significant work to get updated. Though it might be relevant.
> Have added Steve Arnold to the list (maintainer for meta-printing). so
> he can comment about the status of meta-printing.

To be honest, meta-printing seems better suited for these recipes 
provided layer is maintained still. Dunfell is LTS release and well 
maintained so I would not consider is dead by any means. I would like to 
hear from Steve and see what his plans are for this layer.

> 
> I split the patch's up in 3 emails, as they can be assessed individual
> and depending on the results of the review, some might be easier to
> include.
> 
> Regards
> Claus
> 

