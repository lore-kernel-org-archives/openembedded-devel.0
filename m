Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id EFE856A4D7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 09:04:29 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id A5E714B0016;
	Tue, 28 May 2013 11:04:24 +0200 (CEST)
Date: Tue, 28 May 2013 11:04:22 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528110422.0169995c@e6520eb>
In-Reply-To: <20130528085017.GC3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-7-git-send-email-eric@eukrea.com>
	<20130528085017.GC3192@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-qt5][PATCH 7/8] qtbase: install and split package fonts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2013 09:04:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 28 May 2013 10:50:17 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :
> > +FILES_${PN}-fonts-ttf-vera       =3D "${libdir}/${QT_DIR_NAME}/fonts/V=
era*.ttf ${libdir}/fonts/Vera*.ttf"
> > +FILES_${PN}-fonts-ttf-dejavu     =3D "${libdir}/${QT_DIR_NAME}/fonts/D=
ejaVu*.ttf ${libdir}/fonts/DejaVu*.ttf"
> > +FILES_${PN}-fonts-pfa            =3D "${libdir}/${QT_DIR_NAME}/fonts/*=
.pfa ${libdir}/fonts/*.pfa"
> > +FILES_${PN}-fonts-pfb            =3D "${libdir}/${QT_DIR_NAME}/fonts/*=
.pfb ${libdir}/fonts/*.pfb"
> > +FILES_${PN}-fonts-qpf            =3D "${libdir}/${QT_DIR_NAME}/fonts/*=
.qpf* ${libdir}/fonts/*.qpf*"
> > +FILES_${PN}-fonts                =3D "${libdir}/${QT_DIR_NAME}/fonts/R=
EADME ${libdir}/fonts/README \
> > +                                    ${libdir}/${QT_DIR_NAME}/fonts/fon=
tdir ${libdir}/fonts/fontdir"
>=20
> maybe we could improve this by using OE_QMAKE_PATH_ARCHDATA (to cover
> version with and without QT_DIR_NAME), but please
> check if fonts are really installed into ArchData directory
>=20
> OE_QMAKE_PATH_QT_ARCHDATA =3D "${libdir}/${QT_DIR_NAME}"
>=20
from what I saw fonts are installed (and searched at runtime) in
${libdir}/fonts
I don't know why ${libdir}/${QT_DIR_NAME} was used in qtbase.inc so I
blindly followed ;-)

Eric

