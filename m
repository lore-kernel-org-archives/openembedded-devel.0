Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4979.1628052938622313002
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 21:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ApDWYOPO;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id a8so1268605pjk.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=N0sXb90f92MpPClVZUTv7aX/lN/aX24ISAuwbazxFPQ=;
        b=ApDWYOPOANUfaFVQ+AJR8/1gIEtPo4EfuBv4U6XJpVbuNzGV5j3e0T3liNLuyQyxkv
         INqT/38LP5QPZ51qJSq9h++ZuRaePW9laJeqLskx0J1BQeLRZ2gvNnDAsOFVlfsUBiS8
         bIRLAevdJ1Jg648YhQ7CC7Nbi3ZAYvLT+rkGxvaZBBLt9fWgucZxO6AFLVJp80aPhg/S
         xPPn4JjOdHRV6UBHDz7TomsWvwDxDCIL0Z1wdBfk9NSeWKRJdmluwhmjOb2nTsU9Vktg
         l4E3Nq0STIa4Mk8w8xK5XAzB0h8F7S2xupevC1SxMKRMEqtt0qtO1W4YSMj2G4OJe4/o
         UQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=N0sXb90f92MpPClVZUTv7aX/lN/aX24ISAuwbazxFPQ=;
        b=BgFOPcJBTPxhnTrxtjFwQzOCDIG4Yc7L+ms3Q5XE3/epUY7IniIBZSMFZyyCcrEFb1
         wlLbk4CXMrocHpeBME35FGB+Ezjs7q57oMvcQ0ZQLji4RiIfC+9J1+agd4cIERMZysLg
         slUYwZcyjNGolfTGieV1fEVCLo4ezB4pHa4cz2ovDePbEzT/3i63Tde+8IVPEBBrWhJO
         WX8Ex+JPWe7LweOQhra3zWTz1BFbkG43aj8XxZ+fVOLYyrQJkmoYD8NzFAIvpQDmZT3R
         V4mbNoFoR0WyiXKyWIloFhHVsPpClUqg55W0GA70JfFxn0Kjh4PD4LSCg0cARhxUUDPB
         0OKg==
X-Gm-Message-State: AOAM531//3/9aCV6+PLySIGNCUgkUjj0+jNj1i6U2LP03b33jBJE65p8
	FNQqXFtjTpp8HN3pKXnbZi8=
X-Google-Smtp-Source: ABdhPJzjWsyNbmt/4eAlPKdBEcQW2RxGhawLpsPFi9+cL+lg7g8EB+7rmO/DkTXwWketZRkCVRolBw==
X-Received: by 2002:a17:90b:3809:: with SMTP id mq9mr25545088pjb.7.1628052938172;
        Tue, 03 Aug 2021 21:55:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:484:f8e6:e2bc:be7? ([2601:202:4180:a5c0:484:f8e6:e2bc:be7])
        by smtp.gmail.com with ESMTPSA id k4sm1112609pgh.9.2021.08.03.21.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Aug 2021 21:55:37 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/1] php: move to version 7.4.21
To: Joe Slater <joe.slater@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: randy.macleod@windriver.com
References: <20210803232436.71145-1-joe.slater@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <617d522d-62a6-d64e-11d1-d95795db27f8@gmail.com>
Date: Tue, 3 Aug 2021 21:55:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803232436.71145-1-joe.slater@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/3/21 4:24 PM, Joe Slater wrote:
> Lots of bug fixes.
>
> CVE: CVE-2021-21704 CVE-2021-21705
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> (cherry picked from commit 93045c3db744a9f1cd0a9b0ce992d44d9c44c309)
Thanks. This is already staged in stable/hardknott-nut

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/hardknott-nut&id=69dcf5bac8adfd55f1a40cff1e989ed8806607cb

-armin
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/php/{php_7.4.16.bb => php_7.4.21.bb} (99%)
>
> diff --git a/meta-oe/recipes-devtools/php/php_7.4.16.bb b/meta-oe/recipes-devtools/php/php_7.4.21.bb
> similarity index 99%
> rename from meta-oe/recipes-devtools/php/php_7.4.16.bb
> rename to meta-oe/recipes-devtools/php/php_7.4.21.bb
> index 821d9cd04..4d427252f 100644
> --- a/meta-oe/recipes-devtools/php/php_7.4.16.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.4.21.bb
> @@ -33,7 +33,8 @@ SRC_URI_append_class-target = " \
>            "
>  
>  S = "${WORKDIR}/php-${PV}"
> -SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
> +SRC_URI[sha256sum] = "36ec6102e757e2c2b7742057a700bbff77c76fa0ccbe9c860398c3d24e32822a"
> +
>  
>  inherit autotools pkgconfig python3native gettext
>  
>
> 
>

