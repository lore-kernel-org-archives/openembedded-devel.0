Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.13894.1616970988578630460
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 15:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L/dYVEo0;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c17so8645109pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 15:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R4MhY8orzS7vRS2gngfjZ6jUrE16Vv6s37mMfhute0s=;
        b=L/dYVEo0Gg5q+S5iaYU4nst/2ZJDH/oPQUAKiNMINVgPA7SY5TFJGa9Va4LoUMAFPt
         POyJQuJqDAipSAUV0kaz0iFp/boZBQk0aiXyfwwvNbOnA34D4WKmEqBsbwCNPcPf6AU9
         9O6O8t6Ymzn75dR4IeNreyqgKaG+Xld6OCbb1DAObACOpAwHGPo6QOMJ4qcLQQ9eg3zW
         3PY2w5f1sL1mzAOmYa44u6+lTxwUvPBkv6JQhL8yB8KqouGtx9oi8lyvgDV3elLbNgbI
         /qNs28NIQF7Xnja1PkKJpp7aVWyq0eaQdXT0tkCTVuPxope+u/i2X5LyBJMNnXaXr1bs
         30bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=R4MhY8orzS7vRS2gngfjZ6jUrE16Vv6s37mMfhute0s=;
        b=M0EIGo6INCPAxWh8wm1FecHzOSDK2Tbf/N+DnIk30RlaTOm4yFxOzETOdnBiLFv3yr
         jq3cd7T9VTxZwdnRCq1etnq8JzxiEQbTtaMqHzY0SRMNt76eIl2eMwH24XZ6xHqMBeX2
         Uxxo96enN5D/NSv1zMwzoLvK/YuzJuRzdrMvLGR0eko8H46clZ/PVegxGR1b9mPFhliB
         q7oK0WBvsN+rlqCC+ob/Wjv5RxwQMrP/Dwqz//xlur8XDbk1Px1erMYp721inJcjUVaC
         pDVvXcoXR13ZN4TgwM8smfxem7B0auCF4t3alpsWLWyxvSBV+/gO0TEZUtQCOXb21/sP
         KBPg==
X-Gm-Message-State: AOAM533rArgTmfYWYVJeWTLfvsFcQYg197rbw7Z5mZxMyoeXyK7vPjmt
	GvnSDFbwQQEMc7O+CzOcJ6SchqJa/PM=
X-Google-Smtp-Source: ABdhPJxv8EQ5anoD8cSQ2UFS5YCMjyy6bwB+yXprELHUrFq/T3mBjGSH3azHSjAWE2g8MjVkwzOVoA==
X-Received: by 2002:a63:f11:: with SMTP id e17mr21702517pgl.296.1616970987989;
        Sun, 28 Mar 2021 15:36:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c0c2:69a9:845:6a4c? ([2601:202:4180:a5c0:c0c2:69a9:845:6a4c])
        by smtp.gmail.com with ESMTPSA id k64sm14810805pgk.23.2021.03.28.15.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 15:36:27 -0700 (PDT)
Subject: Re: [oe] [PATCH] cryptsetup: DEPEND on renamed util-linux-libuuid
To: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210325070600.1335182-1-raj.khem@gmail.com>
 <bcac6cd8-ea83-8512-59af-2fe95e4726a8@gmail.com>
 <CAMKF1sr07Z1dx4decfUZp7jBizp61PAcjbKhaOS+4U6CH7BqyQ@mail.gmail.com>
 <78523e8e-f833-85d8-bade-6051de21329a@gmail.com>
 <CAMKF1spTGCTv7m2vtLEnK3FpQDkWe0otqekjuTTu6AKnMfqH5w@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <842eeef6-d4fd-84d0-ece3-edd423b1e000@gmail.com>
Date: Sun, 28 Mar 2021 15:36:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spTGCTv7m2vtLEnK3FpQDkWe0otqekjuTTu6AKnMfqH5w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/28/21 3:33 PM, Khem Raj wrote:
> On Sun, Mar 28, 2021 at 3:30 PM akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 3/28/21 2:59 PM, Khem Raj wrote:
>>>
>>> On Sun, Mar 28, 2021 at 2:10 PM akuster808 <akuster808@gmail.com
>>> <mailto:akuster808@gmail.com>> wrote:
>>>
>>>     I am seeing a build failure with this change after updating both core
>>>     and meta-oe to latest as of today.
>>>
>>>
>>>     bitbake cryptsetup
>>>
>>>
>>> Please update oe-core to the push that went in today
>> As an RDEPENDS including "util-linux-libuuid" make sense but there is no
>> recipe called "util-linux-libuuid" to use as a DEPENDS.
>>
>> Am I missing something?
> see https://git.openembedded.org/openembedded-core/commit/?id=65efd76198ad805060fe28714765cd423fa748dc

yeah, just saw it . thanks

-armin
>> -armin
>>>
>>>
>>>     ERROR: Nothing PROVIDES 'util-linux-libuuid' (but
>>>     /home/build/releases/master/meta-openembedded/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb>
>>>     DEPENDS on or otherwise requires it). Close matches:
>>>       util-linux
>>>       util-linux-uuid
>>>       util-linux-uuid RPROVIDES util-linux-libuuid
>>>       util-linux-uuid-native
>>>     ERROR: Required build target 'cryptsetup' has no buildable providers.
>>>     Missing or unbuildable dependency chain was: ['cryptsetup',
>>>     'util-linux-libuuid']
>>>
>>>     The recipe in core is not  util-linux-libuuid, its util-linux-uuid.
>>>
>>>     Do I need to cleanup any thing?
>>>
>>>     -armin
>>>
>>>     On 3/25/21 12:06 AM, Khem Raj wrote:
>>>     > OE-core recipe is called util-linux-libuuid now
>>>     >
>>>     > Signed-off-by: Khem Raj <raj.khem@gmail.com
>>>     <mailto:raj.khem@gmail.com>>
>>>     > Cc: Luca Boccassi <luca.boccassi@microsoft.com
>>>     <mailto:luca.boccassi@microsoft.com>>
>>>     > ---
>>>     >  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb> | 2 +-
>>>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>>>     >
>>>     > diff --git
>>>     a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb>
>>>     b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb>
>>>     > index 5faaada4b7..0da9a26e83 100644
>>>     > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb>
>>>     > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>>>     <http://cryptsetup_2.3.5.bb>
>>>     > @@ -13,7 +13,7 @@ DEPENDS = " \
>>>     >      json-c \
>>>     >      libdevmapper \
>>>     >      popt \
>>>     > -    util-linux-uuid \
>>>     > +    util-linux-libuuid \
>>>     >  "
>>>     >
>>>     >  RDEPENDS_${PN} = " \
>>>     >
>>>     > 
>>>     >
>>>

