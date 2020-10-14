Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.7590.1602665554310432295
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rPSkn9WX;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id g29so1550182pgl.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uj/OzIvXJpMnpIBzb8usZ9Zp037kxpjg7D3rUtT5AFo=;
        b=rPSkn9WX6CrotkOIABY4i7qfT2koRAs5TqdmsjrqiaXDHu4OSAkJN64APES3h9N5Ie
         Pkwm8YagMP8yYG1C9jlI2Xdupgb3PjW/pSoGE/XNrGAZLUdhOWX5JckcdiMNz8n3frn1
         JnThFGqgq3uIjiaI15gSlkD00JxgDnDkaspVkndpNjIIRBA4lcwRBBNYq31ehaIsaFa6
         4WODwZRz2oe+3qv0jqXcd7OOFcl0STw6T0xBSAkIeFmNg/C4dpgdaXGp7c6JyCq5vsic
         /F6leRyXST9daz/53DYKPG9quIP88OQzBGfg/GJd5zZp5rzZIsiIj1JEGWeK2WHAYJWZ
         HU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uj/OzIvXJpMnpIBzb8usZ9Zp037kxpjg7D3rUtT5AFo=;
        b=fIsu1G1U8UGF6nCrrmNbFSDI+cY5uAZTCnEvgQkIaYGq+SxdSaFQYVOYE0Z6yht9XR
         qcOTWgdB2Qv+0Mpy2kwo2PvQejUfBxBpbVuZDzViDtvvNJNDVzh9aoOwVhRHbk6oLZQ7
         M7id0ew2dM6upUk4FgS7zGPC/hvniKFu62oD4r7TJezHU6cymlvxCs9nb6NL/kZ4PFyJ
         SvIFLc8R8jkLfC4eJ+ZByDMS6KAqWIDeJAeHueteULOVihHkTuGjMO5gpWqbdc27O+go
         qsPbDB6ALrfbriR0V15Xluhiqbs4KivmomcLjBj6/8F10akshCiPI0+JovUI8t115KFK
         ag5A==
X-Gm-Message-State: AOAM532n8eCNWK1yobkjIVdVWgjnpUQ7HMCmGYbB0V55XaIawm7PR9LP
	UryIMr6qx4n2/LIc76gWQug7WnBmYgX6CYZNHvc=
X-Google-Smtp-Source: ABdhPJy5DAmUTx1c6Pj9LHMv6E11KU5Xcy04D3luobX6jk0zkfDF1YivRV8HR1/d8Tlqk1+wF4cgig7+rW0j+yDC/8M=
X-Received: by 2002:a63:4f17:: with SMTP id d23mr2983939pgb.319.1602665553771;
 Wed, 14 Oct 2020 01:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
 <20201014010617.1086948-3-schnitzeltony@gmail.com> <CAMKF1sr5XQrxteG2Qg3dmgZ=EuVeRixnT-yp6thHFYreohL4SA@mail.gmail.com>
In-Reply-To: <CAMKF1sr5XQrxteG2Qg3dmgZ=EuVeRixnT-yp6thHFYreohL4SA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 14 Oct 2020 10:52:21 +0200
Message-ID: <CALbNGRQ_KfvVcWYO-VXO40PEb-vsd4PKSUktWXyAeLTAtCQm7Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 3/8] wxwidgets: add opengl PACKAGECONFIG / enable it if opengl is in DISTRO_FEATURES
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 7:50 AM Khem Raj <raj.khem@gmail.com> wrote:
> > -PACKAGECONFIG ?= "gtk"
> > +PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
>
> libglu also needs X11, so checking for opengl won't be enough
It's not that simple:

* wxwidgets has three PACKAGECONFIGs for the backend: no_gui/gtk/qt
and users should (there is a note in the recipe) select exactly one of
them.
* For qt and gtk x11 is added to REQUIRED_DISTRO_FEATURES
* PACKAGECONFIG no_gui (the only non x11) is marked as conflicting with opengl

=> To select opengl successfully, x11 must be in DISTRO_FEATURES. Hope
that's good enough

Andreas
