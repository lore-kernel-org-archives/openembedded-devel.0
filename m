Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q17C2-0001Mn-HQ for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 02:12:30 +0100
Received: from f053032104.adsl.alicedsl.de ([78.53.32.104]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q17AL-0000Rl-9y for openembedded-devel@lists.openembedded.org;
	Sun, 20 Mar 2011 01:10:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110319183329.GA14868@sakrah.homelinux.org>
References: <1299591298.3785.126.camel@mattotaupa>
	<1300205205.4123.6.camel@mattotaupa>
	<AANLkTimEXRbjaJ9VXOk4m+QvpF6ZVnWzAGaXY9Q2tiyc@mail.gmail.com>
	<1300364903.3950.21.camel@mattotaupa>
	<1300402006.17833.14.camel@mattotaupa>
	<AANLkTi=xe7p694-8-bnGV85H59M-tJvTUnwm6TgCFPZk@mail.gmail.com>
	<1300449625.3830.47.camel@mattotaupa>
	<20110319183329.GA14868@sakrah.homelinux.org>
Date: Sun, 20 Mar 2011 02:10:44 +0100
Message-ID: <1300583444.7379.1.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] xfce_session_4.6.{1, 2}: explicitly pass the path of `iceauth`
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
X-List-Received-Date: Sun, 20 Mar 2011 01:12:30 -0000
X-Groupsio-MsgNum: 30444
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YN2NztUtJpVpCaAgUPxl"

--=-YN2NztUtJpVpCaAgUPxl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 19.03.2011, 11:33 -0700 schrieb Khem Raj:
> On (18/03/11 13:00), Paul Menzel wrote:
> > Date: Fri, 18 Mar 2011 12:03:43 +0100
> >=20
> > Xfce Session build depends on the executable `iceauth`, which fails whe=
n cross compiling for a different architecture.
> >=20
> >         checking if the linker (arm-oe-linux-gnueabi-ld --sysroot=3D/oe=
/build-minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi) is GNU=
 ld... (cached) yes
> >         checking whether to build with profiling support... no
> >         checking whether to compile with coverage profiling instrumenta=
tion... no
> >         checking whether to disable assertions... no
> >         checking whether to build final version... yes
> >         checking whether arm-oe-linux-gnueabi-ld --sysroot=3D/oe/build-=
minimal-eglibc/minimal-dev/sysroots/armv5te-oe-linux-gnueabi accepts -O1...=
 yes
> >         checking for iceauth... no
> >         configure: error: iceauth missing, please check your X11 instal=
lation
> >=20
> > As suggested by Khem Raj [1] pass the value =E2=80=93 `/usr/bin/iceauth=
` is taken =E2=80=93 to the configure script so that the test is avoided.
> >=20
> > Therefore `iceauth` is removed from `DEPENDS` and the `PR` variable is =
incremented.
> >=20
> > This issue has been reported upstream as ticket #7420 [2].
> >=20
> > [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/=
031115.html
> > [2] http://bugzilla.xfce.org/show_bug.cgi?id=3D7420
> >=20
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> >  recipes/xfce-base/xfce4-session_4.6.1.bb |    6 ++++--
> >  recipes/xfce-base/xfce4-session_4.6.2.bb |    6 ++++--
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/recipes/xfce-base/xfce4-session_4.6.1.bb b/recipes/xfce-ba=
se/xfce4-session_4.6.1.bb
> > index ba66ac1..5029b21 100644
> > --- a/recipes/xfce-base/xfce4-session_4.6.1.bb
> > +++ b/recipes/xfce-base/xfce4-session_4.6.1.bb
> > @@ -1,13 +1,15 @@
> >  DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop=
 Environment"
> > -DEPENDS =3D "lbwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> > +DEPENDS =3D "lbwnck libxfcegui4 libxfce4util dbus xfce-utils"
> >  SECTION =3D "x11"
> > =20
> > -PR =3D "r4"
> > +PR =3D "r5"
> > =20
> >  inherit xfce46
> > =20
> >  RDEPENDS_${PN} =3D "iceauth xfce-utils xinit dbus-x11"
> > =20
> > +EXTRA_OECONF +=3D "ac_cv_path_ICEAUTH=3D/usr/bin/iceauth"
>=20
> Would it make sense to have iceauth-native instead ?

It never really executes `iceauth` during compile time but just during
configure to determine the runtime path. So `iceauth-native` is not
needed and would be even result in the wrong path, I think.

> >  FILES_${PN} +=3D "${libdir}/xfce4/splash/engines/*.so"
> >  FILES_${PN} +=3D "${datadir}/xfce4/tips/*"
> >  FILES_${PN} +=3D "${datadir}/themes/Default/balou/*"
> > diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb b/recipes/xfce-ba=
se/xfce4-session_4.6.2.bb
> > index d7f768a..c937775 100644
> > --- a/recipes/xfce-base/xfce4-session_4.6.2.bb
> > +++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
> > @@ -1,13 +1,15 @@
> >  DESCRIPTION =3D "xfce4-session is a session manager for Xfce 4 Desktop=
 Environment"
> > -DEPENDS =3D "libwnck libxfcegui4 libxfce4util dbus iceauth xfce-utils"
> > +DEPENDS =3D "libwnck libxfcegui4 libxfce4util dbus xfce-utils"
> >  SECTION =3D "x11"
> > =20
> > -PR =3D "r0"
> > +PR =3D "r1"
> > =20
> >  inherit xfce46
> > =20
> >  RDEPENDS_${PN} =3D "iceauth xfce-utils xinit dbus-x11"
> > =20
> > +EXTRA_OECONF +=3D "ac_cv_path_ICEAUTH=3D/usr/bin/iceauth"
> > +
> >  FILES_${PN} +=3D "${libdir}/xfce4/splash/engines/*.so"
> >  FILES_${PN} +=3D "${datadir}/xfce4/tips/*"
> >  FILES_${PN} +=3D "${datadir}/themes/Default/balou/*"
> > --=20
> > 1.7.4.1

--=-YN2NztUtJpVpCaAgUPxl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2FVAkACgkQPX1aK2wOHVgThQCfbKYG54pVzq8b5sWlDydsiNlY
YiAAnR7ZHW/f7LMcvTSLS9UnSjlEk2P+
=kbvY
-----END PGP SIGNATURE-----

--=-YN2NztUtJpVpCaAgUPxl--
