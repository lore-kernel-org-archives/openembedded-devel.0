Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0ruV-0008QK-Es for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 10:21:09 +0200
Received: from f053038023.adsl.alicedsl.de ([78.53.38.23]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P0ruL-0003WU-1k for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:20:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285666476-3020-1-git-send-email-t.fromm@dresearch.de>
References: <1285666009.4168.28.camel@mattotaupa>
	<1285666476-3020-1-git-send-email-t.fromm@dresearch.de>
Date: Wed, 29 Sep 2010 10:20:55 +0200
Message-ID: <1285748455.3876.22.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [v4] wvstreams-4.6: Remove dbus support (breaks build)
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
X-List-Received-Date: Wed, 29 Sep 2010 08:21:09 -0000
X-Groupsio-MsgNum: 24126
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-l/sUtusyNGY84vqSZ7AB"

--=-l/sUtusyNGY84vqSZ7AB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 28.09.2010, 11:34 +0200 schrieb Thilo Fromm:=20
> If wvstreams is configured with DBus support enabled (by not providing
> --without-dbus) the the build fails at link time as libdbus cannot be
> found:
>=20
> | ./CXX -c dbus/wvdbusconn
> | ./CXX -c dbus/wvdbusmarshal
> | ./CXX -c dbus/wvdbusmsg
> | ./CXX -c dbus/wvdbusserver
> | linking libwvdbus.so...
> | arm-angstrom-linux-gnueabi-g++: /libdbus-1.a: No such file or directory
> | make: *** [libwvdbus.so] Error 1
> | FATAL: oe_runmake failed
> NOTE: Task failed: /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-an=
gstrom-linux-gnueabi/wvstreams-4.6-r0/temp/log.do_compile.6422
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvs=
treams_4.6.bb do_compile failed
> ERROR: Task 2024 (/home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/w=
vstreams_4.6.bb, do_compile) failed
>=20
> The root cause for this behaviour is in wvstreams' configure.ac; the
> weird dbus detection and library path handling breaks successive builds.
>=20
> This patch, however, does not fix the configure.ac file but disables
> DBus support for wvstreams at configure time. This at least fixes the
> broken build.
>=20
> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>

I build tested your patch with `MACHINE =3D "beagleboard"` and
distributions =C8=A6ngstr=C3=B6m 2008.1 and Minimal with `LIBC =3D "libc"`.

But it fails for me for Minimal with `LIBC =3D "eglibc"`

	| make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-dev/=
work/armv7a-oe-linux-uclibceabi/wvstreams-4.6-r1/wvstreams-4.6/argp'
	| ./CXX -c utils/wvbuffer
	| ./CXX -c utils/wvbufferstore
	| ./CXX -c utils/wvcont
	| ./CXX -c utils/wverror
	| ./CXX -c streams/wvfdstream
	| ./CXX -c utils/wvfork
	| ./CXX -c utils/wvhash
	| ./CXX -c utils/wvhashtable
	| ./CXX -c utils/wvlinklist
	| ./CXX -c utils/wvmoniker
	| ./CXX -c utils/wvregex
	| ./CXX -c utils/wvscatterhash
	| ./CXX -c utils/wvsorter
	| ./CXX -c utils/wvattrs
	| ./CXX -c utils/wvstring
	| ./CXX -c utils/wvstringlist
	| ./CXX -c utils/wvstringmask
	| ./CXX -c utils/strutils
	| ./CXX -c utils/wvtask
	| utils/wvtask.cc: In constructor 'WvTaskMan::WvTaskMan()':
	| utils/wvtask.cc:202:5: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc: In static member function 'static int WvTaskMan::run(Wv=
Task&, int)':
	| utils/wvtask.cc:268:5: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc:274:33: error: 'setcontext' was not declared in this sco=
pe
	| utils/wvtask.cc: In static member function 'static int WvTaskMan::yield(=
int)':
	| utils/wvtask.cc:322:5: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc:328:29: error: 'setcontext' was not declared in this sco=
pe
	| utils/wvtask.cc: In static member function 'static void WvTaskMan::get_s=
tack(WvTask&, size_t)':
	| utils/wvtask.cc:344:5: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc:374:30: error: 'setcontext' was not declared in this sco=
pe
	| utils/wvtask.cc: In static member function 'static void WvTaskMan::_stac=
kmaster()':
	| utils/wvtask.cc:412:9: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc:422:41: error: 'setcontext' was not declared in this sco=
pe
	| utils/wvtask.cc: In static member function 'static void WvTaskMan::do_ta=
sk()':
	| utils/wvtask.cc:477:5: error: 'getcontext' was not declared in this scop=
e
	| utils/wvtask.cc:521:63: error: 'makecontext' was not declared in this sc=
ope
	| utils/wvtask.cc:526:52: error: 'setcontext' was not declared in this sco=
pe
	| make: *** [utils/wvtask.o] Error 1
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed
	NOTE: package wvstreams-4.6-r1: task do_compile: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb do_com=
pile failed
	ERROR: Task 11 (/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb, do_co=
mpile) failed with 256
	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed

and minimal-uclibc.

	| ./CXX -c ipstreams/wvaddr
	| In file included from ipstreams/wvaddr.cc:19:0:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvipraw
	| In file included from ./include/wvipraw.h:10:0,
	|                  from ipstreams/wvipraw.cc:8:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvlistener
	| In file included from ipstreams/wvlistener.cc:10:0:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvresolver
	| In file included from ./include/wvresolver.h:10:0,
	|                  from ipstreams/wvresolver.cc:7:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvstreamsdebuggerserver
	| In file included from ./include/wvstreamsdebuggerserver.h:12:0,
	|                  from ipstreams/wvstreamsdebuggerserver.cc:6:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvtcp
	| In file included from ./include/wvtcplistener.h:11:0,
	|                  from ipstreams/wvtcp.cc:7:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvudp
	| In file included from ./include/wvudp.h:10:0,
	|                  from ipstreams/wvudp.cc:8:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ./CXX -c ipstreams/wvunixdgsocket
	| In file included from ./include/wvunixdgsocket.h:13:0,
	|                  from ipstreams/wvunixdgsocket.cc:1:
	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() const'=
:
	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointer wi=
ll break strict-aliasing rules
	| ipstreams/wvunixdgsocket.cc: In constructor 'WvUnixDGSocket::WvUnixDGSoc=
ket(const WvFastString&, bool, int)':
	| ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not declared in th=
is scope
	| make: *** [ipstreams/wvunixdgsocket.o] Error 1
	| FATAL: oe_runmake failed
	| ERROR: Function do_compile failed
	NOTE: package wvstreams-4.6-r1: task do_compile: Failed
	ERROR: TaskFailed event exception, aborting
	ERROR: Build of /oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb do_com=
pile failed
	ERROR: Task 12 (/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb, do_co=
mpile) failed with 256
	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed

[=E2=80=A6]

I am not sure, but your patch is an improvement for GNU Libc based
distributions and so your patch could as well be commit.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul

--=-l/sUtusyNGY84vqSZ7AB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEABECAAYFAkyi9toACgkQPX1aK2wOHVhkbQCYvKbm46F0Kdduz11f7aNOl4yF
4QCfTqIkKCJnsSNcnMLmHKdWsWaLYqA=
=mwd7
-----END PGP SIGNATURE-----

--=-l/sUtusyNGY84vqSZ7AB--
