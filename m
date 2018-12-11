Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3E26BC9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:09:52 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q1so8736027qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 07:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TbYjtbAUUw7ttkzlcIfXj8+LNhvJ6f7jl/TyV/HyZ18=;
	b=U0pXT1M20ipAdB8j3AXBF3wHqfWjPSC7iAe9fDWTIq3kZRYnb/webWIyYYgQ3RTnRZ
	kBe9LNfstgPINGxP01P2CtZ5Crzgs3MU0sfp7O10NxdgSfaAkPNF8ew7b6CmAyJ7+7/d
	wqSbcmwVGiyKI/QEGmhi0lIlUdRZ/vwv6811MuhAKkY5zCCKEMgisE6C3vmhdjltjz3u
	KemLYuGMH9ZVkFAV3OK2mqk4DFWsyM2VJM8ccysJHj5kh46uqPDxUoyLKrL7e/23omMB
	rzQ4L9T52n9wYihS97FMCJ/EI+tm+YgjNpdsC2jbHF8MFFAj8Yaz+LNnxO7gXiteYht4
	dw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TbYjtbAUUw7ttkzlcIfXj8+LNhvJ6f7jl/TyV/HyZ18=;
	b=T2TDJLjTjSRNimjfEuFzIjndLdkUm8Yun5E2gwURSjYhQZwnn4Bou2WKW7RXaTQb3A
	70WpuNtPmKpSbmVOYbYs35VnoS3k9lEJfBT8zxih7WcKnbUh2XAwkLFheWG8OnJPbYUY
	zrfmHJweaKFriQNo4U+6Bd794dLYak5y0lH9uuXLzUceDj3i795tlwaZ7pQBBgK8UyHb
	KEOuxA9O9effO16yEjc5Es32Xc7nFR8t4mFtVnSTdWHSCcdIy+lOmJIhnabw6MZzSdL6
	R7qHWzTwZg37RKUUrxqwfAmWk+HBj5shtCdtjMxuWnELa5jPhwnv3HLfoqV+kNyfcv04
	yRdw==
X-Gm-Message-State: AA+aEWa+xb3eJkcsX7jtEpFfhB9QqPiR9Lti1YTt7D82WtVmfAUQTSsB
	JBkIoHH4QeNNLo5UFP+ZaYM80T8mjtvkL77jUJQ=
X-Google-Smtp-Source: AFSGD/UU4ngmfObG1XhOuHm2vplkPhIwYjcKWIjjt2DitKrTC0BllxhUq08xUH2lJN63cXQZUc54yaej+IC3FAQ2cO8=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr15359463qke.2.1544540993219; 
	Tue, 11 Dec 2018 07:09:53 -0800 (PST)
MIME-Version: 1.0
References: <1543997256-46343-1-git-send-email-changqing.li@windriver.com>
	<24c4dd68-8e62-dd2b-357f-d6e5a9ce833f@windriver.com>
	<CA+chaQeaEWUr36Gn1YMuSRebyNQBFd0k-hW3k5rcxjvXb1xisA@mail.gmail.com>
	<02491310-20e8-39d6-78d6-2536d664e5e6@windriver.com>
In-Reply-To: <02491310-20e8-39d6-78d6-2536d664e5e6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Dec 2018 07:09:26 -0800
Message-ID: <CAMKF1soEqsNpW+rX6+ySrgCHXSMrsfjQVmCBYao_+koxiBax+w@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 11 Dec 2018 15:09:52 -0000
Content-Type: text/plain; charset="UTF-8"

adding Michael
On Tue, Dec 11, 2018 at 1:47 AM Changqing Li <changqing.li@windriver.com> wrote:
>
> On 12/11/18 5:21 PM, Martin Jansa wrote:
>
> http://downloads.yoctoproject.org/mirror/sources/ is updated only by Yocto autobuilder which doesn't include meta-oe layers.
>
> Someone will need to upload it there manually.
>
> http://sources.openembedded.org is the one updated by world builds Khem is running.
>
> Thanks.
>
> Khem, can you help to check if there is already a mirror on http://sources.openembedded.org?
>
> I cannot see it,   403 forbidden.   if it is there,  maybe we can change SRC_URI point to there.
>
>
> On Tue, Dec 11, 2018 at 6:26 AM Changqing Li <changqing.li@windriver.com> wrote:
>>
>> Hi,  Khem and Martin
>>
>> I noticed Khem have merge this patch to master yesterday,  but the
>> mirror on http://downloads.yoctoproject.org/mirror/sources/
>>
>> still not generated yet, do you know how to trigger the build and
>> generate a mirror on above link?   I think the checksum will change
>>
>> again tomorrow,  seem we don't have time to change SRC_URI to the
>> http://downloads.yoctoproject.org/mirror/sources/, :-(
>>
>>
>> On 12/5/18 4:07 PM, changqing.li@windriver.com wrote:
>> > From: Changqing Li <changqing.li@windriver.com>
>> >
>> > Geolite database checksum changed today, so update it
>> > to the lastest one.
>> >
>> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> > ---
>> >   .../recipes-support/geoip/geoip_1.6.12.bb          | 26 ++++++++++++----------
>> >   1 file changed, 14 insertions(+), 12 deletions(-)
>> >
>> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > index 57f0b67..c3ce4d8 100644
>> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>> > @@ -8,11 +8,13 @@ using reverse DNS lookups."
>> >   HOMEPAGE = "http://dev.maxmind.com/geoip/"
>> >   SECTION = "libdevel"
>> >
>> > +GEOIP_DATABASE_VERSION = "20181205"
>> > +
>> >   SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
>> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.20181120.gz \
>> > -           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.20181120.gz \
>> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.20181120.gz \
>> > -           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.20181120.gz \
>> > +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz;apply=no;name=GeoIP-dat;downloadfilename=GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz \
>> > +           http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat;downloadfilename=GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz \
>> > +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;apply=no;name=GeoLiteCity-dat;downloadfilename=GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz \
>> > +           http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat;downloadfilename=GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz \
>> >              file://run-ptest \
>> >   "
>> >   SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>> > @@ -20,14 +22,14 @@ SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>> >   SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>> >   SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>> >
>> > -SRC_URI[GeoIPv6-dat.md5sum] = "a908d7a51c3883eb8f693ca197c7a142"
>> > -SRC_URI[GeoIPv6-dat.sha256sum] = "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>> > +SRC_URI[GeoIPv6-dat.md5sum] = "52d6aa0aac1adbfa5eb7fa4742197c11"
>> > +SRC_URI[GeoIPv6.sha256sum] = "416ac92fcc35a21d5efbb32e5c88e609c37aec1aa1af6247d088b8da1af6e9bf"
>> >
>> >   SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
>> >   SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>> >
>> > -SRC_URI[GeoLiteCityv6-dat.md5sum] = "8ac3506ccabaae7e9f7d6301c2654313"
>> > -SRC_URI[GeoLiteCityv6-dat.sha256sum] = "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>> > +SRC_URI[GeoLiteCityv6-dat.md5sum] = "6734ccdc644fc0ba76eb276dce73d005"
>> > +SRC_URI[GeoLiteCityv6-dat.sha256sum] = "c95a9d2643b7f53d7abeed2114388870e13fbbad4653f450a49efa7e4b86aca4"
>> >
>> >   LICENSE = "LGPL-2.1"
>> >
>> > @@ -44,10 +46,10 @@ EXTRA_OECONF = "--disable-static               \
>> >   do_install() {
>> >       make DESTDIR=${D} install
>> >       install -d ${D}/${datadir}/GeoIP
>> > -    install ${WORKDIR}/GeoIP.dat.20181120 ${D}/${datadir}/GeoIP/GeoIP.dat
>> > -    install ${WORKDIR}/GeoIPv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoIPv6.dat
>> > -    install ${WORKDIR}/GeoLiteCity.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>> > -    install ${WORKDIR}/GeoLiteCityv6.dat.20181120 ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>> > +    install ${WORKDIR}/GeoIP.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIP.dat
>> > +    install ${WORKDIR}/GeoIPv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoIPv6.dat
>> > +    install ${WORKDIR}/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>> > +    install ${WORKDIR}/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION} ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>> >       ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>> >   }
>> >
>>
>> --
>> BRs
>>
>> Sandy(Li Changqing)
>>
> --
> BRs
>
> Sandy(Li Changqing)

