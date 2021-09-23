Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.929.1632425887434568975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B5lJoKd/;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 72so25142037qkk.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9yNv5PoxKCCv3fkUNqSaJjMR7Mip4JoOAKswY+wx+l8=;
        b=B5lJoKd/hhK5/IS9vKfo04piEmuPdCXKcjHK1PICRIJY+wisSOmZBhNn0M+8eqIcL9
         btTYe7GgRw4sBcUqTLQ4O8Zot2AywabYQfcyuoX3r5YLBGVlmXn8KIM3qV0T5geGK2O/
         aG1N2kpI/S9spwChB+d4e4i2JwCzBaeWOLyz0yYh/mMGLxhRoet+tSKD59w/4jEDOQW8
         ifNXUUrg1ib2Kgb4F5xkyDRykqgQpJ6So47kSB3DfnvWDuSB0AdGfv6WUuG06xbDOwg7
         NyxkwgNOqEQX7koXkFwuHKvY5753Iwj/oY2u8JrawcodqJWGKIyrvluCvlArCWnuDUL9
         5hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9yNv5PoxKCCv3fkUNqSaJjMR7Mip4JoOAKswY+wx+l8=;
        b=7wGsQqU2x/bl1uy1XZ9hI4mQnlUmUbgWZx/4xoeEErI2ytgG7qjhERsw60TYg3L5Av
         olu5V00BMB3afqRksaw6lQPgAX7CahRk3LYKSZjl0eHcflb2Y9tOBhBc/H21B7MdABeL
         pfQKeObc6Oj5l95pxNqssF5CD1whdQJ3WCBjumJhhpx90twOYbvXnSyQwiPnaYHP3D7V
         ihDMuDo5nQACHUKYJhrjr9mJYCOGpJ1SC2eqEyt/EHEbRBAWBSc79TdpUeDX4zql9pMj
         vcn5qSIqeE546MgseJq/Ty3czhHEE1p0Uk6o4wXycMXpI0rhmsuNdh6xGqid9RNMhQ2K
         MmBw==
X-Gm-Message-State: AOAM533YxOPzuGmM95Lt3FkRPuxowlsegc9DLjeTdU02MLB8+BYDeeaA
	pLmowuLO/F8BCdUY1VOaU7vSsv+3HZ8=
X-Google-Smtp-Source: ABdhPJziWyhlhPTHpqu2lbCuGXc5Ut7QnBbFkA1+m/Y7UDKv8YJ7FYiVdRdZ+o+C4qS+axaPdCZAUg==
X-Received: by 2002:a37:8287:: with SMTP id e129mr6713287qkd.415.1632425886432;
        Thu, 23 Sep 2021 12:38:06 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id l1sm4081673qti.94.2021.09.23.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:38:05 -0700 (PDT)
Date: Thu, 23 Sep 2021 15:38:03 -0400
From: "Trevor Woerner" <twoerner@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify the target
Message-ID: <20210923193803.GA21792@localhost>
References: <20210923185506.2188-1-twoerner@gmail.com>
 <ea5ca6b018214c50826e5a1bef9bd86d@axis.com>
MIME-Version: 1.0
In-Reply-To: <ea5ca6b018214c50826e5a1bef9bd86d@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2021-09-23 @ 07:24:07 PM, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Trevor Woerner
> > Sent: den 23 september 2021 20:55
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-oe][PATCH v2] vk-gl-cts: allow the user to specify the
> > target
> > 
> > When building opengl-es-cts (for example), instead of hard-coding a
> > specific target to build (surfaceless), leave the choice empty by default
> > which instructs the package's build system to search the sysroot and try
> > to
> > determine which target to use (i.e. the "Default" target).
> > 
> > Provide overrides (in the form of PACAKGECONFIGs) to allow the user to
> > specify a specific target to build (if they don't want the target selected
> > automatically).
> > 
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes in v2:
> > - add logic to try to guess which dependencies (x11/wayland) will be
> >   required in the case where the user doesn't set a target explicitly
> > - add comments to explain the code, and explain how the newly added
> >   PACKAGECONFIGs work
> > ---
> >  .../vk-gl-cts/khronos-cts.inc                 | 33 +++++++++++++++++--
> >  1 file changed, 30 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-
> > oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > index f61921473..903f006db 100644
> > --- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > +++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
> > @@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
> > 
> >  inherit pkgconfig cmake features_check
> > 
> > -REQUIRED_DISTRO_FEATURES += "opengl"
> > +ANY_OF_DISTRO_FEATURES += "opengl wayland"
> > 
> > -DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
> > +DEPENDS += "libpng zlib virtual/libgles2"
> > 
> >  SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
> >              file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
> > @@ -36,7 +36,34 @@ SRC_URI:append:toolchain-clang = "\
> >  	file://fix-clang-private-operator.patch \
> >  "
> > 
> > -EXTRA_OECMAKE:append = " -DDEQP_TARGET=surfaceless"
> > +# The best thing for the user to do is to not specify any of the following
> > +# PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
> > +# probing and build what it thinks is appropriate.
> > +# However, if you want, you can specify one of the following PACKAGECONFIGs
> > +# to override this behaviour.
> > +PACKAGECONFIG ??= ""
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
> 
> If they are mutually exclusive, it is better to use the sixth argument for 

There's a *sixth* argument to PACKAGECONFIG??! What kind of sorcery is this??!

> the PACKAGECONFIG varflags, which allows you to specify other incompatible 
> varflags. I.e, the above would then become:
> 
> PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,,,, wayland x11_egl x11_glx x11_egl_glx"
> PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,, wayland,,, surfaceless x11_egl x11_glx x11_egl_glx"
> PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,, virtual/libx11 virtual/egl,,, surfaceless wayland x11_glx x11_egl_glx"
> PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,, virtual/libx11,,, surfaceless wayland x11_egl x11_egl_glx"
> PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,, virtual/libx11 virtual/egl,,, surfaceless wayland x11_egl x11_glx"
> 
> This allows other PACKAGECONFIGs to be added without breaking the logic.

I was going to leave that as a problem for whoever came along after me and
wanted to add something else ;-)

(just kidding)

> 
> > +
> > +    # if the user doesn't specify any PACKAGECONFIG then the cts build system
> > +    # is going to probe the sysroot to try to figure out what to build
> > +    # in this case we try to guess whether the user is building for wayland
> > +    # or x11 and add the required dependencies automatically
> > +    distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
> > +    if len(packageconfig) == 0:
> 
> A better test is:
> 
>     if not bb.utils.contains_any("PACKAGECONFIG", [ "surfaceless", "wayland", "x11_egl", "x11_glx", "x11_egl_glx" ], True, False, d):
> 
> > +        if "wayland" in distrofeatures:
> > +            d.appendVar("DEPENDS", " wayland ")
> > +        if "x11" in distrofeatures:
> > +            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
> > +}
> > 
> >  CTSDIR = "/usr/lib/${BPN}"
> > 
> > --
> > 2.30.0.rc0
> 
