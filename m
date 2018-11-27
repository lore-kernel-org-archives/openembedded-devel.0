Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id CBBC56C613
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:14:38 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id q26so130053wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uYF+Yzwvhueok7Y175ofIwvOHHIz3TNQX+I5aDKkA/Q=;
	b=OqoD75kwaVSMBJQAssZXVnFoA2v4sUmFgekSEOht+/W3HYKGcPh+hNWFDVvBIcCpSt
	ejPPBx5ejBd11FKjJtyxOA8NAQG6bNVw87kv1ll25oN2l5oZetz1tRS2OCkKTc9eXZka
	GSJS/RWyU/4pyyN0VPzLEbdQb2Cy1JxFNZoMf1L8xpt78XslYCJt3VTCwB1aeXxzmI8b
	44Rf3BkJsZYCyRhvBbyFmlnoz492y6puNpupOsWGPAq/iPlQvvLGMSZ2Fkf9FuW143RM
	Q8oU2oe/dAls5NVOKCddnrrzRhkS+K4Zn9HV+ktJ2BtifU4FV0zGySMeLtCSIHLVjMJk
	yRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uYF+Yzwvhueok7Y175ofIwvOHHIz3TNQX+I5aDKkA/Q=;
	b=oaxakTV3WjcgIcJaDnLpysgdUxVN2aYfBulpswt31YWvLFY+IxvJkO2gSsl5dVN5xO
	yKEEz3ADDCnyCWxcaD5+Y93+CmfCncVSDRNgClx5uFtuzt1PgIPqDa2ZZ+etIhlrJBy4
	uTUQEhqS8/WnChGiD44WWCQfxz7J3n24ZP1f4zM9uhwwDBvj7xLiOJtqUmzV1TxvaQdt
	deT2rcED5axlT6cZT3bDsnCA71vhBv/tWvhJoeZnMs+7w5bVgQkqwHLPdQSOAFhwuuxp
	Wi8y86ALUXc7iU4snZ37Jl/q/IsRifmlFI5bCYmmfvByRhDtyFEBB1pZI0RnF1UkNBXo
	LPJQ==
X-Gm-Message-State: AA+aEWaGvikP+5owO6eQqw4WSzJKl9UidZC5CyUsN5rBwk9nNnIP8o/e
	KSqYAxKDmMAiazzckF62ggtKoMPaWzPYL77D/pc=
X-Google-Smtp-Source: AFSGD/Xxz64vx5yphepVa36wU9Hav/r5YhrjLv4a8KFT4YNiBugaPFFgW2VDto8lvS8aTGDIk8KNo9iTTgK24Ocgk4w=
X-Received: by 2002:a1c:af07:: with SMTP id y7mr132051wme.94.1543346079192;
	Tue, 27 Nov 2018 11:14:39 -0800 (PST)
MIME-Version: 1.0
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
	<CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
In-Reply-To: <CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Nov 2018 20:14:26 +0100
Message-ID: <CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: add downloadfilename for geoip database files
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
X-List-Received-Date: Tue, 27 Nov 2018 19:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm seeing different checksum than both your builder and the recipe.

$ wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
--2018-11-27 20:06:32--
http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
Resolving geolite.maxmind.com... 104.16.37.47, 104.16.38.47,
2606:4700::6810:252f, ...
Connecting to geolite.maxmind.com|104.16.37.47|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1209046 (1.2M) [application/octet-stream]
Saving to: =E2=80=98GeoIPv6.dat.gz=E2=80=99

2018-11-27 20:06:32 (10.3 MB/s) - =E2=80=98GeoIPv6.dat.gz=E2=80=99 saved [1=
209046/1209046]

$ md5sum GeoIPv6.dat.gz
d98a04eded0b08b945b5629106d58760  GeoIPv6.dat.gz

Is this the legacy archive? Because
https://dev.maxmind.com/geoip/legacy/geolite/ now shows following:

Updated versions of the GeoLite Legacy databases are now only available to
redistribution license customers, although anyone can continue to download
the March 2018 GeoLite Legacy builds. Starting January 2, 2019, the last
build will be removed from our website. GeoLite Legacy database users will
need to switch to the GeoLite2 or commercial GeoIP databases and update
their integrations by January 2, 2019.

For more information, please visit our Support Center.

Note: After careful consideration, taking into account customer feedback,
we have decided against removing latitude and longitude coordinates from
the GeoLite2 databases. We are in the process of reviewing coordinates used
in all of our GeoLite2 and GeoIP databases to ensure there is no risk of
misuse.

* GeoLite2 databases are free IP geolocation databases comparable to, but
less accurate than, MaxMind=E2=80=99s GeoIP2 databases. Please remember to =
use the
accuracy radius if displaying coordinates on a map.

New Database Format Available: This page is for our GeoLite Legacy
databases. For our latest database format, please visit our GeoLite2
Databases page. We offer redistribution licenses for our newer GeoLite2
databases that will allow you to package the databases with your commercial
products. For more information, please visit the GeoLite2 Commercial
Redistribution page.


On Tue, Nov 27, 2018 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:

> I am seeing errors on some builders
>
> http://errors.yoctoproject.org/Errors/Details/202341/
> On Mon, Nov 19, 2018 at 11:29 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Looks, good.
> >
> > Adding variable for 20181120 might help with maintenance (if we need to
> > change just checksums in future). And with good variable name (or a
> > comment) it would also document in the recipe why we're using this in
> > downloadfilename.
> >
> > On Tue, Nov 20, 2018 at 7:48 AM <changqing.li@windriver.com> wrote:
> >
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > previous change of checksum don't trigger archive to re-downloaded,
> > > , which will cause checksum mismatch. add downloadfilename to
> > > trigger re-download.
> > >
> > > 1. for user with PREMIRROR, another benefit is it can still compile
> > > success event upstream checksum change frequently.
> > > 2. but for user don't use PREMIRROR, if upstream checksum changed,
> > > still might have checksum mismatch problem.
> > >
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > >  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
> > > +++++++++++-----------
> > >  1 file changed, 12 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > > b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > > index 1e1a7ff..57f0b67 100644
> > > --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > > @@ -9,10 +9,10 @@ HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
> > >  SECTION =3D "libdevel"
> > >
> > >  SRC_URI =3D "git://github.com/maxmind/geoip-api-c.git \
> > > -
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.d=
at.gz;apply=3Dno;name=3DGeoIP-dat
> > > \
> > > -
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno;name=3DGeoIPv6-dat
> > > \
> > > -
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;app=
ly=3Dno;name=3DGeoLiteCity-dat
> > > \
> > > -
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Geo=
LiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat
> > > \
> > > +
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.d=
at.gz;apply=3Dno;name=3DGeoIP-dat;downloadfilename=3DGeoIP.dat.20181120.gz
> > > \
> > > +
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno;name=3DGeoIPv6-dat;downloadfilename=3DGeoIPv6.dat.20181120.gz
> > > \
> > > +
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;app=
ly=3Dno;name=3DGeoLiteCity-dat;downloadfilename=3DGeoLiteCity.dat.20181120.=
gz
> > > \
> > > +
> > >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Geo=
LiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat;downloadfilename=3DGe=
oLiteCityv6.dat.20181120.gz
> > > \
> > >             file://run-ptest \
> > >  "
> > >  SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> > > @@ -20,14 +20,14 @@ SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622ed=
31a"
> > >  SRC_URI[GeoIP-dat.md5sum] =3D "d538e57ad9268fdc7955c6cf9a37c4a9"
> > >  SRC_URI[GeoIP-dat.sha256sum] =3D
> > > "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
> > >
> > > -SRC_URI[GeoIPv6-dat.md5sum] =3D "00dc3b3f53eb5f7bf6915f939998f12c"
> > > -SRC_URI[GeoIPv6-dat.sha256sum] =3D
> > > "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
> > > +SRC_URI[GeoIPv6-dat.md5sum] =3D "a908d7a51c3883eb8f693ca197c7a142"
> > > +SRC_URI[GeoIPv6-dat.sha256sum] =3D
> > > "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
> > >
> > >  SRC_URI[GeoLiteCity-dat.md5sum] =3D "d700c137232f8e077ac8db8577f699d=
9"
> > >  SRC_URI[GeoLiteCity-dat.sha256sum] =3D
> > > "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
> > >
> > > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "7f6333d433d8127181ea3c5828287=
c98"
> > > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
> > > "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
> > > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "8ac3506ccabaae7e9f7d6301c2654=
313"
> > > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
> > > "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
> > >
> > >  LICENSE =3D "LGPL-2.1"
> > >
> > > @@ -44,10 +44,10 @@ EXTRA_OECONF =3D "--disable-static               =
\
> > >  do_install() {
> > >      make DESTDIR=3D${D} install
> > >      install -d ${D}/${datadir}/GeoIP
> > > -    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
> > > -    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
> > > -    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
> > > -    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
> > > +    install ${WORKDIR}/GeoIP.dat.20181120
> ${D}/${datadir}/GeoIP/GeoIP.dat
> > > +    install ${WORKDIR}/GeoIPv6.dat.20181120
> > > ${D}/${datadir}/GeoIP/GeoIPv6.dat
> > > +    install ${WORKDIR}/GeoLiteCity.dat.20181120
> > > ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> > > +    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
> > > ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
> > >      ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
> > >  }
> > >
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

