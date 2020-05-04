Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.13582.1588619395377751509
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 12:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O/OyOswS;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id hi11so331630pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2020 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E58o0kwVwD1N31WHk3dYktSCIrbDoFtEblur/zFB94I=;
        b=O/OyOswSm4b0n1aaeeY3SpKSlfsaKNb1x8tHg6Imn3Di5gEhzbf3UXr1/B/b/5eSoL
         8JvSwGE3X4oi5yo6SJfubDBSsDdUznYn+TndH0pFQyVL3BDa2GsWkLqu4w3enjCMdhsy
         tCrTLpKywcPY1b+EtpPukjMuZR2BXvZrJbGUPpIMnJgCh3htIsMX9xHGWSDOjk2LDMOS
         MU+YMBtqAou6oUf/R11d+As62hHOFWbEF4jC6pfBrhM9Hw6tkFyrZ6ev6Q0ukxAz8bNi
         yErHgqy0egkTl8Faj4GVjp0kl2q/48BisuJ928sKw9ScDJMQ5Swhq4k4bo+MMTnaoc+4
         N1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E58o0kwVwD1N31WHk3dYktSCIrbDoFtEblur/zFB94I=;
        b=ocTk6x9qX4ILf65jFG94LVJSjlg7PlE0tzOZfzEBBU/R083Ex2oaSq1GbuNCsIm2Td
         xgM1gDEHBydpUNbRnGT68cigX6MfvviFJwVW+R2nnkmRvyh5jiCxzGt1nK3c2FWFUxD8
         8a1Ghwb+gavnPmNNJL3mo6rew8Fr2SZF9o8P5xY0iWFJqv0fAm1dfGimzwzAk0jr/0dV
         2eOu4o2WoJ+vM74uH9Cy27EMcX6ca7h3Z7Vs/mzumQsIFBg2Yo3+ZVZlJVXiCgSI2Kp4
         VAUZlfaT54NmknllNzF6LhK5ou3v2yhrjTAAg1jPk6pOIMfyLkemxamg8Fqr7qwcj5ZY
         2XFQ==
X-Gm-Message-State: AGi0PuYN+n9y57J2zDSXq6/iZyHTZgAWsaivafopUz/JQUx35ACnQuMY
	kl9Fdp3pXhzdOUJJLwWsbZVWrpSj4sM=
X-Google-Smtp-Source: APiQypK9QDFDPqZ7m04mR8m96iCT0cB4EpSg7UMZMGUeHeDQOdV6uY+mGz+NGQII30hR8+4t0rSIzw==
X-Received: by 2002:a17:90a:a608:: with SMTP id c8mr550724pjq.90.1588619394496;
        Mon, 04 May 2020 12:09:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::b3aa? ([2601:646:9200:4e0::b3aa])
        by smtp.gmail.com with ESMTPSA id y29sm9702831pfq.162.2020.05.04.12.09.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 12:09:53 -0700 (PDT)
Subject: Re: [oe] [meta-networking][PATCH] tcpdump: Fix PACKAGECONFIG for OpenSSL
To: openembedded-devel@lists.openembedded.org
References: <CAAxSGfag8qgjxUOGSZRCQgQoYWDTpK7DaytoYC-BhmHBJJvpag@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <b58abe3f-3c4e-5f50-1207-5376f65c985d@gmail.com>
Date: Mon, 4 May 2020 12:09:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAAxSGfag8qgjxUOGSZRCQgQoYWDTpK7DaytoYC-BhmHBJJvpag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Can you rebase it on master or master-next and resend ?

On 5/4/20 4:57 AM, Alexander Vickberg wrote:
> This fixes building TCPDump without OpenSSL. Current version does not
> recognize the option --without-openssl.
> 
> Signed-off-by: Alexander Vickberg <wickbergster@gmail.com
> <mailto:wickbergster@gmail.com>>
> ---
>  meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> <http://tcpdump_4.9.3.bb> | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> <http://tcpdump_4.9.3.bb>
> b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> <http://tcpdump_4.9.3.bb>
> index 05fc99bdc..94543dd1d 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> <http://tcpdump_4.9.3.bb>
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
> <http://tcpdump_4.9.3.bb>
> @@ -27,7 +27,7 @@ inherit autotools-brokensep ptest
>  PACKAGECONFIG ?= "openssl"
>  
>  PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
> -PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl
> --without-crypto,openssl"
> +PACKAGECONFIG[openssl] = "--with-crypto,--without-crypto,openssl"
>  PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
>  # Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
>  PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
> -- 
> 2.25.1
> 
> 
> 
