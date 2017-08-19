Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3D18F65CC7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 15:07:21 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id k43so43900657uaf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b/0GqV/BETY5X1gFTooLAy1W1+gZShTAP5t2jI4jr1Q=;
	b=rIszTmhWAgm1Eu6wl2d/PmSdHaqpdYfcmMXrKKhSwLqgEgCYQds/Flmp3L2nCAZ1ry
	uvaj8W/xx2ylZjcfG3qmDvIDnJG7LhL9jGKsG2XAtF8mGNllvWa0bE7u2XePszHVFeFA
	GkfIvGi3QG9bvHV3IVHC+dAC/ZKMjaHny4XN6ZBO8/WxXQzuObXcQiC7nk/HPLsrTCwB
	sj2CJ0mNljwelH1xRpqIKMggbhjiNbXopb9R/phzQI+OHn1mN7v8mSLCBsxeoOAEK88G
	wOYyC+hemTn03h480iBRE+fVcWXUk7lQTEiS5bVYRc5RdzVNTKnxbxcIHqL3RXiQxQHp
	cQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b/0GqV/BETY5X1gFTooLAy1W1+gZShTAP5t2jI4jr1Q=;
	b=YVsxtztgVA9/DKBrnTz4/w0htLeOCqGBHwCj7n9spfaO+cKXZy45k4VOLQRcEfWRiI
	T5YfOVgxaLObJLOoxNVQD3WGDgH3BYBabFppL5oMiY9EpcLdjbZcUJ6+Ozefc9DA4N+h
	pQi+8WZNsKF0b7HUg3mMJn2v66a1wQMtdWypjTCamcN5uCqLT94GDKF3Y+xIb9OSWIMF
	J3QAPpigSSpebHIq/1FNDz9j1nAoOjs/jip+WtM09GmOcKfSHyoh13cSQk26oo+NcJvD
	UKxADtpBkZNh3Ogf4yrJBowmMvqDAYEKqobE7FLU+vdWaUQECYh/RXyLJI9P1l88W1Sl
	WIng==
X-Gm-Message-State: AHYfb5hFWYFzhmAfFqLABpFkwrFyaIlLEEzkLskt6Sdu1UgP7e36Aolz
	jAOOibxHhMhw7hL0D4Xkm/0gwEr/+w==
X-Received: by 10.176.1.55 with SMTP id 52mr8823146uak.160.1503155242440; Sat,
	19 Aug 2017 08:07:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sat, 19 Aug 2017 08:07:21 -0700 (PDT)
In-Reply-To: <CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
References: <20170817122733.5027-1-matt.hoosier@gmail.com>
	<CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 Aug 2017 17:07:21 +0200
Message-ID: <CA+chaQcraxF5yR0VxAF073p9AxZsNM9285iNg+Gmpy+rrPcbXw@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Aug 2017 15:07:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nothing from me yet, it's included in master-next for my next bitbake world
builds to test it, but first I need to resolve other issues in meta-qt5.

On Sat, Aug 19, 2017 at 2:55 PM, Matt Hoosier <matt.hoosier@garmin.com>
wrote:

> On Thu, Aug 17, 2017 at 7:27 AM, Matt Hoosier <matt.hoosier@gmail.com>
> wrote:
> >
> > From: Matt Hoosier <matt.hoosier@garmin.com>
> >
> > With
> >
> >     commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
> >     Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >     Date:   Thu Feb  9 00:26:09 2017
> >
> >     qmake5_base.bbclass: set qt.conf by environment variable again
> >
> > we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
> > instead directed it to a path which was intended not to exist.
> >
> > The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
> > to build again after Qt 5.8 started paying attention to the
> > contents of this file.
> >
> > The change as done in efa8aaf works well enough for Morty and
> > subsequent releases' copies of Bitbake, but fails on earlier
> > releases because they lack the following change:
> >
> >     commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
> >     Author: Ross Burton <ross.burton@intel.com>
> >     Date: 2016-07-14 13:56:22
> >
> >     bitbake: build: don't use $B as the default cwd for functions
> >
> > The result is that when we build with Krogoth or prior, the body
> > of do_generate_qt_config_file() runs with a cwd of ${B}, which was
> > _not_ the intent of efa8aaf. Because the working directory is ${B},
> > ${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
> > whose cwd is by design also ${B} -- then finds the file 'foodummy',
> > and the build breaks for the reasons outlined in efa8aaf.
> >
> > This change simply shifts the implementation tactics to suppress
> > the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rely
> > on unspecified behavior about the cwd of do_generate_qt_config_file().
> >
> > (cherry picked from commit a17ff281aa8d99f770b0a049cb798235005fb93e
> > at https://codereview.qt-project.org/yocto/meta-qt5.)
> > ---
> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
> >  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
> >  recipes-qt/qt5/qtbase_git.bb           | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
> nativesdk-qtbase_git.bb
> > index f2ff5f7..ffbb917 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
> > @@ -94,7 +94,7 @@ OE_QMAKE_PATH_HOST_LIBS =3D "${libdir}"
> >
> >  # for qtbase configuration we need default settings
> >  # since we cannot set empty set filename to a not existent file
> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> > +deltask generate_qt_config_file
> >
> >  do_configure() {
> >      ${S}/configure -v \
> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
> qtbase-native_git.bb
> > index 98cbecc..0884a19 100644
> > --- a/recipes-qt/qt5/qtbase-native_git.bb
> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
> > @@ -79,7 +79,7 @@ PACKAGECONFIG_CONFARGS =3D " \
> >
> >  # for qtbase configuration we need default settings
> >  # since we cannot set empty set filename to a not existent file
> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> > +deltask generate_qt_config_file
> >
> >  do_configure_prepend() {
> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-devi=
ce-extra.pri:
> No such file or directory"
> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.b=
b
> > index 5cfbcfa..a2e8917 100644
> > --- a/recipes-qt/qt5/qtbase_git.bb
> > +++ b/recipes-qt/qt5/qtbase_git.bb
> > @@ -137,7 +137,7 @@ QT_CONFIG_FLAGS +=3D " \
> >
> >  # for qtbase configuration we need default settings
> >  # since we cannot set empty set filename to a not existent file
> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
> > +deltask generate_qt_config_file
> >
> >  do_configure() {
> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-devi=
ce-extra.pri:
> No such file or directory" during configuration
> > --
> > 2.12.0
> >
>
> Any comments?
>

