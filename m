Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBPQ0-0005pW-Vv for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 12:41:29 +0200
Received: from f053034068.adsl.alicedsl.de ([78.53.34.68]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QBPOC-0002NL-Fg for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 10:39:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302981525.3780.7.camel@mattotaupa>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
	<1302900059.3534.1.camel@gnutoo-desktop>
	<1302956885.8709.69.camel@mattotaupa>
	<1302960425.20934.3.camel@mattotaupa>
	<1302981525.3780.7.camel@mattotaupa>
Date: Sun, 17 Apr 2011 12:39:10 +0200
Message-ID: <1303036750.23572.5.camel@mattotaupa>
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
X-List-Received-Date: Sun, 17 Apr 2011 10:41:29 -0000
X-Groupsio-MsgNum: 31236
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Qd5uc/40Hf8cqTWM9jLA"

--=-Qd5uc/40Hf8cqTWM9jLA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 16.04.2011, 21:18 +0200 schrieb Paul Menzel:
> Am Samstag, den 16.04.2011, 15:27 +0200 schrieb Paul Menzel:
> > Am Samstag, den 16.04.2011, 14:28 +0200 schrieb Paul Menzel:
> > > Am Freitag, den 15.04.2011, 22:40 +0200 schrieb Denis 'GNUtoo' Carikl=
i:
> > > > On Fri, 2011-04-15 at 18:42 +0200, Patrik Dahlstr=C3=B6m wrote:
> > > > > * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. Th=
is
> > > > >   patch sets the appropriate flags in autoconf.mk.in for
> > > > >   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
> > > > What error did you get?
> > > > Maybe you could add something like:
> > > >  This patch fixes the following error:
> > > >  [ERROR here]
> > > > To the commit message.
> > >=20
> > > I get the following error message.
> > >=20
> > >         make[7]: Entering directory `/oe/build-minimal-eglibc/minimal=
-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/xpcom/type=
lib/xpidl'
> > >         xpidl.c
> > >         gcc -o host_xpidl.o -c -isystem/oe/build-minimal-eglibc/minim=
al-dev/sysroots/i686-linux/usr/include -O2 -g -DXP_UNIX -O3  -DMDCPUCFG=3D\=
"md/_linux.cfg\"  -I. -I. -I../../..
> > >         /dist/include -I../../../dist/include/nsprpub  -I/oe/build-mi=
nimal-eglibc/minimal-dev/work/armv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozi=
lla-1.9.2/dist/include/nspr -I/hom
> > >         e/paul/oe/build-minimal-eglibc/minimal-dev/work/armv7a-oe-lin=
ux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/include/nss      -I/oe/build=
-minimal-eglibc/minimal-dev/work/a
> > >         rmv7a-oe-linux-gnueabi/firefox-3.6.8-r3/mozilla-1.9.2/dist/in=
clude/nspr xpidl.c
> > >        =20
> > >         In file included from xpidl.c:42:
> > >         xpidl.h:49:18: error: glib.h: No such file or directory
> > >         In file included from xpidl_idl.c:43:
> > >         xpidl.h:49:18: error: glib.h: No such file or directory
> > >         In file included from xpidl_util.c:42:
> > >         xpidl.h:49:18: error: glib.h: No such file or directory
> > >         In file included from xpidl_header.c:42:
> > >         xpidl.h:49:18: error: glib.h: No such file or directory
> > >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> > >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> > >         xpidl.h:52:24: error: libIDL/IDL.h: No such file or directory
> > >         In file included from xpidl.c:42:
> > >         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'enable_debug'
> > >         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'enable_warnings'
> > >         xpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'verbose_mode'
> > >         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'emit_typelib_annotations'
> > >         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'explicit_output_filename'
> > >         In file included from xpidl_idl.c:43:
> > >         xpidl.h:79: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'enable_debug'
> > >         xpidl.h:80: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'enable_warnings'
> > >         xpidl.h:94: error: expected declaration specifiers or '...' b=
efore '*' tokenxpidl.h:81: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before 'verbose_mode'
> > >        =20
> > >         xpidl.h:82: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'emit_typelib_annotations'
> > >         xpidl.h:94: error: 'gboolean' declared as function returning =
a function
> > >         xpidl.h:83: error: expected '=3D', ',', ';', 'asm' or '__attr=
ibute__' before 'explicit_output_filename'
> > >         xpidl.h:100: error: expected specifier-qualifier-list before =
'nodeHandler'
> > >         xpidl.h:94: error: expected declaration specifiers or '...' b=
efore '*' token
> > >         xpidl.h:94: error: 'gboolean' declared as function returning =
a function
> > >         xpidl.h:100: error: expected specifier-qualifier-list before =
'nodeHandler'
> > >         xpidl.h:130: error: expected specifier-qualifier-list before =
'IDL_ns'
> > >         xpidl.h:138: error: expected specifier-qualifier-list before =
'GHashTable'
> > >         xpidl.h:130: error: expected specifier-qualifier-list before =
'IDL_ns'
> > >         xpidl.h:156: error: expected ')' before 'p'
> > >         xpidl.h:138: error: expected specifier-qualifier-list before =
'GHashTable'
> > >         xpidl.h:177: error: 'xpidl_process_node' declared as function=
 returning a function
> > >         xpidl.h:156: error: expected ')' before 'p'
> > >         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function r=
eturning a function
> > >         xpidl.h:177: error: 'xpidl_process_node' declared as function=
 returning a functionxpidl.h:209: error: 'xpidl_parse_iid' declared as func=
tion returning a function
> > >        =20
> > >         xpidl.h:202: error: 'xpidl_sprint_iid' declared as function r=
eturning a function
> > >         xpidl.h:241: error: expected '=3D', ',', ';', 'asm' or '__att=
ribute__' before 'find_underlying_type'xpidl.h:209: error: 'xpidl_parse_iid=
' declared as function returning a function
> > >        =20
> > >         xpidl.h:248: error: expected ')' before 'const_tree'
> > >         xpidl.h:254: error: expected ')' before 'method_tree'
> > >         xpidl.h:260: error: expected ')' before 'method_tree'
> > >         xpidl.h:266: error: expected ')' before 'method_tree'xpidl.h:=
241: error: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'find=
_underlying_type'
> > >        =20
> > >         xpidl.h:273: error: 'check_native' declared as function retur=
ning a functionxpidl.h:248: error: expected ')' before 'const_tree'
> > >        =20
> > >         xpidl.h:254: error: expected ')' before 'method_tree'
> > >         xpidl.h:276: error: expected declaration specifiers or '...' =
before 'GSList'
> > >         xpidl.h:260: error: expected ')' before 'method_tree'
> > >         xpidl.h:279: error: expected ')' before 'method_tree'xpidl.h:=
266: error: expected ')' before 'method_tree'
> > >        =20
> > >         xpidl.h:273: error: 'check_native' declared as function retur=
ning a function
> > >         xpidl.h:276: error: expected declaration specifiers or '...' =
before 'GSList'
> > >         xpidl.h:279: error: expected ')' before 'method_tree'
> > >=20
> > > > By the way, thanks a lot for the fix.
> > >=20
> > > I am testing this patch right now and will see if also a dependency o=
n
> > > `glib-2.0` is needed.
> >=20
> > Patrik=E2=80=99s patch worked just fine.
> >=20
> >         Build Configuration:
> >         BB_VERSION        =3D "1.12.0"
> >         METADATA_BRANCH   =3D "firefox"
> >         METADATA_REVISION =3D "2acbb95"
> >         TARGET_ARCH       =3D "arm"
> >         TARGET_OS         =3D "linux-gnueabi"
> >         MACHINE           =3D "beagleboard"
> >         DISTRO            =3D "minimal"
> >         DISTRO_VERSION    =3D "dev-snapshot-20110416"
> >         TARGET_FPU        =3D "hard"
>=20
> Please wait until tomorrow. I think I made a mistake testing the patch.

Ok, it did work alright. Also tested using =C8=A6ngstr=C3=B6m.

        Build Configuration:
        BB_VERSION        =3D "1.12.0"
        METADATA_BRANCH   =3D "firefox"
        METADATA_REVISION =3D "2acbb95"
        TARGET_ARCH       =3D "arm"
        TARGET_OS         =3D "linux-gnueabi"
        MACHINE           =3D "beagleboard"
        DISTRO            =3D "angstrom"
        DISTRO_VERSION    =3D "v20110417"
        TARGET_FPU        =3D "hard"

I have problems compiling it using `minimal-uclibc` though. But this
probably belongs to a different thread.

        jsfun.h: In function 'js_ArgsPrivateNative* js_GetArgsPrivateNative=
(JSObject*)':
        jsfun.h:233:55: warning: converting to non-pointer type 'unsigned i=
nt' from NULL
        In file included from jsinterp.h:50:0,
                         from jscntxt.h:53,
                         from jsbool.cpp:49:
        jsscript.h: In member function 'JSObjectArray* JSScript::objects()'=
:
        jsscript.h:141:64: warning: cast from 'uint8*' to 'JSObjectArray*' =
increases required alignment of target type
        jsscript.h: In member function 'JSUpvarArray* JSScript::upvars()':
        jsscript.h:146:63: warning: cast from 'uint8*' to 'JSUpvarArray*' i=
ncreases required alignment of target type
        jsscript.h: In member function 'JSObjectArray* JSScript::regexps()'=
:
        jsscript.h:151:65: warning: cast from 'uint8*' to 'JSObjectArray*' =
increases required alignment of target type
        jsscript.h: In member function 'JSTryNoteArray* JSScript::trynotes(=
)':
        jsscript.h:156:67: warning: cast from 'uint8*' to 'JSTryNoteArray*'=
 increases required alignment of target type
        In file included from jsbool.cpp:49:0:
        jscntxt.h: In function 'JSAtom** FrameAtomBase(JSContext*, JSStackF=
rame*)':
        jscntxt.h:1307:14: warning: cast from 'uint8*' to 'JSAtom**' increa=
ses required alignment of target type
        jscntxt.h: In function 'JSContext* js_ContextFromLinkField(JSCList*=
)':
        jscntxt.h:1533:69: warning: cast from 'uint8*' to 'JSContext*' incr=
eases required alignment of target type
        In file included from jsbool.cpp:52:0:
        jsnum.h: In function 'int JSDOUBLE_IS_FINITE(jsdouble)':
        jsnum.h:101:20: error: 'finite' was not declared in this scope
        In file included from jsbool.cpp:55:0:
        jsvector.h: In member function 'T* js::Vector<T, MinInlineCapacity,=
 AllocPolicy>::inlineEnd() const [with T =3D short unsigned int, unsigned i=
nt N =3D 32u, AllocPolicy =3D js::ContextAllocPolicy]':
        jsvector.h:679:13:   instantiated from 'bool js::Vector<T, MinInlin=
eCapacity, AllocPolicy>::append(const U*, const U*) [with U =3D char, T =3D=
 short unsigned int, unsigned int N =3D 32u, AllocPolicy =3D js::ContextAll=
ocPolicy]'
        jsvector.h:418:51:   instantiated from 'bool js::js_AppendLiteral(j=
s::Vector<T, N, AP>&, const char (&)[ArrayLength]) [with T =3D short unsign=
ed int, unsigned int N =3D 32u, AP =3D js::ContextAllocPolicy, unsigned int=
 ArrayLength =3D 5u]'
        jsbool.cpp:169:43:   instantiated from here
        jsvector.h:254:32: warning: cast from 'const char*' to 'short unsig=
ned int*' increases required alignment of target type
        jsvector.h: In member function 'T* js::Vector<T, MinInlineCapacity,=
 AllocPolicy>::inlineBegin() const [with T =3D short unsigned int, unsigned=
 int N =3D 32u, AllocPolicy =3D js::ContextAllocPolicy]':
        jsvector.h:514:5:   instantiated from 'bool js::Vector<T, MinInline=
Capacity, AllocPolicy>::convertToHeapStorage(size_t) [with T =3D short unsi=
gned int, unsigned int N =3D 32u, AllocPolicy =3D js::ContextAllocPolicy, s=
ize_t =3D unsigned int]'
        jsvector.h:684:9:   instantiated from 'bool js::Vector<T, MinInline=
Capacity, AllocPolicy>::append(const U*, const U*) [with U =3D char, T =3D =
short unsigned int, unsigned int N =3D 32u, AllocPolicy =3D js::ContextAllo=
cPolicy]'
        jsvector.h:418:51:   instantiated from 'bool js::js_AppendLiteral(j=
s::Vector<T, N, AP>&, const char (&)[ArrayLength]) [with T =3D short unsign=
ed int, unsigned int N =3D 32u, AP =3D js::ContextAllocPolicy, unsigned int=
 ArrayLength =3D 5u]'
        jsbool.cpp:169:43:   instantiated from here
        jsvector.h:249:23: warning: cast from 'const char*' to 'short unsig=
ned int*' increases required alignment of target type
        make[4]: *** [jsbool.o] Error 1

Additionally Firefox should probably get updated to newer version, since
I guess the current one in OE suffers from several security issues.


Thanks,

Paul

--=-Qd5uc/40Hf8cqTWM9jLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2qwzgACgkQPX1aK2wOHVjEzwCeMY13+sFmziyWIQCCSAZ3V9Sl
Do4An2hYYOHkjrM8DjelYiox3KlQJmJY
=SuiB
-----END PGP SIGNATURE-----

--=-Qd5uc/40Hf8cqTWM9jLA--
