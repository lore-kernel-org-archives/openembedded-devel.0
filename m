Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.216.1617835783402134393
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFKuUr2p;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g15so337312qkl.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XUL4rHxUF9fsBGLtsHefHdB5JA4+4nAPmHdu7Ja9i3c=;
        b=VFKuUr2pZCV1Hurqj9Ma8BVvasbv3Qph5T+uYLoHpL5feyEZeDzniN8GEvYorkK22z
         UbnqqU8NJ9jUGpnnzIR4rzKAKeWKkeKjoVAry4MdqTKHf2ktAoieDoWGpWhTdCxrlq6P
         BEaOuVI4pnFMTngvshS3SHVIYxscthtEFCwBkKpdOIYOglInObGLO9BoaNRj2f5hIc2+
         myyPw9/7wgRvPaVAmQvkcxRZp+Mb86u0iNlHuL5kmRaVVtbp5n0m/FD/mfDStqBwCGOJ
         dVgMswPjSKzF3DH9F53/jInnwNVhRds86F8/xmKvDsYYhzB7JaxvNaE6yNK9ALmKisiH
         3uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XUL4rHxUF9fsBGLtsHefHdB5JA4+4nAPmHdu7Ja9i3c=;
        b=HRCDYqUlcahpJW6JCOTEt0ToaFPwuKdcXxLdoNrDgmjmmdc1ewrpv4VT0TzO31m0u6
         lXPGBGLGMwLhG4kg3ML5jBCbNzscoC0YlS4NkK0I1tEjI7SYp+SxcZSM/hU+w7pP4tuW
         rgerGOsO4UT7zcIJNdnrkpgQVxl/LXI0NduUm/26ZJ+N4wiVjk5qjqtt6fCUEAIVlU8a
         bzURrNzC4JqtgMISwANNUH9aDuW1kWHaF+om2v1litaDaiLb6xjWOxAN6guajx5Re5Gd
         iHc85MTSLRmVWNdYXl/HFe/0jgPXO/UgKcbMKo1GfmT11kNGyS45MI45T7x6yOOAxAYv
         eokA==
X-Gm-Message-State: AOAM531VepeBWE5KPlyUV/PXKS2U7Zjd5kZNXgVxeIVIZ9/fu1h/aQyJ
	lR/Cq4P2BtR3LlKGQHAsOT6qxLAJbX3RJWG3vSA=
X-Google-Smtp-Source: ABdhPJzNrN9hYVf7y2KpIg4k/YKB2Y3zobk7iapFosGqkj19kEH4UbSWcVWD+VzazdcytggCfIvjAeKnROHv62H6mZs=
X-Received: by 2002:a05:620a:12ae:: with SMTP id x14mr5644011qki.25.1617835782569;
 Wed, 07 Apr 2021 15:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210407221829.606871-1-schnitzeltony@gmail.com>
 <20210407221829.606871-2-schnitzeltony@gmail.com> <CAMKF1soK2QREb8XkTanPJQ_bCOQRAGTeng5iiuf1_D_WUwfpwQ@mail.gmail.com>
 <CALbNGRSTsAjv017jex=h0T8iZPWwHiAQ6j+h1LHyO4k+Z4SkNQ@mail.gmail.com>
In-Reply-To: <CALbNGRSTsAjv017jex=h0T8iZPWwHiAQ6j+h1LHyO4k+Z4SkNQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 7 Apr 2021 15:49:16 -0700
Message-ID: <CAMKF1srYzaAF4zkGv0cz4k+Tt6LMv4-V0AhzeiqNsk5=NFtMaQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] networkmanager-openvpn: Fix packageing
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yeah, it would be good, if you rebased your series on latest master or
master-next and resend it to avoid any rebasing mishaps.

On Wed, Apr 7, 2021 at 3:46 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> On Thu, Apr 8, 2021 at 12:26 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 7, 2021 at 3:18 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> > >
> > > Recent upgrade introduced:
> > > | ERROR: networkmanager-openvpn-1.8.14-r0 do_package: QA Issue: netwo=
rkmanager-openvpn: Files/directories were installed but not shipped in any =
package:
> > > |  /usr/share/metainfo
> > > |  /usr/share/metainfo/network-manager-openvpn.metainfo.xml
> > >
> >
> > I wonder why my world build missed this. Is there any setting you are
> > use where this is triggered.
> I wondered either :) My guess was: I am not on the very very latest
> master of oe-core - maybe ${datadir}/metainfo was added to
> bitbake.conf meanwhile
>
> So before checking I decided to send this just in case openvpn-1.8.14
> becomes a candidate on elder branches: it is prepared to merge back.
>
> Andreas
