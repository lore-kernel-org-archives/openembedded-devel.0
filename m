Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.2249.1617244600598253297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vg30r2QY;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id l123so371366pfl.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Mar 2021 19:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r3TsmG21oBYYeg2Utd1Bviw+++JvbRXwQRXrsybAxkQ=;
        b=Vg30r2QY98S/RjAjKNYHKoCbYwaCfxMVOlgJv6Iw+KzOAN8VhlYCaltrTgZruwkAZ1
         m/b4ER+X0Kj5A86Ep9nh94ArntwXfl//ZmrQmG5WN5ATwiLO8z/hDHNNUOtCtSiSmwr1
         GOR8J/SSTXqZD7GhCdBuTDDSm+BmUrB50oJTZvrtstP7qBGQS5dm+MhG2ElsnpdUPbng
         hmEMOHDp1tDB2N+yEVldCmlDnSRUa5Bf9nevbzcZXQikrgWtGD6J2TuHgNX5ASlu+vdL
         RcD/TVHEMGCjepOOwZ7GqaA84etqI3Dr4WhEly5lN04fXpd4x6ub+mXj9MxrO8c74dTF
         HTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=r3TsmG21oBYYeg2Utd1Bviw+++JvbRXwQRXrsybAxkQ=;
        b=H6WD+AbYXIF2N1NosxFAVz80xEtNF2aT11KvBPkyLakKXhZvoKFqshk+dgyFROMFik
         Xa6GXKWY2HgDoQjytpbXpAHX8UOLUnYJW6dpZwMM+IAVWDVZif9NaXdj1sXzr8z0TJZe
         hrbM9nYgk0pLjRWiA4g68EBCtsx0vNjKYs/RhCSePuonqkPYUSJi5m5JrLa2tOR1oCvG
         C69NEKl55sW8neyxluX8+Zvje4l79xUeBcKkLm/zlwimxCUXr06wblAKfka10uUzqGd7
         TdqUDAet4JVBlEV+dVRrO1vTvEOmMqY/olXKmAd4OI22tnD8Rrkk+RXu9RCpJDSFZLvX
         T+5A==
X-Gm-Message-State: AOAM531mg//D4abSi0TRTkl7ZvwdZZXhyH6ApJCF00Fg54P3XOAxFy8L
	cYzsxeZ6QboZ3p0bHSeQWw0rfZejgRk4YQ==
X-Google-Smtp-Source: ABdhPJx7/qtnbJ4enuZOJPbC9uYTeRB90QHktJo+Kq9J0owyjmVbOwXcbMv6Rt6To6usGeydFlCPug==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr5583070pgr.327.1617244599817;
        Wed, 31 Mar 2021 19:36:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::7c4e? ([2601:646:9200:a0f0::7c4e])
        by smtp.gmail.com with ESMTPSA id l3sm3286581pju.44.2021.03.31.19.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 19:36:39 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] xterm: upgrade 366 -> 367
To: zangrc <zangrc.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1617244170-92064-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f891025a-4233-4bac-d94e-55d9ce8284a4@gmail.com>
Date: Wed, 31 Mar 2021 19:36:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617244170-92064-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/31/21 7:29 PM, zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
> ---
>   .../recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)
> 
> diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> similarity index 89%
> rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
> rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> index 969159bc5..e0d3dcec1 100644
> --- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
> +++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
> @@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
>   SUMMARY = "xterm is the standard terminal emulator for the X Window System"
>   DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
>   
> -LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
> +LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
>  


add a comment in commit msg explaining why above checksum changed.


>   SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
>              file://0001-Add-configure-time-check-for-setsid.patch \
>             "
>   
> -SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
> +SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
>   
>   PACKAGECONFIG ?= ""
>   PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
> 
> 
> 
> 
> 
