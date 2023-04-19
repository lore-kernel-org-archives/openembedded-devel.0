Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094E7C77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 16:38:21 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.43206.1681922300390692422
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Apr 2023 09:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NQjNvwa1;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-18777914805so10700030fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 09:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681922299; x=1684514299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KdODpN3ruvkChLHrfgT6IvBR2KiFaGL4ZPcv5p9sM8=;
        b=NQjNvwa1Jg8RfYfmdb5EKmYFzh/kyIMeGcn0ee1ekCYVO/9uT1Q8S4OYdJ+X+WZmHW
         aIpJF5aSIqleP/PG7PDrNscFgbTRlAdHQcwQSJHBdFMi20vHgI3NsI5bzuYvbgv+f/aj
         cDEGPvqzASFBnc4y5Nj++rKxCQ0vgDoxYq3DMXx4gF8YrbSwFR4B0nIkENywsIACC9YU
         BeECDfgX86rULho3PzVxbk2kdJ/DAvG/AuQb6fq6QbYt24j/xyinNjeCXjARsGfQR5Sv
         Bxlq1VrnnRNr4bzXxxoWL5rGnxReCxRICFa4vEFFeRnfoaDltjDS1izA3om1r1Sb+pkU
         /eUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922299; x=1684514299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KdODpN3ruvkChLHrfgT6IvBR2KiFaGL4ZPcv5p9sM8=;
        b=OdMuLn4OU+y5Wgdhk7XY9zxE+kHjXL4YA9rKqfP118tKXiWHPDKeFG+F/ab1JQe3Ro
         uzzFlNuup0to0leH6MElIAuPnD/dvIV4M7NwU2+d08pqkIZIHoYn4H1+t9r/aFLOMF6g
         2abAVzynNrmdPrz71eapfg3oSkygTIh88zb+KvyBxqyfOlBJ6VjSzSauf+wlozoiiM8s
         OBPpUwWFEfUc4wvzysprcV9MG68XIogI7s04hDWKOVXdiVcZPP3Sjn/BmbIxmb/1CqIe
         I3OoaBFvDnxRVqm+FT0S7mqMcvTPnfePxNZ7exWt5GQq+Uv0gqqjPRc8j3M8h2nhkky4
         rEuw==
X-Gm-Message-State: AAQBX9dsp84UJq6NStK/c0MV5lKG9tazwFPRTFKggeIjR0VAWMO4OMZ7
	zIXyssmYMZsXFFoD+l/vT1iHZ22sfDhqG3S97xQ=
X-Google-Smtp-Source: AKy350aONT1E105MkQyJEa9XBVtERp8EOjTEyd6xt7j9afh+vkhABl6s6F/ZbGkyoHabS7auq06NW45+DMxU/uMNyzw=
X-Received: by 2002:a05:687c:228:b0:184:5ab4:804f with SMTP id
 ax40-20020a05687c022800b001845ab4804fmr58307oac.2.1681922299474; Wed, 19 Apr
 2023 09:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <174C6101BE5619C9.18270@lists.openembedded.org> <AS1PR10MB569715A94CEE2A11FB789D47FD629@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569715A94CEE2A11FB789D47FD629@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2023 09:37:53 -0700
Message-ID: <CAMKF1spNtActvS_BTHGV_gjpm3etJeDkQXD5cmfDu=HW7XQuWg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][langdale][kirkstone][PATCH] ntp: whitelist CVE-2019-11331
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Apr 2023 16:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102140

Thanks for reminder. It has fell though, I have now staged it in master-nex=
t

On Wed, Apr 19, 2023 at 6:19=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Hello Armin, Khem,
>
> This patch was taken to kirkstone an langdale weeks ago but is still miss=
ing on master (and therefore also in mickledore).
> Could you please pick them?
>
> Thanks,
>   Peter
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
> > Sent: Tuesday, March 14, 2023 20:49
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [oe] [meta-oe][master][langdale][kirkstone][PATCH] ntp: whitel=
ist CVE-2019-11331
> >
> > Links from https://nvd.nist.gov/vuln/detail/CVE-2019-11331 lead to conc=
lusion that this is how icurrent ntp protocol is designed.
> > New RFC is propsed for future but it will not be compatible with curren=
t one.
> >
> > See https://support.f5.com/csp/article/K09940637
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta=
-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> > index 2ae53dc64..c4589c20f 100644
> > --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> > +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
> > @@ -30,6 +30,7 @@ SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool=
/ntp4/ntp-4.2/ntp-${PV}.tar.g
> >  SRC_URI[sha256sum] =3D "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb=
79754a87536b849c19"
> >
> >  # CVE-2016-9312 is only for windows.
> > +# CVE-2019-11331 is inherent to RFC 5905 and cannot be fixed without
> > +breaking compatibility
> >  # The other CVEs are not correctly identified because cve-check  # is =
not able to check the version correctly (it only checks for 4.2.8 omitting =
p15 that makes the difference)  CVE_CHECK_IGNORE +=3D "\ @@ -53,6 +54,7 @@ =
CVE_CHECK_IGNORE +=3D "\
> >      CVE-2016-7433 \
> >      CVE-2016-9310 \
> >      CVE-2016-9311 \
> > +    CVE-2019-11331 \
> >  "
> >
> >
> > --
> > 2.30.2
>

