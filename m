Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F265C0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 17:28:37 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.14431.1737826115080025918
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jan 2025 09:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a74xn91z;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2b1e12fb032so1251158fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 09:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737826114; x=1738430914; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR6ZsjVs817wM9JHpF5S/7gr9LRHk8Gbz+lNN8KH9oI=;
        b=a74xn91ztf7xohgcBi4xGE8JQHb/UiJVZkM/5cvqxrY3UcKEXfget9fqfcMy0SiMxy
         CpcBLMsWwbPapm37IUHKVPAsOA2qwIr2FnUZP+0/rof6qIahHqGHcWF7TQrszWFzEXgI
         MNoxIny/Iqcop6HLwLyEKzlLt+euaAQaujhPhBVQRzEXkGuSPNnqZVCCyNFFol7kHbA+
         PAb8F9kuIBmCRLSaZJfO1oUYsIZQfVnrsdEA88h7eTxY2rUAQ69x1V0FpyntSsh+ORrL
         hcAJTyLyd80cj7mvXY3j9n8DO78AUy87KLHTrtKDpdy6dC6DHO+V686MQ9n3568l4rt4
         7sVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737826114; x=1738430914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YR6ZsjVs817wM9JHpF5S/7gr9LRHk8Gbz+lNN8KH9oI=;
        b=VNJHwh53gMJNhrDAvh+4DnlbjIynduLQF9iqOWdlh3OKOJuszl8FfpdB4kauPh7ZTB
         69mggTJyI0fGwnhMXf6so24VOBnA3ilRIj7NT7N9KnLbhdwf/miU8Sd9QIlqN2xwCDeM
         HqCbOglLC8be766evr4E5fB62o+RVpKnywRcR2WYnsC+l6p6b/boo4KEf9CYm8xDbWq/
         U9haqq1Hd8UowVpKdvR/nFyV1qmBU2ZSd2nwDEF/Nu4xN0vdcPwpwS3j1eLIITR1BRgH
         s14dnrofGfKwf2oKxstkO5OXCTauoTunF9qnGptJ1maN121Lcz4n64u39sEwQeMT2G9z
         UWDA==
X-Gm-Message-State: AOJu0YwOS+N1fCqO3ynRvD8UEeT4Jj759KS4wC2IEIyWblLyB+hBEaSn
	JU7ha24doyZQ/xO7SBwIGiNNYFcsyWwhIWd/mkveYlSR56I9IPvw4qc6smuITaMRDlwtOUSIdiK
	QL2fzJ/BXHHoMtte8Fydz4sLBsXg=
X-Gm-Gg: ASbGncvPEGCqRh+VBwOsAiriDIzLTc/RdQdmhEQYCu2ApR3qkHpBF9f81ygDSCkStAJ
	p5H5QRqe9IBbLXMfRSBhgM9Gnveu3C+OyyOJUY3WONTvBLywn4TmJ7b5ZU852ZfNv5HI8O9ALk1
	ly
X-Google-Smtp-Source: AGHT+IHzD7JhQ50dRdZAxXErLW7NfLxhPD0SHVdr5EDIeIzpNvkQ3/pN7/SB92U59nkXMzZORHdpslMZml6DUJ1/jF0=
X-Received: by 2002:a05:6871:53cb:b0:29e:2bbd:51ba with SMTP id
 586e51a60fabf-2b1c0a1c13fmr19773547fac.9.1737826114311; Sat, 25 Jan 2025
 09:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20250125115543.7605-1-gavrosc.ref@yahoo.com> <20250125115543.7605-1-gavrosc@yahoo.com>
 <CAMKF1sosNH_RSMMdquqOth8fEkW7ySanb918bqBp_pTOtkoYzw@mail.gmail.com>
In-Reply-To: <CAMKF1sosNH_RSMMdquqOth8fEkW7ySanb918bqBp_pTOtkoYzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Jan 2025 09:28:07 -0800
X-Gm-Features: AWEUYZnrQxz5n6JTZwKNJ-C_vIn_8HVCUEcShf4AsennwR8EJySbfzUkA3icEao
Message-ID: <CAMKF1spe-VU4n1YbHjRt_DGtkCpcdybEiPbKvG5awubHHa+WXQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp-native: dependency with libpci
To: gavrosc@yahoo.com
Cc: openembedded-devel@lists.openembedded.org, yoann.congal@smile.fr, 
	randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Jan 2025 17:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115082

On Sat, Jan 25, 2025 at 9:07=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> if its a build time issue then shouldn't it be added to DEPENDS ?
>
> On Sat, Jan 25, 2025 at 3:56=E2=80=AFAM Christos Gavros via
> lists.openembedded.org <gavrosc=3Dyahoo.com@lists.openembedded.org>
> wrote:
> >
> > Building of net-snmp-native aborted due to
> > missing dependency with libpci-native.
> > Fixed by changing the name to 'libpciaccess'
> > which is recipe's name
> >
> > Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
> > ---
> >  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.=
bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> > index 06decbe852..cde1c1dfe8 100644
> > --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> > +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> > @@ -268,7 +268,7 @@ RDEPENDS:${PN}-server-snmpd +=3D "net-snmp-mibs"
> >  RDEPENDS:${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd ${PN}-lib-=
trapd"
> >  RDEPENDS:${PN}-server +=3D "net-snmp-server-snmpd net-snmp-server-snmp=
trapd"
> >  RDEPENDS:${PN}-client +=3D "net-snmp-mibs net-snmp-libs"
> > -RDEPENDS:${PN}-libs +=3D "libpci \
> > +RDEPENDS:${PN}-libs +=3D "libpciaccess \

looking further, libpci is a package built by pciutils recipe and its
added to DEPENDS here but only
for target recipe.  if we know this is not needed for native version
then we should mark the rdepends
for target too. So remove it from RDEPENDS:${PN}-libs  and Add
something like this

RDEPENDS:append:${PN}-libs:class-target =3D " libpci"

> >                          ${PN}-lib-netsnmp \
> >                          ${PN}-lib-agent \
> >                          ${PN}-lib-helpers \
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115077): https://lists.openembedded.org/g/openembed=
ded-devel/message/115077
> > Mute This Topic: https://lists.openembedded.org/mt/110805858/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

