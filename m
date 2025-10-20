Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED0BCCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 19:44:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1398.1760989486865357260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 12:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/P+7X19;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47106fc51faso55710445e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760989485; x=1761594285; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zm5KAmXJ6/ftsRANAkCiP5uCmKbRtWtu9Cpang86E9Y=;
        b=g/P+7X19LxjQoYv0B9sCrWuRr0fcGNxD1TxmowiDasfS8g31MLucSJoS9muXLX5jJy
         TanAUPqssmdHSfPA2eDkAs0EH+rC5Zyd0f9RFx+CVqKm6vSz5sf97rqopCb3jJ8jolYW
         E11u5rUG/NF/QBzb6KEP3vncAGQH8BxJa3FetHETxrJkZRA217SaSo7j9ROJKt69EUh4
         x6xBzQhMPuq0tDi876BJmeKn8W9qgElPxmxo34cvZA1f8DWH1TDCyOLSSa1+uJEWPzs4
         G5/Lgobkyw2TfHLpgmr21dT1KlGiwJV6shFUMtB2ue3746HpRvjUOdfYcsyRja2doKKf
         BwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989485; x=1761594285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm5KAmXJ6/ftsRANAkCiP5uCmKbRtWtu9Cpang86E9Y=;
        b=KkTgnEiTT8d+23NH/Zm6f2gKpgb8LC0Ue3M/+rqZzasPedTVrxAlU/ztTeD9Dghn98
         83O+ffd4dWulxL2KOcKdIHnsAiyvwP2T4A2Gy/ili0YnUk57tcv4Bf8xhBBzHjvXJNT0
         CSSCWwQA/rbAT/En76HXGJqwE2druYx1oZs6sraZ0XDLqL/RajGXDg51GeWI/6gg+LqS
         e3DiuUVUnz8eT2MmaKMYUEXcjDoo3g85Bv67zcAW+HbBrho11Kne6s+mFsvn5dljbcRz
         XNUavjZ/CJ4nWoy9WkHu1l2DONV+h+eIkqJ8Ay9Q1VAM8W8fvK5MGOgCtRxfyU5dpbkE
         hrMw==
X-Forwarded-Encrypted: i=1; AJvYcCVRw0u4DicpRBydH6od5+Ypq4dw7Owe7oGNccF2WadDDcUFKrfvPXlNyUdURqeB/zqaehc1WF1YvcaV7uBLOO6ZOAE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsCTst+RVHwr5BGD1MHAil6mNqt5eIzelKHxhIZUBnWjBXwPJI
	XYNZgxaS6EBeE9WAvfdybCExtCRusb1/4nHStMh8echMXPEZRXfggT6K
X-Gm-Gg: ASbGnctE+zFTT/UT5VuTUhM81NRCDIptrxGkqgQy/mOW3fVluDgC13m/Uo8g7lfpmVi
	J6g9DJ52gBNFTQPXbP0MCo4xZG0TbzWBOAoQwExeNfGKCchtCezj++h5eeqajSMybtfrLZJxukM
	q9995YSB2WttQiqeCXutFZCX2oEpUlAOe3vSQVSbhwVcGl8BSvnyOHaAVNAgDN+SnRyr1hKUIxF
	MUxJ8L8Sip9k5a7Xn666Oxvxg7//uwG3dKyeKkJwLUmgjLXrNfNRVm3Io5/BXZCOpM/UIUX2iKG
	O47MOWUx6jFJpp3p06U51H6olGoIQIT3Q3AYnpe3NL+xyEQAqmwoR8OeDXlntNjxdJiXv1Z5Wk2
	BhzEAp8j6SLN9obX7IPRmlpNy4MK3qtMtkMQaNVxti5lBHGzV8rM2+vFtn5ykNqfXGU3UUc8ph3
	NueQ/56k2MmrYSn1TO9HA=
X-Google-Smtp-Source: AGHT+IFLqp7CNyEY9LK6fPm2Fmvzia/DpPQ44ljAqRNxQcCURmgxRP5Ds6ku/KH2nQs40XpuInUT1g==
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id 5b1f17b1804b1-471179174dcmr118660905e9.33.1760989485152;
        Mon, 20 Oct 2025 12:44:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ba01bsm16462233f8f.41.2025.10.20.12.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:44:43 -0700 (PDT)
Message-ID: <7c7311ac-1964-4ff1-9046-e41c93ae4269@gmail.com>
Date: Mon, 20 Oct 2025 21:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and
 CC
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20251020180022.3398560-1-skandigraun@gmail.com>
 <20251020180022.3398560-2-skandigraun@gmail.com>
 <DB5PR02MB10213BD36DCCF1B79BE13FBA1EFF5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DB5PR02MB10213BD36DCCF1B79BE13FBA1EFF5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 19:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120822

On 10/20/25 21:38, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Gyorgy Sarvari <skandigraun@gmail.com>
>> Sent: den 20 oktober 2025 20:00
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Subject: [meta-oe][PATCH 2/2] cryptsetup: extend licenses with Apache and CC
> Apache -> Apache-2.0
> CC -> CC-BY-SA-4.0
>
>> The project's readme indicates that some parts of the code is covered
>> by Apache and CC licenses - add them to the RECIPE accordingly.
>>
>> Reported-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
>> index c297de053d..f2dc5d9b46 100644
>> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
>> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
>> @@ -6,8 +6,13 @@ and can hence offer more features than plain dm-crypt. On the other \
>>  hand, the header is visible and vulnerable to damage."
>>  HOMEPAGE = "https://gitlab.com/cryptsetup/cryptsetup"
>>  SECTION = "console"
>> -LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
>> +LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-exception & Apache-2.0 & CC-BY-SA-4.0"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326 \
>> +                    file://docs/licenses/COPYING.Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>> +                    file://docs/licenses/COPYING.CC-BY-SA-4.0;md5=b296faaab9c17d5874fd17967df54736 \
>> +                    file://docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception;md5=32107dd283b1dfeb66c9b3e6be312326 \
>> +                    file://docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception;md5=1960515788100ce5f9c98ea78a65dc52 \
>> +                    file://README.licensing;md5=45c1ba157f18d08991819f41f56d72e9"
>>
>>  DEPENDS = " \
>>      json-c \
> If you are going to include CC-BY-SA-4.0 in LICENSE, then you also need 
> to set LICENSE:<pkg> for all packages that this recipe produces. The 
> license is only used for the FAQ.md file, which does not affect the output 
> of any package.
>
> //Peter
>
True, thanks for that. I thought that argon library was relicensed since
kirkstone, but I only assumed that without checking it the actual
content under this cc license. Will send a new version.

