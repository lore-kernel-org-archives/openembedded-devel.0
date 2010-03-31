Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Nx1tf-0007z2-Pn
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 19:40:18 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Nx1qU-0006eL-8j from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 10:36:50 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 31 Mar 2010 10:36:49 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 31 Mar 2010 17:36:39 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	31 Mar 2010 10:36:37 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4BB382AA.3040901@mlbassoc.com>
References: <4BB35552.9070508@mlbassoc.com>
	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>
	<4BB382AA.3040901@mlbassoc.com>
Organization: Mentor Graphics Corporation
Date: Wed, 31 Mar 2010 10:36:37 -0700
Message-ID: <1270056997.6277.89.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 31 Mar 2010 17:36:49.0479 (UTC)
	FILETIME=[BE306570:01CAD0F8]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Wed, 31 Mar 2010 17:40:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-31 at 11:13 -0600, Gary Thomas wrote:
> On 03/31/2010 11:06 AM, Khem Raj wrote:
> > On Wed, Mar 31, 2010 at 6:59 AM, Gary Thomas<gary@mlbassoc.com>  wrote:
> >> Has anyone had success building FireFox for a PowerPC
> >> target - I'm using the development branch (org.openembedded.dev)
> >>   MACHINE=3Defika
> >>   DISTRO =3D "angstrom-2008.1"
> >>
> >> I've tried to build a number of different FireFox packages,
> >> none with success.  So far I've tried 2.0.0.3, 3.5.2&  3.6.2
> >>
> >> Any pointers?
> >>
> >> Query: is there an easy way to build a particular package version?
> >> What I've done is just add a line like this to my local.conf:
> >>   PREFERRED_VERSION_firefox=3D"3.5.2"
> >
> >
> > what errors do you get.
>=20
> It depends on the version.  For 3.6.2 (latest), I get this:
>=20
> ccache powerpc-angstrom-linux-g++ -mcpu=3D603e -mhard-float  -L/local/Ang=
strom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/usr/lib=20
> -Wl,-rpath-link,/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-=
linux/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -o jsbool.o -c -fvisibility=3D=
hidden -DOSTYPE=3D\"Linux\"=20
> -DOSARCH=3DLinux -DEXPORT_JS_API  -DJS_USE_SAFE_ARENA  -I. -I. -I./../../=
dist/include -I./../../dist/include/nsprpub=20
> -I/local/Angstrom_BeagleBoard/tmp/work/ppc603e-angstrom-linux/firefox-3.6=
.2-r0/mozilla-1.9.2/dist/include/nspr   -I.    -fPIC=20
> -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/us=
r/include  -fno-rtti -fno-exceptions -Wall -Wpointer-arith -Woverloaded-vir=
tual -Wsynth=20
> -Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wcast-align -Wno-invalid-of=
fsetof -Wno-variadic-macros -Wno-long-long -pedantic=20
> -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/us=
r/include -Os -fsigned-char -fno-strict-aliasing -fpermissive -fvisibility-=
inlines-hidden=20
> -fno-strict-aliasing -pthread -pipe  -DNDEBUG -DTRIMMED -g -fno-inline -O=
2  -isystem/local/Angstrom_BeagleBoard/tmp/staging/ppc603e-angstrom-linux/u=
sr/include  -DMOZILLA_CLIENT=20
> -include ./js-confdefs.h -Wp,-MD,.deps/jsbool.pp jsbool.cpp
> jsapi.cpp: In function 'JSBool JS_ConvertArgumentsVA(JSContext*, uintN, j=
sval*, const char*, __va_list_tag*)':
> jsapi.cpp:289: error: cannot convert '__va_list_tag**' to '__va_list_tag =
(*)[1]' for argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const =
char**, JSBool, jsval**,=20
> __va_list_tag (*)[1])'
> jsapi.cpp: In function 'jsval* JS_PushArgumentsVA(JSContext*, void**, con=
st char*, __va_list_tag*)':
> jsapi.cpp:398: error: cannot convert '__va_list_tag**' to '__va_list_tag =
(*)[1]' for argument '5' to 'JSBool TryArgumentFormatter(JSContext*, const =
char**, JSBool, jsval**,=20
> __va_list_tag (*)[1])'
> make[4]: *** [jsapi.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-=
angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2/js/src'
> make[3]: *** [libs_tier_js] Error 2
> make[3]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-=
angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
> make[2]: *** [tier_js] Error 2
> make[2]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-=
angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
> make[1]: *** [default] Error 2
> make[1]: Leaving directory `/local/Angstrom_BeagleBoard/tmp/work/ppc603e-=
angstrom-linux/firefox-3.6.2-r0/mozilla-1.9.2'
> make: *** [build] Error 2
> FATAL: oe_runmake failed
>=20
> Note: to even get this far, I had to apply the attached patch
> as the default setup falls apart with regard to va_list processing.

Oh man that takes me (and I bet you too) back... Sounds like mozilla
needs some patching again.  Maybe the ppcnux folks have one somewhere
already tho?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


