Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.14584.1619912042412019874
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tPBoSGr4;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id 10so1658020pfl.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8raXicMqeMKW5Av93e/1rkZYlaGeuywAFHnUmXETRP8=;
        b=tPBoSGr4bp6R7hiu5kZ3JRkcE1KVPFwlbaQ6C42iC/DkfOrGsWCyDA/VCZCoD+8Ds0
         Gb597dm5zM0B7ASHdJrl85H5NwxF5Y8piv8PPyiTsuAIbt3NyDGmhYteee1ozmbUlJPL
         QszX648cXueu1AzaILcKggTlKLGkJHJGamEQCNteIsIm9AWS4vVEupVOUmkj2qdVmFlM
         FnXA4tgZ3zSVrRlh1HV8k0NHUlBx1un6BMh5i6jd2zJE67yY4pnRKL5W1H5QMe+My9pB
         VrU8+oh842HDOndH2yG7FAjc5YRedKA/dq0J0ftqOJNOjZ+6PU7+sXJxqNY7iNj8Djfi
         jyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8raXicMqeMKW5Av93e/1rkZYlaGeuywAFHnUmXETRP8=;
        b=f63KfinJm0O/UHJwlWUjL5+g0CcKXpajv6iEB6Tj/UnS5/MgYcjKCFmPMeer2i2zjm
         jEzunDzMZM7YIpehhi+eOBPsJvWYTQQsvcZeh2lwvNAaccAEgDxQF7tuC92xk+r8K2Fn
         bnpdamzp9wQExhVOoNoXV0Krhnmm5cPY4gLrtf2m7zs9Zt5FJ8gPgWVCDOb+8n1fV9Km
         iNZvOHpYK+C6FXkZC5VttjGshAH+JcL2HIs5huBf2hTZRKTocbsRazg/KW9ra9/01Ayb
         DIUK/AqxcpZQHSgAp5/ED7ccYK69hcHwunVDn0pPswVVgoTDtkp6J950orMq5YwG/tmm
         QlEA==
X-Gm-Message-State: AOAM531j4v/Byyt/lZRyHl1irVCeBIQTVUlTZ3IIk5MQ4ZtXgx28re4s
	TvC/EVWE1pVUS2h/ebAgiFld0MR/dnpiNQ==
X-Google-Smtp-Source: ABdhPJxpTOceu4LBLUpX4yVfX/W4YaVL654HzGipBWZ9bEHR1GX+zKEYR85EvXJ+jhfSC1UxOAs80w==
X-Received: by 2002:a63:d47:: with SMTP id 7mr11524274pgn.400.1619912041802;
        Sat, 01 May 2021 16:34:01 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8589:f92a:54a1:6475? ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id z16sm9783108pjq.42.2021.05.01.16.34.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 May 2021 16:34:01 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/4] nostromo: Blacklist and exclude from world builds
To: openembedded-devel@lists.openembedded.org
References: <167B153DE0E00D49.25516@lists.openembedded.org>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3e1df708-4887-de2f-723f-147d6b5d22db@gmail.com>
Date: Sat, 1 May 2021 16:33:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <167B153DE0E00D49.25516@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

wow.  The README is missing 'gatesgarth... wonder how that got missed.

this set was for 'Gatesgarth'....

-armin

On 5/1/21 4:30 PM, Armin Kuster via lists.openembedded.org wrote:
> Host site is dead.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
> index e726c9ac66..f1cf59355d 100644
> --- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
> +++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
> @@ -62,3 +62,6 @@ pkg_postinst_${PN} () {
>          fi
>      fi
>  }
> +
> +PNBLACKLIST[nostromo] ?= "Host site for URI is dead"
> +EXCLUDE_FROM_WORLD = "1"
>
> 
>

