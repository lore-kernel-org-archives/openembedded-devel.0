Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PsVGh-0000at-Fm
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 08:05:43 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A205C7.dip0.t-ipconnect.de [87.162.5.199]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1O74OAx007554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 24 Feb 2011 08:04:24 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id 111BC2A23F;
	Thu, 24 Feb 2011 08:04:25 +0100 (CET)
Message-ID: <4D6602F8.2040702@dresearch.de>
Date: Thu, 24 Feb 2011 08:04:24 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D64BD5E.6040805@dresearch.de> <4D657E89.9050706@mentor.com>
In-Reply-To: <4D657E89.9050706@mentor.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1O74OAx007554
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
X-List-Received-Date: Thu, 24 Feb 2011 07:05:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2011 10:39 PM, Tom Rini wrote:
> On 02/23/2011 12:55 AM, Steffen Sledz wrote:
>> Again a clean build:
>>
>> OE:hipox sledz@mobil-400-586:~/work/openembedded>  bitbake net-snmp
>> ...
>>
>> Build Configuration:
>> BB_VERSION        =3D "1.12.0"
>> METADATA_BRANCH   =3D "org.openembedded.dev"
>> METADATA_REVISION =3D "8e4bd2f"
>> TARGET_ARCH       =3D "arm"
>> TARGET_OS         =3D "linux-gnueabi"
>> MACHINE           =3D "hipox"
>> DISTRO            =3D "angstrom"
>> DISTRO_VERSION    =3D "2010.7-test-20110223"
>> TARGET_FPU        =3D "soft"
>>
>> ...
>> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te
>> -mtune=3Darm926ej-s -Wl,-rpath-link
>> -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-=
gnueabi/usr/lib
>> -Wl,-O1 -Wl,--hash-style=3Dgnu -mthumb-interwork -mno-thumb
>> -DNETSNMP_ENABLE_IPV6
>> -isystem/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-li=
nux-gnueabi/usr/include
>> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
>> -ggdb2 -Ulinux -Dlinux=3Dlinux -Wall -Winline -Wstrict-prototypes
>> -Wwrite-strings -Wcast-qual -Wno-char-subscripts -o .libs/snmpd
>> .libs/snmpd.o -Wl,-rpath-link
>> -Wl,/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-=
gnueabi/usr/lib
>> -Wl,-O1 -Wl,--hash-style=3Dgnu=20
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/agent/.libs
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs
>>
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/snmplib/.libs
>> -L/home/sledz/work/OE-testing/tmp.6/sysroots/armv5te-angstrom-linux-gn=
ueabi/usr/lib
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/snmplib
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/agent/helpers
>> ./.libs/libnetsnmpagent.so helpers/.libs/libnetsnmphelpers.so
>> ./.libs/libnetsnmpmibs.so
>> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/=
net-snmp-svn-r7.0/net-snmp/agent/helpers/.libs/libnetsnmphelpers.so
>> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/=
net-snmp-svn-r7.0/net-snmp/agent/.libs/libnetsnmpagent.so
>> /home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/=
net-snmp-svn-r7.0/net-snmp/snmplib/.libs/libnetsnmp.so
>> -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
>> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
>> collect2: ld returned 1 exit status
>> make[1]: *** [snmpd] Error 1
>=20
> Does log.do_configure say anything about pthreads?

Nothing special:

OE:hipox sledz@mobil-400-586:~/work/OE-testing> grep -u pthread /home/sle=
dz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn=
-r7.0/temp/log.do_configure*
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure:checking pthread.h usability... yes
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure:checking pthread.h presence... yes
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure:checking for pthread.h... yes
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure.19195:checking pthread.h usability..=
. yes
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure.19195:checking pthread.h presence...=
 yes
/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net=
-snmp-svn-r7.0/temp/log.do_configure.19195:checking for pthread.h... yes

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


