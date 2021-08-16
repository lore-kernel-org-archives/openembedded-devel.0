Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.20779.1629095470349465184
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 23:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZUnNw+uA;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so25777844pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 23:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XpFyTibKR0aUjSG0qtClnPS/4uCCnzOtz6FnG9T/Klk=;
        b=ZUnNw+uAW1MCmcnWlOOijte4d7MQRDlfqKVY6cycLSfOfaiEL1YROFIr7L7FEQFKJ7
         jn/zZWuY4PQ93aBfBfPGMoRG45gXUMMhjgpVX8MeCQGLe1Y+v0Nph6R+jlyS8I/mgFDo
         /PPMXqb7himlVyqJQpxmeY9so1OVuUxgF4re5jiTW1EfyCD2io0IU3ouDph40ES3svlP
         sx6NlGi/FkfY8Oe9sPfGJauCiFSxkl6be6XOHOjYRUfKRPSXj+R8oYunZtUnDqfxG5Q2
         pi3lV5zR6JRa4j0jtZBFPz45+2QoiDzLzeZk+VfxXyaGpQa6Dorqc/mWma05DRQfxzbJ
         1Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=XpFyTibKR0aUjSG0qtClnPS/4uCCnzOtz6FnG9T/Klk=;
        b=XisL/SxR3oMQIDWlBVRNrSskGboYFkYQw+2UksA2GMQJZugoDDV1Oh6G1IVd3d56Zl
         XTAq2LJorqpRDYu0956+CyjkaUlKfv9MuHoMD8yCI7xV7vfh4ewKteETxTHbH9+z0K/a
         2lA4U5OsnMLgiyEgkp/OawKxVo1960tb87XTYlFO+QOcwxfVKqEY6AOYOFs5j0bC9y0f
         rIkQElfMpwStZ0+GhQW7hTzjdcmNmZ9EEphC4SCXBGdYJQdUUFyJ+mQO7LK4epi78sNX
         tiPm2UE17d2RiFFudGYg+LXqcJtS65WeY9K1IGamWSA/2Z22l6pcpyDCoyPRcwj4dGTu
         OB6Q==
X-Gm-Message-State: AOAM533Ww2G9k9nmZwvkSoLJ+UWAB1WHnBaXYFfHm+oRK0DvWz52GCPe
	FxFjMNMcNc/PutywN0O3ZJlR1XKKtIwVEQ==
X-Google-Smtp-Source: ABdhPJwJIWl4jD8wFBV3EVk76qSEmsKN+cDOsUyxinDjWBDc2VpsTRwV3+1LHbLu33B7l+akOwgi9w==
X-Received: by 2002:a17:90a:9c6:: with SMTP id 64mr9759752pjo.155.1629095469611;
        Sun, 15 Aug 2021 23:31:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::f40b? ([2601:646:9200:a0f0::f40b])
        by smtp.gmail.com with ESMTPSA id fh19sm8653293pjb.27.2021.08.15.23.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Aug 2021 23:31:09 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] [PATCH] takao-fonts: It should be in ttf-fonts directory as the other ttf fonts.
To: leimaohui <leimaohui@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1629109498-55444-1-git-send-email-leimaohui@fujitsu.com>
 <1629109498-55444-2-git-send-email-leimaohui@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5cf0af51-e13f-1420-938c-e4e45ee98838@gmail.com>
Date: Sun, 15 Aug 2021 23:31:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1629109498-55444-2-git-send-email-leimaohui@fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/16/21 3:24 AM, leimaohui wrote:
> - Moved it to ttf-fonts directory.
> - Rename to ttf-takao.
> - Use ttf.inc instead of rewrite do_install.
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>   .../packagegroups/packagegroup-meta-oe.bb        |  2 +-
>   .../ttf-takao_003.03.01.bb}                      | 16 +++++++++++-----
>   2 files changed, 12 insertions(+), 6 deletions(-)
>   rename meta-oe/recipes-graphics/{takao-fonts/takao-fonts_003.03.01.bb => ttf-fonts/ttf-takao_003.03.01.bb} (56%)
> 

I think this is still not a complete fix there are more recipes in 
meta-openembedded repo which have direct dependency on this recipe, 
please check those out too. I did mention full list in my last message

> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index d46447d33..b7abe2197 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -493,7 +493,6 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
>       packagegroup-fonts-truetype \
>       qrencode \
>       ${@bb.utils.contains("DISTRO_FEATURES", "x11", "st", "", d)} \
> -    takao-fonts \
>       leptonica \
>       libvncserver \
>       libmng \
> @@ -537,6 +536,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
>       ttf-noto-emoji-regular \
>       ttf-sazanami-gothic \
>       ttf-sazanami-mincho \
> +    ttf-takao-pgothic ttf-takao-gothic ttf-takao-pmincho ttf-takao-mincho \
>       ttf-tlwg \
>       ttf-roboto \
>       ttf-wqy-zenhei \
> diff --git a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> similarity index 56%
> rename from meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> rename to meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> index 9ddfc6ae7..be0e544cc 100644
> --- a/meta-oe/recipes-graphics/takao-fonts/takao-fonts_003.03.01.bb
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-takao_003.03.01.bb
> @@ -1,3 +1,5 @@
> +require ttf.inc
> +
>   SUMMARY = "Takao Fonts are a community developed derivatives of IPA Fonts."
>   DESCRIPTION = "Takao Fonts are a community developed derivatives of IPA Fonts."
>   
> @@ -6,14 +8,18 @@ SECTION = "User Interface/X"
>   
>   LICENSE = "IPA"
>   LIC_FILES_CHKSUM = "file://IPA_Font_License_Agreement_v1.0.txt;md5=6cd3351ba979cf9db1fad644e8221276"
> +
>   SRC_URI = "https://launchpad.net/${BPN}/trunk/15.03/+download/TakaoFonts_00303.01.tar.xz"
> -SRC_URI[md5sum] = "8cd3fe724faa5034a9369e98cf108d2d"
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
