Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web08.1258.1621127221726039280
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 May 2021 18:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWCD12yW;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id l70so2231384pga.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 May 2021 18:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CimF9f6BPgNnZvgbzhPlKVlWr+5ynJrlRhhdEMlHh7M=;
        b=jWCD12yWWXBukl2vllArL7/Y5xWWKN/Ayupb4NSGg1fm4NdfTMB7+Ira2LVEJe1Fou
         LNQr4HkiimDpc4+JhBdrcjZq4Z7EwyCHaDYCLd5i1SiOL/EMHvrPIyVpAvpqRJOtGwZP
         /I7KVSobbHzpPU5FWMNH4jqf6LSUOJ2MvhgB8znhrK1tjIzIHUfXS6G7VCA2gPG8qVeN
         kCTiU1pv8K69PLzixMRsa6qruUsoLwSBeQ/9N18yFvdE7+e8SlMCTdBJsMDnjnn8v67o
         jz+bMtzGuY+C5rm+5mgVZi22U9Fcg9DDmdXMccCLeJJeGYaT4cA6r8vVHiIAJns8GAgR
         2vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CimF9f6BPgNnZvgbzhPlKVlWr+5ynJrlRhhdEMlHh7M=;
        b=tLi1JsyFMp1uJn3urnNze7gvFYSy5DYgqk+9/HhQt+kEExHXGNuvoYl27X4XuM4fgm
         N9XuWDy00v9lZKvi7wkQCiGoN6xws36uwz8PUwvb3uOeCF2CSPi5LXyYso48basiUWqC
         KqoEa201IsnMXKUqCTFjo9QkmBJo4MlIMufSG4PgF7oVaV15KTSTPvPbBN7411JcOcSt
         CSfPhk+Ilq5lclLUycigctiOqXqZ27xbgD5lDXWXuHBArjBfEszV2CHrdJRFGyW9SQ3z
         TXzX+fKMed6OifEcmmpE+6O0pjVDOluAzDnq9G896SZAwJX6hx3M23PbmoUDplPn4y34
         1Ydw==
X-Gm-Message-State: AOAM5309mS90F26Kstc279H/yNlriDlX1u5H4P87dcTLyaDZ5v6UTH5B
	z34y3P6/q/iZwydTIupTEUJhf1XaJlODeg==
X-Google-Smtp-Source: ABdhPJx6bMcktZFMVVfgiSKH8OskJ89GPTUYMqT9M9CD6kl1VzNO5ZSRkyxv1WUlMbtNtB+WjcM5tQ==
X-Received: by 2002:a05:6a00:198d:b029:2c5:7ce9:aa62 with SMTP id d13-20020a056a00198db02902c57ce9aa62mr29912277pfl.51.1621127220960;
        Sat, 15 May 2021 18:07:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id w26sm3431164pgl.50.2021.05.15.18.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 18:07:00 -0700 (PDT)
Subject: Re: [oe] [PATCH 15/20] gegl: add PACKAGECONFIG libraw and enable it by default
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
 <20210515233853.583490-15-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <104112c6-ce22-ce7f-1d35-73bde2ca6e38@gmail.com>
Date: Sat, 15 May 2021 18:06:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210515233853.583490-15-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/15/21 4:38 PM, Andreas Müller wrote:
> Without gnome-photos fails to start and complains:
> | (org.gnome.Photos:952): gnome-photos-WARNING **: 08:02:54.154: Unable to find GEGL operation gegl:raw-load: Check your GEGL install
> | (org.gnome.Photos:952): gnome-photos-CRITICAL **: 08:02:54.154: photos_application_create_window: assertion 'gegl_sanity_checked' failed
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> index d08a3a3c9..06abf799e 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.30.bb
> @@ -28,7 +28,7 @@ SRC_URI = " \
>   "
>   SRC_URI[sha256sum] = "c112782cf4096969e23217ccdfabe42284e35d5435ff0c43d40e4c70faeca8dd"
>   
> -PACKAGECONFIG ??= "gexiv2 jpeg libpng librsvg sdl2"
> +PACKAGECONFIG ??= "gexiv2 jpeg libpng libraw librsvg sdl2"
>   PACKAGECONFIG_class-native = "libpng librsvg"
>   
>   PACKAGECONFIG[jasper] = "-Djasper=enabled,-Djasper=disabled,jasper"
> @@ -38,6 +38,7 @@ PACKAGECONFIG[jpeg] = "-Dlibjpeg=enabled,-Dlibjpeg=disabled,jpeg"
>   PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
>   PACKAGECONFIG[libav] = "-Dlibav=enabled,-Dlibav=disabled,libav"
>   PACKAGECONFIG[libpng] = "-Dlibpng=enabled,-Dlibpng=disabled,libpng"
> +PACKAGECONFIG[libraw] = "-Dlibraw=enabled,-Dlibraw=disabled,libraw"

there is no libraw recipe in core or meta-oe or meta-gnome we only have 
libraw1394

>   PACKAGECONFIG[librsvg] = "-Dlibrsvg=enabled,-Dlibrsvg=disabled,librsvg"
>   PACKAGECONFIG[sdl] = "-Dsdl1=enabled,-Dsdl1=disabled,virtual/libsdl"
>   PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
> 
> 
> 
> 
> 
