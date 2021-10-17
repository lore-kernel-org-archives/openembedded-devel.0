Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429F1C433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 21:23:32 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.28001.1634505811442484335
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cqrickw1;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so13093869pjc.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Oct 2021 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:organization:subject:in-reply-to
         :content-transfer-encoding;
        bh=WiWTXH/TSqM9XLTiPj5AKRnxaMOjIiiGlQ4U80PRuhg=;
        b=cqrickw1fIoPfWezbTpecUkHFmkjY4rf+zW6DOeelcOuf7juc1xB5AUjI2+vacjMaJ
         FSLKtpZcOgLjIJPPuSwxY+/l7fobejiHmnPR4S/MGhIqnSyp4smqQzR3h0uUq5j/FeHF
         QtBaosYrrGhiJR2zzY+VX4lR4102r8AKcmzA5Ngk7MDzFaumjVw4NfPwSniCOx7jwGEa
         LO47j28i1qMbKW+0krfoI6HH+tyTk5PlQG9pd2XHDPldghjNgpupDIchR16cfdTIPA1f
         8MZ3g1clZQM/qnaKRZakdEk/iZDBeZ+V+m/7ozLA6Jqiuck+3xbLi3xW68oQQDapBsHE
         +n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=WiWTXH/TSqM9XLTiPj5AKRnxaMOjIiiGlQ4U80PRuhg=;
        b=r15RpdcGCxtFUjKKZuZkXbjEsKfWKTujr3RBlliesIBuTzIN0eMepU+4TjEwThZNNq
         XMqr/tLbgUbgZS/KYL5cNxAcoxVxqcKsNAZdP66ARNSEtCDhZl8wTjCSfZFaiQpJ+ZvR
         5N6Q31YhgC6VVdLheX3ygFIvhLiiPPuT0G6UhYscKcvp7dapniTObrCOobFVZ739jOC0
         v5JdhVFLyfe+YfWWMJno00CZm0wGanbZ14Qx1ftklvPKfnfJAqdiKeI1/+FXxERLQWKH
         S5hDrgEvdh6IxnLuPjgo3FpnCYYGNHS+oBMz0VDs9E7kN0wh8YQllL+S2wjkrvnO7uk2
         3hIQ==
X-Gm-Message-State: AOAM532e08oOChz1j/kgbyToY+FPm8pw1S1N6z/o7MYByNjFTs/Yx+3w
	ZJkQUl9+Bfuie+WbBiUiDxg=
X-Google-Smtp-Source: 
 ABdhPJy3k4i5jUWxP1de5FWBB2XaDA2wjES22yQbanaTTVer2CfNGxoNvOQH0zlNAxavsD7mPb8l+Q==
X-Received: by 2002:a17:902:d488:b0:13f:165e:f491 with SMTP id
 c8-20020a170902d48800b0013f165ef491mr23776110plg.12.1634505810855;
        Sun, 17 Oct 2021 14:23:30 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9d56:a24c:bb34:792d?
 ([2601:646:9200:a0f0:9d56:a24c:bb34:792d])
        by smtp.gmail.com with ESMTPSA id
 d18sm10587227pgk.24.2021.10.17.14.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 14:23:30 -0700 (PDT)
Message-ID: <0d71ee5f-5302-297b-2e65-87072d96a213@gmail.com>
Date: Sun, 17 Oct 2021 14:23:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20211016165223.1271496-1-raj.khem@gmail.com>
 <1ea36ba81f0d4fe0b43d36b415ee6255@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
In-Reply-To: <1ea36ba81f0d4fe0b43d36b415ee6255@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Oct 2021 21:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93410



On 10/17/21 3:51 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-
>> devel@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 16 oktober 2021 18:52
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Khem Raj <raj.khem@gmail.com>
>> Subject: [oe] [meta-oe][PATCH 1/3] protobuf-c: Do not use gold linker
> 
> Add a motivation as to why this is needed.
> 

yeah, I should have added that gold linker ends up with symbols being 
exported with weak attribute while libprotobuf.map lists these symbols 
as global and exported. Gold linker ignores any mapping directive inside 
extern 'C' blocks, it could be a bug in linker [1]

also see gentoo bug [2]

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=24527
[2] https://bugs.gentoo.org/683892

> //Peter
> 
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb b/meta-
>> oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> index cc037d3934..b5ab0a171c 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
>> @@ -19,6 +19,8 @@ S = "${WORKDIR}/git"
>>
>>   inherit autotools pkgconfig
>>
>> +LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -
>> fuse-ld=bfd ', '', d)}"
>> +
>>   # After several fix attempts there is still a race between generating
>>   # t.test-full.pb.h and compiling cxx_generate_packed_data.c despite
>>   # BUILT_SOURCES and explicit dependencies.
>> --
>> 2.33.1
> 

