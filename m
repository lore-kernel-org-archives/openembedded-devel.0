Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57326C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 16:26:12 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.12540.1742401570465485405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 09:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GiTTDs7W;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f546cbf71cso3058878b6e.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742401570; x=1743006370; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FboNy/YCgw0OBt1dCfkfrAfuq4xSC3XnhiqAUl72vA=;
        b=GiTTDs7WZpnz6R3ExHrAGSfUIFbfoaDcWKGpdagYg7gLViprOtxr5J11LWJcTpcg10
         Ik05rixh+vDvpH6yic0ud7tPHQP3WPBO4yQWYbpdH6f71rGroZBkoIsay/5SW14RN6qj
         Q/shY3aBve/ir1oli8ociUtECH7JuU8ZovP4tztU7XMMFVmyI3SJj0ZwGiSDdn8MJdWH
         n+GMQadV/pocKQd7/asMbP2yf6kU2VO5VudDw52CyrJfd4iBozIQUQkJGU9c5+KjBKQF
         olJsjxI4i2yd5EOQFH7txOntVOBuZ930dau76jRDehImBqPeUR1BUeBZCOjnxh79RexE
         ENbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742401570; x=1743006370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FboNy/YCgw0OBt1dCfkfrAfuq4xSC3XnhiqAUl72vA=;
        b=kT6YvJhJm0c0HijSGsG1D5RQOKruQeKc8ev+S2oRCjsULdtwRoV8ELj/VdTsiK+zxv
         s+mBtQ+QeSCVSkSQwnIhfx2sFR9nl4M0jZcYwHuirhXqKuoQWjti/QoSMvlYY338L6W7
         OZ/IFWUSrMUJJtK1gz++9/1hSDpVRHvkscA0YNkEDgh5Z8qt5WFUcMT6QLMmJqKYEVU9
         rqVteowg+bVI2zg7nrwZovHVGodDYCnJ0d+WLCFRq2HDYWGRNvHE4oKvnKdyhMNbXWBl
         xm0XEJAXTr0gfAlXFvM0fHkilZ8GYCy/Eebey1kEDZxeiNdoj+Ku8feZN+g+ksGb0iJi
         gD3g==
X-Gm-Message-State: AOJu0YzOuH8iHqScfMOmMg04hXRsmvfqvtw3oUwMLC6PTRDINw0WgcaS
	DLcT9B4M7R6OsEl+BLj0hJr8fbAFDY5VjvgQNCGeS99ICkzj4QDJciEZ9sMgEoCWWgNIsMfSL/P
	s/IMQL4ddGlF4C2VF0rsOk2/pQsFZC3Ms
X-Gm-Gg: ASbGnct5MRkI1PXWI+f8/pdQRJ4B0DwyLKTVR0GE67pJ8FU3y+v7WzDuM9y1Ld98l4z
	jGDM4sF1R7w01uM+1EnBCzOQdYPBt5IhXFGUAYDQsbbamsoiCUVlH6Mp9eVfoAevrSdEfEWzA75
	X4B0pZ4GKdaOiwmrGsEEZxPoy9
X-Google-Smtp-Source: AGHT+IFDjfY9G1Ys16VuRageZUDc3Lkyu3lBPGNebZsdmnETyGDE+tLX1yk4H2WV+Dr6AsHVQmW8Upl0aB6Z8gTa5iQ=
X-Received: by 2002:a05:6808:2023:b0:3f6:a6a8:d340 with SMTP id
 5614622812f47-3feb499a9cbmr62395b6e.16.1742401569680; Wed, 19 Mar 2025
 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250319120836.982987-1-ross.burton@arm.com> <20250319120836.982987-5-ross.burton@arm.com>
 <E3F126EB-D3D8-476C-9C8A-B06B7FCF13EF@arm.com>
In-Reply-To: <E3F126EB-D3D8-476C-9C8A-B06B7FCF13EF@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Mar 2025 09:25:42 -0700
X-Gm-Features: AQ5f1Jot0KLEjKJ1zIrgYlupHr0_RUim6FHoDNO7-3IZb9Nqu70IpPdMLwxlnbA
Message-ID: <CAMKF1spLKG79YcSmEvfyd2KwLgtpb=rwYGm_ufYdNkc0sUwDuw@mail.gmail.com>
Subject: Re: [oe] [PATCH 5/9] miniupnpd: don't inherit autotools
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 16:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116080

On Wed, Mar 19, 2025 at 9:23=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> Retracting this one, I broke it.  I=E2=80=99ll resend it shortly.
>

Infact I have a fix for it already in master-next so dont worry about it

> Ross
>
> > On 19 Mar 2025, at 12:08, Ross Burton via lists.openembedded.org <ross.=
burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > This upstream does not in fact use autotools
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20191006.bb | 5 ++---
> > 1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2=
.1.20191006.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2=
.1.20191006.bb
> > index 1c2f030f83..5c0086f8f4 100644
> > --- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.2019=
1006.bb
> > +++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.2019=
1006.bb
> > @@ -7,7 +7,7 @@ SECTION =3D "networking"
> > LICENSE =3D "BSD-3-Clause"
> > LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da1ed15843ce66639bcf9f109cf24=
7870"
> >
> > -inherit autotools gettext pkgconfig systemd
> > +inherit gettext pkgconfig systemd
> >
> > DEPENDS +=3D "iptables net-tools util-linux libmnl libnetfilter-conntra=
ck"
> >
> > @@ -20,12 +20,11 @@ SRC_URI[sha256sum] =3D "218fad7af31f3c22fb4c9db28a5=
5a2a8b5067d41f5b38f52008a057a00
> >
> > IPV6 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '',=
 d)}"
> >
> > -do_configure:prepend() {
> > +do_configure() {
> >    echo "${@d.getVar('DISTRO_VERSION')}" > ${S}/os.openembedded
> > }
> >
> > do_compile() {
> > -    cd ${S}
> >     CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Ma=
kefile.linux config.h
> >     CONFIG_OPTIONS=3D"${IPV6} --leasefile --vendorcfg" oe_runmake -f Ma=
kefile.linux
> > }
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#116072): https://lists.openembedded.org/g/openembed=
ded-devel/message/116072
> > Mute This Topic: https://lists.openembedded.org/mt/111787465/6875888
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

