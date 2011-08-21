Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qv3SK-0007lW-Nt for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2011 10:32:32 +0200
Received: from f053036105.adsl.alicedsl.de ([78.53.36.105]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qv3O2-00014e-EL for openembedded-devel@lists.openembedded.org;
	Sun, 21 Aug 2011 08:28:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313913636-31667-2-git-send-email-dbaryshkov@gmail.com>
References: <1313913636-31667-1-git-send-email-dbaryshkov@gmail.com>
	<1313913636-31667-2-git-send-email-dbaryshkov@gmail.com>
Date: Sun, 21 Aug 2011 10:27:50 +0200
Message-ID: <1313915270.4583.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-gnome 2/2] gnome-disk-utility: fix path for dbus interface definitions
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
X-List-Received-Date: Sun, 21 Aug 2011 08:32:32 -0000
X-Groupsio-MsgNum: 33748
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qwlzdajP34wY6gZvc2KJ"

--=-qwlzdajP34wY6gZvc2KJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Dmitry,


Am Sonntag, den 21.08.2011, 12:00 +0400 schrieb Dmitry Eremin-Solenikov:
> During compilation gdu looks for several UDisks dbus xml files. However
> it looks for them in system root and not in sysroot, failing if those
> don't exist. Fix that.

could you paste the error message please?

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  .../gnome-disk-utility/fix-dbus-interfaces.patch   |   35 ++++++++++++++=
++++++
>  .../gnome-disk-utility_2.32.0.bb                   |    1 +
>  2 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-dis=
k-utility/fix-dbus-interfaces.patch
>=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty/fix-dbus-interfaces.patch b/meta-gnome/recipes-gnome/gnome-disk-utility/=
gnome-disk-utility/fix-dbus-interfaces.patch
> new file mode 100644
> index 0000000..1faadb1
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/fix-=
dbus-interfaces.patch

The patch header is missing [1]. You can also paste the error message in
here.

> @@ -0,0 +1,35 @@
> +Index: gnome-disk-utility-2.32.0/src/gdu/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- gnome-disk-utility-2.32.0.orig/src/gdu/Makefile.am	2011-08-20 01:59:=
16.000000000 +0400
> ++++ gnome-disk-utility-2.32.0/src/gdu/Makefile.am	2011-08-20 02:08:18.00=
0000000 +0400
> +@@ -14,20 +14,20 @@
> + gdu-marshal.c: gdu-marshal.list
> + 	echo "#include \"gdu-marshal.h\"" > $@ && glib-genmarshal $< --prefix=
=3Dgdu_marshal --body >> $@
> +=20
> +-udisks-daemon-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDis=
ks.xml Makefile.am
> +-	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-daemon-glue.h /usr/share/dbus-1/interfaces/org.freedeskto=
p.UDisks.xml
> ++udisks-daemon-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interf=
aces/org.freedesktop.UDisks.xml Makefile.am
> ++	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-daemon-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/=
interfaces/org.freedesktop.UDisks.xml

Hardcoding the path is certainly not portable/good for cross
compilation. There should be another Aufomake(?) variable for looking up
the sysroot besides using `pkg-config`. I do not know what though. Who
distributes `org.freedesktop.UDisks.xml`? It looks like `udisk`.

Anybody else?

> +-udisks-device-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDis=
ks.Device.xml Makefile.am
> +-	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-device-glue.h /usr/share/dbus-1/interfaces/org.freedeskto=
p.UDisks.Device.xml
> ++udisks-device-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interf=
aces/org.freedesktop.UDisks.Device.xml Makefile.am
> ++	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-device-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/=
interfaces/org.freedesktop.UDisks.Device.xml
> +=20
> +-udisks-adapter-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDi=
sks.Adapter.xml Makefile.am
> +-	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-adapter-glue.h /usr/share/dbus-1/interfaces/org.freedeskt=
op.UDisks.Adapter.xml
> ++udisks-adapter-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/inter=
faces/org.freedesktop.UDisks.Adapter.xml Makefile.am
> ++	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-adapter-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1=
/interfaces/org.freedesktop.UDisks.Adapter.xml
> +=20
> +-udisks-expander-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UD=
isks.Expander.xml Makefile.am
> +-	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-expander-glue.h /usr/share/dbus-1/interfaces/org.freedesk=
top.UDisks.Expander.xml
> ++udisks-expander-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/inte=
rfaces/org.freedesktop.UDisks.Expander.xml Makefile.am
> ++	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-expander-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-=
1/interfaces/org.freedesktop.UDisks.Expander.xml
> +=20
> +-udisks-port-glue.h: /usr/share/dbus-1/interfaces/org.freedesktop.UDisks=
.Port.xml Makefile.am
> +-	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-port-glue.h /usr/share/dbus-1/interfaces/org.freedesktop.=
UDisks.Port.xml
> ++udisks-port-glue.h: $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/interfac=
es/org.freedesktop.UDisks.Port.xml Makefile.am
> ++	dbus-binding-tool --prefix=3Ddevkit_disks_daemon --mode=3Dglib-client =
--output=3Dudisks-port-glue.h $(PKG_CONFIG_SYSROOT_DIR)/usr/share/dbus-1/in=
terfaces/org.freedesktop.UDisks.Port.xml
> +=20
> + lib_LTLIBRARIES=3Dlibgdu.la
> +=20
> diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_2.32.0.bb
> index f7945c5..ab1113c 100644
> --- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32=
.0.bb
> @@ -11,6 +11,7 @@ SRC_URI[archive.sha256sum] =3D "03e461b6bda7f773f8018d2=
5fa3213d3073d4dc83a76e6b39d
> =20
>  SRC_URI +=3D "\
>       file://disable-scrollkeeper.patch \
> +     file://fix-dbus-interfaces.patch \
>       "
> =20
>  EXTRA_OECONF +=3D "--disable-scrollkeeper"


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines

--=-qwlzdajP34wY6gZvc2KJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5QwYYACgkQPX1aK2wOHVhJbgCdHUSBR89zCiYhmIviuj3XJE1L
KvIAniLqJFUnSHSEox0rsrKz+zhNBbpF
=DjeY
-----END PGP SIGNATURE-----

--=-qwlzdajP34wY6gZvc2KJ--
