Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id B281677009
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 22:01:35 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so4289030wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2015 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1mYM357kj9Sk7o4CmdeSIwkFsC9g+c6owgQbl0qJ188=;
	b=SK0D8Hm+yqgtnsGxT9+GAbDQBslfOqG5zz6fqWBC6GM+8Gn0QM9YL17iiWYoYAG26Y
	z+bFWkfyY3rwECy2j0Brg1DIgCkhbz1HtK1EVuiMole/KCEtlz7nr+3N5qoFvEBUlT4L
	D1r6fqT7QIB3OQVNnx18vdAwkL4+KgWNzqJdb98zKJQh1GyL1fRx1TnEima8duZDDqg+
	NoUAlOuIPHdHMTs7Jfke7wJElHhqhmlZpPwQ5lhXG1qX0+si6qhAkq5sGNv5UHiYYZnR
	IEEEHFR5UgAi/kZ0sfmIKHICAk4EWG8XyL/pCOE/3kKmz2vrB/BD4D55NIVqzF08tMC+
	8XWA==
X-Received: by 10.180.73.2 with SMTP id h2mr623080wiv.72.1441317695112;
	Thu, 03 Sep 2015 15:01:35 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bu19sm283585wjb.45.2015.09.03.15.01.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 15:01:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Sep 2015 00:02:01 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150903220201.GB2456@jama>
References: <1440332209-8802-1-git-send-email-net147@gmail.com>
	<20150827141522.GP26375@denix.org>
	<D4C07404-5127-46A0-867F-D21F90BBFDA7@gmail.com>
	<CANwerB1W1iqe72aV2Y4CvytbrE15JnM8ktWgoBTDWhB7w0CgXA@mail.gmail.com>
	<20150903214246.GE8323@denix.org>
MIME-Version: 1.0
In-Reply-To: <20150903214246.GE8323@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qtbase: replace host paths with qmake built-in properties in qconfig.pri
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
X-List-Received-Date: Thu, 03 Sep 2015 22:01:38 -0000
X-Groupsio-MsgNum: 57195
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8GpibOaaTibBMecb"
Content-Disposition: inline

--8GpibOaaTibBMecb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2015 at 05:42:46PM -0400, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2015 at 06:46:04PM +1000, Jonathan Liu wrote:
> > Hi Khem,
> >=20
> > On 28 August 2015 at 15:57, Khem Raj <raj.khem@gmail.com> wrote:
> > > Denys
> > >
> > > I have posted an incremental fix, here
> > > https://github.com/meta-qt5/meta-qt5/commit/a0a5002ed4bfcce50d6462897=
c4701246061581a
> > >
> > > Jonathan
> > >
> > > Can you see if it still fixes the usecase that you originally were tr=
ying to fix ?
> >=20
> > Your patch misses some host paths that aren't in
> > ${STAGING_DIR_HOST}/usr (referred to as ${STAGING_EXECPREFIXDIR} in
> > your patch):
> > ${STAGING_DIR_HOST}/lib
> > ${STAGING_DIR_HOST}
> >=20
> > You can change the following in your patch:
> > -e 's| ${STAGING_EXECPREFIXDIR}| $$[QT_INSTALL_PREFIX]|g' \
> >=20
> > To:
> > -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
> >=20
> > So that it covers the host paths missed by sed.
> >=20
> > Regards,
> > Jonathan
>=20
> Ping on this one. Did we get an updated fix for it? Sorry, I was busy lat=
ely=20
> with own releases and wasn't paying attention, but the tip of meta-qt5 is=
=20
> still broken on qtwebkit. Thanks.

Fix is in master-next waiting for jenkins builds to verify Khem's
version squashed with update from Jonathan.

>=20
> --=20
> Denys
>=20
>=20
> > >> On Aug 27, 2015, at 7:15 AM, Denys Dmytriyenko <denis@denix.org> wro=
te:
> > >>
> > >> This seems to cause a build issue in qtwebkit and qtwebengine as wel=
l.
> > >>
> > >> It manifests in not being able to find glib.h or gio/gio.h headers.
> > >>
> > >> Khem, Martin and I are still discussing this on IRC, but I propose t=
o revert
> > >> this commit until it's tested better for all modules.
> > >>
> > >> --
> > >> Denys
> > >>
> > >>
> > >> On Sun, Aug 23, 2015 at 10:16:49PM +1000, Jonathan Liu wrote:
> > >>> This avoids qconfig.pri in the Qt SDK incorrectly including paths f=
rom
> > >>> the build host that may not exist on the SDK host. As the paths are
> > >>> now correct, qmake can correctly detect system include paths and use
> > >>> -isystem instead of -I for Qt's include directories which allows the
> > >>> suppression of warnings from library headers when building Qt
> > >>> applications.
> > >>>
> > >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> > >>> ---
> > >>> recipes-qt/qt5/qtbase_git.bb | 5 +++++
> > >>> 1 file changed, 5 insertions(+)
> > >>>
> > >>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_g=
it.bb
> > >>> index ae63150..324a115 100644
> > >>> --- a/recipes-qt/qt5/qtbase_git.bb
> > >>> +++ b/recipes-qt/qt5/qtbase_git.bb
> > >>> @@ -234,6 +234,11 @@ do_install_append() {
> > >>>     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/=
macx-ios-clang/rename_main.sh:#!/bin/bash
> > >>>     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no =
providers in its RDEPENDS [file-rdeps]
> > >>>     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
> > >>> +
> > >>> +    # Replace host paths with qmake built-in properties
> > >>> +    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
> > >>> +        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
> > >>> +        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
> > >>> }
> > >>>
> > >>> PACKAGES =3D. " \
> > >>> --
> > >>> 2.5.0
> > >>>
> > >>> --
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8GpibOaaTibBMecb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXow1gACgkQN1Ujt2V2gBzvGQCcCSS0poDO9pBhVyrAwpQJzQQc
NSgAoKvadNd0BCCisSLEpkJzPip2zZtI
=JWVK
-----END PGP SIGNATURE-----

--8GpibOaaTibBMecb--
