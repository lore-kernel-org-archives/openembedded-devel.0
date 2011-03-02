Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PuiKH-0003F4-Nk
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 10:26:33 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7E502491278;
	Wed,  2 Mar 2011 10:25:08 +0100 (CET)
Received: from [10.32.10.2] ([10.32.10.2]) by exchange.intern.dresearch.de
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 2 Mar 2011 10:25:08 +0100
Message-ID: <4D6E0CF4.4040005@dresearch.de>
Date: Wed, 02 Mar 2011 10:25:08 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.14) Gecko/20110221 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64BD5E.6040805@dresearch.de> <4D6DF124.2080607@dresearch.de>
	<AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
In-Reply-To: <AANLkTi=sJanB_o6LGmg=3-96=iDD8VMrM-DLp4EC+zBr@mail.gmail.com>
X-OriginalArrivalTime: 02 Mar 2011 09:25:08.0579 (UTC)
	FILETIME=[B9144B30:01CBD8BB]
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
X-List-Received-Date: Wed, 02 Mar 2011 09:26:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 02.03.2011 09:01, schrieb Khem Raj:
> On Tue, Mar 1, 2011 at 11:26 PM, Steffen Sledz <sledz@dresearch.de> wro=
te:
>> Am 23.02.2011 08:55, schrieb Steffen Sledz:
>>> Again a clean build:
>>>
>>> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake net-snmp
>>> ...
>>>
>>> Build Configuration:
>>> BB_VERSION        =3D "1.12.0"
>>> METADATA_BRANCH   =3D "org.openembedded.dev"
>>> METADATA_REVISION =3D "8e4bd2f"
>>> TARGET_ARCH       =3D "arm"
>>> TARGET_OS         =3D "linux-gnueabi"
>>> MACHINE           =3D "hipox"
>>> DISTRO            =3D "angstrom"
>>> DISTRO_VERSION    =3D "2010.7-test-20110223"
>>> TARGET_FPU        =3D "soft"
>>>
>>> ...
>>> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=
=3Darm926ej-s -Wl,-rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysro=
ots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 -mthumb-interwork -mno-thumb -DNETSNMP_ENABLE_IPV6 -isystem/home/sledz/w=
ork/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include =
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -gg=
db2 -Ulinux -Dlinux=3Dlinux -Wall -Winline -Wstrict-prototypes -Wwrite-st=
rings -Wcast-qual -Wno-char-subscripts -o .libs/snmpd .libs/snmpd.o -Wl,-=
rpath-link -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstro=
m-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu  -L/home/sledz/wor=
k/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/=
net-snmp/agent/.libs -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-ang=
strom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
>>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnuea=
bi/net-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing=
/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work=
/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/n=
et-snmp/snmplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom=
-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnm=
pagent.so helpers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /h=
ome/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-s=
nmp-svn-r7.0/net-snmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sled=
z/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-=
r7.0/net-snmp/agent/.libs/libnetsnmpagent.so /home/sledz/work/OE-testing/=
tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmp=
lib/.libs/libnetsnmp.so -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lss=
l
>>> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
>>> collect2: ld returned 1 exit status
>>> make[1]: *** [snmpd] Error 1
>>
>> I did some research in this. This is a bug fixed upstream with svn rev=
ision 18721[1].
>>
>> How can we handle this? Should we increase the SRCREV to a newer versi=
on (which one)?
>>
>> Or should we create a patch backporting the fix? Then we need someone =
who is more familiar with autotools (i failed here).
>=20
> for svn recipe you can bump rev up

I tried to bump to some newer revs (19399/5.6, 19787/5.6.1, 20047/HEAD) b=
ut ended up in some undefined referrence errors (nl_handle_destroy and nl=
_handle_alloc) in all cases. :(

So this needs some more attention.

Jamie, you're listed as net-snmp maintainer. Can you look into this pleas=
e.

> and for others you can backport the
> fix and you can backport it as it is ideally that patch should
> have changed configure.ac and regenerated configure but they patched
> configure instead. but its ok to patch configure here since
> we do not regenerate configure for net-snmp recipe.

As mentioned before i failed trying this. The patch does not apply withou=
t modifications. :(

Steffen

>> [1] http://net-snmp.svn.sourceforge.net/viewvc/net-snmp?view=3Drevisio=
n&revision=3D18721

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


