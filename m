Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Ps93Q-0001rV-3s
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 08:22:32 +0100
X-Envelope-From: sledz@dresearch.de
X-Envelope-To: <openembedded-devel@lists.openembedded.org>
Received: from mobil-400-586.intern.dresearch.de
	(p57A20787.dip0.t-ipconnect.de [87.162.7.135]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1N7LBaa002214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 08:21:11 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id B3BDB217B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 08:21:10 +0100 (CET)
Message-ID: <4D64B565.3040006@dresearch.de>
Date: Wed, 23 Feb 2011 08:21:09 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1N7LBaa002214
Subject: NetworkManager-0.8.1 do_compile failed
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
X-List-Received-Date: Wed, 23 Feb 2011 07:22:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Trying a clean build:

OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake networkmanager
...

Build Configuration:
BB_VERSION        =3D "1.12.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "8e4bd2f"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "hipox"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "2010.7-test-20110223"
TARGET_FPU        =3D "soft"

...
NetworkManager-nm-device-ethernet.o: In function `ip4_match_config':
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1624: =
undefined reference to `rtnl_addr_alloc_cache'
NetworkManager-nm-device-ethernet.o: In function `check_one_address':
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1571: =
undefined reference to `rtnl_addr_get_ifindex'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1573: =
undefined reference to `rtnl_addr_get_family'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1576: =
undefined reference to `rtnl_addr_get_prefixlen'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/nm-device-ethernet.c:1579: =
undefined reference to `rtnl_addr_get_local'
...
<some more errors of the kind>
...
./backends/.libs/libnmbackend.a(libnmbackend_la-NetworkManagerGeneric.o):=
 In function `nm_generic_enable_loopback':
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:70: undefined reference to `rtnl_addr_alloc'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:78: undefined reference to `rtnl_addr_set_local'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:85: undefined reference to `rtnl_addr_set_broadcast'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:88: undefined reference to `rtnl_addr_set_prefixlen'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:89: undefined reference to `rtnl_addr_set_ifindex'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:90: undefined reference to `rtnl_addr_set_scope'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:91: undefined reference to `rtnl_addr_set_label'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:93: undefined reference to `rtnl_addr_add'
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
workmanager-0.8.1-r2/NetworkManager-0.8.1/src/backends/NetworkManagerGene=
ric.c:100: undefined reference to `rtnl_addr_put'
collect2: ld returned 1 exit status
make[4]: *** [NetworkManager] Error 1
make[4]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src=
'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src=
'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1/src=
'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/sledz/work/OE-testing/tmp.6/work/armv5t=
e-angstrom-linux-gnueabi/networkmanager-0.8.1-r2/NetworkManager-0.8.1'
make: *** [all] Error 2

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


