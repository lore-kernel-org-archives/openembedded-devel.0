Return-Path: <tim.jaacks@garz-fricke.com>
X-Greylist: delayed 1120 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Apr 2017 13:04:00 UTC
Received: from mailout-i1.artfiles.de (mailout-i1.artfiles.de [80.252.97.82])
	by mail.openembedded.org (Postfix) with ESMTP id 37F9A77A0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 13:04:00 +0000 (UTC)
Received: from [89.27.136.47] (helo=mail.garz-fricke.com)
	auth=mx@garz-fricke.com by mailout.artfiles.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80.1)
	id 1d2zqI-0005JK-PT; Tue, 25 Apr 2017 14:45:18 +0200
Received: from SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188]) by
	SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188%12]) with mapi
	id 14.03.0319.002; Tue, 25 Apr 2017 14:45:18 +0200
From: Tim Jaacks <tim.jaacks@garz-fricke.com>
To: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Qt 5.8 examples are not built
Thread-Index: AdK9wcoDzIm0pmSuSU2lpb9c718fAA==
Date: Tue, 25 Apr 2017 12:45:16 +0000
Message-ID: <32EA6B79577EEF4C84CB32305D45A05958E23EDA@SRV24.hamburg.garz-fricke.de>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.8.59]
MIME-Version: 1.0
Subject: Re: [meta-qt5] Qt 5.8 examples are not built
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
X-List-Received-Date: Tue, 25 Apr 2017 13:04:01 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Heikki,

thanks again. Of course I have tried a clean build. We have nightly builds =
set up here, running from a completely fresh checked out tree.

I see the examples packages for the Qt modules, and there is one for qtbase=
 as well. But as I said, it is empty. There are no files in qtbase-examples=
 (build/tmp/work/<platform>/qtbase/5.8.0+gitAUTOINC+49dc9aa409-r0/packages-=
split/qtbase-examples is an empty directory).

The build of the qtbase package is successful, though. But I cannot install=
 qtbase-examples to an image, because empty packages cannot be installed. A=
nd the package is empty because the examples are not built in the qtbase co=
mpile step. That's the problem.

=A0
Mit freundlichen Gr=FC=DFen / Best regards
i.A. Tim Jaacks

Software Engineering
Garz & Fricke GmbH
Tempowerkring 2, 21079 Hamburg - Germany
Amtsgericht Hamburg HRB 60514
Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
Phone: +49 40 791899 - 55
Fax:=A0=A0=A0=A0 +49 40 791899 - 39
tim.jaacks@garz-fricke.com
www.garz-fricke.com



> -----Urspr=FCngliche Nachricht-----
> Von: Heikki Sarkanen [mailto:heikki.sarkanen@tamtron.fi]
> Gesendet: Dienstag, 25. April 2017 14:15
> An: Tim Jaacks; openembedded-devel@lists.openembedded.org
> Betreff: Re: [meta-qt5] Qt 5.8 examples are not built
>=20
> Hello Tim,
>=20
> Sorry for my partially incorrect answer. Actually you cannot build those =
"-
> examples" recipes like "qtquickcontrols2-examples" because those are just
> packages [1] provided by the "qtquickcontrols2" recipe. Do you see the
> examples packages with "bitbake -e qtquickcontrols2 | grep ^PACKAGES=3D" =
?
> In any case you should still be able to install the "-examples" packages.=
 One
> more possible solution may be to properly clean your environment when
> upgrading from Qt 5.7 to 5.8. I think you could achieve that by creating =
a
> completely new build folder by sourcing the init script or by removing th=
e
> tmp under the current one.
>=20
> [1] https://github.com/meta-qt5/meta-
> qt5/blob/9927aacfc3b341eb36764fbe7d5a929d4f05f327/recipes-
> qt/qt5/qt5.inc#L52
>=20
> BR,
> Heikki Sarkanen
> ________________________________________
> From: Tim Jaacks <tim.jaacks@garz-fricke.com>
> Sent: 25 April 2017 12:23
> To: Heikki Sarkanen; openembedded-devel@lists.openembedded.org
> Subject: Re: [meta-qt5] Qt 5.8 examples are not built
>=20
> Hello Hekki,
>=20
> thanks for your reply. I cannot use sub-packages as a parameter to bitbak=
e, it
> accepts recipe names only. Is this a new feature? I am on Yocto Jethro.
>=20
> However, adding the qtbase-examples package to IMAGE_INSTALL does not
> make any difference. Maybe this works for other Qt packages (which use th=
e
> qmake5_base_do_configure function just like before), but it doesn't work
> for qtbase, because the qtbase-examples packages is empty. As I said, the
> examples are not compiled at all, so they cannot be installed either.
>=20
>=20
> Mit freundlichen Gr=FC=DFen / Best regards
> i.A. Tim Jaacks
>=20
> Software Engineering
> Garz & Fricke GmbH
> Tempowerkring 2, 21079 Hamburg - Germany Amtsgericht Hamburg HRB
> 60514
> Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
> Phone: +49 40 791899 - 55
> Fax:     +49 40 791899 - 39
> tim.jaacks@garz-fricke.com
> www.garz-fricke.com
>=20
>=20
> > -----Urspr=FCngliche Nachricht-----
> > Von: Heikki Sarkanen [mailto:heikki.sarkanen@tamtron.fi]
> > Gesendet: Montag, 24. April 2017 18:55
> > An: Tim Jaacks; openembedded-devel@lists.openembedded.org
> > Betreff: Re: [meta-qt5] Qt 5.8 examples are not built
> >
> > Hi,
> >
> > I don't know how the PACKAGECONFIG in qtbase has worked but I have
> > built Qt examples with meta-qt5 on both Qt 5.7 and 5.8 by using the
> > "<qtrecipe>- examples" packages like in Wandboard wiki [1]. So if you
> > want to build examples for qtquickcontrols2 you should build that
> > package: "bitbake qtquickcontrols2-examples". If you want to include
> > some examples to your image you could use 'IMAGE_INSTALL_append =3D
> > "qtquickcontrols2-examples qtlocation-examples"'.
> >
> > [1]
> >
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wand
> > board
> >
> > BR,
> > Heikki Sarkanen
> >
> > ________________________________________
> > From: openembedded-devel-bounces@lists.openembedded.org
> > <openembedded-devel-bounces@lists.openembedded.org> on behalf of
> Tim
> > Jaacks <tim.jaacks@garz-fricke.com>
> > Sent: 24 April 2017 17:21
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-qt5] Qt 5.8 examples are not built
> >
> > Hello,
> >
> > I recently updated my meta-qt5 layer to the current head version
> > (https://github.com/meta-qt5/meta-
> > qt5/commit/9927aacfc3b341eb36764fbe7d5a929d4f05f327) resulting in an
> > upgrade to Qt 5.8. Since this upgrade, the Qt examples are not built
> > anymore, even though I added them to PACKAGECONFIG of qtbase. Is this
> > a known issue?
> >
> > In Qt 5.7 the examples were built correctly. As far as I understand,
> > the line that used to make this work in versions before Qt 5.8 is in
> > meta-qt5/recipes-
> > qt/qt5/qt5.inc:
> >
> > | EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> > 'examples', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"
> >
> > The qmake5_base_do_configure function in meta-
> > qt5/classes/qmake5_base.bbclass evaluates this variable:
> >
> > | if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
> > |     QMAKE_VARSUBST_PRE=3D"${EXTRA_QMAKEVARS_PRE}"
> > |     bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
> > | fi
> >
> > This leads to the following note in log.do_configure of qtbase:
> >
> > | NOTE: qmake prevar substitution: ' QT_BUILD_PARTS+=3Dexamples'
> >
> > However, this note is missing in Qt 5.8 because the call to
> > qmake5_base_do_configure has been removed from the do_configure
> task
> > of qtbase here:
> >
> > https://github.com/meta-qt5/meta-
> > qt5/commit/333949a8239dfa7788b35f1059614733e11a6a25#diff-
> > 1120c73503f9288cc8a8c2b984fe4038L202
> >
> > There is no comment on why this has been removed. I tried re-adding
> > it, which resulted in a duplicate configure run. Obviously this is
> > caused by this change in qtbase:
> >
> > https://code.qt.io/cgit/qt/qtbase.git/commit/mkspecs/features/qt_parts
> > .pr
> > f?id=3D60e5a1c8effd4099f7b1414107b5cbb67c266210
> >
> > Does anybody know whether this change was the reason for removing the
> > qmake5_base_do_configure call?
> >
> > However, the removal breaks the mechanism via
> EXTRA_QMAKEVARS_PRE,
> > because this variable is no longer evaluated. As far as I can see,
> > there is no option of building the Qt examples at the moment. Or am I
> missing anything?
> > Any clue would be helpful.
> >
> >
> > Mit freundlichen Gr=FC=DFen / Best regards i.A. Tim Jaacks
> >
> > Software Engineering
> > Garz & Fricke GmbH
> > Tempowerkring 2, 21079 Hamburg - Germany Amtsgericht Hamburg HRB
> > 60514
> > Gesch=E4ftsf=FChrer: Manfred Garz, Matthias Fricke
> > Phone: +49 40 791899 - 55
> > Fax:     +49 40 791899 - 39
> > tim.jaacks@garz-fricke.com
> > www.garz-fricke.com
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

