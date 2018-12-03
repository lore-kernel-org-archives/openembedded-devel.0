Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 62E776B561
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 16:54:40 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id r71so7735185qkr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 08:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nZ5vRPTuA3SK3ddSZISnYTMjcELWnOb/pfcAB3q4rOY=;
	b=r6F66LjwxKjYOWN2fZWrNlViiXV+eYmrE8EUgSM79/FZ01AM/PX7hGLNzrcwJUbsdZ
	PlmLy3wwxRg0vU8ldYrYyIgN87dWISrPlRv+OcDVJjOnJ/wlUafMJGO8fuPa7Fq3khnF
	P0QOizgWaIgy2qPQe742E55t2N8LKDtiTpRGxWs8hAqZmckiAxANQ+c1yaqwZXfCxrS9
	p4Et9S6bIP07+ATPw6DRnHf5XwfdsUdLRR1PluTOu8C54xa8Ysp3TGEs5ieDDtftsu+6
	5KoqBGY8DTAp1r4k7b0CbzbYsm83CETvSpAyQcWk+7CtcWb/rQxkamBG8a4VZE88jxn4
	8Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nZ5vRPTuA3SK3ddSZISnYTMjcELWnOb/pfcAB3q4rOY=;
	b=oKjCksBJpWN8b5Br7GLkTH06XDguwzPS3/0rDk7fn1+bNkCrIxbka72qd+zOCHJzjr
	0eYq6u0Hm8GxLlmmGhTa0lyC/u/abweNX08R3KnT/j04qiXrhY5A2TRsC7YqTTdyD/js
	3GTjG1A0MKAPjCMHddJLFqw8cLXSNhrpgV+rAKv8l/h2fwHyA2wcx+S0JvC+qyLYuOs+
	xmWgGrx5GB2IgGkl9L2nvqfM0Yf04jQSvMPC6s7Jsxc17tLZ1yLv5NLhd8wRr5Va6Zpg
	vaR2qNtzl1sPwXaGm65DJb3JbQdYFQM8pqlgnk8c0pu5BvFmttYQ1Rv/pgvIRGfawURh
	xJug==
X-Gm-Message-State: AA+aEWbATkAbzcOCp75iyaZZ7FY3xDLd49UCf1HGZlyys/J0GUdK9bhZ
	cMdKFhnwHJ5DMR70C6eSleQMuiX/XHQupVlYLF8=
X-Google-Smtp-Source: AFSGD/Uq/Cxc19d43m5xCWbTQHzv0yv575Ev1yCwd4rrymQNFlnKQ2OcJ7f+e7WjuLQY0RDYh2BdXVGQjYx4bdXhR5o=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr15343806qka.206.1543856080897;
	Mon, 03 Dec 2018 08:54:40 -0800 (PST)
MIME-Version: 1.0
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
	<CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
	<CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
	<608363b5-319f-0e49-303c-48bda23c1e48@windriver.com>
	<CAMKF1sqJXeW6DnwmYEWT1s984JPvvsGXQk7Rn-fUwsVd9iy0jQ@mail.gmail.com>
	<2dfdfe62-c5df-f05b-cf72-c77ee75331a9@windriver.com>
	<CA+chaQc-tu7J-6GYo-Y_HiEBMOgcA96giH4tDb67AbGwP5ZhKg@mail.gmail.com>
	<9029c2cd-a68f-53ba-5a2f-ff41c5fbdffa@windriver.com>
	<CAMKF1sqF-YiDdoqcSxnqbuYVDOmGDdUqmAeJoWm07JTjg0fTOA@mail.gmail.com>
	<CA+chaQeu=HBi5wCvZ6w-h8TDGT6Jmt3=fPirc7R1QhrG81566Q@mail.gmail.com>
In-Reply-To: <CA+chaQeu=HBi5wCvZ6w-h8TDGT6Jmt3=fPirc7R1QhrG81566Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 08:54:14 -0800
Message-ID: <CAMKF1spVu=iySrr0XZ9tDny3wUjgC7tU7cBrPpa98JGmiaxu2A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 03 Dec 2018 16:54:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 3, 2018 at 1:25 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> If you're going to push them to yp mirror, then please include the date i=
n the filename and adjust the recipe to use the same (this time not as down=
loadfilename parameter), that way you can update them again with the latest=
 (and last) version at the end of this year.
>

yes agreed.

> On Mon, Dec 3, 2018 at 3:38 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Dec 2, 2018 at 6:06 PM Changqing Li <changqing.li@windriver.com>=
 wrote:
>> >
>> >
>> > On 11/30/18 4:22 PM, Martin Jansa wrote:
>> >
>> > I think Khem meant http://sources.openembedded.org/ it returns 403, be=
cause listing is disabled, but the files are there.
>> >
>> > Thanks.  But  I cannot upload file to that website.  so I prefer use h=
ttp://downloads.yoctoproject.org/mirror/sources/ as SRC_URI.
>>
>> thats ok. Anywhere reliable is fine.
>>
>> >
>> > but currently,  it is like below, so I need patch 2 times to fix this.=
   1st,  correct the right checksum;
>> >
>> > 2nd,  correct SRC_URI to yocto mirror after it have correct file there=
.     Do you have any comments about work like this?
>> >
>> > GeoIP.dat.gz                                       27-Mar-2018 12:17  =
            711428
>> > GeoIPv6.dat.gz_bad-checksum_a908d7a51c3883eb8f6..> 13-Nov-2018 18:55  =
           1202833
>> > GeoIPv6.dat.gz_bad-checksum_b0f82334f94ca89872e..> 21-Nov-2018 00:42  =
           1207062
>>
>> Download the right tars and push them into yp mirror
>> then update the recipe to point to new location and update the
>> checksums at sam time.
>>
>> in your downloads directory rm -rf Geo*
>>
>> >
>> >
>> >
>> >
>> > On Fri, Nov 30, 2018 at 3:18 AM Changqing Li <changqing.li@windriver.c=
om> wrote:
>> >>
>> >>
>> >> On 11/29/18 9:55 AM, Khem Raj wrote:
>> >>
>> >> We have two options
>> >>
>> >> Download and rename may be add a date component and save it on source=
s.oe.org
>> >>
>> >> Hi,  I cannot open this website
>> >>
>> >>
>> >> Second option is to download the databases during build as temporary =
artifacts but this might cause reproducibility problems
>> >>
>> >> Either way it is going to have some issues
>> >> May be option 1 even though tedious can be better of two
>> >>
>> >> On Wed, Nov 28, 2018 at 5:31 PM Changqing Li <changqing.li@windriver.=
com> wrote:
>> >>>
>> >>> Khem and Marthin,
>> >>>
>> >>> The failure still caused by frequently changed checksum of the datab=
ase. I send the patch on 11.20.
>> >>>
>> >>> but the checksum changed on 1121, and it also changed on 1128, seems=
 like weekly change.
>> >>>
>> >>> but it should not failed if there is a premirror saved the
>> >>>
>> >>> Here is a result I get:
>> >>>
>> >>> $ md5sum 1128/*v6*
>> >>> d98a04eded0b08b945b5629106d58760  1128/GeoIPv6 (1).dat.gz
>> >>> 4d48c102ec68298b3fc7f57763455cb5  1128/GeoLiteCityv6.dat.gz
>> >>> $ md5sum 1121/*v6*
>> >>> b0f82334f94ca89872e7722db3511bb9  1121/GeoIPv6.dat.gz
>> >>> 50ad18a8a3ea4bba7c929bea6e22db75  1121/GeoLiteCityv6.dat.gz
>> >>> $ md5sum 1120/*v6*
>> >>> a908d7a51c3883eb8f693ca197c7a142  1120/GeoIPv6.dat.gz
>> >>> 8ac3506ccabaae7e9f7d6301c2654313  1120/GeoLiteCityv6.dat.gz
>> >>>
>> >>>
>> >>> On 11/28/18 3:14 AM, Martin Jansa wrote:
>> >>>
>> >>> I'm seeing different checksum than both your builder and the recipe.
>> >>>
>> >>> $ wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.da=
t.gz
>> >>> --2018-11-27 20:06:32--  http://geolite.maxmind.com/download/geoip/d=
atabase/GeoIPv6.dat.gz
>> >>> Resolving geolite.maxmind.com... 104.16.37.47, 104.16.38.47, 2606:47=
00::6810:252f, ...
>> >>> Connecting to geolite.maxmind.com|104.16.37.47|:80... connected.
>> >>> HTTP request sent, awaiting response... 200 OK
>> >>> Length: 1209046 (1.2M) [application/octet-stream]
>> >>> Saving to: =E2=80=98GeoIPv6.dat.gz=E2=80=99
>> >>>
>> >>> 2018-11-27 20:06:32 (10.3 MB/s) - =E2=80=98GeoIPv6.dat.gz=E2=80=99 s=
aved [1209046/1209046]
>> >>>
>> >>> $ md5sum GeoIPv6.dat.gz
>> >>> d98a04eded0b08b945b5629106d58760  GeoIPv6.dat.gz
>> >>>
>> >>> Is this the legacy archive? Because https://dev.maxmind.com/geoip/le=
gacy/geolite/ now shows following:
>> >>>
>> >>> Yes,  I have  pointed out this problem  the first time I changed the=
 checksum. maybe we should upgrade
>> >>>
>> >>> to geoip2,  and  drop current geoip1.6.  but I think even with geoip=
2,  since it's database still not version,
>> >>>
>> >>> maybe also will met similar problem.
>> >>>
>> >>>
>> >>> //changqing
>> >>>
>> >>>
>> >>> Updated versions of the GeoLite Legacy databases are now only availa=
ble to redistribution license customers, although anyone can continue to do=
wnload the March 2018 GeoLite Legacy builds. Starting January 2, 2019, the =
last build will be removed from our website. GeoLite Legacy database users =
will need to switch to the GeoLite2 or commercial GeoIP databases and updat=
e their integrations by January 2, 2019.
>> >>>
>> >>> For more information, please visit our Support Center.
>> >>>
>> >>> Note: After careful consideration, taking into account customer feed=
back, we have decided against removing latitude and longitude coordinates f=
rom the GeoLite2 databases. We are in the process of reviewing coordinates =
used in all of our GeoLite2 and GeoIP databases to ensure there is no risk =
of misuse.
>> >>>
>> >>> * GeoLite2 databases are free IP geolocation databases comparable to=
, but less accurate than, MaxMind=E2=80=99s GeoIP2 databases. Please rememb=
er to use the accuracy radius if displaying coordinates on a map.
>> >>>
>> >>> New Database Format Available: This page is for our GeoLite Legacy d=
atabases. For our latest database format, please visit our GeoLite2 Databas=
es page. We offer redistribution licenses for our newer GeoLite2 databases =
that will allow you to package the databases with your commercial products.=
 For more information, please visit the GeoLite2 Commercial Redistribution =
page.
>> >>>
>> >>>
>> >>> On Tue, Nov 27, 2018 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>>>
>> >>>> I am seeing errors on some builders
>> >>>>
>> >>>> http://errors.yoctoproject.org/Errors/Details/202341/
>> >>>> On Mon, Nov 19, 2018 at 11:29 PM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>> >>>> >
>> >>>> > Looks, good.
>> >>>> >
>> >>>> > Adding variable for 20181120 might help with maintenance (if we n=
eed to
>> >>>> > change just checksums in future). And with good variable name (or=
 a
>> >>>> > comment) it would also document in the recipe why we're using thi=
s in
>> >>>> > downloadfilename.
>> >>>> >
>> >>>> > On Tue, Nov 20, 2018 at 7:48 AM <changqing.li@windriver.com> wrot=
e:
>> >>>> >
>> >>>> > > From: Changqing Li <changqing.li@windriver.com>
>> >>>> > >
>> >>>> > > previous change of checksum don't trigger archive to re-downloa=
ded,
>> >>>> > > , which will cause checksum mismatch. add downloadfilename to
>> >>>> > > trigger re-download.
>> >>>> > >
>> >>>> > > 1. for user with PREMIRROR, another benefit is it can still com=
pile
>> >>>> > > success event upstream checksum change frequently.
>> >>>> > > 2. but for user don't use PREMIRROR, if upstream checksum chang=
ed,
>> >>>> > > still might have checksum mismatch problem.
>> >>>> > >
>> >>>> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> >>>> > > ---
>> >>>> > >  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
>> >>>> > > +++++++++++-----------
>> >>>> > >  1 file changed, 12 insertions(+), 12 deletions(-)
>> >>>> > >
>> >>>> > > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12=
.bb
>> >>>> > > b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> >>>> > > index 1e1a7ff..57f0b67 100644
>> >>>> > > --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> >>>> > > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> >>>> > > @@ -9,10 +9,10 @@ HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
>> >>>> > >  SECTION =3D "libdevel"
>> >>>> > >
>> >>>> > >  SRC_URI =3D "git://github.com/maxmind/geoip-api-c.git \
>> >>>> > > -
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCount=
ry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat
>> >>>> > > \
>> >>>> > > -
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.=
gz;apply=3Dno;name=3DGeoIPv6-dat
>> >>>> > > \
>> >>>> > > -
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.=
dat.gz;apply=3Dno;name=3DGeoLiteCity-dat
>> >>>> > > \
>> >>>> > > -
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv=
6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat
>> >>>> > > \
>> >>>> > > +
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCount=
ry/GeoIP.dat.gz;apply=3Dno;name=3DGeoIP-dat;downloadfilename=3DGeoIP.dat.20=
181120.gz
>> >>>> > > \
>> >>>> > > +
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.=
gz;apply=3Dno;name=3DGeoIPv6-dat;downloadfilename=3DGeoIPv6.dat.20181120.gz
>> >>>> > > \
>> >>>> > > +
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.=
dat.gz;apply=3Dno;name=3DGeoLiteCity-dat;downloadfilename=3DGeoLiteCity.dat=
.20181120.gz
>> >>>> > > \
>> >>>> > > +
>> >>>> > > http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv=
6-beta/GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat;downloadfil=
ename=3DGeoLiteCityv6.dat.20181120.gz
>> >>>> > > \
>> >>>> > >             file://run-ptest \
>> >>>> > >  "
>> >>>> > >  SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>> >>>> > > @@ -20,14 +20,14 @@ SRCREV =3D "4b526e7331ca1d692b74a0509ddcc72=
5622ed31a"
>> >>>> > >  SRC_URI[GeoIP-dat.md5sum] =3D "d538e57ad9268fdc7955c6cf9a37c4a=
9"
>> >>>> > >  SRC_URI[GeoIP-dat.sha256sum] =3D
>> >>>> > > "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae04=
49"
>> >>>> > >
>> >>>> > > -SRC_URI[GeoIPv6-dat.md5sum] =3D "00dc3b3f53eb5f7bf6915f939998f=
12c"
>> >>>> > > -SRC_URI[GeoIPv6-dat.sha256sum] =3D
>> >>>> > > "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d14=
80"
>> >>>> > > +SRC_URI[GeoIPv6-dat.md5sum] =3D "a908d7a51c3883eb8f693ca197c7a=
142"
>> >>>> > > +SRC_URI[GeoIPv6-dat.sha256sum] =3D
>> >>>> > > "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c27=
10"
>> >>>> > >
>> >>>> > >  SRC_URI[GeoLiteCity-dat.md5sum] =3D "d700c137232f8e077ac8db857=
7f699d9"
>> >>>> > >  SRC_URI[GeoLiteCity-dat.sha256sum] =3D
>> >>>> > > "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4=
cd"
>> >>>> > >
>> >>>> > > -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "7f6333d433d8127181ea3c5=
828287c98"
>> >>>> > > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>> >>>> > > "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42a=
c7"
>> >>>> > > +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "8ac3506ccabaae7e9f7d630=
1c2654313"
>> >>>> > > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>> >>>> > > "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa85=
06"
>> >>>> > >
>> >>>> > >  LICENSE =3D "LGPL-2.1"
>> >>>> > >
>> >>>> > > @@ -44,10 +44,10 @@ EXTRA_OECONF =3D "--disable-static         =
      \
>> >>>> > >  do_install() {
>> >>>> > >      make DESTDIR=3D${D} install
>> >>>> > >      install -d ${D}/${datadir}/GeoIP
>> >>>> > > -    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
>> >>>> > > -    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
>> >>>> > > -    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
>> >>>> > > -    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP=
/
>> >>>> > > +    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoI=
P/GeoIP.dat
>> >>>> > > +    install ${WORKDIR}/GeoIPv6.dat.20181120
>> >>>> > > ${D}/${datadir}/GeoIP/GeoIPv6.dat
>> >>>> > > +    install ${WORKDIR}/GeoLiteCity.dat.20181120
>> >>>> > > ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>> >>>> > > +    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
>> >>>> > > ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>> >>>> > >      ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>> >>>> > >  }
>> >>>> > >
>> >>>> > > --
>> >>>> > > 2.7.4
>> >>>> > >
>> >>>> > > --
>> >>>> > > _______________________________________________
>> >>>> > > Openembedded-devel mailing list
>> >>>> > > Openembedded-devel@lists.openembedded.org
>> >>>> > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
>> >>>> > >
>> >>>> > --
>> >>>> > _______________________________________________
>> >>>> > Openembedded-devel mailing list
>> >>>> > Openembedded-devel@lists.openembedded.org
>> >>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >>>
>> >>> --
>> >>> BRs
>> >>>
>> >>> Sandy(Li Changqing)
>> >>
>> >> --
>> >> BRs
>> >>
>> >> Sandy(Li Changqing)
>> >
>> > --
>> > BRs
>> >
>> > Sandy(Li Changqing)

