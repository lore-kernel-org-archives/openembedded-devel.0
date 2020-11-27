Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.25654.1606516337082467134
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2020 14:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YByyrH2x;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id f27so4220310qtv.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2020 14:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uAEf2F2AtRceedry3B0XO7D/l/xcluNg6lDkXKf3C/Q=;
        b=YByyrH2xlvSW8yiEtaPN9HE0xm6baJ94gecZbehBOCojrOi+EAb9KUODXqxOOos0KV
         QMjMATrZTuyULTSgN72aD+gF09atVO3tsHOHix6hnMs+nmsNInrU70HD2FFRqkCHzmi3
         DS2L2Sm8spEPZWLIMVpWWYe4z2LxVXeRw5R3lj42RvAi9aSl6iEVMKuPT64O+VMV7jgB
         L5eX51S8bYOQTzbHcpS4EjcMoKBhO2+M3DAPLakXy+dc7IcHh5V18E9A/0o+ZCb0Te2Y
         DY1wG/QFddWZkb1Q2ppcIy+t/okLEQdQpRyf6xhK+Xz5tgh8uaEICaB5nrw/4DeIqUok
         iw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uAEf2F2AtRceedry3B0XO7D/l/xcluNg6lDkXKf3C/Q=;
        b=Qe8Kyonx5JvnFP8h/XFRmW8wom29Eo3xi7gKthhF+7vvEKwpkYcMTNIjizJeE+1JaE
         fRXxuweDPf6tRXLpnVNpUyyhhqFqcDRjpZzGhfJXM52+fNXDR8+9rdXnS9N3/TSspASB
         VdNvB81fJ20ytNigB0mQ31HLed4LaF0Wn/GhyrbctH/X+Vd0sl6pQJSgydw9XATPF3oJ
         6adxt3HClNhy/04yBiRFPV9VCGNqFuhi+0rDFmy0uPn2s72dcTiWP4BOBwxBegBet02B
         mi3FxxlAZb74o78ZHTS/itx/oHt/VHsAW+V1BjYLFjClM5C/N9S2jt2slj5apIxsHr+9
         MtTA==
X-Gm-Message-State: AOAM533M2znrv5SsRGMmHbsfQFPmdFMXR/vhMASbiau3oNIyrIMTZpHX
	6VbtklynBqdVVRZAlJpg38h9N+WLbO7Ve75xRBE=
X-Google-Smtp-Source: ABdhPJxe8VK0FtlekZejEjAOXF6Ew73ujqlbyOf6FJ7dJaXsdPGDwTwQ1ptDV5XHPjHgJrs8o/gDLNTDNbv2yzgC1HI=
X-Received: by 2002:ac8:2ff6:: with SMTP id m51mr10458596qta.194.1606516336186;
 Fri, 27 Nov 2020 14:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20201127153734.147135-1-beniaminsandu@gmail.com>
 <CAMKF1sqFj_6HvhgoX64=Zkx_wJRj6593crEJ_dzhTXHVexA2Rg@mail.gmail.com>
 <CABQJdOEPr-5mOcP01PiGX+mzMpfd+4CxFiEeHBkDo1yu7Yr9QQ@mail.gmail.com> <CAMKF1spC2zcn7PABeux8V2dXJwJ=OuJm5Tuq+cckfTsv=y_w+A@mail.gmail.com>
In-Reply-To: <CAMKF1spC2zcn7PABeux8V2dXJwJ=OuJm5Tuq+cckfTsv=y_w+A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Nov 2020 14:31:50 -0800
Message-ID: <CAMKF1sqeMT6ms-yUVwoj9Sw8YQm+zZAoG+OZkoZ5Xmfx2c5rBg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] trace-cmd: create recipe for version 2.9.1
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

btw. it failed musl build as well

https://errors.yoctoproject.org/Errors/Details/538865/

It perhaps needs to include sys/types.h somewhere.

On Fri, Nov 27, 2020 at 2:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Nov 27, 2020 at 1:01 PM Beniamin Sandu <beniaminsandu@gmail.com>=
 wrote:
> >
> >
> >
> > =C3=8En vin., 27 nov. 2020 la 21:51, Khem Raj <raj.khem@gmail.com> a s=
cris:
> >>
> >> On Fri, Nov 27, 2020 at 7:37 AM beni <beniaminsandu@gmail.com> wrote:
> >> >
> >> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
> >> > ---
> >> >  .../recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb  | 16 ++++++++++++=
++++
> >>
> >>
> >> Please add it to packagegroup-meta-oe as well.
> >
> >
> > Okay.
> >>
> >>
> >> >  1 file changed, 16 insertions(+)
> >> >  create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.=
1.bb
> >> >
> >> > diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/=
meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> >> > new file mode 100644
> >> > index 000000000..d9599c046
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
> >> > @@ -0,0 +1,16 @@
> >> > +SUMMARY =3D "User-space front-end command-line tool for ftrace"
> >> > +
> >> > +LICENSE =3D "GPLv2 & LGPLv2.1"
> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D873f48a813bded3de6ebc54=
e6880c4ac"
> >> > +
> >> > +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt=
/trace-cmd.git;branch=3Dmaster"
> >> > +SRCREV =3D "530b1a0caef39466e16bbd49de5afef89656f03f"
> >> > +
> >> > +S =3D "${WORKDIR}/git"
> >> > +
> >> > +do_install() {
> >> > +       oe_runmake DESTDIR=3D${D} install
> >> > +}
> >> > +
> >> > +FILES_${PN} +=3D "${prefix}/etc \
> >>
> >> user ${sysconfdir}
> >
> > IIRC ${sysconfdir} points to /etc and I need /usr/etc, I could not fin=
d anything to point there at a quick glance so I used this.
>
> yes that was the question. If the content should be moved to /etc
> instead of /usr/etc since /usr/etc does not seem to be
> that common.
>
> >>
> >>
> >> > +       ${libdir}/traceevent/plugins/"
> >> > --
> >> > 2.25.1
> >> >
> >> >
> >> >=20
> >> >
