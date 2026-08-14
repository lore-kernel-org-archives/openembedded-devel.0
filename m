Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D35C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 04:46:15 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6419.1786682769969414288
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 21:46:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=okGOJ2c+;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66c67a73eb7so1450769d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 21:46:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786682769; cv=none;
        d=google.com; s=arc-20260327;
        b=en7oLjodgf9Zgo9nF1NH3C5Qvw3f7G6L7c8jKh/jTpczaXhPSQTvDSxW93ATec1cDT
         edahwmKab/uSYhtOM0DDZ4eJQfPbhM+GjriAhU/5xYQp5NsY2IZjMYMXbAoEKZWKnucI
         6hSvtA/ELYjGWH+dpD0srWtG0EgWvXU8EJ2a8IY3GeVJsLdgFS4fW74KmEwqXLZKjPkD
         ySOk0Uf6kZFaH6eEQH7ccsKMduAm+x+DMOHv5t+nsBLsTkt/7M5a+kaLlG85h2ltY3EP
         LXnDwTUOhBtrTzo1KuSnCckshu0ugj8udQ1AbppJDdnbqqUiEHkiwihMD8/8HIJ99RoT
         DGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6xoFw/93cC55v839/PQDMh7WSGIzXqapHetILoR0H5I=;
        fh=gTQrVd3LoRZ1ifWc8SCx5FEsS+o1KCs/ul0L9U0HRGQ=;
        b=shxkmgKdfjVFvAAHaiEl3PxjfXo7sKuoMFg92IH/GPeBFSYTejDV6IgyMaEveWfsyh
         R1Df2EN1ckkxUPybFjrlYVGm6Zyj0DWF+eNGCPh1S+3W6GvXwKNiDY2V+0o25AIMDec2
         Kakk+zxAp2VVHwsn78eQ823ql/WlecS90uSc7LRc+A/wFvO1wNW3hLaHikrata7VLMsc
         dpR+Ub/sI7RxYrGiHwudFXo12KUi0WTMgCVROyu/1zGIdS5+clfd/jU4Bo6jiddNVMAZ
         mLQxgSNpmGuGRnNbCKq5RWpCiyNC2xlyB1J486BDplraSkYl3xiGoKsePJDEgoNLQF41
         HiIg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786682769; x=1787287569; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6xoFw/93cC55v839/PQDMh7WSGIzXqapHetILoR0H5I=;
        b=okGOJ2c+chjTGoLiVhZUPBvdcxas5wvt1iYfmJQ6fSmq8Ytk4B79yqM3BMvearVbWc
         W1NSz6yv+2zZgT3zSIDFfhsthhogYP4LR+zvPd9+3UUhcAjXecq+NenZRIFgehXmi4lt
         icA1icjCt7jW51KI4BZhswjKW0sO1Zez5hWFCCRQiqmWaYwpROWjxwaw9ds4anogLSuq
         yOu3BUJm9s+ZDdi0ryBB3CmVLkmztNnwLMGzB5cuDPO4rZ5gw9PV3qlzamHEMfAGRn6z
         O1gWh8v2gbUHyh1HNaXpn0DI3SaoXNU107Z3B8Bgp+5LnRUz9hZ1cgG0rqrkB49QIfT7
         SdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786682769; x=1787287569;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6xoFw/93cC55v839/PQDMh7WSGIzXqapHetILoR0H5I=;
        b=cCJkLq39QcPQra9hlG3SkIcuWBGFXCxQELK4P0ewUCz7JvlbyRPRlqlj0kttMzfs9/
         kqaZDVmSTC4BpH1F6celg9ICyvGYmgLfgdxTrMKbzYKfnFBUregg01oyFNNujxqnDUWC
         gSDkKgoYmNQWYvHjMnspscJsFnL2sBh8A3ZJj2fN+nve1s81pB/JJR6ArUzkS0gSMD8G
         pq1cnhb/sjGDlYRN1FjwMQkDe/x4Z8deSzw6rdy8dDV245KvFcqpvI9FwXOE1TT1I2cY
         NW+MnWvyKWemkNSq/iSeARyi++GbsHDqYzE3R40NwT4yZ7+/JRRKIBGKN69U0ddZazZs
         PVFw==
X-Gm-Message-State: AOJu0YxuA8eLemBlaGuiFGPSmG3+O/az4yjAigdfZDod/0YHUD5ngiNf
	/kIeU+FniDh65mwedRsYxiyKQjlfYlzgGhEUDbJ9ZHKuyzG3NaKyoxO1x3d4vcFhPT94XMSuFRL
	ut12kBgsywq1wzevdJ76oTbb1vpxK1Rg=
X-Gm-Gg: AR+sD11KKC8cNeWOJFmR7FKmasKMn/rdeGYQFNCub0rfLXK0YU7AhCwuQS+9ajsIvsX
	rwEhQOX9FZsLUFcApmPQHiDauTjSnqG3gAiKuCWc/z0jMVkGAxz7RXoBUK7AkHAXiieco3C/7gh
	ev90Qpzgo2fTyw6iVFtbYlc400MGQ/QYcHhpYIR12CA1f/UfL1OVZ2mIruqWStAvdYd+nB/xeDW
	5yJiUD7fpSEd7OvMIqxadGi99rBSeT5hlqLEDm1B69ISZn4Lfy6YTNkHJEQms39u9liMRaasxBX
	lVdwqN/gkdiTnMuP63kk/AkP2+pTSJZZen1Q4bTKLEFqeNE+vqesW2NhsTsbFQnhN6cU0IXBqlu
	ipeliqqQz/9HZ5bKRV5caDA5FTMDEWeDNHJNU9+YIyGxPaAQwN4gNKbtSfc49ytjY758b9u3odZ
	Rn9zZCQfziLjegTXkSo9WLeOQ+9r99WFMvPE2L77d0bPQqLxeCH1N3b9dUNdv22OXB6ghAob96I
	lA12TLsQyWz3w==
X-Received: by 2002:a05:690c:d87:b0:833:4ca4:f3a6 with SMTP id
 00721157ae682-837128cdc96mr13921997b3.13.1786682768887; Thu, 13 Aug 2026
 21:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072523.3463118-1-james@codeconstruct.com.au>
 <CAMKF1srwt1jwqqCsvqOuO+2BpZsADa7N0R7Sz10HOctHaiCsUg@mail.gmail.com> <b921cfd80b988672d5f0b03731e19a8f12f8acba.camel@codeconstruct.com.au>
In-Reply-To: <b921cfd80b988672d5f0b03731e19a8f12f8acba.camel@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 21:45:41 -0700
X-Gm-Features: AUfX_mxilHRGJdNaHZ-COeNB-ERUAdkIxODM2tAnGi5eIjN8FRF9tSVnSjYE5tU
Message-ID: <CAMKF1sqKEhVdUExdeUEQSft5SSixeh2-F+1S06SFgkZDrFWgpg@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH v2 1/2] mctp: split mctp tools and
 mctpd into separate recipes
To: James Lee <james@codeconstruct.com.au>
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="000000000000c413490658fa7fcc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 04:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129032

--000000000000c413490658fa7fcc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 9:14=E2=80=AFPM James Lee <james@codeconstruct.com.=
au>
wrote:

> I believe that would work, but think it's important to have a clear
> split at this point.
>
> The mctp utilities and mctpd daemon have different use-cases and
> dependencies, and do not depend on each other. The split allows users
> to install the mctp utilities on systemd distros without automatically
> adding the daemon. It also makes it clear that the mctp package does
> not depend on systemd or useradd.
>

The output can be packaged to be more granular such that daemon goes into
package of its own, would that work ?


>
> On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:
> > Can we do something like
> > inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> > 'useradd', '', d)}
> >
> > On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via lists.openembedd=
ed.org
> > <james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:
> > > The current mctp recipe relies on the upstream's conditional build
> > > and
> > > install of the mctpd binary if systemd is present, only building
> > > the
> > > mctp utility otherwise. Future upstream changes allowing running as
> > > non-root require more control over the build process. We will need
> > > to
> > > add a new system user when mctpd is built.
> > >
> > > Adding a user requires inheriting useradd, which assumes at least
> > > one
> > > user will be created, failing the recipe otherwise. Building
> > > without
> > > mctpd would then cause the recipe to fail as conditionally
> > > inheriting
> > > useradd seems infeasible.
> > >
> > > To make useradd available for the new upstream release, split the
> > > recipe
> > > into "mctp" for the utilities and "mctpd" for the daemon, isolating
> > > the
> > > systemd dependency to "mctpd".
> > >
> > > This makes the two parts of the source explicitly selectable from
> > > user
> > > choice, rather than auto-detecting based on the presence of
> > > systemd. It
> > > will also let us express the useradd rules only when they're needed
> > > for
> > > the mctpd installation in the upcoming version bump.
> > >
> > > Signed-off-by: James Lee james@codeconstruct.com.au
> > > ---
> > >  meta-networking/recipes-support/mctp/mctp.inc | 11 +++++
> > >  .../recipes-support/mctp/mctp_2.5.bb          | 46 ++-------------
> > > ----
> > >  .../recipes-support/mctp/mctpd_2.5.bb         | 28 +++++++++++
> > >  3 files changed, 42 insertions(+), 43 deletions(-)
> > >  create mode 100644 meta-networking/recipes-support/mctp/mctp.inc
> > >  create mode 100644 meta-networking/recipes-
> > > support/mctp/mctpd_2.5.bb
> > >
> > > diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-
> > > networking/recipes-support/mctp/mctp.inc
> > > new file mode 100644
> > > index 0000000000..98225cffea
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/mctp/mctp.inc
> > > @@ -0,0 +1,11 @@
> > > +HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > +SECTION =3D "net"
> > > +LICENSE =3D "GPL-2.0-only"
> > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > +
> > > +SRC_URI =3D
> > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;t=
ag
> > > =3Dv${PV}"
> > > +SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > +
> > > +inherit meson pkgconfig
> > > +
> > > +EXTRA_OEMESON =3D "-Dtests=3Dfalse"
> > > diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > index a8787d3f2b..5811495c66 100644
> > > --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > +++ b/meta-networking/recipes-support/mctp/mctp_2.5.bb
> > > @@ -1,45 +1,5 @@
> > > -SUMMARY =3D "Management Component Control Protocol utilities"
> > > -HOMEPAGE =3D "http://www.github.com/CodeConstruct/mctp"
> > > -SECTION =3D "net"
> > > -LICENSE =3D "GPL-2.0-only"
> > > +require mctp.inc
> > >
> > > -LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21"
> > > +SUMMARY =3D "Management Component Transport Protocol (MCTP)
> > > utilities"
> > >
> > > -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> > > -
> > > -SRC_URI =3D
> > > "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;t=
ag
> > > =3Dv${PV}"
> > > -
> > > -
> > > -inherit meson pkgconfig systemd
> > > -
> > > -EXTRA_OEMESON =3D " \
> > > -    -Dtests=3Dfalse \
> > > -"
> > > -
> > > -PACKAGECONFIG ??=3D " \
> > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > > -"
> > > -
> > > -# mctpd will only be built if pkg-config detects libsystemd; in
> > > which case
> > > -# we'll want to declare the dep and install the service.
> > > -PACKAGECONFIG[systemd] =3D ",,systemd,libsystemd"
> > > -SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > local.target"
> > > -SYSTEMD_AUTO_ENABLE:${PN} =3D "enable"
> > > -
> > > -do_install:append () {
> > > -    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true',
> > > 'false', d)}; then
> > > -        install -d ${D}${systemd_system_unitdir}
> > > -        install -m 0644 ${S}/conf/mctpd.service \
> > > -                ${D}${systemd_system_unitdir}/mctpd.service
> > > -        install -m 0644 ${S}/conf/*.target \
> > > -                ${D}${systemd_system_unitdir}/
> > > -        install -d ${D}${datadir}/dbus-1/system.d
> > > -        install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > -                ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > -    fi
> > > -}
> > > -
> > > -FILES:${PN} +=3D " \
> > > -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
> > > -            '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> > > -"
> > > +MESON_TARGET =3D "mctp mctp-client"
> > > diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > new file mode 100644
> > > index 0000000000..f049be646b
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> > > @@ -0,0 +1,28 @@
> > > +require mctp.inc
> > > +
> > > +SUMMARY =3D "Management Component Transport Protocol (MCTP) control
> > > protocol daemon"
> > > +
> > > +inherit systemd
> > > +
> > > +do_install:append () {
> > > +    install -d ${D}${systemd_system_unitdir}
> > > +    install -m 0644 ${S}/conf/mctpd.service \
> > > +            ${D}${systemd_system_unitdir}/mctpd.service
> > > +    install -m 0644 ${S}/conf/*.target \
> > > +            ${D}${systemd_system_unitdir}/
> > > +    install -d ${D}${datadir}/dbus-1/system.d
> > > +    install -m 0644 ${S}/conf/mctpd-dbus.conf \
> > > +            ${D}${datadir}/dbus-1/system.d/mctpd.conf
> > > +}
> > > +
> > > +SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-
> > > local.target"
> > > +
> > > +DEPENDS +=3D "systemd"
> > > +
> > > +# Meson adds mctp utility binaries to FILES and do_install(),
> > > which cannot be
> > > +# overriden by MESON_TARGET. Override FILES and remove binaries to
> > > correct.
> > > +FILES:${PN} =3D "${datadir}/dbus-1/system.d/mctpd.conf
> > > ${sbindir}/mctpd"
> > > +
> > > +do_install:append () {
> > > +    rm -r ${D}${bindir}
> > > +}
>

--000000000000c413490658fa7fcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 13,=
 2026 at 9:14=E2=80=AFPM James Lee &lt;<a href=3D"mailto:james@codeconstruc=
t.com.au">james@codeconstruct.com.au</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">I believe that would work, but think it=
&#39;s important to have a clear<br>
split at this point.<br>
<br>
The mctp utilities and mctpd daemon have different use-cases and<br>
dependencies, and do not depend on each other. The split allows users<br>
to install the mctp utilities on systemd distros without automatically<br>
adding the daemon. It also makes it clear that the mctp package does<br>
not depend on systemd or useradd.<br></blockquote><div><br></div><div>The o=
utput can be packaged to be more granular such that daemon goes into</div><=
div>package of its own, would that work ?</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
On Thu, 2026-08-13 at 06:53 -0700, Khem Raj wrote:<br>
&gt; Can we do something like=C2=A0<br>
&gt; inherit_defer ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sys=
temd&#39;,<br>
&gt; &#39;useradd&#39;, &#39;&#39;, d)}<br>
&gt; <br>
&gt; On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a><br>
&gt; &lt;james=3D<a href=3D"mailto:codeconstruct.com.au@lists.openembedded.=
org" target=3D"_blank">codeconstruct.com.au@lists.openembedded.org</a>&gt; =
wrote:<br>
&gt; &gt; The current mctp recipe relies on the upstream&#39;s conditional =
build<br>
&gt; &gt; and<br>
&gt; &gt; install of the mctpd binary if systemd is present, only building<=
br>
&gt; &gt; the<br>
&gt; &gt; mctp utility otherwise. Future upstream changes allowing running =
as<br>
&gt; &gt; non-root require more control over the build process. We will nee=
d<br>
&gt; &gt; to<br>
&gt; &gt; add a new system user when mctpd is built.<br>
&gt; &gt; <br>
&gt; &gt; Adding a user requires inheriting useradd, which assumes at least=
<br>
&gt; &gt; one<br>
&gt; &gt; user will be created, failing the recipe otherwise. Building<br>
&gt; &gt; without<br>
&gt; &gt; mctpd would then cause the recipe to fail as conditionally<br>
&gt; &gt; inheriting<br>
&gt; &gt; useradd seems infeasible.<br>
&gt; &gt; <br>
&gt; &gt; To make useradd available for the new upstream release, split the=
<br>
&gt; &gt; recipe<br>
&gt; &gt; into &quot;mctp&quot; for the utilities and &quot;mctpd&quot; for=
 the daemon, isolating<br>
&gt; &gt; the<br>
&gt; &gt; systemd dependency to &quot;mctpd&quot;.<br>
&gt; &gt; <br>
&gt; &gt; This makes the two parts of the source explicitly selectable from=
<br>
&gt; &gt; user<br>
&gt; &gt; choice, rather than auto-detecting based on the presence of<br>
&gt; &gt; systemd. It<br>
&gt; &gt; will also let us express the useradd rules only when they&#39;re =
needed<br>
&gt; &gt; for<br>
&gt; &gt; the mctpd installation in the upcoming version bump.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: James Lee <a href=3D"mailto:james@codeconstruct.co=
m.au" target=3D"_blank">james@codeconstruct.com.au</a><br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta-networking/recipes-support/mctp/mctp.inc | 11 +++++<br=
>
&gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" rel=
=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 46 ++-------------<br>
&gt; &gt; ----<br>
&gt; &gt; =C2=A0.../recipes-support/mctp/<a href=3D"http://mctpd_2.5.bb" re=
l=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 28 +++++++++++<br>
&gt; &gt; =C2=A03 files changed, 42 insertions(+), 43 deletions(-)<br>
&gt; &gt; =C2=A0create mode 100644 meta-networking/recipes-support/mctp/mct=
p.inc<br>
&gt; &gt; =C2=A0create mode 100644 meta-networking/recipes-<br>
&gt; &gt; support/mctp/<a href=3D"http://mctpd_2.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta=
-<br>
&gt; &gt; networking/recipes-support/mctp/mctp.inc<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..98225cffea<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-networking/recipes-support/mctp/mctp.inc<br>
&gt; &gt; @@ -0,0 +1,11 @@<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/CodeConstruc=
t/mctp" rel=3D"noreferrer" target=3D"_blank">http://www.github.com/CodeCons=
truct/mctp</a>&quot;<br>
&gt; &gt; +SECTION =3D &quot;net&quot;<br>
&gt; &gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21&quot;=
<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D<br>
&gt; &gt; &quot;git://<a href=3D"http://github.com/CodeConstruct/mctp;branc=
h=3Dmain;protocol=3Dhttps;tag" rel=3D"noreferrer" target=3D"_blank">github.=
com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag</a><br>
&gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; +SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson pkgconfig<br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMESON =3D &quot;-Dtests=3Dfalse&quot;<br>
&gt; &gt; diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http=
://mctp_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; b/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5=
.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; index a8787d3f2b..5811495c66 100644<br>
&gt; &gt; --- a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp=
_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctp=
_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
&gt; &gt; @@ -1,45 +1,5 @@<br>
&gt; &gt; -SUMMARY =3D &quot;Management Component Control Protocol utilitie=
s&quot;<br>
&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"http://www.github.com/CodeConstruc=
t/mctp" rel=3D"noreferrer" target=3D"_blank">http://www.github.com/CodeCons=
truct/mctp</a>&quot;<br>
&gt; &gt; -SECTION =3D &quot;net&quot;<br>
&gt; &gt; -LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt; &gt; +require mctp.inc<br>
&gt; &gt; <br>
&gt; &gt; -LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61db21&quot;=
<br>
&gt; &gt; +SUMMARY =3D &quot;Management Component Transport Protocol (MCTP)=
<br>
&gt; &gt; utilities&quot;<br>
&gt; &gt; <br>
&gt; &gt; -SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<=
br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI =3D<br>
&gt; &gt; &quot;git://<a href=3D"http://github.com/CodeConstruct/mctp;branc=
h=3Dmain;protocol=3Dhttps;tag" rel=3D"noreferrer" target=3D"_blank">github.=
com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag</a><br>
&gt; &gt; =3Dv${PV}&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -<br>
&gt; &gt; -inherit meson pkgconfig systemd<br>
&gt; &gt; -<br>
&gt; &gt; -EXTRA_OEMESON =3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;systemd&#39;, d)} \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -# mctpd will only be built if pkg-config detects libsystemd; in<=
br>
&gt; &gt; which case<br>
&gt; &gt; -# we&#39;ll want to declare the dep and install the service.<br>
&gt; &gt; -PACKAGECONFIG[systemd] =3D &quot;,,systemd,libsystemd&quot;<br>
&gt; &gt; -SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.target mctp-<=
br>
&gt; &gt; local.target&quot;<br>
&gt; &gt; -SYSTEMD_AUTO_ENABLE:${PN} =3D &quot;enable&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -do_install:append () {<br>
&gt; &gt; -=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;systemd&#39;, &#39;true&#39;,<br>
&gt; &gt; &#39;false&#39;, d)}; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unit=
dir}<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.serv=
ice \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sy=
stemd_system_unitdir}/mctpd.service<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sy=
stemd_system_unitdir}/<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/sys=
tem.d<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus=
.conf \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${da=
tadir}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; -=C2=A0 =C2=A0 fi<br>
&gt; &gt; -}<br>
&gt; &gt; -<br>
&gt; &gt; -FILES:${PN} +=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;${datadir}/dbus-1=
/system.d/mctpd.conf&#39;, &#39;&#39;, d)} \<br>
&gt; &gt; -&quot;<br>
&gt; &gt; +MESON_TARGET =3D &quot;mctp mctp-client&quot;<br>
&gt; &gt; diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http=
://mctpd_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; b/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..f049be646b<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctp=
d_2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
&gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; +require mctp.inc<br>
&gt; &gt; +<br>
&gt; &gt; +SUMMARY =3D &quot;Management Component Transport Protocol (MCTP)=
 control<br>
&gt; &gt; protocol daemon&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit systemd<br>
&gt; &gt; +<br>
&gt; &gt; +do_install:append () {<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd.service \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_u=
nitdir}/mctpd.service<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/*.target \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${systemd_system_u=
nitdir}/<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}${datadir}/dbus-1/system.d<br>
&gt; &gt; +=C2=A0 =C2=A0 install -m 0644 ${S}/conf/mctpd-dbus.conf \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${datadir}/dbus-1/=
system.d/mctpd.conf<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.target mctp-<=
br>
&gt; &gt; local.target&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;systemd&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# Meson adds mctp utility binaries to FILES and do_install(),<br=
>
&gt; &gt; which cannot be<br>
&gt; &gt; +# overriden by MESON_TARGET. Override FILES and remove binaries =
to<br>
&gt; &gt; correct.<br>
&gt; &gt; +FILES:${PN} =3D &quot;${datadir}/dbus-1/system.d/mctpd.conf<br>
&gt; &gt; ${sbindir}/mctpd&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install:append () {<br>
&gt; &gt; +=C2=A0 =C2=A0 rm -r ${D}${bindir}<br>
&gt; &gt; +}<br>
</blockquote></div></div>

--000000000000c413490658fa7fcc--

