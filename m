Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PNVVk-0004JP-3d
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 20:05:09 +0100
Received: by qwg5 with SMTP id 5so4729858qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 11:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=Z0vqL+J5a5jeeZ5MH03e7ULRTnrFjvagrxwZsNHuXJw=;
	b=N+kULxRSTfFc0SKRjBaBudnuQrJRZ67IoO9dEFwTIy363pEqHCemEESmsSGGgGFImh
	4RYQrCAmNmPgxfsfxY9v/VQHf29rZMWW+02dcg2n0+Oxw59LsRmPWlbRzkYaOtBfp9io
	CvQIA8VjUXEGwLxPpX+EOzGHl5rkUjtXkDbz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=qd/5UFHqO30GCH3VTcGaZD+zrlOqm73kvwZNDBivRAdxD+pqlQYfodBF+vR0F11Jcu
	rgH7z/0HVr+f08re6ziefffVvWpA8OB4kQdJLHQEQisL0lZzwclWEvVxLTIXTsFOSa0h
	uDDpPDgqLI6mWLjnLsmukX99diJeGjvarlwwQ=
Received: by 10.229.251.204 with SMTP id mt12mr6369272qcb.182.1291143826326;
	Tue, 30 Nov 2010 11:03:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Tue, 30 Nov 2010 11:03:26 -0800 (PST)
In-Reply-To: <1291133947.3599.16.camel@mattotaupa>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 30 Nov 2010 20:03:26 +0100
Message-ID: <AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package request for Phonon-VLC backend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Nov 2010 19:05:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for your interest!
here is my too recipes which are not soo valueable as it is mainly bump
version or so.
here my automoc-native :

automoc-native.bb:
~~~~~~~~~~~~~

DESCRIPTION =3D "automoc is a mess for people who don't want to learn
autotools"
PRIORITY =3D "optional"
LICENSE =3D "GPL"
DEPENDS +=3D "qt4-x11-free"

SRCREV =3D "b873d2cb457503320e5f1d56d516e23eeb9ad7db"

PV =3D "git${SRCPV}"
PR =3D "r0"

inherit native qt4x11 cmake

SRC_URI =3D "git://git.kde.org/automoc;protocol=3Dgit;branch=3Dmaster"
S =3D "${WORKDIR}/git"


# OE lacks some native qt4 tools, so we use the ones form the host :/
EXTRA_OECMAKE =3D "-DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
                 -DQT_INSTALL_LIBS=3D${OE_QMAKE_LIBDIR_QT} \
         -DQT_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT} \
         -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
         -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
         -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
         -DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE} \
         -DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
         -DQ_WS_X11=3DON \
        "


OECMAKE_BUILDPATH =3D "build"

OECMAKE_SOURCEPATH =3D "../"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Mainly a merge of the existing recipe with an updated repo.
here is the report http://tinderbox.openembedded.org/packages/1152405/
and the missing log repports "QtCore/qglobal.h: No such file or directory"
.....

And here is my Phonon-VLC backend recipe :
qt4-plugin-phonon-backend-vlc.bb :
~~~~~~~~~~~~~~~~~~~~~~~~~

DESCRIPTION =3D "qt4-plugin-phonon-backend-vlc"
AUTHOR =3D "Fathi Boudra <fabo@kde.org> (current maintainer) Lukas Durfina =
<
lukas.durfina@gmail.com> Tanguy Krotoff <tkrotoff@gmail.com>"
SECTION =3D "libs"
PRIORITY =3D "optional"
HOMEPAGE =3D "http://phonon.kde.org/"
LICENSE =3D "LGPL"

DEPENDS +=3D "qt4-x11-free vlc automoc-native"

SRCREV =3D "1df39c9bd306b0b46356d13b24fca5f632e1b327"

PV =3D "0.3.0"
PR =3D "r0"
PR_append =3D "+git${SRCREV}"

inherit qt4x11 cmake

SRC_URI =3D "git://
gitorious.org/phonon/phonon-vlc.git;protocol=3Dgit;branch=3Dmaster "
S =3D "${WORKDIR}/git"

EXTRA_OECMAKE =3D "-DQTONLY=3DON -DCMAKE_BUILD_TYPE=3DRelease \
-DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
-DQT_INSTALL_LIBS=3D${OE_QMAKE_LIBDIR_QT} \
-DQT_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT} \
-DQT_HEADERS_DIR=3D${OE_QMAKE_INCDIR_QT} \
-DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
-DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
-DQT_UIC3_EXECUTABLE=3D${OE_QMAKE_UIC3} \
-DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
-DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE} \
-DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
-DQT_DBUSXML2CPP_EXECUTABLE=3D/usr/bin/qdbusxml2cpp \
-DQT_DBUSCPP2XML_EXECUTABLE=3D/usr/bin/qdbuscpp2xml \
-DQT_MKSPECS_DIR=3D${QMAKESPEC}/../ \
"

OECMAKE_BUILDPATH =3D "build"

OECMAKE_SOURCEPATH =3D "../"

#do_install() {
#}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

But as it depends on automoc-native i could not test it.

Thanks again. And I here to test if needed.

Regards,

Sylvain (aka GarthPS)


2010/11/30 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear Sylvain
>
>
> Am Dienstag, den 30.11.2010, 15:36 +0100 schrieb Sylvain Par=E9:
>
> > I have a package request. If that interests somebody to make a receipe
> > for Phonon-VLC backend at it seem to be the most stable backend for
> > phononn according to Phonon's dev.
> > Like this we could have Phonon-VLC backend additionnaly to
> > Phonon-gstreamer one.
> >
> > I tried to make one myself but I can't manage to fix automoc-native
> > (dependence) to make it build.
>
> please attach the work you have done so far with a Signed-off-by line.
>
> > Thanks by advance!
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

