Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB5Yx-0005WT-1q for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 15:29:24 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB5X7-0007zg-Ek for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:27:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302956885.8709.69.camel@mattotaupa>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
	<1302956885.8709.69.camel@mattotaupa>
Date: Sat, 16 Apr 2011 15:27:05 +0200
Message-ID: <1302960425.20934.3.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Sat, 16 Apr 2011 13:29:24 -0000
X-Groupsio-MsgNum: 31220
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qxAsQ6kEoJpGJITgBEea"

--=-qxAsQ6kEoJpGJITgBEea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.04.2011, 14:28 +0200 schrieb Paul Menzel:
> Am Freitag, den 15.04.2011, 22:40 +0200 schrieb Denis 'GNUtoo' Carikli:
> > On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> > >   patch sets the appropriate flags in autoconf.mk.in for
> > >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> > What error did you get?
> > Maybe you could add something like:
> >  This patch fixes the following error:
> >  [ERROR here]
> > To the commit message.
>=20
> I get the following error message.
>=20
>         make[7]: Entering directory `/oe/build-minimal-eglibc/minimal-dev=
/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/typelib/=
xpidl'
>         xpidl.c
>         gcc -o host_xpidl.o -c -isystem/oe/build-minimal-eglibc/minimal-d=
ev/sysroots/i686-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=3D\"md/=
_linux.cfg\"  -I. -I. -I../../..
>         /dist/include -I../../../dist/include/nsprpub  -I/oe/build-minima=
l-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-=
1.9.2/dist/include/nspr -I/hom
>         e/paul/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-g=
nueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/oe/build-min=
imal-eglibc/minimal-dev/work/a
>         rmv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/includ=
e/nspr xpidl.c
>        =20
>         In file included from xpidl.c:42:
>         xpidl.h:49:18: error: glib.h: No such file or directory
>         In file included from xpidl_idl.c:43:
>         xpidl.h:49:18: error: glib.h: No such file or directory
>         In file included from xpidl_util.c:42:
>         xpidl.h:49:18: error: glib.h: No such file or directory
>         In file included from xpidl_header.c:42:
>         xpidl.h:49:18: error: glib.h: No such file or directory
>         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
>         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
>         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
>         In file included from xpidl.c:42:
>         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'enable_debug'
>         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'enable_warnings'
>         xpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'verbose_mode'
>         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'emit_typelib_annotations'
>         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'explicit_output_filename'
>         In file included from xpidl_idl.c:43:
>         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'enable_debug'
>         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'enable_warnings'
>         xpidl.h:94: error: expected declaration specifiers or '...' befor=
e '*' tokenxpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attribu=
te__' before 'verbose_mode'
>        =20
>         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'emit_typelib_annotations'
>         xpidl.h:94: error: 'gboolean' declared as function returning a fu=
nction
>         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'explicit_output_filename'
>         xpidl.h:100: error: expected specifier-qualifier-list before 'nod=
eHandler'
>         xpidl.h:94: error: expected declaration specifiers or '...' befor=
e '*' token
>         xpidl.h:94: error: 'gboolean' declared as function returning a fu=
nction
>         xpidl.h:100: error: expected specifier-qualifier-list before 'nod=
eHandler'
>         xpidl.h:130: error: expected specifier-qualifier-list before 'IDL=
_ns'
>         xpidl.h:138: error: expected specifier-qualifier-list before 'GHa=
shTable'
>         xpidl.h:130: error: expected specifier-qualifier-list before 'IDL=
_ns'
>         xpidl.h:156: error: expected ')' before 'p'
>         xpidl.h:138: error: expected specifier-qualifier-list before 'GHa=
shTable'
>         xpidl.h:177: error: 'xpidl_process_node' declared as function ret=
urning a function
>         xpidl.h:156: error: expected ')' before 'p'
>         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function retur=
ning a function
>         xpidl.h:177: error: 'xpidl_process_node' declared as function ret=
urning a functionxpidl.h:209: error: 'xpidl_parse_iid' declared as function=
 returning a function
>        =20
>         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function retur=
ning a function
>         xpidl.h:241: error: expected '=3D', ',', ';', 'asm' or '__attribu=
te__' before 'find_underlying_type'xpidl.h:209: error: 'xpidl_parse_iid' de=
clared as function returning a function
>        =20
>         xpidl.h:248: error: expected ')' before 'const_tree'
>         xpidl.h:254: error: expected ')' before 'method_tree'
>         xpidl.h:260: error: expected ')' before 'method_tree'
>         xpidl.h:266: error: expected ')' before 'method_tree'xpidl.h:241:=
 error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'find_und=
erlying_type'
>        =20
>         xpidl.h:273: error: 'check_native' declared as function returning=
 a functionxpidl.h:248: error: expected ')' before 'const_tree'
>        =20
>         xpidl.h:254: error: expected ')' before 'method_tree'
>         xpidl.h:276: error: expected declaration specifiers or '...' befo=
re 'GSList'
>         xpidl.h:260: error: expected ')' before 'method_tree'
>         xpidl.h:279: error: expected ')' before 'method_tree'xpidl.h:266:=
 error: expected ')' before 'method_tree'
>        =20
>         xpidl.h:273: error: 'check_native' declared as function returning=
 a function
>         xpidl.h:276: error: expected declaration specifiers or '...' befo=
re 'GSList'
>         xpidl.h:279: error: expected ')' before 'method_tree'
>=20
> > By the way, thanks a lot for the fix.
>=20
> I am testing this patch right now and will see if also a dependency on
> `glib-2.0` is needed.

Patrik=E2=80=99s patch worked just fine.

        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "gitorious"
        METADATA_REVISION =3D "2acbb95"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "minimal"
        DISTRO_VERSION    =3D "dev-snapshot-20110416"
        TARGET_FPU        =3D "hard"


Thanks,

Paul

--=-qxAsQ6kEoJpGJITgBEea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2pmSMACgkQPX1aK2wOHVhSqgCcD5koVKeh/vXjwN/v2NsiLvJr
8H4An1589KEYAerfbqaDR8C7yj+FtzRo
=DIB+
-----END PGP SIGNATURE-----

--=-qxAsQ6kEoJpGJITgBEea--
