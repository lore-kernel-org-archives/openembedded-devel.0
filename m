Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.5661.1604625677934536619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 17:21:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ft2ziUPL;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id k9so3172267qki.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 17:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lswXaqt0WKbyKWCFgM0DLsD62GQbUfRRKiRwP2M7jpE=;
        b=Ft2ziUPLLfjVCKBBYdhSEYZc5wpjNGaMemMvDzeA8v8dttlldg+rme399cTYoaVsgF
         8e65WsCI9uJQnng0HtdSlctQi418+rM/lVOwM/8gnhSsET+2Q19SyUCkw8/w7KJ1GjQx
         tyPKmQLtSB18MdTcmIoZaRYtwJRE9SlYsaj0n1zQV9bBEUYhgQQsg4f9RD5tk4ey7RIB
         UqeMBgWTBbwykocj0nqpcJ36Fvy81sFKA3C5n5yXq4ynn7lckpr6h5lRLRwRoGgxYKnT
         zYSDocRX1TUhbRNOG+hL5KM6GSlYQHDeGQlLiD/ylDeDHxli65yfjZE3HfQFeYsZzKxB
         bpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lswXaqt0WKbyKWCFgM0DLsD62GQbUfRRKiRwP2M7jpE=;
        b=BlbdYGzausqi7d0qqvdOvXoIWaNOHg3tBLbSUtuKc8aVKlyLqfLgJHzEqBNoNPUqbV
         ma43QSISHPqmP9j4421KW59InqMyXt/OuOpVEjdr+tUuN5GkjbF66lE3AzYdw6O4tBBa
         0aROsa5/g00iliRmL3bdUK6Qh+cIR0b/dl3gVJ+CwUf+p0mZBEqUgn2+emp/Oy7ynbF8
         NScVJEUxzIN33gg6gu/Vhh00wx8n0MbH0a1TG9pqSZwYZUnfMwOS3RQVblZlkhwqxxTf
         P3nTs/w0Vle4RHr0F6IeDLk6aDvU/TNMjg9uQaBkfFcMoYTX2evLJ5ybiGTnRi6lZ3Q0
         /o1A==
X-Gm-Message-State: AOAM533G69raPAMZV7ZN/uwchtmCkoOIm3Ze3pjyT/sY0BnpNsNjBKke
	afcxPKhlozQprx8lM6vF6iyDZo1YuM2mgnwaFmg=
X-Google-Smtp-Source: ABdhPJxxrZA0lQd/O8y2F/DHsjH9FJ/ij9CCw46gKj1vSjaJKKZ5mGGBhAMxHk0PSe5uGk8HLxZAMhrHFBZ+BITQA3k=
X-Received: by 2002:a37:6195:: with SMTP id v143mr4708630qkb.71.1604625676917;
 Thu, 05 Nov 2020 17:21:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604605168.git.rosbrookn@ainfosec.com> <78fd054347adbdb03d3faaae803d9ab3ad4da060.1604605168.git.rosbrookn@ainfosec.com>
 <CAMKF1srO7=d+ZWvd-3xYbamddv14=6NYUnmR+_BQgMZEc2XYHw@mail.gmail.com> <20201105205543.GA1137694@FED-nrosbr-BE.crux.rad.ainfosec.com>
In-Reply-To: <20201105205543.GA1137694@FED-nrosbr-BE.crux.rad.ainfosec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 5 Nov 2020 17:20:50 -0800
Message-ID: <CAMKF1soW_Lkvz9SqO_t__rNX6u-cTyy=oEZRot1MYKW=-V3hfA@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 1/2] strongswan: do not use deprecated stroke and starter by default
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 12:55 PM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> On Thu, Nov 05, 2020 at 12:20:36PM -0800, Khem Raj wrote:
> > On Thu, Nov 5, 2020 at 11:49 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
> > >
> > > The swanctl and vici configuration of strongswan is preferred, as the stroke
> > > plugin used with starter is deprecated. As a reasonable default, add swanctl
> > > systemd-charon to PACKAGECONFIG by default, removing charon and stroke.
> > >
> > > While here, make sure strongswan-starter.service is only installed when
> > > charon is enabled. The current unconditional installation of
> > > strongswan-starter.service can break systems which install strongswan.service
> > > for use with swanctl.
> > >
> > > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > > ---
> > >  .../recipes-support/strongswan/strongswan_5.8.4.bb    | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > > index 8a8809243..59641cb83 100644
> > > --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > > +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > > @@ -25,7 +25,7 @@ EXTRA_OECONF = " \
> > >
> > >  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> > >
> > > -PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
> > > +PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl systemd-charon \
> > >          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
> >
> > ldap is not a standard DISTRO_FEATURE so lets keep it disabled by
> > default. secondly enabling systemd-charon here would mean it wont work
> > with sysvinit so lets make that
> > option depend on systemd DISTRO_FEATURE
>
> To be clear, the ldap line is not from this patch. That is in the
> existing recipe. But, if you're asking me to change that while I'm here,
> I'm happy to do so.

OK please do it while you are here.

>
> I will make systemd-charon depend on the systemd DISTRO_FEATURE.
>
> Thanks,
> -NR
