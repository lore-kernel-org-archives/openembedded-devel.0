Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4MQM-0003iI-Hq for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 01:32:27 +0200
Received: from f053047056.adsl.alicedsl.de ([78.53.47.56]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4MQ1-0001I2-V0 for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 23:32:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
References: <1286500978.3659.60.camel@mattotaupa>
	<AANLkTim9By3dRuBbtOveONnCHOso+SvtE2mTt+5yg1SZ@mail.gmail.com>
Date: Sat, 09 Oct 2010 01:32:04 +0200
Message-ID: <1286580724.4113.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gtk+_2.20.1: add `pango-native` to `DEPENDS`
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
X-List-Received-Date: Fri, 08 Oct 2010 23:32:28 -0000
X-Groupsio-MsgNum: 24545
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-zlNfonm1hF1bPk9K77oi"

--=-zlNfonm1hF1bPk9K77oi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 08.10.2010, 08:24 +0200 schrieb Frans Meulenbroeks:
> 2010/10/8 Paul Menzel <paulepanter@users.sourceforge.net>:

[=E2=80=A6]

> > Since two or three days I am not able to build `gtk+_2.20.1.bb` anymore=
. I tried to revert to `gtk+.inc` 9730a2 [1] with
> >
> >    git checkout 9730a28e669931fee601756e949bb210999b4b81 recipes/gtk+/g=
tk+.inc
> >
> > but it did not help. I do still get the same error.
> >
> >    | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/g=
-ir-scanner  --add-include-path=3D../gdk-pixbuf --namespace=3DGdk --nsversi=
on=3D2.0 --libtool=3D"/bin/sh ../i686-linux-libtool"  --include=3DGio-2.0 -=
-include=3DGdkPixbuf-2.0 --include=3DPango-1.0   --library=3Dlibgdk-x11-2.0=
.la --strip-prefix=3DGdk --add-include-path=3D../gdk-pixbuf -DG_LOG_DOMAIN=
=3D\"Gdk\" -DGDK_COMPILATION -I.. -I../gdk -I../gdk-pixbuf -DG_DISABLE_CAST=
_CHECKS -pthread -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux=
/usr/include/glib-2.0 -I/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-=
linux/usr/lib/glib-2.0/include -I/oe/build-minimal-eglibc/minimal-dev/sysro=
ots/i686-linux/usr/include/pango-1.0 -I/oe/build-minimal-eglibc/minimal-dev=
/sysroots/i686-linux/usr/include/cairo -I/oe/build-minimal-eglibc/minimal-d=
ev/sysroots/i686-linux/usr/include/pixman-1 -I/oe/build-minimal-eglibc/mini=
mal-dev/sysroots/i686-linux/usr/include/freetype2 -I/oe/build-minimal-eglib=
c/minimal-dev/sysroots/i686-linux/usr/include -I/oe/build-minimal-eglibc/mi=
nimal-dev/sysroots/i686-linux/usr/include/libpng12 -I/oe/build-minimal-egli=
bc/minimal-dev/sysroots/i686-linux/usr/include/gio-unix-2.0/      gdk.h gdk=
applaunchcontext.h gdkcairo.h gdkcolor.h gdkcursor.h gdkdisplay.h gdkdispla=
ymanager.h gdkdnd.h gdkdrawable.h gdkevents.h gdkfont.h gdkgc.h gdki18n.h g=
dkimage.h gdkinput.h gdkkeys.h gdkkeysyms.h gdkpango.h gdkpixbuf.h gdkpixma=
p.h gdkprivate.h gdkproperty.h gdkregion.h gdkrgb.h gdkscreen.h gdkselectio=
n.h gdkspawn.h gdktestutils.h gdktypes.h gdkvisual.h gdkwindow.h gdk.c gdka=
pplaunchcontext.c gdkcairo.c gdkcolor.c gdkcursor.c gdkdisplay.c gdkdisplay=
manager.c gdkdnd.c gdkdraw.c gdkevents.c gdkfont.c gdkgc.c gdkglobals.c gdk=
image.c gdkkeys.c gdkkeyuni.c gdkoffscreenwindow.c gdkpango.c gdkpixbuf-dra=
wable.c gdkpixbuf-render.c gdkpixmap.c gdkpolyreg-generic.c gdkrectangle.c =
gdkregion-generic.c gdkrgb.c gdkscreen.c gdkselection.c gdkvisual.c gdkwind=
ow.c gdkwindowimpl.c gdkenumtypes.c gdkenumtypes.h x11/checksettings.c x11/=
gdkapplaunchcontext-x11.c x11/gdkasync.c x11/gdkcolor-x11.c x11/gdkcursor-x=
11.c x11/gdkdisplay-x11.c x11/gdkdnd-x11.c x11/gdkdrawable-x11.c x11/gdkeve=
nts-x11.c x11/gdkfont-x11.c x11/gdkgc-x11.c x11/gdkgeometry-x11.c x11/gdkgl=
obals-x11.c x11/gdkim-x11.c x11/gdkimage-x11.c x11/gdkinput-none.c x11/gdki=
nput-x11.c x11/gdkinput-xfree.c x11/gdkinput.c x11/gdkkeys-x11.c x11/gdkmai=
n-x11.c x11/gdkpixmap-x11.c x11/gdkproperty-x11.c x11/gdkscreen-x11.c x11/g=
dkselection-x11.c x11/gdksettings.c x11/gdkspawn-x11.c x11/gdktestutils-x11=
.c x11/gdkvisual-x11.c x11/gdkwindow-x11.c x11/gdkxftdefaults.c x11/gdkxid.=
c x11/xsettings-client.c x11/xsettings-common.c libgdk-x11-2.0.la Makefile =
--output Gdk-2.0.gir
> >    | Couldn't find include 'Pango-1.0.gir' (search path: ['../gdk-pixbu=
f', '../gdk-pixbuf', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-li=
nux/usr/share/gir-1.0', '/oe/build-minimal-eglibc/minimal-dev/sysroots/i686=
-linux/usr/share/gir-1.0', '/usr/share/gir-1.0', '/oe/build-minimal-eglibc/=
minimal-dev/sysroots/i686-linux/usr/share/gir-1.0'])
> >
> > `Pango-1.0.gir` is not available in sysroot. But nothing seems to have =
changed regarding Pango during the last days either.
> >
> > I am using `minimal` for `MACHINE =3D "beagleboard"`.
> >
> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D973=
0a28e669931fee601756e949bb210999b4b81
> >
> > Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> >  recipes/gtk+/gtk+_2.20.1.bb |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
> > index 6ef5e5b..915ccf5 100644
> > --- a/recipes/gtk+/gtk+_2.20.1.bb
> > +++ b/recipes/gtk+/gtk+_2.20.1.bb
> > @@ -19,6 +19,8 @@ ARM_INSTRUCTION_SET =3D "arm"
> >  DEPENDS_virtclass-native =3D "libpng-native atk-native pango-native ca=
iro-native libxrender-native libxext-native libgcrypt-native"
> >  PROVIDES_virtclass-native =3D "gdk-pixbuf-csource-native"
> >
> > +DEPENDS +=3D "pango-native"
> > +
> >  # Enable xkb selectively
> >  XKBTOGGLE =3D " --disable-xkb"
> >  XKBTOGGLE_angstrom =3D ""
> > --
> >
> I doubt that this is sound.

The build finished without errors after this change. I will test some
more though.

> Your error indicates you are missing includes, so you might need a
> DEPENDS on pango, not on pango-native

`gtk+_2.20.1` already depends on `pango` in `gtk+.inc`.

> (and maybe pango needs to be
> fixed to put its stuff in the right dir or gtk+ to look at the right
> place)

I am wondering what changed during the last days. Maybe I need to do a
`git bisect`. But I guess that will take a long time.

> Then again I do not see any beagle specific include dirs in your path,
> which also greatly surprises me.

Maybe it has to do with `g-ir-scanner`. I could not find it sysroot.

[=E2=80=A6]

> One other thing:
> *if* we need a depend on pango-native, I guess it should go from the
> DEPENDS_virtclass-native.

That sounds reasonable. I will send an updated patch than.

> Then again I am not that good wrt the
> machinery that I can say whether it will not add an additional -native
> or so. I recall another issue with that from earlier this week. Then
> again I feel the build machinery should not add an addtional -native
> suffix to depends etc that already have -native at the end).

Is this documented somewhere besides the source?


Thanks,

Paul

--=-zlNfonm1hF1bPk9K77oi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkyvqfQACgkQPX1aK2wOHVhGjgCYhuy/p73oa/lLDZ0WhF9qqodX
NwCePUSM+lQCi+SQOpcjSgd2wKGKOvU=
=4Rby
-----END PGP SIGNATURE-----

--=-zlNfonm1hF1bPk9K77oi--
