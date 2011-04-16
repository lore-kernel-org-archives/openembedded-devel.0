Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBB3I-0002Df-GC for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 21:21:04 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBB1T-0007CT-Dg for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 19:19:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302960425.20934.3.camel@mattotaupa>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
	<1302956885.8709.69.camel@mattotaupa>
	<1302960425.20934.3.camel@mattotaupa>
Date: Sat, 16 Apr 2011 21:18:45 +0200
Message-ID: <1302981525.3780.7.camel@mattotaupa>
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
X-List-Received-Date: Sat, 16 Apr 2011 19:21:04 -0000
X-Groupsio-MsgNum: 31227
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-p0y8+Bwhx3IWEI0STqdZ"

--=-p0y8+Bwhx3IWEI0STqdZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.04.2011, 15:27 +0200 schrieb Paul Menzel:
> Am Samstag, den 16.04.2011, 14:28 +0200 schrieb Paul Menzel:
> > Am Freitag, den 15.04.2011, 22:40 +0200 schrieb Denis 'GNUtoo' Carikli:
> > > On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > > > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> > > >   patch sets the appropriate flags in autoconf.mk.in for
> > > >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> > > What error did you get?
> > > Maybe you could add something like:
> > >  This patch fixes the following error:
> > >  [ERROR here]
> > > To the commit message.
> >=20
> > I get the following error message.
> >=20
> >         make[7]: Entering directory `/oe/build-minimal-eglibc/minimal-d=
ev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/typeli=
b/xpidl'
> >         xpidl.c
> >         gcc -o host_xpidl.o -c -isystem/oe/build-minimal-eglibc/minimal=
-dev/sysroots/i686-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=3D\"m=
d/_linux.cfg\"  -I. -I. -I../../..
> >         /dist/include -I../../../dist/include/nsprpub  -I/oe/build-mini=
mal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozill=
a-1.9.2/dist/include/nspr -I/hom
> >         e/paul/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux=
-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/oe/build-m=
inimal-eglibc/minimal-dev/work/a
> >         rmv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/incl=
ude/nspr xpidl.c
> >        =20
> >         In file included from xpidl.c:42:
> >         xpidl.h:49:18: error: glib.h: No such file or directory
> >         In file included from xpidl_idl.c:43:
> >         xpidl.h:49:18: error: glib.h: No such file or directory
> >         In file included from xpidl_util.c:42:
> >         xpidl.h:49:18: error: glib.h: No such file or directory
> >         In file included from xpidl_header.c:42:
> >         xpidl.h:49:18: error: glib.h: No such file or directory
> >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> >         In file included from xpidl.c:42:
> >         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'enable_debug'
> >         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'enable_warnings'
> >         xpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'verbose_mode'
> >         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'emit_typelib_annotations'
> >         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'explicit_output_filename'
> >         In file included from xpidl_idl.c:43:
> >         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'enable_debug'
> >         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'enable_warnings'
> >         xpidl.h:94: error: expected declaration specifiers or '...' bef=
ore '*' tokenxpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attri=
bute__' before 'verbose_mode'
> >        =20
> >         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'emit_typelib_annotations'
> >         xpidl.h:94: error: 'gboolean' declared as function returning a =
function
> >         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attrib=
ute__' before 'explicit_output_filename'
> >         xpidl.h:100: error: expected specifier-qualifier-list before 'n=
odeHandler'
> >         xpidl.h:94: error: expected declaration specifiers or '...' bef=
ore '*' token
> >         xpidl.h:94: error: 'gboolean' declared as function returning a =
function
> >         xpidl.h:100: error: expected specifier-qualifier-list before 'n=
odeHandler'
> >         xpidl.h:130: error: expected specifier-qualifier-list before 'I=
DL_ns'
> >         xpidl.h:138: error: expected specifier-qualifier-list before 'G=
HashTable'
> >         xpidl.h:130: error: expected specifier-qualifier-list before 'I=
DL_ns'
> >         xpidl.h:156: error: expected ')' before 'p'
> >         xpidl.h:138: error: expected specifier-qualifier-list before 'G=
HashTable'
> >         xpidl.h:177: error: 'xpidl_process_node' declared as function r=
eturning a function
> >         xpidl.h:156: error: expected ')' before 'p'
> >         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function ret=
urning a function
> >         xpidl.h:177: error: 'xpidl_process_node' declared as function r=
eturning a functionxpidl.h:209: error: 'xpidl_parse_iid' declared as functi=
on returning a function
> >        =20
> >         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function ret=
urning a function
> >         xpidl.h:241: error: expected '=3D', ',', ';', 'asm' or '__attri=
bute__' before 'find_underlying_type'xpidl.h:209: error: 'xpidl_parse_iid' =
declared as function returning a function
> >        =20
> >         xpidl.h:248: error: expected ')' before 'const_tree'
> >         xpidl.h:254: error: expected ')' before 'method_tree'
> >         xpidl.h:260: error: expected ')' before 'method_tree'
> >         xpidl.h:266: error: expected ')' before 'method_tree'xpidl.h:24=
1: error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'find_u=
nderlying_type'
> >        =20
> >         xpidl.h:273: error: 'check_native' declared as function returni=
ng a functionxpidl.h:248: error: expected ')' before 'const_tree'
> >        =20
> >         xpidl.h:254: error: expected ')' before 'method_tree'
> >         xpidl.h:276: error: expected declaration specifiers or '...' be=
fore 'GSList'
> >         xpidl.h:260: error: expected ')' before 'method_tree'
> >         xpidl.h:279: error: expected ')' before 'method_tree'xpidl.h:26=
6: error: expected ')' before 'method_tree'
> >        =20
> >         xpidl.h:273: error: 'check_native' declared as function returni=
ng a function
> >         xpidl.h:276: error: expected declaration specifiers or '...' be=
fore 'GSList'
> >         xpidl.h:279: error: expected ')' before 'method_tree'
> >=20
> > > By the way, thanks a lot for the fix.
> >=20
> > I am testing this patch right now and will see if also a dependency on
> > `glib-2.0` is needed.
>=20
> Patrik=E2=80=99s patch worked just fine.
>=20
>         Build Configuration:
>         BB_VERSION        =3D "1.12.0"
>         METADATA_BRANCH   =3D "gitorious"
>         METADATA_REVISION =3D "2acbb95"
>         TARGET_ARCH       =3D "arm"
>         TARGET_OS         =3D "linux-gnueabi"
>         MACHINE           =3D "beagleboard"
>         DISTRO            =3D "minimal"
>         DISTRO_VERSION    =3D "dev-snapshot-20110416"
>         TARGET_FPU        =3D "hard"

Please wait until tomorrow. I think I made a mistake testing the patch.


Thanks,

Paul

--=-p0y8+Bwhx3IWEI0STqdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2p65UACgkQPX1aK2wOHVjwigCcC2PS0OSG3I4Ir5C2iZu2bIGj
d70Ani7DG6uS/GluJ/DeKmJRi66s9kpy
=F5ae
-----END PGP SIGNATURE-----

--=-p0y8+Bwhx3IWEI0STqdZ--
