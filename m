Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 74CD76A487
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:40:49 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 11FF64B0269;
	Tue, 28 May 2013 10:40:44 +0200 (CEST)
Date: Tue, 28 May 2013 10:40:43 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528104043.16ff4b8b@e6520eb>
In-Reply-To: <20130528082857.GA3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-7-git-send-email-eric@eukrea.com>
	<20130528082857.GA3192@jama>
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
X-List-Received-Date: Tue, 28 May 2013 08:40:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 28 May 2013 10:28:57 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> On Tue, May 28, 2013 at 01:43:52AM +0200, Eric B=C3=A9nard wrote:
> > - fonts were not installed (at least in qt 5.0.2) so install
> > them manually.
> > - split the font package in smaller package as done in qt4 to
> > save space on the target.
> >=20
> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> > ---
> >  recipes-qt/qt5/qtbase.inc |   30 ++++++++++++++++++++++++++++--
> >  1 file changed, 28 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> > index 81cc2e1..4b4fb10 100644
> > --- a/recipes-qt/qt5/qtbase.inc
> > +++ b/recipes-qt/qt5/qtbase.inc
> > @@ -161,7 +161,33 @@ do_install_append() {
> >      # qemu built on host breaks do_package, remove it here (will be re=
places with right qemu when do_compile is fixed
> >      # ERROR: objcopy failed with exit code 1 (cmd was 'arm-oe-linux-gn=
ueabi-objcopy' --only-keep-debug '/OE/oe-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/qmake' '/OE/oe-core/tmp-eglib=
c/work/armv5te-oe-linux-gnueabi/qtbase/5.0.1-r0.0/package/usr/bin/.debug/qm=
ake')
> >      rm -f ${D}/${bindir}/${QT_DIR_NAME}/qmake
> > +    # install fonts manually if they are missing
> > +    if [ ! -d ${D}/${libdir}/fonts ]; then
> > +        cp -a ${S}/lib/fonts ${D}/${libdir}
> > +    fi
> >  }
> > =20
> > -PACKAGES =3D. "${PN}-fonts "
> > -FILES_${PN}-fonts =3D "${libdir}/${QT_DIR_NAME}/fonts ${libdir}/fonts"
> > +PACKAGES =3D. "${PN}-fonts \
> > +             ${PN}-fonts-ttf-vera \
> > +             ${PN}-fonts-ttf-dejavu \
> > +             ${PN}-fonts-pfa \
> > +             ${PN}-fonts-pfb \
> > +             ${PN}-fonts-qpf "
> > +
> > +RRECOMMENDS_${PN}-fonts =3D " \
> > +             ${PN}-fonts-ttf-vera \
> > +             ${PN}-fonts-ttf-dejavu \
> > +             ${PN}-fonts-pfa \
> > +             ${PN}-fonts-pfb \
> > +             ${PN}-fonts-qpf "
> > +
> > +ALLOW_EMPTY_${PN}-fonts =3D "1"
> > +PACKAGES_DYNAMIC +=3D "^${PN}-fonts-.*"
>=20
> Is this line needed? You're creating all ${PN}-fonts manually, I don't
> see any do_split_packages which would require PACKAGES_DYNAMIC.
>=20
true, this comes from qt4 package and I blindly copied those lines.

Eric

