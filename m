Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.116.1593100904656646524
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 09:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SutmfUmI;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id x8so2079811plm.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 09:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c5bKA6t56B3aNZpmiQEhJTtnF3uEMuz4TjlcH9Guimc=;
        b=SutmfUmIh833/lBv2dkQYArOBbHj41BDLb2fHHZNGi/qpXNC4/q6mtckq8H3Rqrzl4
         PNjx5KSxtiAI2ivhk6KGiHcLbnl8pp8vEj8MCypVDFOdVdL4iX3DTdK+znpmKd6efdvQ
         fAnwMiRnH3/MlHK2b0E3f4gUqTEcLAeGv/Qh9rY9HzZuofFYj2+eRd/mMUpmkDqZyusR
         0PU9c4yaY3CjUDJQeKy0kRLSBf+8Ne7BUuXzLeSSpBoSzvs6fT7MsACAJdH7ivIlTe/u
         bABwoAC6giFZxkApCbSRP7M7qh0w0Q52Iu37vItN1gJbfLZ8jWIsCAQ+nU3yB6ekBWO7
         emOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c5bKA6t56B3aNZpmiQEhJTtnF3uEMuz4TjlcH9Guimc=;
        b=OlxC9Bh4jPxD9U5DFMBYTrYhrhrMNm746Sjm/bgvFqheUni9hUyw+P6KH7topoACaz
         Zhqikp031aJhQnGZUJ9ituRZbBVrp+5785NAolWtguPOQJ6QgeCyFqHXgf2ienA24f8M
         2+NybvNmrY8t1nTlg/JIvRevKS6A109N+WZ8WwbF99747G3/YlC1uOLv/2EkkLD/762p
         TbiT2xrVao6C9v+gth0bbrqR+gko7g62T4WDK4JlDP3IwJ5h2+UMSpZXCugxXR4sqEtF
         ednZ+MMcNdvRcdVtCLB33C4v8k+kKqikTENqno3qchq+LBefVj4zsOq5+Qkbyrw4ZdjG
         5w1A==
X-Gm-Message-State: AOAM530kYytvbxvUnsnaguTBSkVHLbWRx14KxA872lo6weQy5pMaNRsO
	IdzqlB3BTwXgyN/GNqP11aiA2dg5D04=
X-Google-Smtp-Source: ABdhPJy0kRuK7MTex4mVOq9+XMXZC9uKp/cks/zPG1msRhb8CNUlUj8Ie/Dc3SH+fSyn2B3pkFQkdg==
X-Received: by 2002:a17:902:8c89:: with SMTP id t9mr23009351plo.306.1593100903419;
        Thu, 25 Jun 2020 09:01:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::dedc? ([2601:646:9200:4e0::dedc])
        by smtp.gmail.com with ESMTPSA id z24sm24134065pfk.29.2020.06.25.09.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:01:42 -0700 (PDT)
Subject: Re: [oe] [PATCH v2] Revert "packagegroup-xfce-base: add RDEPEND packagegroup-core-x11"
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625064921.4060827-1-schnitzeltony@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <2d898deb-9e9f-3c13-2775-1b5f663140ff@gmail.com>
Date: Thu, 25 Jun 2020 09:01:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625064921.4060827-1-schnitzeltony@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 6/24/20 11:49 PM, Andreas Müller wrote:
> packagegroup-core-x11 drags stuff not everybody needs e.g xserver-nodm-init and
> that's not what everybody wants. packagegroup-core-x11 is something to add into
> images.
> 
> This reverts commit 394567c0078c627642e7b80b722f147da5a6f376:
> 
>     packagegroup-xfce-base: add RDEPEND packagegroup-core-x11
> 
>     without packagegroup-core-x11, after boot target, and run
>     startx, it will report error like:
> 
>     /usr/bin/startx: line 203: xauth: command not found
> 
>     xinit: unable to run server "/usr/bin/X": No such file or directory
>     Use the -- option, or make sure that /usr/bin is in your path and
>     that "/usr/bin/X" is a program or a link to the right type of server
>     for your display.  Possible server names include:


will these issues resurface if we revert it ?

> 
>         Xorg        Common X server for most displays
>         Xvfb        Virtual frame buffer
>         Xfake       kdrive-based virtual frame buffer
>         Xnest       X server nested in a window on anot
> 
>     Signed-off-by: Changqing Li <changqing.li@windriver.com>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
> V1 -> V2:
> * Add commit message of patch reverted
> * Add Signed-off-by
> 
>  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> index 6ddf8ee91..70ef909ef 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> @@ -7,7 +7,6 @@ inherit packagegroup features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>  
>  RDEPENDS_${PN} = " \
> -    packagegroup-core-x11 \
>      xfwm4 \
>      xfce4-session \
>      xfconf \
> 
> 
> 
> 
