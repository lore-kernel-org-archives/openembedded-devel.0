Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P0slY-0003if-BX
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 11:16:03 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 1C841491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 11:15:46 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 29 Sep 2010 11:15:45 +0200
Message-ID: <4CA303CE.8050302@dresearch.de>
Date: Wed, 29 Sep 2010 11:15:58 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285666009.4168.28.camel@mattotaupa>	<1285666476-3020-1-git-send-email-t.fromm@dresearch.de>
	<1285748455.3876.22.camel@mattotaupa>
In-Reply-To: <1285748455.3876.22.camel@mattotaupa>
X-OriginalArrivalTime: 29 Sep 2010 09:15:45.0710 (UTC)
	FILETIME=[E5F7CCE0:01CB5FB6]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
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
X-List-Received-Date: Wed, 29 Sep 2010 09:16:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 29.09.2010 10:20, schrieb Paul Menzel:
> Am Dienstag, den 28.09.2010, 11:34 +0200 schrieb Thilo Fromm:=20
>> If wvstreams is configured with DBus support enabled (by not providing
>> --without-dbus) the the build fails at link time as libdbus cannot be
>> found:
>>
>> | ./CXX -c dbus/wvdbusconn
>> | ./CXX -c dbus/wvdbusmarshal
>> | ./CXX -c dbus/wvdbusmsg
>> | ./CXX -c dbus/wvdbusserver
>> | linking libwvdbus.so...
>> | arm-angstrom-linux-gnueabi-g++: /libdbus-1.a: No such file or direct=
ory
>> | make: *** [libwvdbus.so] Error 1
>> | FATAL: oe_runmake failed
>> NOTE: Task failed: /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te=
-angstrom-linux-gnueabi/wvstreams-4.6-r0/temp/log.do_compile.6422
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of /home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/=
wvstreams_4.6.bb do_compile failed
>> ERROR: Task 2024 (/home/maniac/work/HYP/oe/3way_merge/recipes/wvstream=
s/wvstreams_4.6.bb, do_compile) failed
>>
>> The root cause for this behaviour is in wvstreams' configure.ac; the
>> weird dbus detection and library path handling breaks successive build=
s.
>>
>> This patch, however, does not fix the configure.ac file but disables
>> DBus support for wvstreams at configure time. This at least fixes the
>> broken build.
>>
>> Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
>=20
> I build tested your patch with `MACHINE =3D "beagleboard"` and
> distributions =C8=A6ngstr=C3=B6m 2008.1 and Minimal with `LIBC =3D "lib=
c"`.
>=20
> But it fails for me for Minimal with `LIBC =3D "eglibc"`
>=20
> 	| make[1]: Leaving directory `/oe/build-minimal-uclibc/minimal-uclibc-=
dev/work/armv7a-oe-linux-uclibceabi/wvstreams-4.6-r1/wvstreams-4.6/argp'
> 	| ./CXX -c utils/wvbuffer
> 	| ./CXX -c utils/wvbufferstore
> 	| ./CXX -c utils/wvcont
> 	| ./CXX -c utils/wverror
> 	| ./CXX -c streams/wvfdstream
> 	| ./CXX -c utils/wvfork
> 	| ./CXX -c utils/wvhash
> 	| ./CXX -c utils/wvhashtable
> 	| ./CXX -c utils/wvlinklist
> 	| ./CXX -c utils/wvmoniker
> 	| ./CXX -c utils/wvregex
> 	| ./CXX -c utils/wvscatterhash
> 	| ./CXX -c utils/wvsorter
> 	| ./CXX -c utils/wvattrs
> 	| ./CXX -c utils/wvstring
> 	| ./CXX -c utils/wvstringlist
> 	| ./CXX -c utils/wvstringmask
> 	| ./CXX -c utils/strutils
> 	| ./CXX -c utils/wvtask
> 	| utils/wvtask.cc: In constructor 'WvTaskMan::WvTaskMan()':
> 	| utils/wvtask.cc:202:5: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc: In static member function 'static int WvTaskMan::ru=
n(WvTask&, int)':
> 	| utils/wvtask.cc:268:5: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc:274:33: error: 'setcontext' was not declared in this=
 scope
> 	| utils/wvtask.cc: In static member function 'static int WvTaskMan::yi=
eld(int)':
> 	| utils/wvtask.cc:322:5: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc:328:29: error: 'setcontext' was not declared in this=
 scope
> 	| utils/wvtask.cc: In static member function 'static void WvTaskMan::g=
et_stack(WvTask&, size_t)':
> 	| utils/wvtask.cc:344:5: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc:374:30: error: 'setcontext' was not declared in this=
 scope
> 	| utils/wvtask.cc: In static member function 'static void WvTaskMan::_=
stackmaster()':
> 	| utils/wvtask.cc:412:9: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc:422:41: error: 'setcontext' was not declared in this=
 scope
> 	| utils/wvtask.cc: In static member function 'static void WvTaskMan::d=
o_task()':
> 	| utils/wvtask.cc:477:5: error: 'getcontext' was not declared in this =
scope
> 	| utils/wvtask.cc:521:63: error: 'makecontext' was not declared in thi=
s scope
> 	| utils/wvtask.cc:526:52: error: 'setcontext' was not declared in this=
 scope
> 	| make: *** [utils/wvtask.o] Error 1
> 	| FATAL: oe_runmake failed
> 	| ERROR: Function do_compile failed
> 	NOTE: package wvstreams-4.6-r1: task do_compile: Failed
> 	ERROR: TaskFailed event exception, aborting
> 	ERROR: Build of /oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb do=
_compile failed
> 	ERROR: Task 11 (/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb, d=
o_compile) failed with 256
> 	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
> 	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
>=20
> and minimal-uclibc.
>=20
> 	| ./CXX -c ipstreams/wvaddr
> 	| In file included from ipstreams/wvaddr.cc:19:0:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvipraw
> 	| In file included from ./include/wvipraw.h:10:0,
> 	|                  from ipstreams/wvipraw.cc:8:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvlistener
> 	| In file included from ipstreams/wvlistener.cc:10:0:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvresolver
> 	| In file included from ./include/wvresolver.h:10:0,
> 	|                  from ipstreams/wvresolver.cc:7:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvstreamsdebuggerserver
> 	| In file included from ./include/wvstreamsdebuggerserver.h:12:0,
> 	|                  from ipstreams/wvstreamsdebuggerserver.cc:6:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvtcp
> 	| In file included from ./include/wvtcplistener.h:11:0,
> 	|                  from ipstreams/wvtcp.cc:7:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvudp
> 	| In file included from ./include/wvudp.h:10:0,
> 	|                  from ipstreams/wvudp.cc:8:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ./CXX -c ipstreams/wvunixdgsocket
> 	| In file included from ./include/wvunixdgsocket.h:13:0,
> 	|                  from ipstreams/wvunixdgsocket.cc:1:
> 	| ./include/wvaddr.h: In member function 'uint32_t WvIPAddr::addr() co=
nst':
> 	| ./include/wvaddr.h:284:31: warning: dereferencing type-punned pointe=
r will break strict-aliasing rules
> 	| ipstreams/wvunixdgsocket.cc: In constructor 'WvUnixDGSocket::WvUnixD=
GSocket(const WvFastString&, bool, int)':
> 	| ipstreams/wvunixdgsocket.cc:50:32: error: 'chmod' was not declared i=
n this scope
> 	| make: *** [ipstreams/wvunixdgsocket.o] Error 1
> 	| FATAL: oe_runmake failed
> 	| ERROR: Function do_compile failed
> 	NOTE: package wvstreams-4.6-r1: task do_compile: Failed
> 	ERROR: TaskFailed event exception, aborting
> 	ERROR: Build of /oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb do=
_compile failed
> 	ERROR: Task 12 (/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb, d=
o_compile) failed with 256
> 	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
> 	ERROR: '/oe/openembedded/recipes/wvstreams/wvstreams_4.6.bb' failed
>=20
> [=E2=80=A6]
>=20
> I am not sure, but your patch is an improvement for GNU Libc based
> distributions and so your patch could as well be commit.
>=20
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Acked-by: Steffen Sledz <sledz@dresearch.de>

and applied

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



