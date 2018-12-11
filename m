Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id AEC3E6C497
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 09:21:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id s14so1399060wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 01:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7RbaCbE2BMjF1YjC6QNSGdQNVymB5Faub0Ieg+bvIyI=;
	b=C35LQ5wvV2pzljvMDqSQqpXX0O6tLtf1AUbiyVVSSMHbYs36/9dV+5YEuJKhCf1MmU
	4BqtAOVTDrEoguWm/FaQxX+/3NO2AHkqrOQZyyCVgL0koGZYWAyUkUrU8c2j/oV9YsAn
	sAlve2hMhRVF0AwsZt6mRbAkAT7BahIVwEkyCI16lltCfqF8B4BSW6Ko3tOjlzP/vejN
	gm5gr0aQo584jGNapwWYeRPO6mWvHDaXGH5uzh0+r+4sHCBG7EYF4uTrrpQuTKJ6mA2E
	6PcrkQmUFxvZSdKs+0ftgrtwvhPG8HNPeCw4l/v/OQvyyXjmOWU23XmZbSPb+xqrIwTT
	GyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7RbaCbE2BMjF1YjC6QNSGdQNVymB5Faub0Ieg+bvIyI=;
	b=DJVTKlIZ0yw5oOc6O2KicDy6Q1Z1cipjQKuhEOIDd5fuoPTENozhHCuLdxsfgVmEHY
	U0tCib7JFukvR14mtCIPNYMh6hYD3DCs824Xp6euwm31xPpfrTSh3WXJ5P6uiMtWhEGX
	rH2EUhjoiIM9SysshtwlJzb5+8jUnSByzzQjvYNhbNCOFIDQZ0FRgZ3uWIZApo9qIoEM
	07E+dxu3aQJRJzQZoeZWL9SgVKqD1Wnwu218+p9v52v+Y86RNWF601MFXXPlmW6PHh9U
	R+OAOXLs2P+ZCOTg5RySXEz+OV8nGbR43YzWoqct6dX4C9Z+2OGjGBu4l7ecdYWj8hGL
	1CjA==
X-Gm-Message-State: AA+aEWapK1FJlvFFALfFKZoFVTkZB8z4ebVm0+s4xBxhFpkp7RG6Hye7
	xVZNmk+3851q6TcE2X294ceX4VsV0cDOZDcpQfY=
X-Google-Smtp-Source: AFSGD/XuhdZhO406BkbrjoMRagwNLHDIAPUdNfuqd53CnbBHDiyQmwmwA/hNVYkbT0GGEAf+JTJQvgtKe8seap9G8Cs=
X-Received: by 2002:a1c:3489:: with SMTP id b131mr1545646wma.44.1544520073408; 
	Tue, 11 Dec 2018 01:21:13 -0800 (PST)
MIME-Version: 1.0
References: <1543997256-46343-1-git-send-email-changqing.li@windriver.com>
	<24c4dd68-8e62-dd2b-357f-d6e5a9ce833f@windriver.com>
In-Reply-To: <24c4dd68-8e62-dd2b-357f-d6e5a9ce833f@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Dec 2018 10:21:05 +0100
Message-ID: <CA+chaQeaEWUr36Gn1YMuSRebyNQBFd0k-hW3k5rcxjvXb1xisA@mail.gmail.com>
To: changqing.li@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2] geoip: update geolite database checksum
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
X-List-Received-Date: Tue, 11 Dec 2018 09:21:13 -0000
Content-Type: text/plain; charset="UTF-8"

http://downloads.yoctoproject.org/mirror/sources/ is updated only by Yocto
autobuilder which doesn't include meta-oe layers.

Someone will need to upload it there manually.

http://sources.openembedded.org is the one updated by world builds Khem is
running.

On Tue, Dec 11, 2018 at 6:26 AM Changqing Li <changqing.li@windriver.com>
wrote:

> Hi,  Khem and Martin
>
> I noticed Khem have merge this patch to master yesterday,  but the
> mirror on http://downloads.yoctoproject.org/mirror/sources/
>
> still not generated yet, do you know how to trigger the build and
> generate a mirror on above link?   I think the checksum will change
>
> again tomorrow,  seem we don't have time to change SRC_URI to the
> http://downloads.yoctoproject.org/mirror/sources/, :-(
>
>
> On 12/5/18 4:07 PM, changqing.li@windriver.com wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Geolite database checksum changed today, so update it
> > to the lastest one.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   .../recipes-support/geoip/geoip_1.6.12.bb          | 26
> ++++++++++++----------
> >   1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > index 57f0b67..c3ce4d8 100644
> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > @@ -8,11 +8,13 @@ using reverse DNS lookups."
> >   HOMEPAGE = "http://dev.maxmind.com/geoip/"
> >   SECTION = "libdevel"
> >
> > +GEOIP_DATABASE_VERSION = "20181205"
> > +
> >   SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
> > -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz
> \
> > -
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz
> \
> > -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz
> \
> > -
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz
> \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz
> \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz
> \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz
> \
> > +
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz
> \
> >              file://run-ptest \
> >   "
> >   SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> > @@ -20,14 +22,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> >   SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
> >   SRC_URI[GeoIP-dat.sha256sum] =
> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
> >
> > -SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
> > -SRC_URI[GeoIPv6-dat.sha256sum] =
> "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
> > +SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
> > +SRC_URI[GeoIPv6.sha256sum] =
> "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
> >
> >   SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
> >   SRC_URI[GeoLiteCity-dat.sha256sum] =
> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
> >
> > -SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
> > -SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
> > +SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
> > +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
> "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
> >
> >   LICENSE = "LGPL-2.1"
> >
> > @@ -44,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
> >   do_install() {
> >       make DESTDIR=${D} install
> >       install -d ${D}/${datadir}/GeoIP
> > -    install ${WORKDIR}/GeoIP.dat.20181120
> ${D}/${datadir}/GeoIP/GeoIP.dat
> > -    install ${WORKDIR}/GeoIPv6.dat.20181120
> ${D}/${datadir}/GeoIP/GeoIPv6.dat
> > -    install ${WORKDIR}/GeoLiteCity.dat.20181120
> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> > -    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
> > +    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION}
> ${D}/${datadir}/GeoIP/GeoIP.dat
> > +    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}
> ${D}/${datadir}/GeoIP/GeoIPv6.dat
> > +    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}
> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
> > +    install ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}
> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
> >       ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
> >   }
> >
>
> --
> BRs
>
> Sandy(Li Changqing)
>
>

