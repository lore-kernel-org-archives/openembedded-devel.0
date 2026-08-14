Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4A4C5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 05:42:36 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7080.1786686155538680511
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 22:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NnmVFEjO;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836c91bd782so10237847b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 22:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786686154; cv=none;
        d=google.com; s=arc-20260327;
        b=iN6YvIehxwcfZ7aOaU3daShjcwNjmrz0+5RSA0BZZ3Uog2/z0NFOVWLr4kGM2XkwlJ
         UjhV7IMkEqYZQ2OfWUuGE0xDY9jRzMtb6vr6+oM08MFHCL1HGGKy8ca117WmDKsYBxx6
         RVS9HbfzNrnqSzr9+2d9+9iwuAl3TDIUKf556giM+Tcij+8yDwyjhcAzSwm2krQ7Ia+k
         FAq8hdImeetwohccqYXXGtNIUjun6vrSd8C5K4YetnqMu8mB/fdNtBsTqlj9w8l2BQS4
         7h0Jo11dGP7J8ecXzOnmvbFTrVTIcywRXFIs7fho2YhIJ98h8sVdnvApXDA2AfPnmBhn
         M3Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Y1PzhIrtuMDDX9MDYUZAAl/dld/jUyqgTkiuX6t/J4=;
        fh=gTQrVd3LoRZ1ifWc8SCx5FEsS+o1KCs/ul0L9U0HRGQ=;
        b=J7k6yNG59U3pA2HVAx+y7OQf7wOtA52r/1EBcbejgzZntOs2OVcVA2lDJ1YhjbIm4S
         PrLytUYZgIfPtcDhlSmRrd0y2Bi1Lb+Ajr7UCaHKU8cuunmrYN+JjN1GaCdIsTqsb0Vz
         dUZOUTImAiy1HADtHeL/3wBj0Ox+dRIkQr3sNyZquJl+v65QF9XDcxnsmyXRFOkPBfqL
         qviVPSq3fRv1HtrmtstzVTngdiFcoZoxT+XqFP2paf/f8ktxIW4qtqaKxMEe42w/SHxH
         38WVnjUQ+OyhL0IpvXysfRAvVEWLJ8kw1Z2+2bPAftX8qqhFBnzVnEgowveb+MLFmx9z
         qlTw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786686154; x=1787290954; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Y1PzhIrtuMDDX9MDYUZAAl/dld/jUyqgTkiuX6t/J4=;
        b=NnmVFEjObJ7HYfZuD7w2Rz7IgqOjmDGa97+Jy0SB3TMz6VWw+s5XvImMDeuDVAX8jg
         k0Nu7Wn9a9vMpBKs1gswYSNDnE4+PcVET12nrhq55v0WtF/pLEubqtE1dpM8LtSBvnaw
         ntK2PdPSxIn6UIWeE/FPywuXeSWEe7boSBxx+DethBJOhFnCREbu8k1RdBt9LuuvwOOL
         /QWNhBCjqYsjZp3DsHGXI3dkxMQfNR7eoWhYMWssUE789ZPrUSf6htR0VluytwCFqxG+
         tIkGRKJpWxQwQAC7Ql4K7hZ1Nv9qiivJwnzyg1b4aZXJDF6tulvO+JJ/+bVt7/pRn+Aw
         L8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786686154; x=1787290954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5Y1PzhIrtuMDDX9MDYUZAAl/dld/jUyqgTkiuX6t/J4=;
        b=ozlq0k/vnkBEmryxvoJ4dbLSSEkvz2PZYktLKd9infyj1vwLywS7xxP0g1Vfc7NRod
         4hSkFXw4Q+055nRp8td3cMOjIsNVS6HAq5OYc5nWfVaT5pRQZWq39HgVF9g1UqQlrtgq
         vEpx11ohZ+W5q74yYLlMy8JhhcLPkjWwf5r0J16lyONuj7J16jh5RFPm0O4cyVrpfu25
         8wnUVolPmcwH4mFowOfgLNhjo6gTovHGf6AujhgFeOll6Djw80vOT/5Nrj9DSdvEuoPy
         RNQr50Wk+c51sMGptNh89eZukc5JHE6mAVBUrSTmdMg2T0knHaeuw/6NrmlRr/oECbj6
         h8nw==
X-Gm-Message-State: AOJu0Yzo+X51X8q9b8UW671ldTQEXOpXO0ngoo9ufUrLChTxVo7ExLoH
	kCroYX1v+3/alI6dkzMa6ymWX045b3DJGnL8shqYm89mHrdY/XSCJJVKpx1mTzUPcIqQzXNl7fO
	CdBZpLa9+2VW0T70GF4CViVjKURmmpjc=
X-Gm-Gg: AR+sD11IhaJXLJo0TX3J8a6+xbPwvupv77kM6oxNVvnGC8+zSEGmp2FUNa1762/CfTs
	H9UX2mope2QtglenvBH9tDeHpFPsokj1c3XcU8GXdF7mBRj0Z/4l2GBBdpl+Snv4RS9pRr1+NO+
	w00CtaL1bb5JaIZAKfWyyBNEO4cC4H7g0OMls7I8pyQat2+RQBgA81k8ya347TblVebDGT6YSxv
	rWjYSJSEW/YdJl6IKJRHXwPOJoIe8r2nbl0/5CsUNajx5WfddGkoORbd1X0DuqTahJcq1wtI1Ez
	5e1ISuJAXjYPDxkWxmYFLQX+kaHkKOHMSRGmVndYaSOgcJFtElk0lW5t8LJtw0ra6NmYCkU+x2d
	HA00z9DFOD2WAscwGwsd0Bq33HmEjJp/yIavRavE4KOwkQ503IwT6x+ZF5pC8UmZcrxNz62pTeL
	+GDWB/IfYo0uqUw5Ha49KLv/sXFlwbiZJVw+X+9mBG4PB5blS77TuufVHJee5hRaAzvPyQPFexY
	2shcQfjyxyDAg==
X-Received: by 2002:a05:690c:111:b0:809:6b62:2f7a with SMTP id
 00721157ae682-83712da845dmr16230767b3.21.1786686154403; Thu, 13 Aug 2026
 22:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
 <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com>
 <b921cfd80b988672d5f0b03731e19a8f12f8acba.camel@codeconstruct.com.au>
 <CAMKF1sqKEhVdUExdeUEQSft5SSixeh2-F+1S06SFgkZDrFWgpg@mail.gmail.com>
 <e06584c2d374e22b742f5ff4db7f17c88c26962e.camel@codeconstruct.com.au>
 <CAMKF1srfUdNC=gxPzeEKZmRK9msT3wEUKJpJfFi8o4i7B5GqSg@mail.gmail.com> <1fad84121fc6874e9ee1374bd87d8f35b5da5ee7.camel@codeconstruct.com.au>
In-Reply-To: <1fad84121fc6874e9ee1374bd87d8f35b5da5ee7.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 22:42:06 -0700
X-Gm-Features: AUfX_myElBbRf1YOCVQkARtqTJrD_mT6eLFjLQ2E5InCuwIyk8wIv9jGSiBGLMI
Message-ID: <CAMKF1spfpykT33acxX0HQCbKpKFuP0M8t=6a_=_J5+N7uZhQiA@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools and
 mctpd into separate recipes
To: James Lee <james@codeconstruct.com.au>
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="0000000000008ef7160658fb49d9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 05:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129036

--0000000000008ef7160658fb49d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 10:22=E2=80=AFPM James Lee <james@codeconstruct.com=
.au>
wrote:

> On Thu, 2026-08-13 at 22:15 -0700, Khem Raj wrote:
> >
> >
> > On Thu, Aug 13, 2026 at 9:53=E2=80=AFPM James Lee
> > <james@codeconstruct.com.au> wrote:
> > > On Thu, 2026-08-13 at 21:45 -0700, Khem Raj wrote:
> > > >
> > > >
> > > > On Thu, Aug 13, 2026 at 9:14=E2=80=AFPM James Lee
> > > > <james@codeconstruct.com.au> wrote:
> > > > > I believe that would work, but think it's important to have a
> > > > > clear
> > > > > split at this point.
> > > > >
> > > > > The mctp utilities and mctpd daemon have different use-cases
> > > > > and
> > > > > dependencies, and do not depend on each other. The split allows
> > > > > users
> > > > > to install the mctp utilities on systemd distros without
> > > > > automatically
> > > > > adding the daemon. It also makes it clear that the mctp package
> > > > > does
> > > > > not depend on systemd or useradd.
> > > > >
> > > >
> > > >
> > > > The output can be packaged to be more granular such that daemon
> > > > goes
> > > > into
> > > > package of its own, would that work ?
> > > >
> > >
> > > I believe that would break the inherit_defer approach?
> > >
> >
> >
> > Cant be sure. Looking forward to you experiment with it :)
> >
>
> To be clear, I have experimented with this approach and didn't find a
> way to detect which packages are being installed with the library
> functions. Splitting into two recipes was the fallback option.
>
> If you know of any way it could be done, the help would be appreciated.
>

OK, then fix the build issues found with distro without systemd eg. poky


>
> > >
> > > > >
> > > > > On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:
> > > > > > Can we do something like
> > > > > > inherit_defer ${@bb.utils.contains('DISTRO_FEATURES',
> > > > > > 'systemd',
> > > > > > 'useradd', '', d)}
> > > > > >
> > > > > > On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via
> > > > > > lists.openembedded.org
> > > > > > <james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:
> > > > > > > The current mctp recipe relies on the upstream's
> > > > > > > conditional
> > > > > > > build
> > > > > > > and
> > > > > > > install of the mctpd binary if systemd is present, only
> > > > > > > building
> > > > > > > the
> > > > > > > mctp utility otherwise. Future upstream changes allowing
> > > > > > > running as
> > > > > > > non-root require more control over the build process. We
> > > > > > > will
> > > > > > > need
> > > > > > > to
> > > > > > > add a new system user when mctpd is built.
> > > > > > >
> > > > > > > Adding a user requires inheriting useradd, which assumes at
> > > > > > > least
> > > > > > > one
> > > > > > > user will be created, failing the recipe otherwise.
> > > > > > > Building
> > > > > > > without
> > > > > > > mctpd would then cause the recipe to fail as conditionally
> > > > > > > inheriting
> > > > > > > useradd seems infeasible.
> > > > > > >
> > > > > > > To make useradd available for the new upstream release,
> > > > > > > split
> > > > > > > the
> > > > > > > recipe
> > > > > > > into "mctp" for the utilities and "mctpd" for the daemon,
> > > > > > > isolating
> > > > > > > the
> > > > > > > systemd dependency to "mctpd".
> > > > > > >
> > > > > > > This makes the two parts of the source explicitly
> > > > > > > selectable
> > > > > > > from
> > > > > > > user
> > > > > > > choice, rather than auto-detecting based on the presence of
> > > > > > > systemd. It
> > > > > > > will also let us express the useradd rules only when
> > > > > > > they're
> > > > > > > needed
> > > > > > > for
> > > > > > > the mctpd installation in the upcoming version bump.
> > > > > > >
> > > > > > > Signed-off-by: James Lee james@codeconstruct.com.au
> > > > > > > ---
> > > > > > >  meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
> > > > > > >  .../recipes-support/mctp/mctp_2.5.bb          | 46 ++-----
> > > > > > > ----
> > > > > > > ----
> > > > > > > ----
> > > > > > >  .../recipes-support/mctp/mctpd_2.5.bb         | 28
> > > > > > > +++++++++++
> > > > > > >  3 files changed, 42 insertions(+), 43 deletions(-)
> > > > > > >  create mode 100644 meta-networking/recipes-
> > > > > > > support/mctp/mctp.inc
> > > > > > >  create mode 100644 meta-networking/recipes-
> > > > > > > support/mctp/mctpd_2.5.bb
> > > > > > >
> > > > > > > diff --git a/meta-networking/recipes-support/mctp/mctp.inc
> > > > > > > b/meta-
> > > > > > > networking/recipes-support/mctp/mctp.inc
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..98225cffea
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-networking/recipes-support/mctp/mctp.inc
> > > > > > > @@ -0,0 +1,11 @@
> > > > > > > +HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > > > > > +SECTION =3D "net"
> > > > > > > +LICENSE =3D "GPL-2.0-only"
> > > > > > > +LIC_FILES_CHKSUM =3D
> > > > > > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > > > > > +
> > > > > > > +SRC_URI =3D
> > > > > > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dh
> > > > > > > ttps
> > > > > > > ;tag
> > > > > > > =3Dv${PV}"
> > > > > > > +SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > > > > > +
> > > > > > > +inherit meson pkgconfig
> > > > > > > +
> > > > > > > +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> > > > > > > diff --git a/meta-networking/recipes-
> > > > > > > support/mctp/mctp_2.5.bb
> > > > > > > b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > > > index a8787d3f2b..5811495c66 100644
> > > > > > > --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > > > +++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > > > > > @@ -1,45 +1,5 @@
> > > > > > > -SUMMARY =3D "Management Component Control Protocol
> > > > > > > utilities"
> > > > > > > -HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > > > > > -SECTION =3D "net"
> > > > > > > -LICENSE =3D "GPL-2.0-only"
> > > > > > > +require mctp.inc
> > > > > > >
> > > > > > > -LIC_FILES_CHKSUM =3D
> > > > > > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > > > > > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > > > > > > utilities"
> > > > > > >
> > > > > > > -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > > > > > -
> > > > > > > -SRC_URI =3D
> > > > > > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dh
> > > > > > > ttps
> > > > > > > ;tag
> > > > > > > =3Dv${PV}"
> > > > > > > -
> > > > > > > -
> > > > > > > -inherit meson pkgconfig systemd
> > > > > > > -
> > > > > > > -EXTRA_OEMESON =3D " \
> > > > > > > -    -Dtests=3Dfalse \
> > > > > > > -"
> > > > > > > -
> > > > > > > -PACKAGECONFIG ??=3D " \
> > > > > > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > > > > > -"
> > > > > > > -
> > > > > > > -# mctpd will only be built if pkg-config detects
> > > > > > > libsystemd;
> > > > > > > in
> > > > > > > which case
> > > > > > > -# we'll want to declare the dep and install the service.
> > > > > > > -PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
> > > > > > > -SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > > > > > local.target"
> > > > > > > -SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> > > > > > > -
> > > > > > > -do_install:append () {
> > > > > > > -    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd',
> > > > > > > 'true',
> > > > > > > 'false', d)}; then
> > > > > > > -        install -d ${D}${systemd_system_unitdir}
> > > > > > > -        install -m 0644 ${S}/conf/mctpd.service \
> > > > > > > -
> > > > > > > ${D}${systemd_system_unitdir}/mctpd.service
> > > > > > > -        install -m 0644 ${S}/conf/*.target \
> > > > > > > -                ${D}${systemd_system_unitdir}/
> > > > > > > -        install -d ${D}${datadir}/dbus-1/system.d
> > > > > > > -        install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > > > > > -                ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > > > > > -    fi
> > > > > > > -}
> > > > > > > -
> > > > > > > -FILES:${PN} +=3D " \
> > > > > > > -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> > > > > > > -            '${datadir}/dbus-1/system.d/mctpd.conf', '',
> > > > > > > d)} \
> > > > > > > -"
> > > > > > > +MESON_TARGET =3D "mctp mctp-client"
> > > > > > > diff --git a/meta-networking/recipes-
> > > > > > > support/mctp/mctpd_2.5.bb
> > > > > > > b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > > > > > new file mode 100644
> > > > > > > index 0000000000..f049be646b
> > > > > > > --- /dev/null
> > > > > > > +++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > > > > > @@ -0,0 +1,28 @@
> > > > > > > +require mctp.inc
> > > > > > > +
> > > > > > > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > > > > > > control
> > > > > > > protocol daemon"
> > > > > > > +
> > > > > > > +inherit systemd
> > > > > > > +
> > > > > > > +do_install:append () {
> > > > > > > +    install -d ${D}${systemd_system_unitdir}
> > > > > > > +    install -m 0644 ${S}/conf/mctpd.service \
> > > > > > > +            ${D}${systemd_system_unitdir}/mctpd.service
> > > > > > > +    install -m 0644 ${S}/conf/*.target \
> > > > > > > +            ${D}${systemd_system_unitdir}/
> > > > > > > +    install -d ${D}${datadir}/dbus-1/system.d
> > > > > > > +    install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > > > > > +            ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > > > > > +}
> > > > > > > +
> > > > > > > +SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > > > > > local.target"
> > > > > > > +
> > > > > > > +DEPENDS +=3D "systemd"
> > > > > > > +
> > > > > > > +# Meson adds mctp utility binaries to FILES and
> > > > > > > do_install(),
> > > > > > > which cannot be
> > > > > > > +# overriden by MESON_TARGET. Override FILES and remove
> > > > > > > binaries to
> > > > > > > correct.
> > > > > > > +FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf
> > > > > > > ${sbindir}/mctpd"
> > > > > > > +
> > > > > > > +do_install:append () {
> > > > > > > +    rm -r ${D}${bindir}
> > > > > > > +}
>

--0000000000008ef7160658fb49d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 10:22=E2=80=AFPM James Lee &lt;<a href=3D"mailto:james@codeconstru=
ct.com.au">james@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Thu, 2026-08-13 at 22:15 -0700, Khe=
m Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Thu, Aug 13, 2026 at 9:53=E2=80=AFPM James Lee<br>
&gt; &lt;<a href=3D"mailto:james@codeconstruct.com.au" target=3D"_blank">ja=
mes@codeconstruct.com.au</a>&gt; wrote:<br>
&gt; &gt; On Thu, 2026-08-13 at 21:45 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Thu, Aug 13, 2026 at 9:14=E2=80=AFPM James Lee<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:james@codeconstruct.com.au" target=3D"=
_blank">james@codeconstruct.com.au</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; I believe that would work, but think it&#39;s important=
 to have a<br>
&gt; &gt; &gt; &gt; clear<br>
&gt; &gt; &gt; &gt; split at this point.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The mctp utilities and mctpd daemon have different use-=
cases<br>
&gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; dependencies, and do not depend on each other. The spli=
t allows<br>
&gt; &gt; &gt; &gt; users<br>
&gt; &gt; &gt; &gt; to install the mctp utilities on systemd distros withou=
t<br>
&gt; &gt; &gt; &gt; automatically<br>
&gt; &gt; &gt; &gt; adding the daemon. It also makes it clear that the mctp=
 package<br>
&gt; &gt; &gt; &gt; does<br>
&gt; &gt; &gt; &gt; not depend on systemd or useradd.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The output can be packaged to be more granular such that dae=
mon<br>
&gt; &gt; &gt; goes<br>
&gt; &gt; &gt; into<br>
&gt; &gt; &gt; package of its own, would that work ?<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; I believe that would break the inherit_defer approach?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Cant be sure. Looking forward to you experiment with it :)<br>
&gt; =C2=A0<br>
<br>
To be clear, I have experimented with this approach and didn&#39;t find a<b=
r>
way to detect which packages are being installed with the library<br>
functions. Splitting into two recipes was the fallback option.<br>
<br>
If you know of any way it could be done, the help would be appreciated.<br>=
</blockquote><div><br></div><div>OK, then fix the build issues found with d=
istro without systemd eg. poky=C2=A0</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; &gt; <br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:<br>
&gt; &gt; &gt; &gt; &gt; Can we do something like=C2=A0<br>
&gt; &gt; &gt; &gt; &gt; inherit_defer ${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &#39;systemd&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &#39;useradd&#39;, &#39;&#39;, d)}<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee=
 via<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;james=3D<a href=3D"mailto:codeconstruct.com.au=
@lists.openembedded.org" target=3D"_blank">codeconstruct.com.au@lists.opene=
mbedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; The current mctp recipe relies on the upstrea=
m&#39;s<br>
&gt; &gt; &gt; &gt; &gt; &gt; conditional<br>
&gt; &gt; &gt; &gt; &gt; &gt; build<br>
&gt; &gt; &gt; &gt; &gt; &gt; and<br>
&gt; &gt; &gt; &gt; &gt; &gt; install of the mctpd binary if systemd is pre=
sent, only<br>
&gt; &gt; &gt; &gt; &gt; &gt; building<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; mctp utility otherwise. Future upstream chang=
es allowing<br>
&gt; &gt; &gt; &gt; &gt; &gt; running as<br>
&gt; &gt; &gt; &gt; &gt; &gt; non-root require more control over the build =
process. We<br>
&gt; &gt; &gt; &gt; &gt; &gt; will<br>
&gt; &gt; &gt; &gt; &gt; &gt; need<br>
&gt; &gt; &gt; &gt; &gt; &gt; to<br>
&gt; &gt; &gt; &gt; &gt; &gt; add a new system user when mctpd is built.<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Adding a user requires inheriting useradd, wh=
ich assumes at<br>
&gt; &gt; &gt; &gt; &gt; &gt; least<br>
&gt; &gt; &gt; &gt; &gt; &gt; one<br>
&gt; &gt; &gt; &gt; &gt; &gt; user will be created, failing the recipe othe=
rwise.<br>
&gt; &gt; &gt; &gt; &gt; &gt; Building<br>
&gt; &gt; &gt; &gt; &gt; &gt; without<br>
&gt; &gt; &gt; &gt; &gt; &gt; mctpd would then cause the recipe to fail as =
conditionally<br>
&gt; &gt; &gt; &gt; &gt; &gt; inheriting<br>
&gt; &gt; &gt; &gt; &gt; &gt; useradd seems infeasible.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; To make useradd available for the new upstrea=
m release,<br>
&gt; &gt; &gt; &gt; &gt; &gt; split<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; recipe<br>
&gt; &gt; &gt; &gt; &gt; &gt; into &quot;mctp&quot; for the utilities and &=
quot;mctpd&quot; for the daemon,<br>
&gt; &gt; &gt; &gt; &gt; &gt; isolating<br>
&gt; &gt; &gt; &gt; &gt; &gt; the<br>
&gt; &gt; &gt; &gt; &gt; &gt; systemd dependency to &quot;mctpd&quot;.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; This makes the two parts of the source explic=
itly<br>
&gt; &gt; &gt; &gt; &gt; &gt; selectable<br>
&gt; &gt; &gt; &gt; &gt; &gt; from<br>
&gt; &gt; &gt; &gt; &gt; &gt; user<br>
&gt; &gt; &gt; &gt; &gt; &gt; choice, rather than auto-detecting based on t=
he presence of<br>
&gt; &gt; &gt; &gt; &gt; &gt; systemd. It<br>
&gt; &gt; &gt; &gt; &gt; &gt; will also let us express the useradd rules on=
ly when<br>
&gt; &gt; &gt; &gt; &gt; &gt; they&#39;re<br>
&gt; &gt; &gt; &gt; &gt; &gt; needed<br>
&gt; &gt; &gt; &gt; &gt; &gt; for<br>
&gt; &gt; &gt; &gt; &gt; &gt; the mctpd installation in the upcoming versio=
n bump.<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: James Lee <a href=3D"mailto:ja=
mes@codeconstruct.com.au" target=3D"_blank">james@codeconstruct.com.au</a><=
br>
&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0meta-networking/recipes-support/mctp/mc=
tp.inc | 11 +++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"htt=
p://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 46 ++-----<br>
&gt; &gt; &gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; &gt; &gt; ----<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"htt=
p://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 28<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++++++++++<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A03 files changed, 42 insertions(+), 43 d=
eletions(-)<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0create mode 100644 meta-networking/reci=
pes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; support/mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; =C2=A0create mode 100644 meta-networking/reci=
pes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; support/mctp/<a href=3D"http://mctpd_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-support/=
mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta-<br>
&gt; &gt; &gt; &gt; &gt; &gt; networking/recipes-support/mctp/mctp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 0000000000..98225cffea<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/mc=
tp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.git=
hub.com/CodeConstruct/mctp" rel=3D"noreferrer" target=3D"_blank">http://www=
.github.com/CodeConstruct/mctp</a>&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SECTION =3D &quot;net&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f=
406a29dc61db21&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SRC_URI =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/Code=
Construct/mctp;branch=3Dmain;protocol=3Dh" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dh</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; ttps<br>
&gt; &gt; &gt; &gt; &gt; &gt; ;tag<br>
&gt; &gt; &gt; &gt; &gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad=
917e46652b272&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Dfalse&quot=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; support/mctp/<a href=3D"http://mctp_2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta-networking/recipes-support/mctp/<a hre=
f=3D"http://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</=
a><br>
&gt; &gt; &gt; &gt; &gt; &gt; index a8787d3f2b..5811495c66 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta-networking/recipes-support/mctp/<a=
 href=3D"http://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.=
bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a=
 href=3D"http://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.=
bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -1,45 +1,5 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; -SUMMARY =3D &quot;Management Component Contr=
ol Protocol<br>
&gt; &gt; &gt; &gt; &gt; &gt; utilities&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.git=
hub.com/CodeConstruct/mctp" rel=3D"noreferrer" target=3D"_blank">http://www=
.github.com/CodeConstruct/mctp</a>&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -SECTION =3D &quot;net&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +require mctp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f=
406a29dc61db21&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D &quot;Management Component Trans=
port Protocol (MCTP)<br>
&gt; &gt; &gt; &gt; &gt; &gt; utilities&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; &gt; -SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad=
917e46652b272&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -SRC_URI =3D<br>
&gt; &gt; &gt; &gt; &gt; &gt; &quot;git://<a href=3D"http://github.com/Code=
Construct/mctp;branch=3Dmain;protocol=3Dh" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dh</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; ttps<br>
&gt; &gt; &gt; &gt; &gt; &gt; ;tag<br>
&gt; &gt; &gt; &gt; &gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -inherit meson pkgconfig systemd<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -EXTRA_OEMESON =3D &quot; \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO=
_FEATURES&#39;, &#39;systemd&#39;, d)} \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -# mctpd will only be built if pkg-config det=
ects<br>
&gt; &gt; &gt; &gt; &gt; &gt; libsystemd;<br>
&gt; &gt; &gt; &gt; &gt; &gt; in<br>
&gt; &gt; &gt; &gt; &gt; &gt; which case<br>
&gt; &gt; &gt; &gt; &gt; &gt; -# we&#39;ll want to declare the dep and inst=
all the service.<br>
&gt; &gt; &gt; &gt; &gt; &gt; -PACKAGECONFIG[systemd] =3D &quot;,,systemd,l=
ibsystemd&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.servic=
e mctp.target mctp-<br>
&gt; &gt; &gt; &gt; &gt; &gt; local.target&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enable&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -do_install:append () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;systemd&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &#39;true&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &#39;false&#39;, d)}; then<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}$=
{systemd_system_unitdir}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 =
${S}/conf/mctpd.service \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${D}${systemd_system_unitdir}/mctpd.service<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 =
${S}/conf/*.target \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${D}${systemd_system_unitdir}/<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}$=
{datadir}/dbus-1/system.d<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 =
${S}/conf/mctpd-dbus.conf \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ${D}${datadir}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt; &gt; &gt; &gt; -}<br>
&gt; &gt; &gt; &gt; &gt; &gt; -<br>
&gt; &gt; &gt; &gt; &gt; &gt; -FILES:${PN} +=3D &quot; \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DIST=
RO_FEATURES&#39;, &#39;systemd&#39;, \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#=
39;${datadir}/dbus-1/system.d/mctpd.conf&#39;, &#39;&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; d)} \<br>
&gt; &gt; &gt; &gt; &gt; &gt; -&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +MESON_TARGET =3D &quot;mctp mctp-client&quot=
;<br>
&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta-networking/recipes-<br>
&gt; &gt; &gt; &gt; &gt; &gt; support/mctp/<a href=3D"http://mctpd_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; b/meta-networking/recipes-support/mctp/<a hre=
f=3D"http://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb=
</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; &gt; &gt; &gt; index 0000000000..f049be646b<br>
&gt; &gt; &gt; &gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a=
 href=3D"http://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.=
5.bb</a><br>
&gt; &gt; &gt; &gt; &gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; &gt; &gt; &gt; &gt; +require mctp.inc<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SUMMARY =3D &quot;Management Component Trans=
port Protocol (MCTP)<br>
&gt; &gt; &gt; &gt; &gt; &gt; control<br>
&gt; &gt; &gt; &gt; &gt; &gt; protocol daemon&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +inherit systemd<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +do_install:append () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${systemd_syste=
m_unitdir}<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctp=
d.service \<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
D}${systemd_system_unitdir}/mctpd.service<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.ta=
rget \<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
D}${systemd_system_unitdir}/<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${datadir}/dbus=
-1/system.d<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctp=
d-dbus.conf \<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${=
D}${datadir}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.servic=
e mctp.target mctp-<br>
&gt; &gt; &gt; &gt; &gt; &gt; local.target&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +DEPENDS +=3D &quot;systemd&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# Meson adds mctp utility binaries to FILES =
and<br>
&gt; &gt; &gt; &gt; &gt; &gt; do_install(),<br>
&gt; &gt; &gt; &gt; &gt; &gt; which cannot be<br>
&gt; &gt; &gt; &gt; &gt; &gt; +# overriden by MESON_TARGET. Override FILES =
and remove<br>
&gt; &gt; &gt; &gt; &gt; &gt; binaries to<br>
&gt; &gt; &gt; &gt; &gt; &gt; correct.<br>
&gt; &gt; &gt; &gt; &gt; &gt; +FILES:${PN} =3D &quot;${datadir}/dbus-1/syst=
em.d/mctpd.conf<br>
&gt; &gt; &gt; &gt; &gt; &gt; ${sbindir}/mctpd&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt; &gt; &gt; +do_install:append () {<br>
&gt; &gt; &gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 rm -r ${D}${bindir}<br>
&gt; &gt; &gt; &gt; &gt; &gt; +}<br>
</blockquote></div></div>

--0000000000008ef7160658fb49d9--

