Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.31864.1623686029094781031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 08:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uUZs0Zrh;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id v11so6793126ply.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jun 2021 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=Cq7ULZqhjHH6OGiR8E7YGKmjLubqW5j+QICs9znUX4k=;
        b=uUZs0ZrhtDadrBpSg5oJrLQ1SNTBaY3SCPtpszNbkEFIZ5JB9hkQo8K3iSdEwA5v3f
         C7/XQ8BJqjOfXDWNHE+6DuUWyqSHLhFystiqvX2uSflStd1MT8PY7t/Q6IqjNNc25dXP
         QnisPS5nvRGPsWuAiJ0s6AfEY1ba5VhB2vFgiL3PMzQ4wkkIubaIu3K9xY+CoUDCFqKg
         NznmwKyXb5mUMaH6J53JlTjjYK9FGsoLRZrRbiA8LXD8HvnA9mB3nqFF/jZw6E3Kg6II
         756KqhO9hYtPL3t/QRm2V4uizyHjQctVgr10bNDtovrmHcoICzCNBD/NoFUS4LN+qOaX
         YjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Cq7ULZqhjHH6OGiR8E7YGKmjLubqW5j+QICs9znUX4k=;
        b=Cg8+1Cl+GoiUoezMIUx+XYm5Ysw2YJmNbXZAvpeJqr6neSPJ6BD9t5wc165gq+n+Hj
         l/A0utNBBmegf2u/jFPRsuhNQ82BYKOOAkwtSV0fif1ut5+USILBhobyWz0+nVS2VfRf
         ZloH0Nk5sMH3U8HWmPQYatt+mwckNurZPbtdGHkytl9WDaRXfUKQvkVwn3yq5beQBC0m
         XfxZX0oksTZimljxl0BmOc4Bby9c9EnxYDpHQuxxS1SC8oy0FpupT41IYHmKItN4aoKg
         taxeSb9SjY//J+o3/qJ87DKPkYhPP9BqI+co5r8OKxJe4QRSY3HA2oxA00PeZFJYPfD+
         zybQ==
X-Gm-Message-State: AOAM530KldRu9O97QfNFL0P5oY+thvxSIBIVGUUEOPZ8IuFXd8D9k6wG
	C256MtIEBFjTZVwvbhcBWmcWOQqltY1P+Q==
X-Google-Smtp-Source: ABdhPJxYRLdT3P9dUxhy6y1E5T+/U3Zn1TpxVZqfkW2OYwrqa3KrLhK7fe9ZF9CU4bezpEZ+wT3u6w==
X-Received: by 2002:a17:902:d386:b029:11a:6d87:a7db with SMTP id e6-20020a170902d386b029011a6d87a7dbmr9308045pld.31.1623686028414;
        Mon, 14 Jun 2021 08:53:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ed93:eb87:6dc9:a518? ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id x33sm13352137pfh.108.2021.06.14.08.53.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 08:53:47 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] ntp: add CVE-2016-9312 to allowlist
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <20210614124044.3746-1-sekine.shigeki@fujitsu.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <97f50ef4-f51a-b125-bc8c-9afc9266fdb1@gmail.com>
Date: Mon, 14 Jun 2021 08:53:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614124044.3746-1-sekine.shigeki@fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/14/21 5:40 AM, Sekine Shigeki wrote:
> CVE-2016-9312 is only for windows.
> Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> index 7e168825e..e668113c5 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> @@ -26,6 +26,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
>  
>  SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
Does this affect Hardknott?

>  
> +# CVE-2016-9312 is only for windows.
> +CVE_CHECK_WHITELIST += "CVE-2016-9312"
> +
>  inherit autotools update-rc.d useradd systemd pkgconfig
>  
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>
> 
>

