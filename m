Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.312.1630082975315722784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 09:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVR7s1+y;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y11so6144140pfl.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 09:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hXq7JGmE6OM/epKa41hTIH+1K7O6ZafSsttyOrt8sUw=;
        b=VVR7s1+yzZRl/gl8xCsS6jaimo7RxnKS+AFctbdAsriuN6C62XOsybCxUzC6+VR9VI
         bVTmeeBMwRqRNR8F06UVG/Pi2GbGiElbAT51k10vbu/REKXt4nGZIshMYADN1RugDM8X
         /TicjNk89MtasNnXllxqaK7Vx335tz3RZsz/nC6/1T7m42TTYiASPWo2c7hCwhKIVd+I
         I2dbeU2dgQO9rIs5a4a1R6bQG4+K1BsusivjYIyYnQSBBKtUJa/mpFEE2InnuYxEaYQA
         b5V1BECNt/9egIkxaz7RqjaUUo09eS+oXm/DSI/eBlCIz7LUc3D5s5d75oyXQ5NqApEh
         ZSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hXq7JGmE6OM/epKa41hTIH+1K7O6ZafSsttyOrt8sUw=;
        b=gNbexmi8nUXuDp7HTgVEw2TevyHJuuKtyEsBIccsSPxztCSSH5rlHrMa6Nx7XLF5+b
         Pib+wbYf+NneN4KSz0FC2+1WdetpbtiIo7XIjX196AMs3/IPkod/ANuPQqiLHadIhvPS
         LUtiVBKOYQNezy7bBKhZLxOJvzVrF4dLSzugXE5BN1meq+CG6fmsLnqzRzeItg8O68ju
         XI2Ur7AgIEdFzOdDLSMq5KZGgtOBkq6TUhSIbfi2fS6HaJc2iC32s0pR03RaR0ubfPk9
         8NX7lITAmGz030nTRxiR+vl185xDIF8hqB/mhCLJnvlL01DUzPR+fCapCeraCCNL2jqT
         +ozg==
X-Gm-Message-State: AOAM532zPuep41U082nG25GPZDcuJKvo4aJlNJehWbA2GY31Yohq/b4U
	Bri0hFg2OI07KNaqRY4Qnfg=
X-Google-Smtp-Source: ABdhPJwdE39nz/tGJ4iXxCwgOExY32RoeL82yR3aiDh+kevYPtR514UmheiSaRa8Zkf+4wxpTivDYA==
X-Received: by 2002:aa7:8151:0:b029:3e0:bba6:9754 with SMTP id d17-20020aa781510000b02903e0bba69754mr10175450pfn.19.1630082974759;
        Fri, 27 Aug 2021 09:49:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:2885:b622:d56f:490e? ([2601:646:9200:a0f0:2885:b622:d56f:490e])
        by smtp.gmail.com with ESMTPSA id q12sm6923692pfj.153.2021.08.27.09.49.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 09:49:34 -0700 (PDT)
Message-ID: <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
Date: Fri, 27 Aug 2021 09:49:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.3
Subject: Re: [oe] [meta-gnome][PATCH] metacity: Use autotools-brokensep
To: zboszor@pr.hu, openembedded-devel@lists.openembedded.org
Cc: zboszor@gmail.com
References: <20210827084346.2770947-1-zboszor@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210827084346.2770947-1-zboszor@pr.hu>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/27/21 1:43 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> From: Zoltán Böszörményi <zboszor@gmail.com>
> 
> The split build directory causes a make error because
> build/src/core is not created during the build but generated
> sources are moved to it which fails.
> 
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> index a5c704740..969fe13dd 100644
> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> @@ -21,6 +21,8 @@ DEPENDS = " \
>   # depends on startup-notification which depends on virtual/libx11
>   REQUIRED_DISTRO_FEATURES = "x11"
>   
> +GNOMEBASEBUILDCLASS = "autotools-brokensep"
> +

this does not fail on jenkins so I wonder what are the conditions to 
reproduce it.

>   inherit gnomebase gsettings gettext upstream-version-is-even features_check
>   
>   SRC_URI[archive.sha256sum] = "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
> 
> 
> 
> 
> 
