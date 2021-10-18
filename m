Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A92C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 14:02:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.37029.1634565733578942831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GsMENJUY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y4so11344535plb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mhWs0a7eKXd8j0vQ74I2QHVZOfrhPP+Errh7QUvFVQI=;
        b=GsMENJUYdzTrmKEFoo+mOZUZoI4NYXUld8lQc+z3eFI+/yL1YjrkKzaDC5MN4LfCmW
         WPZu3xtFdJxy2LmgdEpCOxB1fF8bypsXg8I88T+Iaui2h7PLFmWihNo2StJbWRCa6hHy
         7RameYAW1xHEhoIXE0oUC1XGFcb/COjsMdZkmLaNlx3IoblWas+VqRLbW3lkBxP9lPDb
         Ea9hbMelKcUhogG1JL+XUY2eUcCUfqVSrnHLh1qwBbT6Cx7UFPHD1E8mALRT83PEuWx4
         a9VP5Uxd4FNuSkmmlZmKitzzZ9iM9bprsIO5H6HQYR085wG4hqvoO+mS/yHo3aGwvsyb
         /FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mhWs0a7eKXd8j0vQ74I2QHVZOfrhPP+Errh7QUvFVQI=;
        b=KeOrCzZAPe4phaMVD0g5FjW4Ycx4DtZUEqXirhbWteT+2La/tv5p9rOujXI8IC6R6k
         /wi8Lny4ny7ZXFLw4BE7f+bdvrRnTH+BYsKkiA7o5TT0/RSKlm8NnvrsYE8uqKbs+6vU
         SBSvDoaALBOCL9V2xfNOlkHVRx4b6fnV14GsY0YuDp8wTBfrMgDo7gbTq2P14EA5DdF/
         UlFckRHHoKI5egsVXZAwTQlidcPVKxcJDe43lh+WLmpTwF3h+feJfvBmC8CXQ6XfqZqt
         mCsToPH0JxT50J2pasuFqMD8jMBxVTwTiCnnETJd8+rIC3zXaSvaDpgm8f3PF0Gn1qYO
         yJSQ==
X-Gm-Message-State: AOAM530IpsvGfCfwcrTbGdh+lLC7K3VZC59uq1MY3kq5UY4wRXfPORcN
	gWKZe1Bgw1wWiQSLu3Q7vn0=
X-Google-Smtp-Source: 
 ABdhPJykVecHQalbwPau44vMh2na2wyXUKND+i2ctVHh339XV+QxUS/9Z84GafJwx653pHKKhqni8g==
X-Received: by 2002:a17:90a:9b84:: with SMTP id
 g4mr48286095pjp.123.1634565733085;
        Mon, 18 Oct 2021 07:02:13 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::f3c? ([2601:646:9200:a0f0::f3c])
        by smtp.gmail.com with ESMTPSA id
 m28sm13393920pgl.9.2021.10.18.07.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 07:02:12 -0700 (PDT)
Message-ID: <d95b750d-7541-dd01-3fb9-cef9a785873a@gmail.com>
Date: Mon, 18 Oct 2021 07:02:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [oe] [PATCH v2][meta-python] python3-pyroute2: update to 0.6.5
Content-Language: en-US
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
Cc: "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
References: <20211016133327.3781109-1-open.source@oleksandr-kravchuk.com>
 <f397ae61-1328-efae-9500-21c4b6ab7eee@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <f397ae61-1328-efae-9500-21c4b6ab7eee@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 14:02:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93422



On 10/18/21 06:50, Trevor Gamblin wrote:
> 
> On 2021-10-16 09:33, Oleksandr Kravchuk wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>>
>> Tests are, unfortunately, not anymore supplied with pypi package.
> 
> Let's hold off on this uprev and I'll see about modifying the recipe to 
> the git fetcher, which might allow us to keep the ptests. I'm very 
> hesitant about removing ptest coverage where we can get it.
> 

makes sense. I have removed it from master-next

> - Trevor
> 
>> Signed-off-by: Oleksandr Kravchuk<open.source@oleksandr-kravchuk.com>
>> ---
>>   ...hon3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.19.bb => python3-pyroute2_0.6.5.bb} (75%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
>> similarity index 75%
>> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
>> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
>> index a85b0929d..d69439352 100644
>> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.19.bb
>> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.6.5.bb
>> @@ -3,9 +3,9 @@ LICENSE = "GPLv2 & Apache-2.0"
>>   LIC_FILES_CHKSUM ="file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \ 
>> file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
>>
>> -SRC_URI[sha256sum] = "45460d12ed2a5caf272a357a3360b36d1e346f17afe1425b66fc21d70f462b29"
>> +SRC_URI[sha256sum] = "d0995c8aeb96c0e4eed4d62e97c9d795000a1a33b747d6dc54326665857cf11c"
>>
>> -inherit setuptools3 pypi ptest
>> +inherit setuptools3 pypi
>>
>>   RDEPENDS:${PN} += " \
>>       ${PYTHON_PN}-ctypes \
>> @@ -29,8 +29,3 @@ RDEPENDS:${PN}-ptest += " \
>>          ${PYTHON_PN}-pytest \
>>          ${PYTHON_PN}-fcntl \
>>   "
>> -
>> -do_install_ptest() {
>> -       install -d ${D}${PTEST_PATH}/tests
>> -       cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>> -}
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#93402):https://lists.openembedded.org/g/openembedded-devel/message/93402
>> Mute This Topic:https://lists.openembedded.org/mt/86371301/3616776
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [trevor.gamblin@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

