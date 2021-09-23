Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.7097.1632413825982114237
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 09:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VviTJ20X;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id gs10so4429545qvb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=8oVZ63U2QXVrIQ6HP38x8iN7v0MKWIzRKhedVCBNIFc=;
        b=VviTJ20XUNzNUk55nkZCMMdm2DD6RSdrG9w2XHrchtD5wfvOlQWRxjOSVjM6Cnhk/m
         WhHa3A38Imp1oLy11HkIK28b4geGBUk+LkxY9fi8bI+XejHS+sV4aAGBMV1PSP+9X7dh
         fKznSk4Z2miTtuRfyqdzvwxhN/mV+8rAXF6e8kHUhTtTuvh//TqXLtGMf/UYsJXAdGw+
         I8dortPk4zseKG8nXpwxJdONEFcczjEbLuQFSSummDYBPoeIggdOvRnr5t0s5aPafGwJ
         6d1W4hYThtae40Uq7vJuIOeNxArNuW7jAf5/l18EbUreEwaXZJApEXOGymfuVJK5cj47
         DBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=8oVZ63U2QXVrIQ6HP38x8iN7v0MKWIzRKhedVCBNIFc=;
        b=anIHaoBs239DujyNtWFizALbyIan7SHJtaoAeHAB47PoS6TfrIPiy+4rT2p7uo5Lh9
         lHRfC0Z60VHqKvySepE5A7ERw6m3VnnRsD2voQWIZFjQfKz41MI46QY5av4ku2eZDQ6t
         JT3OR2T2Z9HKmcVZlZpAes5zodXre/DtcD9l3a80NkuJdFQdhg8A2oL4ELGOKCD8fxY/
         BPUJe0C9M36dpKwhcVwrNDwb6v9CNp0/39PfIlPvDgGMbEKPazamY00u0KzcwqUbhqz1
         HoYR1LuPyhq9NrqHrKFeQEV3299CUHWgY1gGkYG/WhzrT6Cy0X5UBW2DJFxrwNaB9NFE
         Vegw==
X-Gm-Message-State: AOAM531/1gq44yB+BLMaOob9HRpgUfTEfFMsUP2PET4poNw4A9jPlWuq
	REEhJVwHKNkXNSF3BTGWmhU=
X-Google-Smtp-Source: ABdhPJy8ngZ1fiTnECwn1HVEsaJuxnmEa63mpooUMJ29JqmM8xIeQyDMDXH2sGOislBJyAZST7N9Rw==
X-Received: by 2002:a0c:90c4:: with SMTP id p62mr5108735qvp.50.1632413824965;
        Thu, 23 Sep 2021 09:17:04 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id t23sm4691481qkj.31.2021.09.23.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 09:17:04 -0700 (PDT)
Date: Thu, 23 Sep 2021 12:17:02 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] vk-gl-cts: allow the user to specify the target
Message-ID: <20210923161702.GA6213@localhost>
References: <20210923150040.39332-1-twoerner@gmail.com>
 <941bb5b8-3729-2240-5cf5-2230efefa7b7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <941bb5b8-3729-2240-5cf5-2230efefa7b7@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu 2021-09-23 @ 08:52:14 AM, Khem Raj wrote:
> 
> 
> On 9/23/21 8:00 AM, Trevor Woerner wrote:
> > When building opengl-es-cts (for example), allow the user to pick which
> > target to build instead of hard-coding the 'surfaceless' target.
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >   .../recipes-graphics/vk-gl-cts/khronos-cts.inc  | 17 ++++++++++++++---
> >   1 file changed, 14 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > index f61921473..a9c41f1f7 100644
> > --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > @@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
> >   inherit pkgconfig cmake features_check
> > -REQUIRED_DISTRO_FEATURES += "opengl"
> > +ANY_OF_DISTRO_FEATURES += "opengl wayland"
> > -DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
> > +DEPENDS += "libpng zlib virtual/libgles2"
> >   SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
> >               file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
> > @@ -36,7 +36,18 @@ SRC_URI:append:toolchain-clang = "\
> >   	file://fix-clang-private-operator.patch \
> >   "
> > -EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
> > +PACKAGECONFIG ??= ""

^^ the default is to not specify anything, which picks the "Default" target,
in which case the cmake scripts in the source try to automatically detect
what's in your sysroot and make sensible decisions.

So the best option for users is to not specify anything. But I added
PACKAGECONFIGs in case users want to force an option.

…hmm but then the dependencies won't get handled correctly, unless I either:
1) try to do the detection myself based on IMAGE_FEATURES etc
2) add all dependencies to DEPENDS, although that might confuse the cmake probing

> > +PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,"
> > +PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland"
> > +PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl"
> > +PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11"
> > +PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl"
> > +
> > +python __anonymous() {
> > +    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
> > +    if len(packageconfig) > 1:
> > +        bb.fatal("only one PACKAGECONFIG of 'surfaceless wayland x11_egl x11_glx x11_egl_glx' can be specified at a time")
> > +}
> 
> Looks an improvement, but there is no default now, so what will happen by
> default, and can be make some intelligent defaults based on wayland/x11
> distro features etc.
> 
> >   CTSDIR = "/usr/lib/${BPN}"
> > 
> > 
> > 
> > 
> > 
