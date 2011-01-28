Received: from goliath.siemens.de ([192.35.17.28])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PijSb-0000DF-3N
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 09:13:37 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	p0S8Cn5t026981 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 09:12:49 +0100
Received: from DEMCHP99ET3MSX.ww902.siemens.net
	(demchp99et3msx.ww902.siemens.net [139.25.131.243])
	by mail2.siemens.de (8.13.6/8.13.6) with ESMTP id p0S8Cn2r031926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 09:12:49 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.34]) by
	DEMCHP99ET3MSX.ww902.siemens.net ([139.25.131.243]) with mapi;
	Fri, 28 Jan 2011 09:12:49 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jan 2011 09:12:47 +0100
Thread-Topic: [oe] libpcre not compiling
Thread-Index: Acu+VVkM/+aBUgC7RzqwU8O5aZlNzQAa20cQAACAbOA=
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED682ECC4@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED682EC06@DEMCHP99E35MSX.ww902.siemens.net>
	<AANLkTimzYvPnN7tt54jcQVYUmBQFpQsO0LYFoRVh5Q8x@mail.gmail.com> 
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
Subject: Re: libpcre not compiling
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
X-List-Received-Date: Fri, 28 Jan 2011 08:13:37 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

perhaps another info: tried with another machine (=3D> powerpc cross-compil=
er), same problem here.

With kind regards,
fabrice Aeschbacher

> > > [using released version 2010.12]
> > >
> > > libpcre (7.6-r8) fails to compile :
> > >
> > > ...
> > > | /bin/sh ./arm-angstrom-linux-gnueabi-libtool --tag=3DCXX =A0=20
> > --mode=3Dlink arm-angstrom-linux-gnueabi-g++ -march=3Darmv5te=20
> > -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb =A0
> > -isystem/srv/oe-2010/build/at91sam9g20ek/sysroots/armv5te-angs
> > trom-linux-gnueabi/usr/include -O2 -fpermissive=20
> > -fvisibility-inlines-hidden -fvisibility-inlines-hidden=20
> > -version-info 0:0:0 -Wl,-O1 -Wl,--hash-style=3Dgnu -o=20
> > libpcrecpp.la -rpath /usr/lib pcrecpp.lo pcre_scanner.lo=20
> > pcre_stringpiece.lo libpcre.la
> > > | /bin/grep: /usr/lib/libstdc++.la: No such file or directory
> > > |=20
> > /srv/oe-2010/build/at91sam9g20ek/sysroots/x86_64-linux/usr/bin
> > /sed: can't read /usr/lib/libstdc++.la: No such file or directory
> > > | arm-angstrom-linux-gnueabi-libtool: link:=20
> > `/usr/lib/libstdc++.la' is not a valid libtool archive
> > > | make[1]: *** [libpcrecpp.la] Error 1
> > > | make[1]: Leaving directory=20
> > `/srv/oe-2010/build/at91sam9g20ek/work/armv5te-angstrom-linux-
> > gnueabi/libpcre-7.6-r8/pcre-7.6'
> > > | make: *** [all] Error 2
> > > | FATAL: oe_runmake failed
> > > NOTE: package libpcre-7.6-r8: task do_compile: Failed
> > > ERROR: Function 'do_compile' failed (see=20
> > /srv/oe-2010/build/at91sam9g20ek/work/armv5te-angstrom-linux-g
> > nueabi/libpcre-7.6-r8/temp/log.do_compile.1723 for further=20
> > information)
> > > ERROR:=20
> >=20
> '/srv/oe-2010/org.openembedded/recipes/libpcre/libpcre_7.6.bb' failed
> > >
> > >
> > > I would be thankful if someone could give me any hint how=20
> > to solve this.
> > >
> >=20
> > Does it fail same way on master ?
>=20
> I did not try to compile everything on master yet
>=20
> > if not try to figure out commit which fixed it git bisect=20
> is your friend.
>=20
> I diffed the files under recipes/libpcre/* : there is no=20
> change in master compared to 2010.12  release.
>=20
> > Otherwise we need to fix it if its happening on master too.
>=20
> BTW: We need libpcre only because lighttpd depends on it.
>=20
> Kind regards,
> Fabrice


