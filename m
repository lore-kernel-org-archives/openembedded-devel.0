Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.39193.1628872389701384858
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Aug 2021 09:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X6pEwofg;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id f3so12681333plg.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=Eeoj50ByIG9mcnPO4tNDI0JgXeFFP+00OwSxGG5O4i4=;
        b=X6pEwofgsIZ+0XMSW3PwmrkiYkZTBauTQ+5SI+Z7wsb95Kk/5+gLXWnkoyTzniG7ii
         u+DAUgm9WjXCShERrMklZwD1hrOzTVxmq1M1UtZGExxv8DkAh5rsKxSRj1eigye16M8c
         GvwozgUeeJM2yQbcCJ30P6HhB4hBSxrbskU7u5wk1DT+0UAPXdsQCU5ICg+Jmx9bqrBv
         BNRP5p2xBnilfg995oLLwUgBJwfJ6+ZjrBodFWBkD9/7gyVzUGwdXweTM+wY/QdE/xi1
         fLfeNHI7pqCq1AtV+ImUtBkOwCFKivIZWQ5+nPM2F3OIKd8L7736BTB83ahW9QNvujMJ
         jVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=Eeoj50ByIG9mcnPO4tNDI0JgXeFFP+00OwSxGG5O4i4=;
        b=FNtnWvGjmj1D7a+l6WKRlRfyGAcCa2y3hDd6cDSF0zljbwzTKQ/JjWOzjKI1wwxqRF
         wnm9xO7KGbXynHjL7UNyvYK1yxma/Ir6AtBg02+WQi1MhKr5TRbsrVBOsWQo+svqIIF2
         DFKLJt9L/X4EMjnNLdYonUJXuNTfkivcD7abm15cutfGVErnP3oAmiClPSSQYEe0jYgS
         JULfX4G725ONHyyxxQV0pYKpTXG/UU/xfD6r8LF4+3fJO8l6RjclXbL0D++zh/Rdttrm
         wRYxG4wcU/MV3G/icE7pGQdkEoZLuk3HfXGCvHsEGpAW4f/Tk5QDX3H6BYgvZPD4BHHV
         uplQ==
X-Gm-Message-State: AOAM533ksUmSysqNWZmHYD0bn1ZmlWzVMf7gtUU33yrC/8jUifj2YibU
	HpvKGat+UT6tIOWQtDwTfmA=
X-Google-Smtp-Source: ABdhPJwU09jOG4pWA3cQjQDtsZgBM+D5HAgNbS03ldZ7emmrwhATHvGEWXajJh2BzRGd+TmApUIVzw==
X-Received: by 2002:a17:902:8488:b029:129:97e8:16e7 with SMTP id c8-20020a1709028488b029012997e816e7mr2616056plo.39.1628872389192;
        Fri, 13 Aug 2021 09:33:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with UTF8SMTPSA id p67sm2910336pfp.45.2021.08.13.09.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 09:33:08 -0700 (PDT)
Message-ID: <7ec64059-4784-0bbe-4ff0-49542fa645dc@gmail.com>
Date: Fri, 13 Aug 2021 09:33:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [oe] [meta-oe][PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
To: leimaohui <leimaohui@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1628871245-5054-1-git-send-email-leimaohui@fujitsu.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/13/21 9:14 AM, leimaohui wrote:
> - Moved it to ttf-fonts directory.
> - Rename to ttf-takao.
> - Use ttf.inc instead of rewrite do_install.
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>   .../ttf-takao_003.03.01.bb}                      | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>   rename meta-oe/recipes-graphics/{takao-fonts/takao-fonts_003.03.01.bb => ttf-fonts/ttf-takao_003.03.01.bb} (57%)
> 
> diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> similarity index 57%
> rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> rename to meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> index 9ddfc6ae7..2c373f946 100644
> --- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> @@ -1,3 +1,5 @@
> +require ttf.inc
> +
>   SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
>   DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
>   
> @@ -6,14 +8,20 @@ SECTION = "User Interface/X"
>   
>   LICENSE = "IPA"
>   LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
> +PR = "r0"

explicit PR setting is not needed here. I have removed it before staging 
but keep this in mind for future

> +
>   SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
>   SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
>   SRC_URI[sha256sum] = "e9871f72ac69acb3e277aebbee7ca01fbebf54800733e29fafdc46133fc3552f"
>   
>   S = "${WORKDIR}/TakaoFonts_00303.01"
> -do_install() {
> -    install -m 0755 -d ${D}/${datadir}/fonts
> -    install -m 0644 -p ${S}/*.ttf ${D}/${datadir}/fonts/
> -}
> +
> +PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
> +FONT_PACKAGES = "ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho"
> +
> +FILES:ttf-takao-pgothic = "${datadir}/fonts/truetype/TakaoPGothic.ttf"
> +FILES:ttf-takao-gothic = "${datadir}/fonts/truetype/TakaoGothic.ttf"
> +FILES:ttf-takao-pmincho = "${datadir}/fonts/truetype/TakaoPMincho.ttf"
> +FILES:ttf-takao-mincho = "${datadir}/fonts/truetype/TakaoMincho.ttf"
>   
>   FILES:${PN} += "${datadir}/fonts/*.ttf"
> 
> 
> 
> 
> 
