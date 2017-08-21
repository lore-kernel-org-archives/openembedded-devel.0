Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF4B606A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 09:51:11 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id l132so2372222vke.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 02:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jv6llU6MlNXUroh1jZOubZhpV+I2LrazAcFxs5DLS60=;
	b=SPWV72Mkd6WFKSbpWuQ2EB///NmZr+Vm+JugsiLvSMb1N93p5gmLFPU+t6C5wTAqER
	sJW1EXkseTPetzdNc+JRlAqG8hL8Fk0tg9JNqaMQRded8I2544GkjHHpbS3mhQKCbzi8
	JylYZaXeeJS7VCSCVGaP4uo68LinXwV8XCJsBy3oIXMjdHwbw8ZTPJQRMPMQp8+a7hp7
	dUVyJLsARfjUz2tBThy+ZdZHOvCK1n2H/ppFYhJWdljLNN8XoYJE894OiLZC3FDCWbeP
	dqKa7PHBjExu2xjWzlOuML6KFjSzve/F6RMVnRpHFFu2WauliogiUK9Ov0txbmTf5mjX
	xQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jv6llU6MlNXUroh1jZOubZhpV+I2LrazAcFxs5DLS60=;
	b=Aa0LF9D6fFiYpmWAoAtp5Cq889dfCuojlSOhc57JRuDADiOKMPatB2PtzGXN/DppHA
	Yku7PUH0iZTtp6pXkGD6QUK2cUoM9wMrEDleBUnRg3fsuSxy2wvSIGrpsFvUa8w+wggp
	HiLcgZl9zzXzgP2xFO1U+3/xb//9TpuUHI/ov0/CEN/mBDvHum+kF7qog97qmLKfZWOs
	5MHTMQs34C+zubasFhtRERhWK8iH4hfNUiHB3khIITGhPuXFCg2tJSJuDpJ7s88UxLdH
	bNbt+BRdD+yB8R4BMMyBAvjLyYIJSUoJomiBswU9dfayf2CYMOjFa6f5vXVY+YD7qRIz
	WFKg==
X-Gm-Message-State: AHYfb5i0VZiAvbvq2utDSNvX6VJ/g2R9rxi0HEU9ApA/F3+HhWdxspt6
	DowZQ1bXZRQMJbgAxx28d9hWvoxhjw==
X-Received: by 10.31.150.6 with SMTP id y6mr10040081vkd.1.1503309072525; Mon,
	21 Aug 2017 02:51:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 02:51:11 -0700 (PDT)
In-Reply-To: <CA+chaQcraxF5yR0VxAF073p9AxZsNM9285iNg+Gmpy+rrPcbXw@mail.gmail.com>
References: <20170817122733.5027-1-matt.hoosier@gmail.com>
	<CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
	<CA+chaQcraxF5yR0VxAF073p9AxZsNM9285iNg+Gmpy+rrPcbXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 11:51:11 +0200
Message-ID: <CA+chaQdGg=KHt+YfpodkUmKKhe4kVdouETmaFoGrYiK13+uutA@mail.gmail.com>
To: Matt Hoosier <matt.hoosier@garmin.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: fix Krogoth build regression from efa8aaf
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
X-List-Received-Date: Mon, 21 Aug 2017 09:51:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I know it's not caused by this change, but it still creates "foodummy" file
in ${TOPDIR} can we please get rid of it or at least move it somewhere else
like ${WORKDIR}?

On Sat, Aug 19, 2017 at 5:07 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Nothing from me yet, it's included in master-next for my next bitbake
> world builds to test it, but first I need to resolve other issues in
> meta-qt5.
>
> On Sat, Aug 19, 2017 at 2:55 PM, Matt Hoosier <matt.hoosier@garmin.com>
> wrote:
>
>> On Thu, Aug 17, 2017 at 7:27 AM, Matt Hoosier <matt.hoosier@gmail.com>
>> wrote:
>> >
>> > From: Matt Hoosier <matt.hoosier@garmin.com>
>> >
>> > With
>> >
>> >     commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
>> >     Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> >     Date:   Thu Feb  9 00:26:09 2017
>> >
>> >     qmake5_base.bbclass: set qt.conf by environment variable again
>> >
>> > we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
>> > instead directed it to a path which was intended not to exist.
>> >
>> > The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
>> > to build again after Qt 5.8 started paying attention to the
>> > contents of this file.
>> >
>> > The change as done in efa8aaf works well enough for Morty and
>> > subsequent releases' copies of Bitbake, but fails on earlier
>> > releases because they lack the following change:
>> >
>> >     commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
>> >     Author: Ross Burton <ross.burton@intel.com>
>> >     Date: 2016-07-14 13:56:22
>> >
>> >     bitbake: build: don't use $B as the default cwd for functions
>> >
>> > The result is that when we build with Krogoth or prior, the body
>> > of do_generate_qt_config_file() runs with a cwd of ${B}, which was
>> > _not_ the intent of efa8aaf. Because the working directory is ${B},
>> > ${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
>> > whose cwd is by design also ${B} -- then finds the file 'foodummy',
>> > and the build breaks for the reasons outlined in efa8aaf.
>> >
>> > This change simply shifts the implementation tactics to suppress
>> > the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rely
>> > on unspecified behavior about the cwd of do_generate_qt_config_file().
>> >
>> > (cherry picked from commit a17ff281aa8d99f770b0a049cb798235005fb93e
>> > at https://codereview.qt-project.org/yocto/meta-qt5.)
>> > ---
>> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>> >  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
>> >  recipes-qt/qt5/qtbase_git.bb           | 2 +-
>> >  3 files changed, 3 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
>> nativesdk-qtbase_git.bb
>> > index f2ff5f7..ffbb917 100644
>> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> > @@ -94,7 +94,7 @@ OE_QMAKE_PATH_HOST_LIBS =3D "${libdir}"
>> >
>> >  # for qtbase configuration we need default settings
>> >  # since we cannot set empty set filename to a not existent file
>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>> > +deltask generate_qt_config_file
>> >
>> >  do_configure() {
>> >      ${S}/configure -v \
>> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
>> qtbase-native_git.bb
>> > index 98cbecc..0884a19 100644
>> > --- a/recipes-qt/qt5/qtbase-native_git.bb
>> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> > @@ -79,7 +79,7 @@ PACKAGECONFIG_CONFARGS =3D " \
>> >
>> >  # for qtbase configuration we need default settings
>> >  # since we cannot set empty set filename to a not existent file
>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>> > +deltask generate_qt_config_file
>> >
>> >  do_configure_prepend() {
>> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-dev=
ice-extra.pri:
>> No such file or directory"
>> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
>> qtbase_git.bb
>> > index 5cfbcfa..a2e8917 100644
>> > --- a/recipes-qt/qt5/qtbase_git.bb
>> > +++ b/recipes-qt/qt5/qtbase_git.bb
>> > @@ -137,7 +137,7 @@ QT_CONFIG_FLAGS +=3D " \
>> >
>> >  # for qtbase configuration we need default settings
>> >  # since we cannot set empty set filename to a not existent file
>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>> > +deltask generate_qt_config_file
>> >
>> >  do_configure() {
>> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-dev=
ice-extra.pri:
>> No such file or directory" during configuration
>> > --
>> > 2.12.0
>> >
>>
>> Any comments?
>>
>
>

