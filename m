Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.9550.1625592584186336271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 10:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwNytuiz;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 37so3317795pgq.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U0sVQGT8MNEv/BRsmFJ6v515c0o6P/gpqFbblTOQTc0=;
        b=fwNytuiz/P4aJfqkp4znFKPkdSAs9AOPvjoVitjAEjdlPc74U8Ep9C+IG2ZmG11XNw
         UapG/vSyVlkHXnVRNgF3XhVyZll6Ugjx9r20o2ovQcbyzG0otViOTqd4lQazj3SivyJm
         ++S1DvcRmfJxyp6Zp543bd24gNXtczU5c71V9xVag/9m8TxVIkMXjIwvcr5U8sSDbiRV
         H0hN/n/U7hJozkI+24usHIDpdsQYPhYjc82DTR4Jdfuo2FLPPhcoBUpTvM7z04IyBrZ+
         snIeqpYE9J7uuZurL9SiUaDGlXEch2Z7mkwBYjmhjgak4jGECld5e3SmUDNNSJC33rPc
         pkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U0sVQGT8MNEv/BRsmFJ6v515c0o6P/gpqFbblTOQTc0=;
        b=Hao05Fm1Ctvc0q8NBopua1z4O1o0KcGKGUuccg/+Pl/Qb9xt9D9ub50YZQESdybVyy
         awQt2ey5quOuu37BJQgSVar2kpM1Ogf5DOWwHOB/FvZoV3MdCIuZTkreyGWRgw6z9I6I
         dyR0x4rS+omhe01jI4Dbxmsw2+PHW54hwzjnYK1FfZnJzRe6kbv8FSDEUMiFUfWeIvro
         O011LzGkw1+IDhYVk4pz0Wr1bCcJjW/E7i1rJWatQL6RHdHpBcPk8c2a1+BERtohWLJo
         NQA2hOoXD4ZESzOu4SSWTH67C36VL7cBb1YfcgZv6DjNeXgNyMCWrQI5VO2d8RV0VWg4
         eFEg==
X-Gm-Message-State: AOAM532jlzgxh+X1t+H5jsjB6Ff1NsUgl5LyFjYTjqNWK8q4iSCX3Kfb
	dnoNK4EFyN4hkePILGU6NT3wGF0hwWpC/w==
X-Google-Smtp-Source: ABdhPJwCRQXwh5MDBYyfcx9gKjQJLJogpQlxvlqGu3FaDL09vPUjPcWPPsYrKvY79KmNXiJBKDpT5w==
X-Received: by 2002:a63:4041:: with SMTP id n62mr21683050pga.204.1625592583323;
        Tue, 06 Jul 2021 10:29:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:b49f:57de:a758:639f? ([2601:646:9200:a0f0:b49f:57de:a758:639f])
        by smtp.gmail.com with ESMTPSA id p20sm19951358pgi.94.2021.07.06.10.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 10:29:42 -0700 (PDT)
Subject: Re: [oe] [PATCH 8/9] gegl: Disable pango on native build to fix gimp build segfaults
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210706091327.1513939-1-schnitzeltony@gmail.com>
 <20210706091327.1513939-8-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e2b858f3-52bb-fd1b-1af5-97839a0ebb1a@gmail.com>
Date: Tue, 6 Jul 2021 10:29:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706091327.1513939-8-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 7/6/21 2:13 AM, Andreas Müller wrote:
> Achieve by adding a PACKAGECONFIG for pango and keep that out of native.
> 
> * pango support is not required for gimp build
> * pango support caused random segmentation faults building gimp. To work around
>    vector support was disabled for many arches.
>    Am not sure but segfaults might be caused by missing font configuration on
>    native:
>    | Fontconfig error: Cannot load default config file
>    Now with upcoming pango 1.48.7 build of gimp build is broken completely: All
>    calls of gegl caused segfaults.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> index bb0cd1f8a..1fc883225 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> @@ -6,7 +6,6 @@ DEPENDS = " \
>       intltool-native \
>       babl \
>       glib-2.0 \
> -    pango \
>       cairo \
>       expat \
>       zlib \
> @@ -28,7 +27,7 @@ SRC_URI = " \
>   "
>   SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
>   
> -PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg poppler sdl2"
> +PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg pango poppler sdl2"
>   PACKAGECONFIG_class-native = "libpng librsvg"
>   
>   PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
> @@ -40,6 +39,7 @@ PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
>   PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
>   PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"
>   PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
> +PACKAGECONFIG[pango] = "-Dpango=enabled -Dpangocairo=enabled,-Dpango=disabled -Dpangocairo=disabled,pango"
>   PACKAGECONFIG[poppler] = "-Dpoppler=enabled,-Dpoppler=disabled,poppler"
>   PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
>   PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
> 
> 
> 

thanks for doing this, it was causing quite few failures on CI builds 
due to this race.

> 
> 
