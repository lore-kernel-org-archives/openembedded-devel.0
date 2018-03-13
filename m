Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4CB7892B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 12:26:52 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k3so2693691wrg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aEdN9ZPp5iZ4ru5jpgJkOyT74daIP8qp1Exbh/TPXhA=;
	b=WhRPWyweX8VH9I2NIp0WFL2f2xl4s8hDGWQHSfL6L5O8zQDaYHV1jg15tIyMZPX3tM
	ZOH4QpniTs3Jog9e+ZdhuwvCykbw8wcv0dFpovr8Bn+v074PIbI6DOdOM5uDsgWpvoTS
	Cqg31tUBmFcdYWXUspmxVMAurR21Q8yrdEry4RGJZlnPfJMVIc/RWwqGb+F2b0OPo+p3
	drfI0pkIaG13scEXAurqEEL1GrTGECVWRIaJ5i5VEFwAFS1/ZNTVBnqjypgeh++M2325
	aIsVA3dHMeCoMIj12mx+zddsDHICeiXihxz1YY8J+3oHkq7LNMc6TlvI80+aF28UkbfF
	g5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aEdN9ZPp5iZ4ru5jpgJkOyT74daIP8qp1Exbh/TPXhA=;
	b=KJxY0qCv/BqLavlZtFdinKE6mn1sBkBRdbYpJRyPiIqYNsp+bvbKVtoSrGAsUL7zLv
	YdfJyuVJbI7JLSWqOwvofAJNDOpwEMHiHgWLKwagX6EIjslpV8ScFg0TeEqMtmQ5E8p2
	P/ZVU15+WwGMhp3x4soukCVww+1xCgl9jrtjm+iUEOWhIH7R4UrvPsxub0Do7q4AeaCs
	FojTuHHTTsJFbvpELj4IkLWoR8JMZuAhsSnE3QAkvw452PvUyfvbe2bTTFQB5lYVu4j8
	191b/YwSAxKD7NYLO/2yEev51IeVa86BByvFug8vkSs1Dz8kj4iVEwqM/HC5Jbi5bZHl
	MkYw==
X-Gm-Message-State: AElRT7E6KRH696riL65YeKbDojfvEUOkgyQEYQYPZA3a7h5saq91D68I
	Q5TVXzfEbKhh7FLHqxKThcg/1g==
X-Google-Smtp-Source: AG47ELuKKkIKJ7cwWVjn/pC96WNHtoXkRyLn2MY2QfFSMlhUnmW1c3iI3Vr8c4kTrwC5POOlFx0Gdg==
X-Received: by 10.28.61.65 with SMTP id k62mr637590wma.140.1520944012985;
	Tue, 13 Mar 2018 05:26:52 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id p21sm199487wmc.0.2018.03.13.05.26.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Mar 2018 05:26:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Mar 2018 13:26:55 +0100
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20180313122655.GB1427@jama>
References: <20180119151942.19731-1-Martin.Jansa@gmail.com>
	<20180119151942.19731-2-Martin.Jansa@gmail.com>
	<CA+chaQcfAXi3qiQ_oyDX+becM=auVOMpnNuTThXLUJ+0+WdH1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQcfAXi3qiQ_oyDX+becM=auVOMpnNuTThXLUJ+0+WdH1Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [meta-oe][PATCH 2/3] freediameter: add dependency on virtual/kernel and use MACHINE_ARCH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2018 12:26:52 -0000
X-Groupsio-MsgNum: 71245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline

--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2018 at 07:36:26PM +0100, Martin Jansa wrote:
> ping

ping2

this still isn't in origin/master-next nor contrib/stagging/master-next.

> On Fri, Jan 19, 2018 at 4:19 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > * TUNE_PKGARCH cannot RRECOMMEND MACHINE specific kernel-modules
> > * without virtual/kernel dependency (which isn't really build time
> >   dependency) the QA check won't traverse the dependencies correctly
> >   and shows following errors:
> >   ERROR: QA Issue: freediameter rdepends on kernel-module-ipip, but it
> > isn't a build dependency? [build-deps]
> >   ERROR: QA Issue: freediameter rdepends on kernel-module-sctp, but it
> > isn't a build dependency? [build-deps]
> >   ERROR: QA Issue: freediameter rdepends on kernel-module-tipc, but it
> > isn't a build dependency? [build-deps]
> >   ERROR: QA Issue: freediameter rdepends on kernel-module-udp-tunnel, b=
ut
> > it isn't a build dependency? [build-deps]
> > * also change kernel-module dependencies from RDEPENDS to RRECOMMENDS
> >   because the kernel config might include these directly and then
> >   freediameter shouldn't fail to install
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../recipes-protocols/freediameter/freediameter_1.2.1.bb          | 8
> > +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-networking/recipes-protocols/freediameter/freedia
> > meter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freedia
> > meter_1.2.1.bb
> > index 92cd24c3ae..c556eb48e8 100644
> > --- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1=
=2Ebb
> > +++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1=
=2Ebb
> > @@ -7,7 +7,9 @@ Accounting needs."
> >
> >  HOMEPAGE =3D "http://www.freediameter.net"
> >
> > -DEPENDS =3D "flex bison cmake-native libgcrypt gnutls libidn lksctp-to=
ols"
> > +DEPENDS =3D "flex bison cmake-native libgcrypt gnutls libidn lksctp-to=
ols
> > virtual/kernel"
> > +
> > +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> >  fd_pkgname =3D "freeDiameter"
> >
> > @@ -121,8 +123,8 @@ FILES_${PN} +=3D "${libdir}/${fd_pkgname}/*"
> >
> >  RDEPENDS_${PN}  =3D "glib-2.0 gnutls libidn"
> >  RDEPENDS_${PN} +=3D "openssl openssl-conf openssl-engines"
> > -RDEPENDS_${PN} +=3D "kernel-module-tipc kernel-module-sctp"
> > -RDEPENDS_${PN} +=3D "kernel-module-udp-tunnel kernel-module-ipip"
> > +RRECOMMENDS_${PN} +=3D "kernel-module-tipc kernel-module-sctp"
> > +RRECOMMENDS_${PN} +=3D "kernel-module-udp-tunnel kernel-module-ipip"
> >  RDEPENDS_${PN}-ptest =3D "cmake"
> >
> >  INITSCRIPT_PACKAGES =3D "${PN}"
> > --
> > 2.15.1
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWqfDjgAKCRA3VSO3ZXaA
HIHEAJ9aecJWNwj6fxo4QYGtqy9R/tWI0ACfZb/gVQ09CI8Jad1xLKcowVgIxhY=
=uBFj
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
