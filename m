Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A860CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 17:40:12 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.25496.1695490803700852157
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 10:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZmrK839;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d776e1f181bso4600737276.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695490803; x=1696095603; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hV/pg69pSZ7hTG20NtkpxO/nRYSSRuQiXbx9QoybVCw=;
        b=WZmrK839oJr++RduGabal3rAiI2mWleU58a/9uKxqe1X42mQYzN80Fia/qEQBzDKht
         dXZxVvFsKXqlRGe9/KbKNq9qp1lyHtHpdn3fPhO5jDEPGl5O3e5rrpCPS2Xf91z2I5gW
         GsASnLtnnf2nP1kVgqqYmkab014AbPDvuCCKlrDFJezwAp+yjBMVHpy8SI6/vc7hG/0K
         a3nK+t9aJjI9hhzcO+DwiQXnWXRXiUSTAtW1Xj117q6IxGnMtR0pU4cmbQCZw7xJvX0W
         UnSVSRrg4WdD5VCDYo3pdWxcaEZ5oKEqkGcZz8EnIgQDEAgvlOkvnbI+X0zVJPu/cZwH
         dUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490803; x=1696095603;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV/pg69pSZ7hTG20NtkpxO/nRYSSRuQiXbx9QoybVCw=;
        b=LOvXc7oYVCLi7PoxgWIyuiYhXCrKBjM2tkNEs0xAo5TQ+w5KaxmbqdE4uF3fAc/Dps
         SgWtBpobUrPWIE/vDYUjN30SIGvU/wGkqSdQrUoEIuD/6zrcIip5Yajq46T92CO5r0EY
         xkv7FC6dqZDD3xFMuaH/SZMvm8/hUOVsrigClG1DNn7Mzug16PjbVx8TMA4ZWnJSUNGw
         IfTdisIwFKB+xfnUSG7vytxrhhowcbuwp4Cf0nfFVL7djPZ5axm+GJsssO6MlcHdwNfE
         me9huRORvrA0rbNBN35LIq7a0ZBNbVHKVZMmVDhFx4+UjHjlLHHEzBdqyC6xLgX1lzr2
         tPTQ==
X-Gm-Message-State: AOJu0YydoY5WRiabE53NfODi4BPH5nTI9KOcCibrA5/AntVQCBP1RX4K
	hBEjVyV/sTCVH3maupnZvq5xrL8CB3o=
X-Google-Smtp-Source: AGHT+IGZMVsdGJCXWZ0RLDOQBi4eJ/9Y3mboITMrZrrKe6JbhjqN9GJMMfz8hyOwI4CZdQz7NqVETg==
X-Received: by 2002:a25:4251:0:b0:d78:1f87:d6f1 with SMTP id p78-20020a254251000000b00d781f87d6f1mr2098745yba.33.1695490802737;
        Sat, 23 Sep 2023 10:40:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10::29? ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id p10-20020a259e8a000000b00d677aec54ffsm1324237ybq.60.2023.09.23.10.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:40:02 -0700 (PDT)
Message-ID: <c391c6e1-d72c-2292-6601-329300f6e5ad@gmail.com>
Date: Sat, 23 Sep 2023 13:40:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [oe] [meta-networking][kirkstone][PATCH 1/1] frr: Fix
 CVE-2023-41909
Content-Language: en-US
To: narpat.mali@windriver.com, openembedded-devel@lists.openembedded.org
References: <1782ECAD48B0AC42.9600@lists.openembedded.org>
 <719bd714-75ee-d2dc-acd0-813c0e8b129b@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <719bd714-75ee-d2dc-acd0-813c0e8b129b@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 17:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105100



On 9/22/23 8:17 AM, Narpat Mali via lists.openembedded.org wrote:
> Gentle Reminder !!

getting to it today. I had to tweak it a bit to apply as there were a 
few other frr cve fixes in the queue.

thanks for the reminder.

BR,
Armin
>
> ../Narpat
>
> On 08-09-2023 18:06, Narpat Mali via lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> An issue was discovered in FRRouting FRR through 9.0. 
>> bgp_nlri_parse_flowspec
>> in bgpd/bgp_flowspec.c processes malformed requests with no attributes,
>> leading to a NULL pointer dereference.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-41909
>> https://security-tracker.debian.org/tracker/CVE-2023-41909
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   .../frr/frr/CVE-2023-41909.patch              | 42 +++++++++++++++++++
>>   .../recipes-protocols/frr/frr_8.2.2.bb        |  1 +
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 
>> meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
>>
>> diff --git 
>> a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch 
>> b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
>> new file mode 100644
>> index 0000000000..b27d7af166
>> --- /dev/null
>> +++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41909.patch
>> @@ -0,0 +1,42 @@
>> +From 5966b6a1fc72d3698d08199922cc4f42ea7fc9eb Mon Sep 17 00:00:00 2001
>> +From: Donald Sharp <sharpd@nvidia.com>
>> +Date: Fri, 8 Sep 2023 11:46:12 +0000
>> +Subject: [PATCH] bgpd: Limit flowspec to no attribute means a implicit
>> + withdrawal
>> +
>> +All other parsing functions done from bgp_nlri_parse() assume
>> +no attributes == an implicit withdrawal.  Let's move
>> +bgp_nlri_parse_flowspec() into the same alignment.
>> +
>> +Reported-by: Matteo Memelli <mmemelli@amazon.it>
>> +Signed-off-by: Donald Sharp <sharpd@nvidia.com>
>> +
>> +CVE: CVE-2023-41909
>> +
>> +Upstream-Status: Backport 
>> [https://github.com/FRRouting/frr/commit/cfd04dcb3e689754a72507d086ba3b9709fc5ed8]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + bgpd/bgp_flowspec.c | 7 +++++++
>> + 1 file changed, 7 insertions(+)
>> +
>> +diff --git a/bgpd/bgp_flowspec.c b/bgpd/bgp_flowspec.c
>> +index 341cfe9d0..3e2b1ac49 100644
>> +--- a/bgpd/bgp_flowspec.c
>> ++++ b/bgpd/bgp_flowspec.c
>> +@@ -112,6 +112,13 @@ int bgp_nlri_parse_flowspec(struct peer *peer, 
>> struct attr *attr,
>> +    afi = packet->afi;
>> +    safi = packet->safi;
>> +
>> ++    /*
>> ++     * All other AFI/SAFI's treat no attribute as a implicit
>> ++     * withdraw.  Flowspec should as well.
>> ++     */
>> ++    if (!attr)
>> ++        withdraw = 1;
>> ++
>> +    if (packet->length >= FLOWSPEC_NLRI_SIZELIMIT_EXTENDED) {
>> +        flog_err(EC_BGP_FLOWSPEC_PACKET,
>> +             "BGP flowspec nlri length maximum reached (%u)",
>> +--
>> +2.40.0
>> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb 
>> b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> index 1897eb2abd..d226d5411d 100644
>> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> @@ -18,6 +18,7 @@ SRC_URI = 
>> "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
>>              file://CVE-2022-43681.patch \
>>              file://CVE-2023-31489.patch \
>>              file://CVE-2023-31490.patch \
>> +           file://CVE-2023-41909.patch \
>>              file://frr.pam \
>>             "
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105062): https://lists.openembedded.org/g/openembedded-devel/message/105062
> Mute This Topic: https://lists.openembedded.org/mt/101235307/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


