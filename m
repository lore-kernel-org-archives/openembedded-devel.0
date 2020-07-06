Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.422.1594057879697506746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 10:51:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sDFNNvJp;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id md7so2206815pjb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2020 10:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5xjJhkqEJ4P1RoggvQGKagnWPBR3xJQ3POcgMYKLo8U=;
        b=sDFNNvJpOgxcqQe4V59pZ0T0M3CccsA10Ba1th4kvJRWf+eQAmt8XJnPyajiaXGlnw
         4DNu/uzzgTTc+2C42v1syV6bPNWCFGpPAbir9Q7xJCx1vbGNuV57leSi70ZIiLmIMd2P
         bkL2AbrV68eP7w3AGQD9Tzq/NUAEs23l4BnWXmDhbIK+VxmGpMV6n6rufdkdeQWzRtWA
         3nX/B5xel0O4D5HXuzE//sU7F43xxbrhsv3BohzvloR+/eDvkOINSn5CYQVHwIRYXIb1
         EAc2tm72lTkkInUa4lC7dAQF9W0m9rss2GDFGs5S9pAG+jLvlohO2reIn3/UOJS1Ofq6
         DvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5xjJhkqEJ4P1RoggvQGKagnWPBR3xJQ3POcgMYKLo8U=;
        b=qOQByHPxTXDnIU18oEqDbHB4/HSDDrX/5+RSR7C42MsGga8LzyK9zAVqO5s4FTIKRv
         8OGyz/sMPxCFpxo+kBYLJRdi1xU/Gl9X3Sx1EquKvdztoj99YiXSofEKEo6G5sCaanZS
         c3eY3dtvMsnyih4pdEYkYncd94VmqIG5WKYvFv/1wW/8Vv0jsD0/KNgsFvYQhI01VJNr
         /tzPU7iYr5SuJT6TwnwBTaM4V6DBGFMFj17F0IuHtkj9Xt4cS5CP/Hr1ez9ZHitZcq2y
         iP4DB/b2Y3eq1wiTk/AWoqi66T3R6VeuoM238h6+ACWbbcarAJViAI9rDmsDpl87bhdj
         H3pQ==
X-Gm-Message-State: AOAM532SFRFKbSUCrlJ7hTFs/UEgbIl7xoKZTrhVnbKaqm8UVjg1GwRp
	kZXARC/FazI9y/mCAAsSaTAgSt46N8E=
X-Google-Smtp-Source: ABdhPJy4FU+yrXibBRMIBrRSFdvcF9fhq4/A7yFRsd6xi4cgHgwmaWl/BTqfaaOUMDtgtOvl5MoEdA==
X-Received: by 2002:a17:902:eb49:: with SMTP id i9mr39789980pli.231.1594057878622;
        Mon, 06 Jul 2020 10:51:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id k3sm123705pjl.15.2020.07.06.10.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 10:51:18 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: Remove py3-mock from rdeps
To: Tim Orling <ticotimo@gmail.com>, Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200706145109.600956-1-raj.khem@gmail.com>
 <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <f2eeafeb-e2d6-3f9f-0f12-393f0353d94c@gmail.com>
Date: Mon, 6 Jul 2020 10:51:17 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/6/20 8:01 AM, Tim Orling wrote:
> 
> 
> On Mon, Jul 6, 2020 at 7:51 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     python3-mock does not exist as independent package
> 
> 
> Sakib,
> Perhaps you were bringing it in from meta-cloud-services?
> http://layers.openembedded.org/layerindex/recipe/120255/
> 

yeah, I have dropped the ptest addition patch for now which means I can 
drop this one too, so please send a v2 with this fixed as well along 
with other review comments addressed.

> 
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     Cc: Sakib Sajal <sakib.sajal@windriver.com
>     <mailto:sakib.sajal@windriver.com>>
>     ---
>       .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>   | 1 -
>       1 file changed, 1 deletion(-)
> 
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     index e075c019d0..27d122cd52 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     @@ -20,7 +20,6 @@ RDEPENDS_${PN} += " \
>       RDEPENDS_${PN}-ptest += " \
>              ${PYTHON_PN}-pytest \
>              ${PYTHON_PN}-betamax \
>     -       ${PYTHON_PN}-mock \
>       "
> 
>       do_install_ptest() {
>     -- 
>     2.27.0
> 
>     
> 
