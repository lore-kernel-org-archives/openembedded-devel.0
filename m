Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB4dr-0004UW-29 for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 14:30:23 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB4c1-0005Fq-LS for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 12:28:30 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302900059.3534.1.camel@gnutoo-desktop>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
Date: Sat, 16 Apr 2011 14:28:05 +0200
Message-ID: <1302956885.8709.69.camel@mattotaupa>
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
X-List-Received-Date: Sat, 16 Apr 2011 12:30:23 -0000
X-Groupsio-MsgNum: 31218
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ox+BnJtxf6O+B1k06H11"

--=-ox+BnJtxf6O+B1k06H11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 15.04.2011, 22:40 +0200 schrieb Denis 'GNUtoo' Carikli:
> On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
> >   patch sets the appropriate flags in autoconf.mk.in for
> >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> What error did you get?
> Maybe you could add something like:
>  This patch fixes the following error:
>  [ERROR here]
> To the commit message.

I get the following error message.

        make[7]: Entering directory `/oe/build-minimal-eglibc/minimal-dev/w=
ork/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/typelib/xp=
idl'
        xpidl.c
        gcc -o host_xpidl.o -c -isystem/oe/build-minimal-eglibc/minimal-dev=
/sysroots/i686-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=3D\"md/_l=
inux.cfg\"  -I. -I. -I../../..
        /dist/include -I../../../dist/include/nsprpub  -I/oe/build-minimal-=
eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.=
9.2/dist/include/nspr -I/hom
        e/paul/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnu=
eabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/oe/build-minim=
al-eglibc/minimal-dev/work/a
        rmv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/=
nspr xpidl.c
       =20
        In file included from xpidl.c:42:
        xpidl.h:49:18: error: glib.h: No such file or directory
        In file included from xpidl_idl.c:43:
        xpidl.h:49:18: error: glib.h: No such file or directory
        In file included from xpidl_util.c:42:
        xpidl.h:49:18: error: glib.h: No such file or directory
        In file included from xpidl_header.c:42:
        xpidl.h:49:18: error: glib.h: No such file or directory
        xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
        xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
        xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
        In file included from xpidl.c:42:
        xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'enable_debug'
        xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'enable_warnings'
        xpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'verbose_mode'
        xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'emit_typelib_annotations'
        xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'explicit_output_filename'
        In file included from xpidl_idl.c:43:
        xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'enable_debug'
        xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'enable_warnings'
        xpidl.h:94: error: expected declaration specifiers or '...' before =
'*' tokenxpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attribute=
__' before 'verbose_mode'
       =20
        xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'emit_typelib_annotations'
        xpidl.h:94: error: 'gboolean' declared as function returning a func=
tion
        xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribute_=
_' before 'explicit_output_filename'
        xpidl.h:100: error: expected specifier-qualifier-list before 'nodeH=
andler'
        xpidl.h:94: error: expected declaration specifiers or '...' before =
'*' token
        xpidl.h:94: error: 'gboolean' declared as function returning a func=
tion
        xpidl.h:100: error: expected specifier-qualifier-list before 'nodeH=
andler'
        xpidl.h:130: error: expected specifier-qualifier-list before 'IDL_n=
s'
        xpidl.h:138: error: expected specifier-qualifier-list before 'GHash=
Table'
        xpidl.h:130: error: expected specifier-qualifier-list before 'IDL_n=
s'
        xpidl.h:156: error: expected ')' before 'p'
        xpidl.h:138: error: expected specifier-qualifier-list before 'GHash=
Table'
        xpidl.h:177: error: 'xpidl_process_node' declared as function retur=
ning a function
        xpidl.h:156: error: expected ')' before 'p'
        xpidl.h:202: error: 'xpidl_sprint_iid' declared as function returni=
ng a function
        xpidl.h:177: error: 'xpidl_process_node' declared as function retur=
ning a functionxpidl.h:209: error: 'xpidl_parse_iid' declared as function r=
eturning a function
       =20
        xpidl.h:202: error: 'xpidl_sprint_iid' declared as function returni=
ng a function
        xpidl.h:241: error: expected '=3D', ',', ';', 'asm' or '__attribute=
__' before 'find_underlying_type'xpidl.h:209: error: 'xpidl_parse_iid' decl=
ared as function returning a function
       =20
        xpidl.h:248: error: expected ')' before 'const_tree'
        xpidl.h:254: error: expected ')' before 'method_tree'
        xpidl.h:260: error: expected ')' before 'method_tree'
        xpidl.h:266: error: expected ')' before 'method_tree'xpidl.h:241: e=
rror: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'find_under=
lying_type'
       =20
        xpidl.h:273: error: 'check_native' declared as function returning a=
 functionxpidl.h:248: error: expected ')' before 'const_tree'
       =20
        xpidl.h:254: error: expected ')' before 'method_tree'
        xpidl.h:276: error: expected declaration specifiers or '...' before=
 'GSList'
        xpidl.h:260: error: expected ')' before 'method_tree'
        xpidl.h:279: error: expected ')' before 'method_tree'xpidl.h:266: e=
rror: expected ')' before 'method_tree'
       =20
        xpidl.h:273: error: 'check_native' declared as function returning a=
 function
        xpidl.h:276: error: expected declaration specifiers or '...' before=
 'GSList'
        xpidl.h:279: error: expected ')' before 'method_tree'

> By the way, thanks a lot for the fix.

I am testing this patch right now and will see if also a dependency on
`glib-2.0` is needed.


Thanks,

Paul

--=-ox+BnJtxf6O+B1k06H11
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2pi1UACgkQPX1aK2wOHViE2wCfTmcRm8DuatXk94ekSr74FYcF
/qYAn0sq9c7l3i1kP6igF+xkr3fDFaB+
=1bKB
-----END PGP SIGNATURE-----

--=-ox+BnJtxf6O+B1k06H11--
