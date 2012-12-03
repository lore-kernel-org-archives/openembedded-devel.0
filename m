Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfbQF-0004y3-GI
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 20:11:19 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1753176eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 10:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0yIqFhUiM9GKRrmukqa7HTjTyoOBT5ozuMj7xPuJEwM=;
	b=0lsdTPLerjcsV/eUU8RgCkxq5HfJ1MLy3AJRPSdQNL8Wyu/9vHUyurrLxKtQ78QDID
	uUaQQwMSDQTfIlaMqj57qsGtytAB7EklXMzxWHOrsLuvxLHrLg2ZmsavY+9kHT8gtzMC
	C8eVnjdFgMR8/iTW/Xd2dr2BGQnwv1HinPrRIV5xT9QBFVXV7KVoxM4aB8xDnCRSFCXd
	vVXTd19h/aFMMO7jIHB/2oQX6yXNBgqK6jolXeXfOLw7DNkuGR7Bx3IOKTQVnHOh8G0s
	D5Ho1WtTPxYC4CFcDN1JTh44ZGd7rnYNgFiJw/5LscHWYMf4K7nMO8IqNUMF09YU4uaY
	16cg==
Received: by 10.14.194.4 with SMTP id l4mr39177556een.42.1354561016282;
	Mon, 03 Dec 2012 10:56:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm32864935eeo.8.2012.12.03.10.56.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 10:56:55 -0800 (PST)
Date: Mon, 3 Dec 2012 19:56:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121203185650.GF3354@jama.jama.net>
References: <20121024064022.C7F781032E@opal>
	<CAGiJk9fcWHvEdK_bc3ApwExvGM1PKVh6-y9Hj1ifMA0HQG19+w@mail.gmail.com>
	<k6oe50$iv9$2@ger.gmane.org>
	<CAGiJk9f6ZzvrZNrgDfmhMEDFNWiY4gsF-0GF4nz1=6qzZLexeg@mail.gmail.com>
	<CA+chaQes=2CvfGmW=_vOTiKQPRDgyxEZSty657FuE9SS=ptjWw@mail.gmail.com>
	<CAGiJk9ftka_L+iHO-OzkGAxXuvBatd3oFbXrqGNOPjtzp0bYqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9ftka_L+iHO-OzkGAxXuvBatd3oFbXrqGNOPjtzp0bYqg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Koen Kooi : Revert "maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass"
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
X-List-Received-Date: Mon, 03 Dec 2012 19:11:19 -0000
X-Groupsio-MsgNum: 41887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline

--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2012 at 05:23:07PM +0100, Samuel Stirtzel wrote:
> 2012/12/3 Martin Jansa <martin.jansa@gmail.com>:
> > On Tue, Oct 30, 2012 at 2:13 PM, Samuel Stirtzel
> > <s.stirtzel@googlemail.com> wrote:
> >> 2012/10/30 Koen Kooi <koen@dominion.thruhere.net>:
> >>> -----BEGIN PGP SIGNED MESSAGE-----
> >>> Hash: SHA1
> >>>
> >>> Op 30-10-12 10:24, Samuel Stirtzel schreef:
> >>>> 2012/10/24  <git@git.openembedded.org>:
> >>>>> Module: meta-openembedded.git Branch: master Commit:
> >>>>> 80ef3c0aa0f92e93d1581e47ccb77a04022d04cf URL:
> >>>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=
=3D80ef3c0aa0f92e93d1581e47ccb77a04022d04cf
> >>>>>
> >>>>>
> >>>>>
> >>> Author: Koen Kooi <koen@dominion.thruhere.net>
> >>>>> Date:   Wed Oct 24 08:39:12 2012 +0200
> >>>>>
> >>>>> Revert "maliit-framework: Clean up recipe and use
> >>>>> gtk-immodules-cache.bbclass"
> >>>>>
> >>>>> The class hasn't hit oe-core yet
> >>>>>
> >>>>> This reverts commit eb66e508e33ccbec8299041265eef183913a3a8c.
> >>>>>
> >>>>> ---
> >>>>>
> >>>>> .../recipes-support/maliit/maliit-framework_git.bb |   32
> >>>>> +++++++++++++++---- 1 files changed, 25 insertions(+), 7 deletions(=
-)
> >>>>>
> >>>>> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> >>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb index
> >>>>> 534a3c8..3f50d1b 100644 ---
> >>>>> a/meta-oe/recipes-support/maliit/maliit-framework_git.bb +++
> >>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb @@ -4,7 +4=
,7
> >>>>> @@ HOMEPAGE =3D "https://wiki.maliit.org/Main_Page" LICENSE =3D "LG=
PLv2.1"
> >>>>> LIC_FILES_CHKSUM =3D
> >>>>> "file://LICENSE.LGPL;md5=3D5c917f6ce94ceb8d8d5e16e2fca5b9ad"
> >>>>>
> >>>>> -inherit autotools qt4x11 gtk-immodules-cache +inherit autotools
> >>>>> qt4x11
> >>>>>
> >>>>>
> >>>>> SRC_URI =3D
> >>>>> "git://gitorious.org/maliit/maliit-framework.git;branch=3Dmaster \ =
@@
> >>>>> -16,8 +16,9 @@ SRCREV =3D "750842dec74a9b17dca91ef779c4fc5a43c4d9dc=
" PV =3D
> >>>>> "0.92.3+git${SRCPV}"
> >>>>>
> >>>>>
> >>>>> -PACKAGES =3D+ "${PN}-gtk" -GTKIMMODULES_PACKAGES =3D "${PN}-gtk" +=
PACKAGES
> >>>>> =3D+ "\ +    ${PN}-gtk \ +    "
> >>>>>
> >>>>> # Maliit needs Qt configured with -accessibility, a patch for that =
was
> >>>>> already sent and will get merged in post 1.2. RDEPENDS_${PN} =3D
> >>>>> "qt4-plugin-inputmethod-imsw-multi libqtsvg4" @@ -57,12 +58,29 @@
> >>>>> EXTRA_QMAKEVARS_PRE =3D "\ CONFIG+=3Dlocal-install \ "
> >>>>>
> >>>>> -EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}" +do_install() { +    cd ${=
S} &&
> >>>>> (INSTALL_ROOT=3D${D} oe_runmake install)
> >>>>>
> >>>>> -do_install_append() { #Fix absolute paths -    sed -i -e
> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
> >>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf -    sed =
-i
> >>>>> -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
> >>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf +    cd
> >>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf +  =
  cd
> >>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
> >>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf +} + =
+ +
> >>>>> +# Update the inputmethod modules in gtk +pkg_postinst_${PN}-gtk() {
> >>>>> +if [ "x$D" !=3D "x" ]; then +    exit 1 +fi +gtk-query-immodules-2=
=2E0 >
> >>>>> /etc/gtk-2.0/gtk.immodules +} + +pkg_postrm_${PN}-gtk() { +if [ "x$=
D"
> >>>>> !=3D "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
> >>>>> /etc/gtk-2.0/gtk.immodules }
> >>>>>
> >>>>> S=3D "${WORKDIR}/git"
> >>>>>
> >>>>>
> >>>>> _______________________________________________ Openembedded-commits
> >>>>> mailing list
> >>>>> Openembedded-commits@lists.openembedded.org
> >>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-co=
mmits
> >>>>
> >>>>>
> >>>> Hi, can this be re-applied please?
> >>>>
> >>>> The .bbclass was taken in OE-Core with commit: [1]
> >>>>
> >>>> [1]
> >>>> https://github.com/openembedded/oe-core/commit/c67f64e5846bb2a6774e6=
1a4f3719c5f82fc3bd8
> >>>
> >>>
> >>> That's
> >>>>
> >>> not present in the danny branch, see the RFC I sent about that a few
> >>> days ago.
> >>
> >> Alright, this can wait until release branching is done.
> >
> > Even with this patch applied I still see a lot of QA ERRORs in my build:
> >
> > ERROR: QA Issue: non debug package contains .debug directory:
> > maliit-framework-doc path
> > /work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750=
842dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-do=
c/usr/share/doc/maliit-framework/maliit-sdk/examples/apps/settings/.debug/m=
aliit-exampleapp-settings
>=20
> Seems odd, I can't reproduce the problem.
> Can you post the content of your log.do_configure (or at least the
> "qmake prevar substitution:").
>=20
>=20
> Tested with Qt 4.8.1 and 4.8.3, nothing gives me any QA errors.
> Do you have any custom config switches for Qt? I can't imagine that
> debug files end up in the maliit-framework-doc package.
> This recipe was tested on Ubuntu and Fedora with OpenEmbedded updated
> last friday, no QA errors.
> How can applications and .so files end up at /usr/share at all?

Well they are in examples directory, so the difference of my build is
that examples got built and installed.

Here is whole temp dir:
http://build.shr-project.org/tests/jama/maliit-framework-temp/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC89fIACgkQN1Ujt2V2gBzmdACdF5ZbhZ1EmNL952iokUbmt7Au
Em4AoIfORt1kFGwdWJ5pifAWB5tw6lGq
=THzm
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
