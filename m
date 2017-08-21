Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B056778285
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 18:32:02 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y129so24884987pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 11:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e5dlDE9aty7F2fEuPyMgpq6GfOSNB8ZQIered0PrYz0=;
	b=lYsaf80u17OGv38Az8W9bzqiCBROqchLzqYYYXy8V+JfidUQ7YDk7KHjO1H6iH4EnO
	WkRyEn+MXREVY8ecjPXqIxDuFA2WJ4ILnSC2dAN4/9a5K+kJNovVox545OTsuS41W2IY
	ifCuS8L8/XgjyNazTUkJE4GjvIEJ23LkZ6PZB3Re4+CzmsG7MMmGphtwoDkyaDkBFjlp
	DiR2GHv4AzqfcrUtgVhTzh/Gt4ISoHf0Pay5HpGjUxRxXI4pHz3p2ZW7O7TfIaah3gH9
	46Ck37QdHXsV0ZJLJuMU5oa5Gu57avDhUsYBjEtCiW0DRzXB1TD2s2eCWyd0d7hxktov
	i9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e5dlDE9aty7F2fEuPyMgpq6GfOSNB8ZQIered0PrYz0=;
	b=tE5Gfh5AjoBYK+IfFuOsHjGEv8hPYWSmIOAsYJRdXc98zHgddsx9Ln8ziBNyPanq1k
	3PiuTAumFVfu2lN5hwktCGDf3viB5E1yYtzkKTD38tZLDhJqJDQ1gRvK4Q5JpQs2c3BG
	i12dKgZS4FBXwTOlGqLLP+XMUP6KO0FPVo4pVnogJHj0O6JJBgO+ZbRtAXtzQPeKzal2
	MERJGQe5fMkI005lMTZLA4tEwbFnenvymGozDZ8AKF9zkEtuRuO2ah/RCd9cC62uOW6C
	Olk6OGBto5imi6wwRDDrrw+DByrB18idD0cpLpfcgDduBYEVg6kENjL3thrfMV3NgGm3
	7KDg==
X-Gm-Message-State: AHYfb5inyoF1ozpe4p9P2dyIJefn1zdB7QBN4szLBdNLTuoW7XLkEVSG
	xVjznmgyqpP6d4ncz34D8Ikmgp8GWA==
X-Received: by 10.99.141.76 with SMTP id z73mr3981874pgd.288.1503340323895;
	Mon, 21 Aug 2017 11:32:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 21 Aug 2017 11:31:33 -0700 (PDT)
In-Reply-To: <CA+chaQdGg=KHt+YfpodkUmKKhe4kVdouETmaFoGrYiK13+uutA@mail.gmail.com>
References: <20170817122733.5027-1-matt.hoosier@gmail.com>
	<CAJgxT3_Qy3DmcGznf3SdRXfis3qBxXSHPYMrLqdW6r+Tjy0ftQ@mail.gmail.com>
	<CA+chaQcraxF5yR0VxAF073p9AxZsNM9285iNg+Gmpy+rrPcbXw@mail.gmail.com>
	<CA+chaQdGg=KHt+YfpodkUmKKhe4kVdouETmaFoGrYiK13+uutA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Aug 2017 11:31:33 -0700
Message-ID: <CAMKF1sqZaqKK8SD9SqENfDNozCQtmqae4h3YMVOoYcMrfLKDeg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Matt Hoosier <matt.hoosier@garmin.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 21 Aug 2017 18:32:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2017 at 2:51 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> I know it's not caused by this change, but it still creates "foodummy" fi=
le
> in ${TOPDIR} can we please get rid of it or at least move it somewhere el=
se
> like ${WORKDIR}?

ah thats where it comes from, I was wondering if its some of my workspace
tooling doing this. But thanks now I will less annoyed to see it.

>
> On Sat, Aug 19, 2017 at 5:07 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Nothing from me yet, it's included in master-next for my next bitbake
>> world builds to test it, but first I need to resolve other issues in
>> meta-qt5.
>>
>> On Sat, Aug 19, 2017 at 2:55 PM, Matt Hoosier <matt.hoosier@garmin.com>
>> wrote:
>>
>>> On Thu, Aug 17, 2017 at 7:27 AM, Matt Hoosier <matt.hoosier@gmail.com>
>>> wrote:
>>> >
>>> > From: Matt Hoosier <matt.hoosier@garmin.com>
>>> >
>>> > With
>>> >
>>> >     commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
>>> >     Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> >     Date:   Thu Feb  9 00:26:09 2017
>>> >
>>> >     qmake5_base.bbclass: set qt.conf by environment variable again
>>> >
>>> > we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
>>> > instead directed it to a path which was intended not to exist.
>>> >
>>> > The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
>>> > to build again after Qt 5.8 started paying attention to the
>>> > contents of this file.
>>> >
>>> > The change as done in efa8aaf works well enough for Morty and
>>> > subsequent releases' copies of Bitbake, but fails on earlier
>>> > releases because they lack the following change:
>>> >
>>> >     commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
>>> >     Author: Ross Burton <ross.burton@intel.com>
>>> >     Date: 2016-07-14 13:56:22
>>> >
>>> >     bitbake: build: don't use $B as the default cwd for functions
>>> >
>>> > The result is that when we build with Krogoth or prior, the body
>>> > of do_generate_qt_config_file() runs with a cwd of ${B}, which was
>>> > _not_ the intent of efa8aaf. Because the working directory is ${B},
>>> > ${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
>>> > whose cwd is by design also ${B} -- then finds the file 'foodummy',
>>> > and the build breaks for the reasons outlined in efa8aaf.
>>> >
>>> > This change simply shifts the implementation tactics to suppress
>>> > the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rel=
y
>>> > on unspecified behavior about the cwd of do_generate_qt_config_file()=
.
>>> >
>>> > (cherry picked from commit a17ff281aa8d99f770b0a049cb798235005fb93e
>>> > at https://codereview.qt-project.org/yocto/meta-qt5.)
>>> > ---
>>> >  recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
>>> >  recipes-qt/qt5/qtbase-native_git.bb    | 2 +-
>>> >  recipes-qt/qt5/qtbase_git.bb           | 2 +-
>>> >  3 files changed, 3 insertions(+), 3 deletions(-)
>>> >
>>> > diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/
>>> nativesdk-qtbase_git.bb
>>> > index f2ff5f7..ffbb917 100644
>>> > --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>>> > +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>>> > @@ -94,7 +94,7 @@ OE_QMAKE_PATH_HOST_LIBS =3D "${libdir}"
>>> >
>>> >  # for qtbase configuration we need default settings
>>> >  # since we cannot set empty set filename to a not existent file
>>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>>> > +deltask generate_qt_config_file
>>> >
>>> >  do_configure() {
>>> >      ${S}/configure -v \
>>> > diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/
>>> qtbase-native_git.bb
>>> > index 98cbecc..0884a19 100644
>>> > --- a/recipes-qt/qt5/qtbase-native_git.bb
>>> > +++ b/recipes-qt/qt5/qtbase-native_git.bb
>>> > @@ -79,7 +79,7 @@ PACKAGECONFIG_CONFARGS =3D " \
>>> >
>>> >  # for qtbase configuration we need default settings
>>> >  # since we cannot set empty set filename to a not existent file
>>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>>> > +deltask generate_qt_config_file
>>> >
>>> >  do_configure_prepend() {
>>> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-de=
vice-extra.pri:
>>> No such file or directory"
>>> > diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/
>>> qtbase_git.bb
>>> > index 5cfbcfa..a2e8917 100644
>>> > --- a/recipes-qt/qt5/qtbase_git.bb
>>> > +++ b/recipes-qt/qt5/qtbase_git.bb
>>> > @@ -137,7 +137,7 @@ QT_CONFIG_FLAGS +=3D " \
>>> >
>>> >  # for qtbase configuration we need default settings
>>> >  # since we cannot set empty set filename to a not existent file
>>> > -export OE_QMAKE_QTCONF_PATH =3D "foodummy"
>>> > +deltask generate_qt_config_file
>>> >
>>> >  do_configure() {
>>> >      # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-de=
vice-extra.pri:
>>> No such file or directory" during configuration
>>> > --
>>> > 2.12.0
>>> >
>>>
>>> Any comments?
>>>
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

