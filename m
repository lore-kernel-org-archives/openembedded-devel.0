Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55D1C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 11:18:19 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.69554.1679570296211333395
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 04:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LiU0VPGD;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id i5so37939103eda.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679570294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToOQmg1jhS7bINYclkkMJqHfNQsaSXfAuIXt2Va9L3s=;
        b=LiU0VPGDzSKW/bwnXdAhiKfYdZKwcTEagOKsKsPYLS4eNh15us8wBCQiD/CzzGBFpW
         xQBDupoF4Yuow7F6Y1bwSpyNBabJjgjN7oJnhmZN/X++obJ9ncL7+p5HSB9nHlowONWh
         RZ2x0IVjOW1VQyLaePep4pGVZXtKPLN59+XAXbtembG42Aqc/4Ox1RlFIpY7ev6MHWu+
         u9TqMCfJ0wf9uanhJSV5XmbsVW7njLI2brLn2yqWkLiiIE1B7zUKdunpvXScDM0BEXSo
         fk5StwGurzjwfoV8hQ88fjSrult10jIKOvagxFylL3SACU6/qdXeUFgJnCVfmZkg+/TA
         SlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570294;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ToOQmg1jhS7bINYclkkMJqHfNQsaSXfAuIXt2Va9L3s=;
        b=1eSGeTG2s6mXt7dB6uVVZxS8B/At5xPKQurdjrGVD2Ba27TcjcEmB/xqOFW2ywuBem
         FaYBbLzO4Qg/GANnM2To41pBmwNfwWMkutfrWSvoKvhUXWVIeitDAQujbvZ1QMx5Uyyh
         4bvdJZ8YtyRSMn+EvZC3uqbxmrtSdidEltkId2PEfqxBuV1QSHa866Rrx9YGYpDi1lOU
         HVew0NTV3I1U95eUtbifSO+0CS24Jig1Mui9ORBt5iTHxPX2NRUxNJkcLKQit4TJkZFD
         33GbUfn53dRhL62JuAVx08/Ouqn1XIFq4hq9Dk2MNPHd5TfpFmrwPFEfaX8bY4LRDIkD
         4rqA==
X-Gm-Message-State: AO0yUKUhvMlOvOL1Ctzz553UiU5vCFuQUifntN3sarH3cxKBrPQnqV1d
	LDSiYXUU0g469+5BjJ3Qn40=
X-Google-Smtp-Source: AK7set+uazUl14BedyXB1KI18XskouWamhhl+vIoE6gXerY7iAcP2Iv6PcYnVUMD0pbDZ4QrzOQQ6Q==
X-Received: by 2002:a05:6402:54a:b0:500:58d8:b339 with SMTP id i10-20020a056402054a00b0050058d8b339mr9376076edx.20.1679570294560;
        Thu, 23 Mar 2023 04:18:14 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id b22-20020a50ccd6000000b00501dac14d7asm2141188edj.3.2023.03.23.04.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:18:14 -0700 (PDT)
Message-ID: <eee42b19-4c3a-e252-5590-42cc1506ea97@gmail.com>
Date: Thu, 23 Mar 2023 12:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] [meta-python][PATCH v2 1/4] python_mesonpy.bbclass: New
 class
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <6646B534-8948-4706-9E8A-DAEA4111B694@arm.com>
 <14fa0c81-90ec-18c0-9bbf-a1769cfb743f@gmail.com>
 <39A18BD0-B6AD-4EF0-806B-578EDB2D3DC4@arm.com>
 <174EAFE93556A78F.19937@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <174EAFE93556A78F.19937@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 11:18:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101669

2023. 03. 22. 9:18 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 20. 17:26 keltezéssel, Ross Burton írta:
>> On 20 Mar 2023, at 15:01, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>> 2023. 03. 20. 15:46 keltezéssel, Ross Burton írta:
>>>> On 17 Mar 2023, at 07:25, Zoltan Boszormenyi via lists.openembedded.org 
>>>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>>> +inherit setuptools3-base python3targetconfig python_pep517 meson-common
>>>> I still don’t see why you need to split the meson class up.
>>> See the other thread. For some reason, meson always wins
>>> regardless of the inheritance order, so do_configure has
>>> meson_do_configure instead of pep517_do_configure, etc.
>> Add a new do_configure to your class which simply calls the right one.
>
> It still doesn't work. meson_do_qa_configure fails with this: [...]

This construct also doesn't work
===================================
inherit meson
do_configure[postfuncs]:remove = "meson_do_qa_configure"
===================================

It results in an "unparsed line" error. So, I have to re-iterate this:

> Sorry, there seems to be no way around it but splitting out the
> environment setup from meson.bbclass into meson-common class.
> If you don't like the "-common" naming, I can rename it to
> meson-env.bbclass or something like that.
>
> I will still rework python3-meson-python to not require
> the dummy patchelf python module and review other
> comments and make necessary changes.


