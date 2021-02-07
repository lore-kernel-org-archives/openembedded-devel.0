Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web09.25376.1612728513890485909
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 12:08:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GNPc8stk;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id n201so12859494iod.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=vdd+DPg2rzEoWBuOjqNKOneriF5j5I/QRDERv/+Gm14=;
        b=GNPc8stkOJqaIYs3E78SdpIimuPV7qzUYr6HxFAoz5Rere2yd5V7CUoTiTDZGhD47W
         uIqg+TDKaX6Vkti9vs6EsWqinIwTHsCC3S1FEDzCjf6EwvkoUyXrNTj8xgY430R77M1p
         Irpns641CSc2PIo58B93VDDiS7evv8Kr8LgAScOWeFJQkDgdnqBxGLtD4Q2bqLpzLkM3
         cF3fkmMajoWIlD1cK4hq8x5jP/JjK6YUFV9P2urDokndyz9ViD+bSTpcXs9mAvoK81sB
         0u3rioLQfDOw7InJX6/uM3tnx/tCf2A9ScLXYat+ByfxXtbKC1bj69e7d+lyxL+XmiVN
         PLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=vdd+DPg2rzEoWBuOjqNKOneriF5j5I/QRDERv/+Gm14=;
        b=WOzfh7pxaLm/rOeZoxXyiNe62N+IlEqe6gxhoJ3QXVjiFSFj95aM/9DRpNNDoxtOoa
         BzcbCkuQwYsBBJSMLJfAMrQdlykA6QBFcs1yDNBPx3LLhQzQMrdzkp3Ti6605nIelAnX
         1ItUexCsl3N0E+yR2NsCABy8Yf2vA1tGvW/ZwJJkHI72QP4lL6NcUEZjdSg7gj0McKMe
         wc15ZNuX08TBEKQ/SA5IigUjcILcHxdiVwu4s/0Mzmosn0JTx7K3HgDVcQlzLyR7laT/
         Q1xyKfxONt3TobHCmlKeIYeuC1rA10x9k+exbgcuXIhIFx934UNr0bnJT0ko+NmZkJ2Z
         TmxA==
X-Gm-Message-State: AOAM533ROZVrzBrRNPnJMoY8YggvH0VZTBtHv7MA3GgxJsfWRf46RBsS
	s54ZPmvwib0chJuIioCUt8pF3eGYnoSD2w==
X-Google-Smtp-Source: ABdhPJynpQ3bcxZD3CEDN3aExH1rgwEF754ihxSGdHiHTeGFcd7Tox5K8Ogi6eeGWTrvzSssCl+IDQ==
X-Received: by 2002:a6b:db0a:: with SMTP id t10mr13010718ioc.158.1612728513009;
        Sun, 07 Feb 2021 12:08:33 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:1d07:684d:b210:7d14? ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id b9sm4382327ilo.41.2021.02.07.12.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 12:08:32 -0800 (PST)
Subject: Re: [oe] [meta-oe][PATCH] meta-oe/README: add Ubuntu 20 req.
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20210207192056.30420-1-akuster808@gmail.com>
 <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3653db74-3737-37aa-6607-d0841a9c59ba@gmail.com>
Date: Sun, 7 Feb 2021 12:08:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/7/21 11:28 AM, Martin Jansa wrote:
> On Sun, Feb 7, 2021 at 8:21 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     When building on Ubuntu 20.04, luajit needs 32bit support
>     so install 'gcc-multilib'
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-oe/README | 3 +++
>      1 file changed, 3 insertions(+)
>
>     diff --git a/meta-oe/README b/meta-oe/README
>     index 8d787df68b..9034342643 100644
>     --- a/meta-oe/README
>     +++ b/meta-oe/README
>     @@ -14,6 +14,9 @@ e.g. on archlinux based distributions install
>     prerequisites like below
>
>      pacman -S lib32-gcc-libs lib32-glibc
>
>     +Ubuntu 20.05
>     +sudo apt-get install gcc-multilib
>
>
> This is true for older ubuntu versions as well, so I would drop the
> version here (or fix the typo in it)
thanks, will do.

>
> Also I don't see this in master branch.
What don't you see in master?

-armin
>
>     +
>      Send pull requests to openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org> with
>     '[meta-oe]' in the subject'
>
>      When sending single patches, please use something like:
>     -- 
>     2.17.1
>
>
>     
>

