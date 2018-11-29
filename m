Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 741C46C578
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 01:55:19 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id e5so314068qtr.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 17:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nCSk3SVJ/WNRJaFgQMtTD8ISFa+H8Wwj7+k0AtU30LU=;
	b=kHMLxQyS0UbKkJfQsSSOFrFyv17pU1qLe1bW3RVvYKcQC49gecORUcpHe4fGufPyPM
	jx4pFrjy60YZOUqFro+NsyKh3F4VocvjXNmOCIfO/P/iwRW8q2d9AjrzaOaTvws+xhMH
	7Kig035juVkHICrm0YT79f79Zovdp+vBiKUiB86ECA65T0X1HKChZtH+86+ji1Bg+M+E
	Q1OFF25dpWasX36nrVAWQKkciL0zh+L2JAWm1bjc9Jp8f6vKz2x4HIbmbEXvbYyUeEEi
	gtawFnIvSAyrgG4WztfhjWEYP/PiN3vI+hHWRfsjkK0GZECrj+HcO8c2//cO8pk1tIjZ
	kHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nCSk3SVJ/WNRJaFgQMtTD8ISFa+H8Wwj7+k0AtU30LU=;
	b=hqeiZYPE8oIb9dsZ5fMju8jKA2BXO5G4Ur7h/8/zqzISjs9dO1nwkr0Bxu5uQgem29
	WSzeQc740DY1c9I1sQkxt2ApU54qTv8W/Jg1Qs7CO8PWRqyQrc/ownegjpB3lwwoyr0I
	/nuwNxRrl+QPIwhZ0fjpSUKtuLbQS8pvPdEZmpUo5bYEolsBUWK9r7bUgjMsBZJ/p9ry
	GhDhaRIT+eO4mwusSIR2WgxHab4vCveMXEXJbEL6uGjoDN0KbGjvFvRBlqD3DeyhxSz0
	968rKlCy69gdlyUWh/5hUu0qK1nqsuOjWGppemcT6vsJ5SdyqvQx5SDokS8b5tGELTUA
	A1KQ==
X-Gm-Message-State: AA+aEWZ9xeD9VWNThtuvcWQKTtyzGDQE5uE6OZCQwjQm5bYdf/h+6z3a
	OoGQUU31uCHr8hlYKA/U4wnIAMGFkyYMd8lnFHs=
X-Google-Smtp-Source: AJdET5ceAVbP1nWEIEFwepn/IQ4A6pEcrxfanBTJvOvLveZta6RdT+NExc3VYeubG9Iq8mf/ZDTXrogpir5i48eQQf0=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr37824897qte.29.1543456520109; 
	Wed, 28 Nov 2018 17:55:20 -0800 (PST)
MIME-Version: 1.0
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
	<CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
	<CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
	<608363b5-319f-0e49-303c-48bda23c1e48@windriver.com>
In-Reply-To: <608363b5-319f-0e49-303c-48bda23c1e48@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Nov 2018 17:55:08 -0800
Message-ID: <CAMKF1sqJXeW6DnwmYEWT1s984JPvvsGXQk7Rn-fUwsVd9iy0jQ@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
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
X-List-Received-Date: Thu, 29 Nov 2018 01:55:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We have two options

Download and rename may be add a date component and save it on
sources.oe.org

Second option is to download the databases during build as temporary
artifacts but this might cause reproducibility problems

Either way it is going to have some issues
May be option 1 even though tedious can be better of two

On Wed, Nov 28, 2018 at 5:31 PM Changqing Li <changqing.li@windriver.com>
wrote:

> Khem and Marthin,
>
> The failure still caused by frequently changed checksum of the database. =
I
> send the patch on 11.20.
>
> but the checksum changed on 1121, and it also changed on 1128, seems like
> weekly change.
>
> but it should not failed if there is a premirror saved the
>
> Here is a result I get:
>
> $ md5sum 1128/*v6*
> d98a04eded0b08b945b5629106d58760  1128/GeoIPv6 (1).dat.gz
> 4d48c102ec68298b3fc7f57763455cb5  1128/GeoLiteCityv6.dat.gz
> $ md5sum 1121/*v6*
> b0f82334f94ca89872e7722db3511bb9  1121/GeoIPv6.dat.gz
> 50ad18a8a3ea4bba7c929bea6e22db75  1121/GeoLiteCityv6.dat.gz
> $ md5sum 1120/*v6*
> a908d7a51c3883eb8f693ca197c7a142  1120/GeoIPv6.dat.gz
> 8ac3506ccabaae7e9f7d6301c2654313  1120/GeoLiteCityv6.dat.gz
>
>
> On 11/28/18 3:14 AM, Martin Jansa wrote:
>
> I'm seeing different checksum than both your builder and the recipe.
>
> $ wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
> --2018-11-27 20:06:32--
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
> Resolving geolite.maxmind.com... 104.16.37.47, 104.16.38.47,
> 2606:4700::6810:252f, ...
> Connecting to geolite.maxmind.com|104.16.37.47|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1209046 (1.2M) [application/octet-stream]
> Saving to: =E2=80=98GeoIPv6.dat.gz=E2=80=99
>
> 2018-11-27 20:06:32 (10.3 MB/s) - =E2=80=98GeoIPv6.dat.gz=E2=80=99 saved =
[1209046/1209046]
>
> $ md5sum GeoIPv6.dat.gz
> d98a04eded0b08b945b5629106d58760  GeoIPv6.dat.gz
>
> Is this the legacy archive? Because
> https://dev.maxmind.com/geoip/legacy/geolite/ now shows following:
>
> Yes,  I have  pointed out this problem  the first time I changed the
> checksum. maybe we should upgrade
>
> to geoip2,  and  drop current geoip1.6.  but I think even with geoip2,
> since it's database still not version,
>
> maybe also will met similar problem.
>
>
> //changqing
>
>
> Updated versions of the GeoLite Legacy databases are now only available t=
o
> redistribution license customers, although anyone can continue to downloa=
d
> the March 2018 GeoLite Legacy builds. Starting January 2, 2019, the last
> build will be removed from our website. GeoLite Legacy database users wil=
l
> need to switch to the GeoLite2 or commercial GeoIP databases and update
> their integrations by January 2, 2019.
>
> For more information, please visit our Support Center.
>
> Note: After careful consideration, taking into account customer feedback,
> we have decided against removing latitude and longitude coordinates from
> the GeoLite2 databases. We are in the process of reviewing coordinates us=
ed
> in all of our GeoLite2 and GeoIP databases to ensure there is no risk of
> misuse.
>
> * GeoLite2 databases are free IP geolocation databases comparable to, but
> less accurate than, MaxMind=E2=80=99s GeoIP2 databases. Please remember t=
o use the
> accuracy radius if displaying coordinates on a map.
>
> New Database Format Available: This page is for our GeoLite Legacy
> databases. For our latest database format, please visit our GeoLite2
> Databases page. We offer redistribution licenses for our newer GeoLite2
> databases that will allow you to package the databases with your commerci=
al
> products. For more information, please visit the GeoLite2 Commercial
> Redistribution page.
>
>
> On Tue, Nov 27, 2018 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> I am seeing errors on some builders
>>
>> http://errors.yoctoproject.org/Errors/Details/202341/
>> On Mon, Nov 19, 2018 at 11:29 PM Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> >
>> > Looks, good.
>> >
>> > Adding variable for 20181120 might help with maintenance (if we need t=
o
>> > change just checksums in future). And with good variable name (or a
>> > comment) it would also document in the recipe why we're using this in
>> > downloadfilename.
>> >
>> > On Tue, Nov 20, 2018 at 7:48 AM <changqing.li@windriver.com> wrote:
>> >
>> > > From: Changqing Li <changqing.li@windriver.com>
>> > >
>> > > previous change of checksum don't trigger archive to re-downloaded,
>> > > , which will cause checksum mismatch. add downloadfilename to
>> > > trigger re-download.
>> > >
>> > > 1. for user with PREMIRROR, another benefit is it can still compile
>> > > success event upstream checksum change frequently.
>> > > 2. but for user don't use PREMIRROR, if upstream checksum changed,
>> > > still might have checksum mismatch problem.
>> > >
>> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > > ---
>> > >  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
>> > > +++++++++++-----------
>> > >  1 file changed, 12 insertions(+), 12 deletions(-)
>> > >
>> > > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > > b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > > index 1e1a7ff..57f0b67 100644
>> > > --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > > @@ -9,10 +9,10 @@ HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
>> > >  SECTION =3D "libdevel"
>> > >
>> > >  SRC_URI =3D "git://github.com/maxmind/geoip-api-c.git \
>> > > -
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.=
dat.gz;apply=3Dno;name=3DGeoIP-dat
>> > > \
>> > > -
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno;name=3DGeoIPv6-dat
>> > > \
>> > > -
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;ap=
ply=3Dno;name=3DGeoLiteCity-dat
>> > > \
>> > > -
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Ge=
oLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat
>> > > \
>> > > +
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.=
dat.gz;apply=3Dno;name=3DGeoIP-dat;downloadfilename=3DGeoIP.dat.20181120.gz
>> > > \
>> > > +
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=
=3Dno;name=3DGeoIPv6-dat;downloadfilename=3DGeoIPv6.dat.20181120.gz
>> > > \
>> > > +
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;ap=
ply=3Dno;name=3DGeoLiteCity-dat;downloadfilename=3DGeoLiteCity.dat.20181120=
.gz
>> > > \
>> > > +
>> > >
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/Ge=
oLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat;downloadfilename=3DG=
eoLiteCityv6.dat.20181120.gz
>> > > \
>> > >             file://run-ptest \
>> > >  "
>> > >  SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>> > > @@ -20,14 +20,14 @@ SRCREV =3D
>> "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>> > >  SRC_URI[GeoIP-dat.md5sum] =3D "d538e57ad9268fdc7955c6cf9a37c4a9"
>> > >  SRC_URI[GeoIP-dat.sha256sum] =3D
>> > > "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>> > >
>> > > -SRC_URI[GeoIPv6-dat.md5sum] =3D "00dc3b3f53eb5f7bf6915f939998f12c"
>> > > -SRC_URI[GeoIPv6-dat.sha256sum] =3D
>> > > "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
>> > > +SRC_URI[GeoIPv6-dat.md5sum] =3D "a908d7a51c3883eb8f693ca197c7a142"
>> > > +SRC_URI[GeoIPv6-dat.sha256sum] =3D
>> > > "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>> > >
>> > >  SRC_URI[GeoLiteCity-dat.md5sum] =3D "d700c137232f8e077ac8db8577f699=
d9"
>> > >  SRC_URI[GeoLiteCity-dat.sha256sum] =3D
>> > > "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>> > >
>> > > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D
>> "7f6333d433d8127181ea3c5828287c98"
>> > > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>> > > "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
>> > > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D
>> "8ac3506ccabaae7e9f7d6301c2654313"
>> > > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>> > > "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>> > >
>> > >  LICENSE =3D "LGPL-2.1"
>> > >
>> > > @@ -44,10 +44,10 @@ EXTRA_OECONF =3D "--disable-static              =
 \
>> > >  do_install() {
>> > >      make DESTDIR=3D${D} install
>> > >      install -d ${D}/${datadir}/GeoIP
>> > > -    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
>> > > -    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
>> > > -    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
>> > > -    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
>> > > +    install ${WORKDIR}/GeoIP.dat.20181120
>> ${D}/${datadir}/GeoIP/GeoIP.dat
>> > > +    install ${WORKDIR}/GeoIPv6.dat.20181120
>> > > ${D}/${datadir}/GeoIP/GeoIPv6.dat
>> > > +    install ${WORKDIR}/GeoLiteCity.dat.20181120
>> > > ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>> > > +    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
>> > > ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>> > >      ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>> > >  }
>> > >
>> > > --
>> > > 2.7.4
>> > >
>> > > --
>> > > _______________________________________________
>> > > Openembedded-devel mailing list
>> > > Openembedded-devel@lists.openembedded.org
>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> > >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> BRs
>
> Sandy(Li Changqing)
>
>

