Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 79073762AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 09:46:37 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id p65so71674577wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2016 01:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4HzMohhX3er8E6hWb0Qh5GGxzmSfda97vGFuAdmFD7M=;
	b=JW8D5JOluu/P4hEVUys2qzL+WhVZ3Krgnj32ZBIOHvKY5at1HpbXLRgH0lgcMVM969
	h3IUXIIM+xnZsN6VZ23I79G4eMchSyaO0GO/7BgSYCkAvmGX2Smy+akocOI+tbG4Hal4
	9Of2dD3gnNWvwXmry2T+AQyVh7/sbtw6qGyQqCmehRrFjoZ7AIjlc7pP5l/6/55Dkcjf
	+ixZT4crUmXwa7Wkn5d/XtFOgpWzumlYHTI+3jEbiUu1ydMEvaMc4KIO7y3CylbFvHw5
	+4Bo3sJDg+T1D0mzxruXY8nDFJwigMBchPsLHjCWfEyfK81R6Fzgk4e2Q+Q9/Jip3o9p
	y5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4HzMohhX3er8E6hWb0Qh5GGxzmSfda97vGFuAdmFD7M=;
	b=FeBFqsD8M5IuFeCrYH2t6u5ntUAXXMcAFnsCkSISIlh5rZGJLLhmqCFwP+1bGCQIIB
	GEuBioNwDtBXF/Upvv1Fwyr9YmKdW93Gkip3z6LeSPOaMYITUWaBnI3ikqCDhbUZeRke
	DQ6wA37NnSYBIwSzalQjVMdyqXEXxcQBMDZgrpI95ceXpLXdxvWNZcqCKxHx68kwcuSy
	5ROdjPbWANQqvt18ZB8+aFtef4O/TcqLsXjoMH5lbCr3awvi4nXYIaVhxdZdjMNsEH5E
	yCu0OTNE1IF7PMZaED4TrUbpSb3C/hBYaql1Q8vOUWI174pZWgE/pG8wWe+at6J8n36u
	/htg==
X-Gm-Message-State: AD7BkJIHLv5c9J+X4OSI8LR4VjJffMUsdfCDUKedzLGaoUM9tb9Ac46H7zfeIueS3S/LbQ==
X-Received: by 10.194.94.229 with SMTP id df5mr29557466wjb.133.1456911998189; 
	Wed, 02 Mar 2016 01:46:38 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 3sm3310525wmp.14.2016.03.02.01.46.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Mar 2016 01:46:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Mar 2016 10:48:35 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160302094835.GA2567@jama>
References: <1456474768-24329-1-git-send-email-net147@gmail.com>
	<20160301161840.GD6407@jama>
	<CANwerB2fDfGHd70Fi1HuMxTaCs1RvQ7O4=CT0JXVG1+CETForQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANwerB2fDfGHd70Fi1HuMxTaCs1RvQ7O4=CT0JXVG1+CETForQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5][PATCH] qtbase: fix up pkgconfig replacements
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
X-List-Received-Date: Wed, 02 Mar 2016 09:46:39 -0000
X-Groupsio-MsgNum: 60289
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline

--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 02:36:50PM +1100, Jonathan Liu wrote:
> On 2 March 2016 at 03:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Feb 26, 2016 at 07:19:28PM +1100, Jonathan Liu wrote:
> >> The replacements were being done in qt_module.prf which is not included
> >> when building 3rd party libraries. To resolve this, move the
> >> replacements from qt_module.prf to qt.prf which is included when
> >> building any qmake project. The pkgconfig include replacement is remov=
ed
> >> as it doesn't seem to be needed anymore and causes issues when the
> >> includedir path in pkgconfig has part of its path replaced with
> >> ${includedir} resulting in a circular reference that causes the OE
> >> package_do_pkgconfig task to fail.
> >>
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >>  ...le-Fix-pkgconfig-and-libtool-replacements.patch | 56 +++++++++++--=
---------
> >>  1 file changed, 27 insertions(+), 29 deletions(-)
> >
> > This seems to break qtwebengine's pkg-config
> >
> > NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb=
76-r0: task do_populate_sysroot: Started
> > ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 =
do_populate_sysroot: QA Issue: Qt5WebEngineCore.pc failed sanity test (tmpd=
ir) in path /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linu=
x/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0/sysroot-d=
estdir/usr/lib/pkgconfig [pkgconfig]
> > ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 =
do_populate_sysroot: QA staging was broken by the package built above
> > ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 =
do_populate_sysroot: Function failed: do_qa_staging
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/core2-64-oe-linux/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc9=
19d31_7e655fbb76-r0/temp/log.do_populate_sysroot.22802
> > NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb=
76-r0: task do_populate_sysroot: Failed
> > ERROR: Task 22201 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/=
qt5/qtwebengine_git.bb, do_populate_sysroot) failed with exit code '1'
> >
> > Any idea why this replacement wouldn't be used for qtwebengine?
> >
>=20
> It works for me in meta-qt5 master-next branch. Revision 64dc919d31
> doesn't seem to exist in the git://code.qt.io/qt/qtwebengine.git
> repository.
>=20
> I tested with qtwebengine
> PV=3D"5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc" and it is
> working.
> Can you check whether it is working in master-next for you?

The issue was caused by meta-luneui layer which is also included in my
bitbake world builds.

Sorry

>=20
> Regards,
> Jonathan
>=20
> >>
> >> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-li=
btool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconf=
ig-and-libtool-replacements.patch
> >> index 7520107..4807df0 100644
> >> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-r=
eplacements.patch
> >> +++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-r=
eplacements.patch
> >> @@ -61,11 +61,36 @@ Content-Transfer-Encoding: 8bit
> >>  Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
> >>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>  ---
> >> + mkspecs/features/qt.prf        | 13 +++++++++++++
> >>   mkspecs/features/qt_common.prf |  2 +-
> >> - mkspecs/features/qt_module.prf | 16 ++++++++++++++++
> >> - 2 files changed, 17 insertions(+), 1 deletion(-)
> >> + 2 files changed, 14 insertions(+), 1 deletion(-)
> >>
> >> +diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
> >> +index f62b6bb..91be8b3 100644
> >> +--- a/mkspecs/features/qt.prf
> >> ++++ b/mkspecs/features/qt.prf
> >> +@@ -321,6 +321,19 @@ contains(TEMPLATE, .*app) {
> >> +     QTPLUGIN =3D $$manualplugs $$autoplugs
> >> + }
> >> +
> >> ++contains(TEMPLATE, .*lib) {
> >> ++    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
> >> ++    pkgconfig_prefix_replace.replace =3D "prefix=3D"
> >> ++    pkgconfig_prefix_replace.CONFIG =3D path
> >> ++    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
> >> ++
> >> ++    # drop -L/usr/lib in .prl files
> >> ++    prl_replace.match =3D "-L\$${libdir}"
> >> ++    prl_replace.replace =3D ""
> >> ++    prl_replace.CONFIG =3D path
> >> ++    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
> >> ++}
> >> ++
> >> + QT_PLUGIN_VERIFY =3D DEPLOYMENT_PLUGIN
> >> + contains(QT_CONFIG, static) {
> >> +     QT_PLUGIN_VERIFY +=3D QTPLUGIN
> >>  diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_com=
mon.prf
> >>  index 38602f6..f9c401f 100644
> >>  --- a/mkspecs/features/qt_common.prf
> >> @@ -79,33 +104,6 @@ index 38602f6..f9c401f 100644
> >>       }
> >>       lib_replace.CONFIG =3D path
> >>       QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
> >> -diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_mod=
ule.prf
> >> -index aefd3ae..775cda2 100644
> >> ---- a/mkspecs/features/qt_module.prf
> >> -+++ b/mkspecs/features/qt_module.prf
> >> -@@ -276,6 +276,22 @@ load(qt_targets)
> >> -         ltlib_replace.replace =3D $$QMAKE_LIBTOOL_LIBDIR
> >> -     ltlib_replace.CONFIG =3D path
> >> -     QMAKE_LIBTOOL_INSTALL_REPLACE +=3D ltlib_replace
> >> -+
> >> -+    pkgconfig_include_replace.match =3D $$rplbase/include
> >> -+    pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
> >> -+    pkgconfig_include_replace.CONFIG =3D path
> >> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_include_replace
> >> -+
> >> -+    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
> >> -+    pkgconfig_prefix_replace.replace =3D "prefix=3D"
> >> -+    pkgconfig_prefix_replace.CONFIG =3D path
> >> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
> >> -+
> >> -+    # drop -L/usr/lib in .prl files
> >> -+    prl_replace.match =3D "-L\$${libdir}"
> >> -+    prl_replace.replace =3D ""
> >> -+    prl_replace.CONFIG =3D path
> >> -+    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
> >> - }
> >> -
> >> - contains(QT_PRODUCT, OpenSource.*):DEFINES *=3D QT_OPENSOURCE
> >>  --
> >>  2.7.1
> >>
> >> --
> >> 2.7.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbWtvIACgkQN1Ujt2V2gBzXPQCgr6QMgvMM1GKfm15aoQ2Xd+kD
3hkAoJ2f2wVFXxcAXV71BxFKsaaih0oI
=VE3h
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
