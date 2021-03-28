Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.13760.1616970341504016918
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 15:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5aEc0W5;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id l3so8635651pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Mar 2021 15:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=PeRg2dB+Wb7i6rvoDddPwTvEAURW/BsMfkX7f65Trls=;
        b=S5aEc0W5YrRlsbpAkDPXNXYdV5C+NxdP1X8XVT+V2PtDJJAtky7Hx5GNEzhZUkv7cs
         U3wfciHO6g/9F3UURKvX21XhJFy/nhtojODg0xRsTN+B3z8NVpR42ctG1xHVPJOhWxri
         d7NWI3xrW6cIdBiDS82Q9JIxjXt887++btD+vDNrt+fo/iD8+BdVUGGpL4asSReeX7e5
         Ah8FAJwgdd4PtIyyjvYiZfNb6YG5IiA2t/bn+iAieTNTvaK4ejD4mchvmGStRfzRLpGn
         auMwAJ/6XWaMcBvmEuI4ggSPdJZM9hljRMTFbCru2fHJleOPP4zBYePw+uYVKQDWBRBR
         +saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=PeRg2dB+Wb7i6rvoDddPwTvEAURW/BsMfkX7f65Trls=;
        b=ojCve1MEaby0L22R6pgxUXW4lo7TnuWdFju2Zt4zGhZqBSiYg4uVyadYFppbi0GhVF
         6OpUL/FZWbTcCi6+t2obXiuhd4E3iuu0iviZx0V6zNemg9Ai9EUyB0sOkqjvHl+m8TaR
         vLk2oyjkiK6YTfj3S0SLN81s1U8MwM/YKG0t5fHUNOwBExAKBk+Wm7t395vvKAzf5o0O
         4OEnnKVAycubdVvps7+stD1mgH6JsJgphQv41XmfljXBmyOxtiN/MtGRjQwJ9HtbOr/d
         RDNFLPaPB4ndp7gCjLH6+RaTjgDq2xfIIpr437fyMZ1tv9RQ0BIJ5ZtkBeqhX4c/PL01
         stGQ==
X-Gm-Message-State: AOAM530Uz9Avr1F1wkw1YXtoJIgEWGiX1oupJEOAF9C9xakeTmVrDY4d
	fimlmOrXKbUYwhm48mkGDDHOCT4al9c=
X-Google-Smtp-Source: ABdhPJxmoO04aqBoUNuvZwWiDOn8d3He5SdGNrMranlRaLLqdqUf/82IVJZRwSagjMr/70TPs7+NWg==
X-Received: by 2002:a65:5bca:: with SMTP id o10mr22228669pgr.248.1616970340676;
        Sun, 28 Mar 2021 15:25:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c0c2:69a9:845:6a4c? ([2601:202:4180:a5c0:c0c2:69a9:845:6a4c])
        by smtp.gmail.com with ESMTPSA id co20sm13761317pjb.32.2021.03.28.15.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 15:25:40 -0700 (PDT)
Subject: Re: [oe] [PATCH] cryptsetup: DEPEND on renamed util-linux-libuuid
To: Khem Raj <raj.khem@gmail.com>
Cc: Luca Boccassi <luca.boccassi@microsoft.com>,
 openembedded-devel@lists.openembedded.org
References: <20210325070600.1335182-1-raj.khem@gmail.com>
 <bcac6cd8-ea83-8512-59af-2fe95e4726a8@gmail.com>
 <CAMKF1sr07Z1dx4decfUZp7jBizp61PAcjbKhaOS+4U6CH7BqyQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <243901c4-5bef-ae4c-578d-d3e95332b271@gmail.com>
Date: Sun, 28 Mar 2021 15:25:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr07Z1dx4decfUZp7jBizp61PAcjbKhaOS+4U6CH7BqyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 3/28/21 2:59 PM, Khem Raj wrote:
>
>
> On Sun, Mar 28, 2021 at 2:10 PM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     I am seeing a build failure with this change after updating both core
>     and meta-oe to latest as of today.
>
>
>     bitbake cryptsetup
>
>
> Please update oe-core to the push that went in today

i have that change. that is was is causing the below failure.  I revert
it an the problem goes away.

-armin
>
>
>
>     ERROR: Nothing PROVIDES 'util-linux-libuuid' (but
>     /home/build/releases/master/meta-openembedded/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb>
>     DEPENDS on or otherwise requires it). Close matches:
>       util-linux
>       util-linux-uuid
>       util-linux-uuid RPROVIDES util-linux-libuuid
>       util-linux-uuid-native
>     ERROR: Required build target 'cryptsetup' has no buildable providers.
>     Missing or unbuildable dependency chain was: ['cryptsetup',
>     'util-linux-libuuid']
>
>     The recipe in core is not  util-linux-libuuid, its util-linux-uuid.
>
>     Do I need to cleanup any thing?
>
>     -armin
>
>     On 3/25/21 12:06 AM, Khem Raj wrote:
>     > OE-core recipe is called util-linux-libuuid now
>     >
>     > Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     > Cc: Luca Boccassi <luca.boccassi@microsoft.com
>     <mailto:luca.boccassi@microsoft.com>>
>     > ---
>     >  meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb> | 2 +-
>     >  1 file changed, 1 insertion(+), 1 deletion(-)
>     >
>     > diff --git
>     a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb>
>     b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb>
>     > index 5faaada4b7..0da9a26e83 100644
>     > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb>
>     > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.5.bb
>     <http://cryptsetup_2.3.5.bb>
>     > @@ -13,7 +13,7 @@ DEPENDS = " \
>     >      json-c \
>     >      libdevmapper \
>     >      popt \
>     > -    util-linux-uuid \
>     > +    util-linux-libuuid \
>     >  "
>     > 
>     >  RDEPENDS_${PN} = " \
>     >
>     > 
>     >
>

