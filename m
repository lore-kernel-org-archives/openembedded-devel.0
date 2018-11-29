Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id DC0846D2DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 06:23:02 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id z18so967680wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 22:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wosKGFiByhYnzA9q2o7lzIsWfgq4rntPXFAwfYBbAqA=;
	b=h1+2KgW7ibk6fcjdYu/JnqLa9fa08F75UtKjM8RPL/sXTVWGE0l2PsQlQbil/yC0um
	qar0bBgcwW2h8BM2n4ds5yxtUw9pqZ8mLZxFIP3f/HSiFWYpPk3rkXq7x4cCpgEZNDcN
	F9cb64iM4n6+yeCTmpqpXOg03UTBG6wGY5vdx/eDP0jdqLR/9vTQR4HXn6ptVjz8Fp+Q
	O6OvIb048U6OW26+AQsc6wwJv6ToJZtEL0YTmscUejjmZGedvobD+SekrrRWMY/FP1H4
	SXvI+xkSpB1otfoB5KFZdnx5y5AVaPaD2yIt5+pFho47oqdIDHAs9X4fQ+TVTvR1YVN0
	udTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wosKGFiByhYnzA9q2o7lzIsWfgq4rntPXFAwfYBbAqA=;
	b=HE7nehJ19ycm/t9hVF6Yr/IdG95vX6mbjDWApxoQzQ4b50E8RvD5wlCrLvMKNv6LFY
	CnHAArZowGAVjDLyGopLOUdlF/EUNRpNOMwHN5sojmgUAv0YMIGdmJay06b//yBl44WN
	NIlXBoSELpKi3GsyVLDHck3bm3+unpBnB99RyFxSMb12IA3cwAVPev2u/qnxZExXS83+
	LndUmxcR3wH+zsgXCZko5pLOb5P5sZzNaYP75OBtdzCitm6MU6lgMOwjHgB1tbWyJpS0
	eO3r7rkHNxQLZ56+Uzk7rVXLAgWZBHMlE5/OhUpzc46hWrE6Zpx9FGnliXlKZMmbEMyI
	9ekg==
X-Gm-Message-State: AA+aEWaoxIZq7Qj2dl3h5Mp8bKy+p0YPlnxfLXHSGJab6eRVRulNkCDx
	PmcopUMabmOOVTw/elWJJhfVnT3l9Zwh6tH1FvM=
X-Google-Smtp-Source: AFSGD/WoDkbWU/z9VjW81w8TxjM1PbL3pXNHSIMrzaUnrdHkObt69Gl6UZhCZbKfeFyckqSjhF6MCT6gF8GVGpE02dw=
X-Received: by 2002:a1c:4485:: with SMTP id r127mr533438wma.50.1543472583327; 
	Wed, 28 Nov 2018 22:23:03 -0800 (PST)
MIME-Version: 1.0
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
	<CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
	<CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
	<608363b5-319f-0e49-303c-48bda23c1e48@windriver.com>
In-Reply-To: <608363b5-319f-0e49-303c-48bda23c1e48@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Nov 2018 07:22:51 +0100
Message-ID: <CA+chaQeQ2UHR9dsm05auAWoAP5xasEM+k=Ee=pdbFi=zHU_CYg@mail.gmail.com>
To: changqing.li@windriver.com
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
X-List-Received-Date: Thu, 29 Nov 2018 06:23:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for update.

So there will be 4 more changes and then after:
"Starting January 2, 2019, the last build will be removed from our website.=
"
the archive will be only on OE premirror? That's really unfortunate, I'm
not using geoip (other than seeing it fail in my world builds), but this
will be big issue for people using release branches and not the premirror,
we should at least synchronize all branches to use the same archives and in
a month we should mirror the very last build in some more stable place, I
haven't check the license, but cannot YP mirror host the files from the
very last build?

On Thu, Nov 29, 2018 at 2:31 AM Changqing Li <changqing.li@windriver.com>
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

