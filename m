Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AFFC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:15:36 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6849.1786684534253807724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EpHhU7mi;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81ecf499af9so9583147b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 22:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786684533; cv=none;
        d=google.com; s=arc-20260327;
        b=KPqQhBuoO0oV6TiiFvSeB999EwHIaTVuv3yY08m+/uwvAexQ8VY25ReBEn8SGI+zCC
         0vxFVMqitIJ3JfM4e/SbGDs/VtYGHEidFTGEo61h6QqeU8wHMg/JI6PCI85IAXvqI7+a
         +6oL8ojKiiPMrciR3Vgr5t7AKSoTJcLJ8hJ40iH1zGmqv7gaq3VN2T41cktpGfSvsqVB
         nVUcKLXIdSzCr50bQy7bMWMLxTnvncSHuLMm0edW15E9j0hcylDmDDX/HtVYl6iU1XDP
         a19Dfx1dJFcfUIXIGdDRuCTZXvRFMb4M5GgzU+JGNIl4iKOxMXmg+RBcegu1vcPDJjGB
         kfPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ni3rvOT3xia74g/RkbKBpQd1XVJoKp1CpCu0a2F9htE=;
        fh=gTQrVd3LoRZ1ifWc8SCx5FEsS+o1KCs/ul0L9U0HRGQ=;
        b=WxyUeRIf8tyO3CBY9ZijEy70406USP3MQBq2guWyiOFmqv7r9al1RCwZJw8sMemmY7
         4dzSgCcKxikEQblcu/tFFyl3yyns/X2DNqV/VS3QRIbPrLxXoEnefHJV/i5qE6nZ/GHJ
         ng1ZXPtwau0vU1CLQVMOb5gjz7FC7KxOzkXuU3H/bNZL4c9qTnS2RxCqCqxsgHU+nNhE
         Cj3ONbe90P+6+RB23fER9AkSeEnodBSOaOgGdzupBbHYeHTw2MRsH7/bq296BklD9fR8
         nDZ6ik42voxAbAhTH3CX+PLXBBnKKnbKNHKSDGVjjXvIGRw6l0LzoA8KT4MQH5LhHAFC
         tPOw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786684533; x=1787289333; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ni3rvOT3xia74g/RkbKBpQd1XVJoKp1CpCu0a2F9htE=;
        b=EpHhU7mizG1MyT4Kj9C2wRhdDzJHkveBdCnd94AaXcPCSXc08m2AVCP/UbN4m6MD9t
         jqfxxEmlU1Fa0q+itdDBainflJBzhVoDKMXYeRlnHFXxlVBkOhG6QT4Zj1Hs2axZCZwT
         smEZzZwknYdaHTJ9A0OjaLLwIVfHcc2m3uzOls7BnJeK4VwE9Gxztw8qMJC64YsjHWZu
         tJ99anffjAL242IFuPLtf9P1Wh2i4hx6ATzlxw17cS/Ek/vnGXmTXAwisfAP65P6IHA4
         yXlb1t5nsKZ/qE5UcEv7WkpF1xXWYVkGRucfUcM/Jhg8vPMhxTmOOFT1sVrYNOikyup1
         12mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786684533; x=1787289333;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ni3rvOT3xia74g/RkbKBpQd1XVJoKp1CpCu0a2F9htE=;
        b=oNbfFg2dWUEIQd8c4cGLGd/ze5Hz6k8s74XYayqy/TbWE7W3H0UxjqqqSKzNBamI9X
         wdlzX7xzS3PSK2VxcRk2qeWtpy6OO7uFW2ntMWKqFupB06BwjeVJoJihMFPPRBIimEhQ
         mnRekunPBI7WKrq5kstxCfLCd/Nlt+SBJERYutZZoLokGUH9nzcgQx6/l4BJ6BZylmbM
         DXRTzEx1psLw1Et8Z7ep51V5sdu+tss2uCvXdhAX+O8KW3iUGk/mJsnbUNwsW+tkemOA
         j3cqgHxynbLwmm/T0f6NJ95GjK3/Z1AGo5o3WQPgobUgFB6iSu62wzxUwHgG7Uv+9uux
         3beg==
X-Gm-Message-State: AOJu0Yws2nfV66QpuTln7n8JyqCTeccklqYgYfqoT+SDyPjBmpZhApuH
	kn/WwqiG5+TMFT9LVYU+qaYDgvDhI4r4/A5wy/9udLUh/O28U0m96PgktHZ9qD5XShj+H0RQd4t
	RE38wzBou+erKT0dAQvfd0B16rel3ujw=
X-Gm-Gg: AR+sD11IR+yeSMSDr31W5tT+yiqwNRo/zuIUSXP9cZvb1H8biElxYQ1CJh3N278XGu9
	C2VMLKUnYgKPXzTC+NZ7xJxUbaU7WHoAUWqYBKCT98JD39IfUvnRy1gUhSMFxFNpROQwk50qQhC
	CUZQeKnwFPiIEFLhgf/PH1BwbZmmTDdQdhsMujk+cuS8Ii+9uO0unCYBe4mVKYOLTV5tQ9+Rgmf
	GOc0WYPBpugnjb0YARPb8UGWfKLg62kYo1LjfmZW7TMyd/6lzJvtvfnb+QMJvCAqQEwqL4fzKHD
	py7LqXS3qg5bLW7KaieqXzAT3ue6twxZfn4G4snbDLAKHTwB61YCAqX6Ntq5/3bAtf9Yq3NV+LV
	jNJxS5p6w26TI/xDI3mK069K41a0C9at18Gitp3cpQpvpyFYjneAva86tQg/+DnkHkaz6VawQCd
	2ZP8xVdNxojaszNcS45jr+zzDbSvj/9TUB9yXlgHKQaUU3mA8GSeS5GKAoqsk0HCzQfxfSbsM6b
	eQzLON1d+FmVA==
X-Received: by 2002:a05:690c:c381:b0:7e8:6a6a:dc11 with SMTP id
 00721157ae682-83712da9c7fmr13086337b3.19.1786684533064; Thu, 13 Aug 2026
 22:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
 <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com>
 <b921cfd80b988672d5f0b03731e19a8f12f8acba.camel@codeconstruct.com.au>
 <CAMKF1sqKEhVdUExdeUEQSft5SSixeh2-F+1S06SFgkZDrFWgpg@mail.gmail.com> <e06584c2d374e22b742f5ff4db7f17c88c26962e.camel@codeconstruct.com.au>
In-Reply-To: <e06584c2d374e22b742f5ff4db7f17c88c26962e.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 22:15:06 -0700
X-Gm-Features: AUfX_mz8QlQy4t2bJQEKwfWFjX-VgPueF19RWkWZbo-dK5U28TiC6QArnEpHr6E
Message-ID: <CAMKF1srfUdNC=gxPzeEKZmRK9msT3wEUKJpJfFi8o4i7B5GqSg@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools and
 mctpd into separate recipes
To: James Lee <james@codeconstruct.com.au>
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="000000000000eb48170658fae81a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 05:15:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129034

--000000000000eb48170658fae81a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 9:53=E2=80=AFPM James Lee <james@codeconstruct.com.=
au>
wrote:

> On Thu, 2026-08-13 at 21:45 -0700, Khem Raj wrote:
> >
> >
> > On Thu, Aug 13, 2026 at 9:14=E2=80=AFPM James Lee
> > <james@codeconstruct.com.au> wrote:
> > > I believe that would work, but think it's important to have a clear
> > > split at this point.
> > >
> > > The mctp utilities and mctpd daemon have different use-cases and
> > > dependencies, and do not depend on each other. The split allows
> > > users
> > > to install the mctp utilities on systemd distros without
> > > automatically
> > > adding the daemon. It also makes it clear that the mctp package
> > > does
> > > not depend on systemd or useradd.
> > >
> >
> >
> > The output can be packaged to be more granular such that daemon goes
> > into
> > package of its own, would that work ?
> >
>
> I believe that would break the inherit_defer approach?
>

Cant be sure. Looking forward to you experiment with it :)


>
> > >
> > > On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:
> > > > Can we do something like
> > > > inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> > > > 'useradd', '', d)}
> > > >
> > > > On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via
> > > > lists.openembedded.org
> > > > <james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:
> > > > > The current mctp recipe relies on the upstream's conditional
> > > > > build
> > > > > and
> > > > > install of the mctpd binary if systemd is present, only
> > > > > building
> > > > > the
> > > > > mctp utility otherwise. Future upstream changes allowing
> > > > > running as
> > > > > non-root require more control over the build process. We will
> > > > > need
> > > > > to
> > > > > add a new system user when mctpd is built.
> > > > >
> > > > > Adding a user requires inheriting useradd, which assumes at
> > > > > least
> > > > > one
> > > > > user will be created, failing the recipe otherwise. Building
> > > > > without
> > > > > mctpd would then cause the recipe to fail as conditionally
> > > > > inheriting
> > > > > useradd seems infeasible.
> > > > >
> > > > > To make useradd available for the new upstream release, split
> > > > > the
> > > > > recipe
> > > > > into "mctp" for the utilities and "mctpd" for the daemon,
> > > > > isolating
> > > > > the
> > > > > systemd dependency to "mctpd".
> > > > >
> > > > > This makes the two parts of the source explicitly selectable
> > > > > from
> > > > > user
> > > > > choice, rather than auto-detecting based on the presence of
> > > > > systemd. It
> > > > > will also let us express the useradd rules only when they're
> > > > > needed
> > > > > for
> > > > > the mctpd installation in the upcoming version bump.
> > > > >
> > > > > Signed-off-by: James Lee james@codeconstruct.com.au
> > > > > ---
> > > > >  meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
> > > > >  .../recipes-support/mctp/mctp_2.5.bb          | 46 ++---------
> > > > > ----
> > > > > ----
> > > > >  .../recipes-support/mctp/mctpd_2.5.bb         | 28 +++++++++++
> > > > >  3 files changed, 42 insertions(+), 43 deletions(-)
> > > > >  create mode 100644 meta-networking/recipes-
> > > > > support/mctp/mctp.inc
> > > > >  create mode 100644 meta-networking/recipes-
> > > > > support/mctp/mctpd_2.5.bb
> > > > >
> > > > > diff --git a/meta-networking/recipes-support/mctp/mctp.inc
> > > > > b/meta-
> > > > > networking/recipes-support/mctp/mctp.inc
> > > > > new file mode 100644
> > > > > index 0000000000..98225cffea
> > > > > --- /dev/null
> > > > > +++ b/meta-networking/recipes-support/mctp/mctp.inc
> > > > > @@ -0,0 +1,11 @@
> > > > > +HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > > > +SECTION =3D "net"
> > > > > +LICENSE =3D "GPL-2.0-only"
> > > > > +LIC_FILES_CHKSUM =3D
> > > > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > > > +
> > > > > +SRC_URI =3D
> > > > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhtt=
ps
> > > > > ;tag
> > > > > =3Dv${PV}"
> > > > > +SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > > > +
> > > > > +inherit meson pkgconfig
> > > > > +
> > > > > +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> > > > > diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > index a8787d3f2b..5811495c66 100644
> > > > > --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > +++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > @@ -1,45 +1,5 @@
> > > > > -SUMMARY =3D "Management Component Control Protocol utilities"
> > > > > -HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > > > -SECTION =3D "net"
> > > > > -LICENSE =3D "GPL-2.0-only"
> > > > > +require mctp.inc
> > > > >
> > > > > -LIC_FILES_CHKSUM =3D
> > > > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > > > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > > > > utilities"
> > > > >
> > > > > -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > > > -
> > > > > -SRC_URI =3D
> > > > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhtt=
ps
> > > > > ;tag
> > > > > =3Dv${PV}"
> > > > > -
> > > > > -
> > > > > -inherit meson pkgconfig systemd
> > > > > -
> > > > > -EXTRA_OEMESON =3D " \
> > > > > -    -Dtests=3Dfalse \
> > > > > -"
> > > > > -
> > > > > -PACKAGECONFIG ??=3D " \
> > > > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > > > -"
> > > > > -
> > > > > -# mctpd will only be built if pkg-config detects libsystemd;
> > > > > in
> > > > > which case
> > > > > -# we'll want to declare the dep and install the service.
> > > > > -PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
> > > > > -SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > > > local.target"
> > > > > -SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> > > > > -
> > > > > -do_install:append () {
> > > > > -    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd',
> > > > > 'true',
> > > > > 'false', d)}; then
> > > > > -        install -d ${D}${systemd_system_unitdir}
> > > > > -        install -m 0644 ${S}/conf/mctpd.service \
> > > > > -                ${D}${systemd_system_unitdir}/mctpd.service
> > > > > -        install -m 0644 ${S}/conf/*.target \
> > > > > -                ${D}${systemd_system_unitdir}/
> > > > > -        install -d ${D}${datadir}/dbus-1/system.d
> > > > > -        install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > > > -                ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > > > -    fi
> > > > > -}
> > > > > -
> > > > > -FILES:${PN} +=3D " \
> > > > > -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> > > > > -            '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> > > > > -"
> > > > > +MESON_TARGET =3D "mctp mctp-client"
> > > > > diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > > > b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > > > new file mode 100644
> > > > > index 0000000000..f049be646b
> > > > > --- /dev/null
> > > > > +++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > > > @@ -0,0 +1,28 @@
> > > > > +require mctp.inc
> > > > > +
> > > > > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > > > > control
> > > > > protocol daemon"
> > > > > +
> > > > > +inherit systemd
> > > > > +
> > > > > +do_install:append () {
> > > > > +    install -d ${D}${systemd_system_unitdir}
> > > > > +    install -m 0644 ${S}/conf/mctpd.service \
> > > > > +            ${D}${systemd_system_unitdir}/mctpd.service
> > > > > +    install -m 0644 ${S}/conf/*.target \
> > > > > +            ${D}${systemd_system_unitdir}/
> > > > > +    install -d ${D}${datadir}/dbus-1/system.d
> > > > > +    install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > > > +            ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > > > +}
> > > > > +
> > > > > +SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > > > local.target"
> > > > > +
> > > > > +DEPENDS +=3D "systemd"
> > > > > +
> > > > > +# Meson adds mctp utility binaries to FILES and do_install(),
> > > > > which cannot be
> > > > > +# overriden by MESON_TARGET. Override FILES and remove
> > > > > binaries to
> > > > > correct.
> > > > > +FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf
> > > > > ${sbindir}/mctpd"
> > > > > +
> > > > > +do_install:append () {
> > > > > +    rm -r ${D}${bindir}
> > > > > +}
>

--000000000000eb48170658fae81a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 9:53=E2=80=AFPM James Lee &lt;<a href=3D"mailto:james@codeconstruc=
t.com.au">james@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, 2026-08-13 at 21:45 -0700, Khem=
 Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Aug 13, 2026 at 9:14=E2=80=AFPM James Lee<br>
&gt; &lt;<a href=3D"mailto:james@codeconstruct.com.au" target=3D"_blank">ja=
mes@codeconstruct.com.au</a>&gt; wrote:<br>
&gt; &gt; I believe that would work, but think it&#39;s important to have a=
 clear<br>
&gt; &gt; split at this point.<br>
&gt; &gt; <br>
&gt; &gt; The mctp utilities and mctpd daemon have different use-cases and<=
br>
&gt; &gt; dependencies, and do not depend on each other. The split allows<b=
r>
&gt; &gt; users<br>
&gt; &gt; to install the mctp utilities on systemd distros without<br>
&gt; &gt; automatically<br>
&gt; &gt; adding the daemon. It also makes it clear that the mctp package<b=
r>
&gt; &gt; does<br>
&gt; &gt; not depend on systemd or useradd.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; The output can be packaged to be more granular such that daemon goes<b=
r>
&gt; into<br>
&gt; package of its own, would that work ?<br>
&gt; =C2=A0<br>
<br>
I believe that would break the inherit_defer approach?<br></blockquote><div=
><br></div><div>Cant be sure. Looking forward to you experiment with it :)<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; <br>
&gt; &gt; On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; Can we do something like=C2=A0<br>
&gt; &gt; &gt; inherit_defer ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;=
, &#39;systemd&#39;,<br>
&gt; &gt; &gt; &#39;useradd&#39;, &#39;&#39;, d)}<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via<br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &lt;james=3D<a href=3D"mailto:codeconstruct.com.au@lists.ope=
nembedded.org" target=3D"_blank">codeconstruct.com.au@lists.openembedded.or=
g</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; The current mctp recipe relies on the upstream&#39;s co=
nditional<br>
&gt; &gt; &gt; &gt; build<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; install of the mctpd binary if systemd is present, only=
<br>
&gt; &gt; &gt; &gt; building<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; mctp utility otherwise. Future upstream changes allowin=
g<br>
&gt; &gt; &gt; &gt; running as<br>
&gt; &gt; &gt; &gt; non-root require more control over the build process. W=
e will<br>
&gt; &gt; &gt; &gt; need<br>
&gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; add a new system user when mctpd is built.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Adding a user requires inheriting useradd, which assume=
s at<br>
&gt; &gt; &gt; &gt; least<br>
&gt; &gt; &gt; &gt; one<br>
&gt; &gt; &gt; &gt; user will be created, failing the recipe otherwise. Bui=
lding<br>
&gt; &gt; &gt; &gt; without<br>
&gt; &gt; &gt; &gt; mctpd would then cause the recipe to fail as conditiona=
lly<br>
&gt; &gt; &gt; &gt; inheriting<br>
&gt; &gt; &gt; &gt; useradd seems infeasible.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; To make useradd available for the new upstream release,=
 split<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; recipe<br>
&gt; &gt; &gt; &gt; into &quot;mctp&quot; for the utilities and &quot;mctpd=
&quot; for the daemon,<br>
&gt; &gt; &gt; &gt; isolating<br>
&gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; systemd dependency to &quot;mctpd&quot;.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This makes the two parts of the source explicitly selec=
table<br>
&gt; &gt; &gt; &gt; from<br>
&gt; &gt; &gt; &gt; user<br>
&gt; &gt; &gt; &gt; choice, rather than auto-detecting based on the presenc=
e of<br>
&gt; &gt; &gt; &gt; systemd. It<br>
&gt; &gt; &gt; &gt; will also let us express the useradd rules only when th=
ey&#39;re<br>
&gt; &gt; &gt; &gt; needed<br>
&gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; the mctpd installation in the upcoming version bump.<br=
>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Signed-off-by: James Lee <a href=3D"mailto:james@codeco=
nstruct.com.au" target=3D"_blank">james@codeconstruct.com.au</a><br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; =C2=A0meta-networking/recipes-support/mctp/mctp.inc | 1=
1 +++++<br>
&gt; &gt; &gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"http://mctp_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 46 ++---------<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"http://mctpd_=
2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 28 +++++++++++<br>
&gt; &gt; &gt; &gt; =C2=A03 files changed, 42 insertions(+), 43 deletions(-=
)<br>
&gt; &gt; &gt; &gt; =C2=A0create mode 100644 meta-networking/recipes-<br>
&gt; &gt; &gt; &gt; support/mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; =C2=A0create mode 100644 meta-networking/recipes-<br>
&gt; &gt; &gt; &gt; support/mctp/<a href=3D"http://mctpd_2.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-support/mctp/mctp.=
inc<br>
&gt; &gt; &gt; &gt; b/meta-<br>
&gt; &gt; &gt; &gt; networking/recipes-support/mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..98225cffea<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/Co=
deConstruct/mctp" rel=3D"noreferrer" target=3D"_blank">http://www.github.co=
m/CodeConstruct/mctp</a>&quot;<br>
&gt; &gt; &gt; &gt; +SECTION =3D &quot;net&quot;<br>
&gt; &gt; &gt; &gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; &gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61=
db21&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SRC_URI =3D<br>
&gt; &gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/CodeConstruct/=
mctp;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps</a><br>
&gt; &gt; &gt; &gt; ;tag<br>
&gt; &gt; &gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; &gt; &gt; +SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b=
272&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Dfalse&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-support/mctp/<a hr=
ef=3D"http://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb<=
/a><br>
&gt; &gt; &gt; &gt; b/meta-networking/recipes-support/mctp/<a href=3D"http:=
//mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; &gt; &gt; index a8787d3f2b..5811495c66 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-networking/recipes-support/mctp/<a href=3D"h=
ttp://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a href=3D"h=
ttp://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; &gt; &gt; @@ -1,45 +1,5 @@<br>
&gt; &gt; &gt; &gt; -SUMMARY =3D &quot;Management Component Control Protoco=
l utilities&quot;<br>
&gt; &gt; &gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/Co=
deConstruct/mctp" rel=3D"noreferrer" target=3D"_blank">http://www.github.co=
m/CodeConstruct/mctp</a>&quot;<br>
&gt; &gt; &gt; &gt; -SECTION =3D &quot;net&quot;<br>
&gt; &gt; &gt; &gt; -LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; &gt; &gt; +require mctp.inc<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61=
db21&quot;<br>
&gt; &gt; &gt; &gt; +SUMMARY =3D &quot;Management Component Transport Proto=
col (MCTP)<br>
&gt; &gt; &gt; &gt; utilities&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b=
272&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -SRC_URI =3D<br>
&gt; &gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/CodeConstruct/=
mctp;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps</a><br>
&gt; &gt; &gt; &gt; ;tag<br>
&gt; &gt; &gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -inherit meson pkgconfig systemd<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -EXTRA_OEMESON =3D &quot; \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
&gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&=
#39;, &#39;systemd&#39;, d)} \<br>
&gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -# mctpd will only be built if pkg-config detects libsy=
stemd;<br>
&gt; &gt; &gt; &gt; in<br>
&gt; &gt; &gt; &gt; which case<br>
&gt; &gt; &gt; &gt; -# we&#39;ll want to declare the dep and install the se=
rvice.<br>
&gt; &gt; &gt; &gt; -PACKAGECONFIG[systemd] =3D &quot;,,systemd,libsystemd&=
quot;<br>
&gt; &gt; &gt; &gt; -SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.tar=
get mctp-<br>
&gt; &gt; &gt; &gt; local.target&quot;<br>
&gt; &gt; &gt; &gt; -SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enable&quot;<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -do_install:append () {<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;systemd&#39;,<br>
&gt; &gt; &gt; &gt; &#39;true&#39;,<br>
&gt; &gt; &gt; &gt; &#39;false&#39;, d)}; then<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_s=
ystem_unitdir}<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/=
mctpd.service \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${D}${systemd_system_unitdir}/mctpd.service<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/=
*.target \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${D}${systemd_system_unitdir}/<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/=
dbus-1/system.d<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/=
mctpd-dbus.conf \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${D}${datadir}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; -FILES:${PN} +=3D &quot; \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;systemd&#39;, \<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;${datad=
ir}/dbus-1/system.d/mctpd.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; +MESON_TARGET =3D &quot;mctp mctp-client&quot;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-support/mctp/<a hr=
ef=3D"http://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.b=
b</a><br>
&gt; &gt; &gt; &gt; b/meta-networking/recipes-support/mctp/<a href=3D"http:=
//mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; index 0000000000..f049be646b<br>
&gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a href=3D"h=
ttp://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><b=
r>
&gt; &gt; &gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; &gt; &gt; +require mctp.inc<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SUMMARY =3D &quot;Management Component Transport Proto=
col (MCTP)<br>
&gt; &gt; &gt; &gt; control<br>
&gt; &gt; &gt; &gt; protocol daemon&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +inherit systemd<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +do_install:append () {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}=
<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service =
\<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${system=
d_system_unitdir}/mctpd.service<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${system=
d_system_unitdir}/<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.=
d<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.con=
f \<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadi=
r}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.tar=
get mctp-<br>
&gt; &gt; &gt; &gt; local.target&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +DEPENDS +=3D &quot;systemd&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +# Meson adds mctp utility binaries to FILES and do_ins=
tall(),<br>
&gt; &gt; &gt; &gt; which cannot be<br>
&gt; &gt; &gt; &gt; +# overriden by MESON_TARGET. Override FILES and remove=
<br>
&gt; &gt; &gt; &gt; binaries to<br>
&gt; &gt; &gt; &gt; correct.<br>
&gt; &gt; &gt; &gt; +FILES:${PN} =3D &quot;${datadir}/dbus-1/system.d/mctpd=
.conf<br>
&gt; &gt; &gt; &gt; ${sbindir}/mctpd&quot;<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; +do_install:append () {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 rm -r ${D}${bindir}<br>
&gt; &gt; &gt; &gt; +}<br>
</blockquote></div></div>

--000000000000eb48170658fae81a--

