Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.19844.1590693964736537277
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2020 12:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jd5Q8Xke;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id d26so41569otc.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2020 12:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BMfqwJ8oI57V7ei+Fq6tXZ9DizV8fkVSg354lrB02to=;
        b=jd5Q8Xkei+1Agdiu6MKzVKMJ6FT1zT+yBBOYj+IiXbBY+xErhd2BH5fggGcP5fryZf
         XphSveURGP8sy1crS9/mcMgerYfr7TmHx4E49N5TiHxpDw/K1nw97nFij6yv/PEzDTxM
         aGGixjkQaRHwg2wLUwnSArmCdVQEjfovyBy3nLMB9FD5nko64awBqSvcdUXGnmJr3kdc
         gddwrxus7diLDdY4ODt6fvNICx5TtjTeTmBv3JF7qoV4a1IR6rO6yqjtISI5GFiBJyXz
         ykrKDqlLkxc9ubqShCQCBWllOJOclEP4eXBZ0DuNbV7cXy8EjWOgrGxyNADk6JfAeXax
         b3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BMfqwJ8oI57V7ei+Fq6tXZ9DizV8fkVSg354lrB02to=;
        b=t4KL0BlccjLsGkIZEMwkwR4AZsIH5MZvPjZMI2anTkTD/BnxBLhPXKUyfSGIws3rgV
         Juk47mkxP6ZjOz4VHpihIBKibj62B2+oUzhAICKPp2VE9XHMUskTA25fj1CtQixmNXCd
         PuUuMWAuSm4UHOQrGEiHfPJUMKUgThgweiNBxB41zb7ApW8GeIQ+0bAako/cqwwY42WY
         VkmKjtckyzM08Gwf21MZVVF+zUQMe4pgYezFRxCUPoA/Xe/NUaqUxQRMYcib033l10NY
         Z+x3k+xehf4cgvsKhdGFul1CD1d301dL9DYgsR1+f/6W5RIuDGdUTmS4khdQk+11lbXD
         FoSA==
X-Gm-Message-State: AOAM533hpCps8sKqa+mqIrhwQ4/n++KfwDOUnK5+H6GX2T9Z7lCwhOd8
	+3bnM00lCWexKAfoGvOAtPg3IzJXHoA=
X-Google-Smtp-Source: ABdhPJyy5MILzUCq+yNrFCLXLKmUVjqbYpmwDposm3ma392YC5uzDBYtku8UhgiDvuE/pLYMF1sUcA==
X-Received: by 2002:a9d:ec3:: with SMTP id 61mr3526377otj.286.1590693963822;
        Thu, 28 May 2020 12:26:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id b16sm1982943ooj.17.2020.05.28.12.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 12:26:03 -0700 (PDT)
Subject: Re: [oe] [meta-gnome][PATCH] gnome-settings-daemon: fix typo in RDEPENDS
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>,
 openembedded-devel@lists.openembedded.org
Cc: piotr.krol@3mdeb.com
References: <20200527172846.43810-1-maciej.pijanowski@3mdeb.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <fb0f62c5-c9f1-ea90-b859-7bffffcf1ffa@gmail.com>
Date: Thu, 28 May 2020 12:26:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200527172846.43810-1-maciej.pijanowski@3mdeb.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/27/20 10:28 AM, Maciej Pijanowski wrote:
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>   .../gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
> index 0b6865d293db..2aa3a7ebf1b4 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb
> @@ -56,4 +56,4 @@ FILES_${PN} += " \
>       ${libdir}/gnome-settings-daemon-3.0/libgsd.so \
>   "
>   
> -RDEPEND_${PN} += "gdbus"
> +RDEPENDS_${PN} += "gdbus"
> 

this results in
ERROR: Nothing RPROVIDES 'gdbus' (but 
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.34.2.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'gdbus' is unbuildable, removing...

perhaps it should rdep on glib-2.0-utils

> 
> 
> 
