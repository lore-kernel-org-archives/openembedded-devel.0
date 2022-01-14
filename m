Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5862DC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:50:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.10630.1642182607731909476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:50:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F8j4H9yt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so4863316wmj.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cqZvcGG6LCAHrM0N60dWsI4XjIO36wFT0Jg6C7JIm/8=;
        b=F8j4H9ytGeWjNStG4EgkZQDIrA+fkAjx/VPRAq39nE/cXNVwOQTNe0Ckg0qB3BfYSD
         2ttJatTJZ+aA9Yjkk/OSqq3R7O0c6ToqCYkLA0HwkP5SBQWF1alWiWVG3PcQSP8jorAa
         PH5h3Z6HajMNyAHAntBT20/cNU/SiZk4qTPSKM9hH+TGZyUkdvf8RqEk2gP2EiKrC0Uq
         1sWAryTRxM8ruDx4/5WcRQUNjs6AfN6txc2h59AyGvryz5f72C9OZVXHwkSF64eFVK54
         viERrR2jShB4mIvTjxp6vtAOIylDFuvHhwc9DCSaSKC5e/YztiyOp6pzk2J0G78Q/Rno
         Fw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cqZvcGG6LCAHrM0N60dWsI4XjIO36wFT0Jg6C7JIm/8=;
        b=ItQ6tkXqIW+or6ncykiH/+6rxQp1Qj8J/V6O+m4rNu9JL4jxh2uPFgRrBMMJ15k0HO
         dqhPX8SEJ1BI2xi2bzCVsz3q2vpsa0AgKqqHorWMJKXDf1YNrv17IG+RVA0GSd0IMtcV
         Ffi9b5OvfKy7Fjy1Sz7b7EXS4HDaK6TRcfpqjQVX71Bvc+YqJDazlWSsculyVjQ6OSlo
         MWYq5V483SEYww9YeFesEXXIdRMcAeOAMWvyWwAVQ0ntNZMM3qOv6LlAuVltrimRIq3j
         uKhYw8jxQBQM905DEkdHB9/4pxZpHjrb+iYBBQTsX0rqeDqW4rltzBvACGxPZ1Aw3MJ5
         MKBA==
X-Gm-Message-State: AOAM53099SerjEEctpnMMTUabKmORPaaZ9KwSnpAQPV4wdRPrzW9gPqE
	T1JAF7ArMVXkt96tPq8uvYg=
X-Google-Smtp-Source: 
 ABdhPJy0epV5HinHjVOkA/2Xi8dJSsodZtOkzCv+lg8fXYDxusfWTDN5xIwJr0m2mLN+EiTtnZKabg==
X-Received: by 2002:a05:6000:1c0a:: with SMTP id
 ba10mr5219917wrb.233.1642182605971;
        Fri, 14 Jan 2022 09:50:05 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 o13sm7469020wrc.111.2022.01.14.09.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 09:50:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 14 Jan 2022 18:50:04 +0100
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Nisha Parrakat <nishaparrakat@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only
 handle npm if configured
Message-ID: <20220114175004.7scwmyfgyre3refx@jama>
References: <20220113081301.26006-1-nishaparrakat@gmail.com>
 <9e70a83ae7094421baad114700d6df43@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bept32hfci2pcuck"
Content-Disposition: inline
In-Reply-To: <9e70a83ae7094421baad114700d6df43@axis.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 17:50:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94846


--bept32hfci2pcuck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 01:25:24PM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-devel@lis=
ts.openembedded.org> On Behalf Of Nisha Parrakat
> > Sent: den 13 januari 2022 09:13
> > To: openembedded-devel@lists.openembedded.org; raj.khem@gmail.com
> > Cc: nishaparrakat@gmail.com
> > Subject: [oe] [meta-oe][dunfell][PATCH 1/2] nodejs_12.21.0.bb: only han=
dle npm if configured
> >=20
> > npm-cli.js should be symlinked only when the file is present
> > the file may not be available if the configure option is --without-npm
> >=20
> > Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb b/meta-o=
e/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > index b9e382177..22191a157 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
> > @@ -133,7 +133,9 @@ do_install_append_class-native() {
> >      # /usr/bin/npm is symlink to /usr/lib/node_modules/npm/bin/npm-cli=
=2Ejs
> >      # use sed on npm-cli.js because otherwise symlink is replaced with=
 normal file and
> >      # npm-cli.js continues to use old shebang
> > -    sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/node_=
modules/npm/bin/npm-cli.js
> > +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" =
]]; then
> > +        sed "1s^.*^#\!/usr/bin/env node^g" -i ${D}${exec_prefix}/lib/n=
ode_modules/npm/bin/npm-cli.js
> > +    fi
> >=20
> >      # Install the native binaries to provide it within sysroot for the=
 target compilation
> >      install -d ${D}${bindir}
> > @@ -147,7 +149,9 @@ do_install_append_class-native() {
> >  }
> >=20
> >  do_install_append_class-target() {
> > -    sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/node=
_modules/npm/bin/npm-cli.js
> > +    if [[ -f "${D}${exec_prefix}/lib/node_modules/npm/bin/npm-cli.js" =
]]; then
> > +        sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${exec_prefix}/lib/=
node_modules/npm/bin/npm-cli.js
> > +    fi
> >  }
> >=20
> >  PACKAGES =3D+ "${PN}-npm"
> > --
> > 2.17.1
>=20
> This patch should not be applied because it a) contains bashisms and b)=
=20
> it is better to just remove the workaround as it is no longer needed (see=
=20
> the patches I just sent for master).

agreed, with dash nodejs do_install fails with dash:

tmp-glibc/work/x86_64-linux/nodejs-native/16.11.1-r0/temp/run.do_install.28=
37733:169: [[: not found

but unfortunately it doesn't cause do_install to fail, because [[ is in
if expression.

>=20
> //Peter
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94833): https://lists.openembedded.org/g/openembedded=
-devel/message/94833
> Mute This Topic: https://lists.openembedded.org/mt/88392913/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [M=
artin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--bept32hfci2pcuck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYeG3yQAKCRA3VSO3ZXaA
HOh8AKCw3bZwhW7p2nTuq3TJoukOFBa5cwCdHUzBctKSoZRgHWj/ZiB7LuSN2RE=
=+rXV
-----END PGP SIGNATURE-----

--bept32hfci2pcuck--

