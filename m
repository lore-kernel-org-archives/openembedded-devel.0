Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.507.1607471754440141890
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 15:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uCxj6JUU;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id bd6so114029qvb.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Dec 2020 15:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAIPpqIXVshftaXbvRGxeIO56MQo/FweDwITqPWyR28=;
        b=uCxj6JUU8z7JWQ3/G67eDVwfczNbOvLklD/lI8irpIt6u3RN+5ITMyu+aEV0PlO77t
         ex4NkZKtOYbernQZjUU2g2+GyUiHpTICYTIn1kUDtH9uuOX6I1yntXQ8aq2mt+zf90tS
         w8kvgF0ZmWW5MjNF5PKvx84cQpBozScQrt63oh0T/7prA5a1g+/PuMW1zMsXWM3nI2i4
         VeSfmRj5n08AoR6w1SVnYYRrMQtEHnNSMCsbMhCbK121GmdYzdKrK6IDX4cVXBPLyJ0S
         PBeLp0pteclW1tt8Jzyf6ELdQkbVdIMx8l1YADzc95sAAq+h31JoF8HUddncwB+a2OC9
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAIPpqIXVshftaXbvRGxeIO56MQo/FweDwITqPWyR28=;
        b=Qt0Ak8d90Pj547Eb6zgQAuqThmblL/zRkv6CEmJP9RZU2Xt73k0O6ZSMbMa+E+d/O8
         jlnQf6W2H1oC9mbo4NE9kRUgVNcNA1FV8P9acrBist5AHhvkYvOhdIni8yUrJIK/u/Vy
         nZC2B/kJx1eW1TzOajU94dv0xuJopxZKJfdhVKE9JBIg6lblcMITph94KiLrFn/+J1oV
         bTMtHis3DVzQC2e8JDQyTKUU50Rz85xlgxoYq5hDTefjgkXhM4UCKzPHhEulQduKXeNG
         7iwyFKM0Kvxg6sEWaVrSQC1Ldpajg8wCQ5PPcP/bljViAy/wYR/mxPiGNXXad73OyIgP
         Bt2A==
X-Gm-Message-State: AOAM530Cp9z2YY9FLdym0MIFn0cESl20b59oWGggATQtgPgGnN5UVhAY
	ZRiSLshARMjyWlWsBDcn0tQmDrRGq9/sexoNMCg=
X-Google-Smtp-Source: ABdhPJwvmYNYabVlFy/s2maKpyvEyuWAPJcOpFHBYujfMc6LEfn+65WGFjQVJJKnI003l1CvcuYuWwWAJvou0qIbAeU=
X-Received: by 2002:ad4:4052:: with SMTP id r18mr710067qvp.38.1607471753451;
 Tue, 08 Dec 2020 15:55:53 -0800 (PST)
MIME-Version: 1.0
References: <20201204040829.38707-1-twoerner@gmail.com> <20201204040829.38707-2-twoerner@gmail.com>
 <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
In-Reply-To: <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Dec 2020 15:55:26 -0800
Message-ID: <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

while I have applied v3, please send a v4 addressing this change.

On Sat, Dec 5, 2020 at 10:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 3, 2020 at 8:08 PM Trevor Woerner <twoerner@gmail.com> wrote:
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> > changes from v1 to v2:
> > - Added. I had forgotten to submit this the first time.
> >
> > changes from v2 to v3:
> > - Fixed do_compile for wayland.
> > ---
> >  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> > index 320d07dfc..209230572 100644
> > --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> > +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> > @@ -9,13 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> >                      file://COPYING.SGI;beginline=5;md5=269cdab4af6748677acce51d9aa13552"
> >
> >  DEPENDS = "libpng jpeg udev"
> > +DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
> >
> > -PV = "20191226+${SRCPV}"
> > +PV = "2020.11+${SRCPV}"
>
> this version change is not upgradable i am seeing
>
> glmark2-2020.11+AUTOINC+784aca755a: Package version for package
> glmark2-src went backwards which would break package feeds (from
> 0:20191226+0+72dabc5d72-r0.0 to 0:2020.11+0+784aca755a-r0.0)
> [version-going-backwards]
>
>
> >
> >  COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
> >
> >  SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
> > -SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
> > +SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.28.0.497.g54e85e7af1
> >
> >
> > 
> >
