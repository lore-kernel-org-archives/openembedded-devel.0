Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80557FD3750
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:36:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44212.1772022958348131581
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KvJ+iRza;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483a233819aso65391125e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 04:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772022957; x=1772627757; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AkRS5W+T/5d2otXQgRkrEzIyH4zuNv/OQFcKiLJg+cI=;
        b=KvJ+iRza3GjLfftug8YcrWx2thB9SoDAGPEqMj8dCnUJEzUo9napvy8typq9EbLJas
         lQd837oNnM+qgltlh+buKBQfSf9fxrdeKxq/lkj9ZECQechOkaNUY55SRXrTgHLZugBs
         RPMoANtzsuQCduXv20YLz2pgMw4GRIyEKhhH8QaPdkK47jhzH5CX3DrX61vkAw26jUst
         d0Cv/fJoKrVKW9k7d/0siwNT3UivwC9WNFUruRUtBOvbnQqEurwDWwGTQtmFLhOhQai/
         Xf8DPkJflI7K6CBFRFBiCHmDzk3uWl65u+kWoY9Wnr6WRCfAM+owcqi6CtAp2Cg/LCkM
         XoNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022957; x=1772627757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkRS5W+T/5d2otXQgRkrEzIyH4zuNv/OQFcKiLJg+cI=;
        b=tRaatxa2doPiDQJLHhljMt9WG/noRzGfrQAviXChVWXb7kKtTSnZbKFlk7xRqGP8yf
         nD6WB1Ltdo8nGhzqAoOK2ooB7C0L6uWLrkHG5933rYBnK/hAB4YN2vQl65XWZ1I1GMX9
         J5+6bV6QS3N3tiVpeOXjdgctdXFnzgFDzDuDYwQkWQD7lEHeIc39W0ZW2Mnz9s94oPQ2
         1100cPfyfLWJfUW6uarAA+k2pVeC/YAtstuBnZsMMCjUoXXy1xnT0wWyArwpVsvezlUf
         qzFKaxUtvxc1Xg6NN0lL+yJDwSYtVtB98Vje94rRt9g6AazVV3E/RxxD06FeutlJBJAV
         sE3w==
X-Forwarded-Encrypted: i=1; AJvYcCUY0Xp3RXROAwRw2S8N36QxoBmMgI9i3T8EQX/QSOPzZ0TGqw0fuEmxcQAbyJxHUZMuaODJyz2nMOv2CiUKcNBIe1E=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCYGjdYgMTZB/xs+tH0CRe3ouXIwgTUPh4WRUfPGskyDVTrPUI
	ZrwPQeoybvEGJc63ABUOAhdJPM+t512OZsrjggOUyUjItMnpvC9Lf921
X-Gm-Gg: ATEYQzxzwjAZmm9rx/7sNDZAnOzEIl83fJYUWxRJeztkACsj3W19qxMGnACmIs6dObm
	Fo77yCb3iyU5ZzCdXhr3ijgflOHNM6KF3enKYDvgyTy4O5SO87eN1oC9+jZBHby787M5JT/EG52
	Gv6oFhRYWj/odesygFuig8ASYOnuygDzwkA8RR2q4xSvhFs6H1viX6inu62zWyCKYfGaRGAqnGb
	Rplw3wfdjtV/SGqW8Cf3N0tjSB9msz9aIUp8SUafjZy4MAZxpynK6YQudWX5Lbpql23velIiyjw
	87uSQ8wtEya87ytpgupbTX79vCDVn7IleOp4I+tPREknnIfjC27ZVOLnLfJrZqa5rc/ACfXBzjt
	IDKaj/qXuGC6F78XcQw4tR//84zHknpQWo1dVt2sc8IgU8i8uebVAWAfvCZJnttSDj308uwAf+V
	VRrungSNER3w3ijkC1iGPRCPMr9nX8Y5E=
X-Received: by 2002:a05:600c:1f8f:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-483a962e459mr300543385e9.16.1772022956452;
        Wed, 25 Feb 2026 04:35:56 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f1a3fsm75612685e9.3.2026.02.25.04.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:35:55 -0800 (PST)
Message-ID: <5f02ad7b-159c-48eb-8fc8-8da43107ad17@gmail.com>
Date: Wed, 25 Feb 2026 13:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] CVE report - master - 2026-02-23
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260223080942.2282331-2-skandigraun@gmail.com>
 <08f026da-7cda-47fb-984f-6a7c8103ee9c@gmail.com>
 <AS1PR10MB5697E46664E7BB655C2E0C8AFD75A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <AS1PR10MB5697E46664E7BB655C2E0C8AFD75A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 12:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124652

On 2/25/26 13:12, Marko, Peter wrote:
>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Gyorgy Sarvari via
>> lists.openembedded.org
>> Sent: Wednesday, February 25, 2026 13:05
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] CVE report - master - 2026-02-23
>>
>> On 2/23/26 09:09, Gyorgy Sarvari wrote:
>>>  - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
>>>  - freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
>>>  - freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
>>>  - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
>>>  - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
>>>  - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
>>>  - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
>>>  - freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
>>>  - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
>>>  - freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
>>>  - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
>>>  - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
>>>  - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
>>>  - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
>>>  - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
>>>  - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
>>>  - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
>>>  - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
>>>  - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
>>>  - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
>>>  - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
>>>  - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
>>>  - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
>>>  - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
>>>  - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
>>>  - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
>>>  - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
>>>
>> These CVEs are all for freerdp v2. In a few days there will be about 11
>> more made public.
>> Upstream has just released a new version in the 2.x series, the very
>> last one, they say that "From this point on we will no longer maintain
>> this branch and urge all to upgrade to FreeRDP 3.x."
>>
>> It contains some fixes, but not all CVE fixes from 3.x.
>> Considering that freerdp3 recipe is available, and that version is well
>> maintained, what would you say if we dropped the v2 recipe instead of
>> upgrading it to this last version in this series?
>>
>> I'm not a fan of shrinking the CVE list like that, but this recipe's
>> future doesn't look bright...
> Dual versions like this should be removed ones all recipes depending on them are updated to use newer version.
> So this means looking if vlc and remmina recipes work with freerdp3 and if so. Drop the old revision.
>
>

Good point, thank you. I see that actually weston from oe-core has an
optional dependency on it also. I guess my proposal can be ignored then.


