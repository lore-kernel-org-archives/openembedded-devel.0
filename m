Return-Path: <tim.jaacks@garz-fricke.com>
Received: from mailout-afa70.mailout.artfiles.de
	(mailout-afa70.mailout.artfiles.de [212.72.176.70])
	by mail.openembedded.org (Postfix) with ESMTP id 3154271DAE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 09:25:26 +0000 (UTC)
Received: from [89.27.136.47] (helo=mail.garz-fricke.com)
	auth=mx@garz-fricke.com by mailout.artfiles.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256) (Exim 4.80.1)
	id 1d2wim-0007NQ-RK; Tue, 25 Apr 2017 11:25:21 +0200
Received: from SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188]) by
	SRV24.hamburg.garz-fricke.de ([fe80::91bd:d629:787:188%12]) with mapi
	id 14.03.0319.002; Tue, 25 Apr 2017 11:23:01 +0200
From: Tim Jaacks <tim.jaacks@garz-fricke.com>
To: Heikki Sarkanen <heikki.sarkanen@tamtron.fi>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5] Qt 5.8 examples are not built
Thread-Index: AdK9o1IOlNp10nunTneZZDOn8ch1kw==
Date: Tue, 25 Apr 2017 09:23:00 +0000
Message-ID: <32EA6B79577EEF4C84CB32305D45A05958E23E24@SRV24.hamburg.garz-fricke.de>
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
X-List-Received-Date: Tue, 25 Apr 2017 09:25:27 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Hekki,

thanks for your reply. I cannot use sub-packages as a parameter to bitbake,=
 it accepts recipe names only. Is this a new feature? I am on Yocto Jethro.

However, adding the qtbase-examples package to IMAGE_INSTALL does not make =
any difference. Maybe this works for other Qt packages (which use the qmake=
5_base_do_configure function just like before), but it doesn't work for qtb=
ase, because the qtbase-examples packages is empty. As I said, the examples=
 are not compiled at all, so they cannot be installed either.

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
> Gesendet: Montag, 24. April 2017 18:55
> An: Tim Jaacks; openembedded-devel@lists.openembedded.org
> Betreff: Re: [meta-qt5] Qt 5.8 examples are not built
>=20
> Hi,
>=20
> I don't know how the PACKAGECONFIG in qtbase has worked but I have built
> Qt examples with meta-qt5 on both Qt 5.7 and 5.8 by using the "<qtrecipe>=
-
> examples" packages like in Wandboard wiki [1]. So if you want to build
> examples for qtquickcontrols2 you should build that package: "bitbake
> qtquickcontrols2-examples". If you want to include some examples to your
> image you could use 'IMAGE_INSTALL_append =3D "qtquickcontrols2-examples
> qtlocation-examples"'.
>=20
> [1]
> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wand
> board
>=20
> BR,
> Heikki Sarkanen
>=20
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org
> <openembedded-devel-bounces@lists.openembedded.org> on behalf of
> Tim Jaacks <tim.jaacks@garz-fricke.com>
> Sent: 24 April 2017 17:21
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-qt5] Qt 5.8 examples are not built
>=20
> Hello,
>=20
> I recently updated my meta-qt5 layer to the current head version
> (https://github.com/meta-qt5/meta-
> qt5/commit/9927aacfc3b341eb36764fbe7d5a929d4f05f327) resulting in an
> upgrade to Qt 5.8. Since this upgrade, the Qt examples are not built
> anymore, even though I added them to PACKAGECONFIG of qtbase. Is this a
> known issue?
>=20
> In Qt 5.7 the examples were built correctly. As far as I understand, the =
line
> that used to make this work in versions before Qt 5.8 is in meta-qt5/reci=
pes-
> qt/qt5/qt5.inc:
>=20
> | EXTRA_QMAKEVARS_PRE +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'examples', 'QT_BUILD_PARTS+=3Dexamples', '', d)}"
>=20
> The qmake5_base_do_configure function in meta-
> qt5/classes/qmake5_base.bbclass evaluates this variable:
>=20
> | if [ ! -z "${EXTRA_QMAKEVARS_PRE}" ]; then
> |     QMAKE_VARSUBST_PRE=3D"${EXTRA_QMAKEVARS_PRE}"
> |     bbnote "qmake prevar substitution: '${EXTRA_QMAKEVARS_PRE}'"
> | fi
>=20
> This leads to the following note in log.do_configure of qtbase:
>=20
> | NOTE: qmake prevar substitution: ' QT_BUILD_PARTS+=3Dexamples'
>=20
> However, this note is missing in Qt 5.8 because the call to
> qmake5_base_do_configure has been removed from the do_configure task
> of qtbase here:
>=20
> https://github.com/meta-qt5/meta-
> qt5/commit/333949a8239dfa7788b35f1059614733e11a6a25#diff-
> 1120c73503f9288cc8a8c2b984fe4038L202
>=20
> There is no comment on why this has been removed. I tried re-adding it,
> which resulted in a duplicate configure run. Obviously this is caused by =
this
> change in qtbase:
>=20
> https://code.qt.io/cgit/qt/qtbase.git/commit/mkspecs/features/qt_parts.pr
> f?id=3D60e5a1c8effd4099f7b1414107b5cbb67c266210
>=20
> Does anybody know whether this change was the reason for removing the
> qmake5_base_do_configure call?
>=20
> However, the removal breaks the mechanism via EXTRA_QMAKEVARS_PRE,
> because this variable is no longer evaluated. As far as I can see, there =
is no
> option of building the Qt examples at the moment. Or am I missing anythin=
g?
> Any clue would be helpful.
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
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

