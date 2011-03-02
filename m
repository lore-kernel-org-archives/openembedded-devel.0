Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PugTV-0005JS-2U
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 08:27:57 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 1B8B749127F;
	Wed,  2 Mar 2011 08:26:32 +0100 (CET)
Received: from [10.32.10.2] ([10.32.10.2]) by exchange.intern.dresearch.de
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 2 Mar 2011 08:26:32 +0100
Message-ID: <4D6DF124.2080607@dresearch.de>
Date: Wed, 02 Mar 2011 08:26:28 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.14) Gecko/20110221 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64BD5E.6040805@dresearch.de>
In-Reply-To: <4D64BD5E.6040805@dresearch.de>
X-OriginalArrivalTime: 02 Mar 2011 07:26:32.0132 (UTC)
	FILETIME=[2758A840:01CBD8AB]
Subject: Re: net-snmp-svn-r7.0 do_compile failed
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
X-List-Received-Date: Wed, 02 Mar 2011 07:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 23.02.2011 08:55, schrieb Steffen Sledz:
> Again a clean build:
>=20
> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake net-snmp
> ...
>=20
> Build Configuration:
> BB_VERSION        =3D "1.12.0"
> METADATA_BRANCH   =3D "org.openembedded.dev"
> METADATA_REVISION =3D "8e4bd2f"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "hipox"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "2010.7-test-20110223"
> TARGET_FPU        =3D "soft"
>=20
> ...
> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
arm926ej-s -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots=
/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu -m=
thumb-interwork -mno-thumb -DNETSNMP_ENABLE_IPV6 -isystem/home/sledz/work=
/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -fe=
xpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb2=
 -Ulinux -Dlinux=3Dlinux -Wall -Winline -Wstrict-prototypes -Wwrite-strin=
gs -Wcast-qual -Wno-char-subscripts -o .libs/snmpd .libs/snmpd.o -Wl,-rpa=
th-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-l=
inux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu  -L/home/sledz/work/O=
E-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net=
-snmp/agent/.libs -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstr=
om-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi=
/net-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing/t=
mp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work/O=
E-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net=
-snmp/snmplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-l=
inux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnmpa=
gent.so helpers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /hom=
e/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snm=
p-svn-r7.0/net-snmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sledz/=
work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7=
.0/net-snmp/agent/.libs/libnetsnmpagent.so /home/sledz/work/OE-testing/tm=
p.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmpli=
b/.libs/libnetsnmp.so -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
> collect2: ld returned 1 exit status
> make[1]: *** [snmpd] Error 1

I did some research in this. This is a bug fixed upstream with svn revisi=
on 18721[1].

How can we handle this? Should we increase the SRCREV to a newer version =
(which one)?

Or should we create a patch backporting the fix? Then we need someone who=
 is more familiar with autotools (i failed here).

Steffen

[1] http://net-snmp.svn.sourceforge.net/viewvc/net-snmp?view=3Drevision&r=
evision=3D18721

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


