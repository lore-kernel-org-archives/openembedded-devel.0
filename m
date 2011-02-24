Received: from einhorn.in-berlin.de ([192.109.42.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PsVMw-0000jj-D4
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 08:12:10 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A205C7.dip0.t-ipconnect.de [87.162.5.199]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p1O7AmMl007929
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 24 Feb 2011 08:10:49 +0100
Received: from mobil-400-586.intern.dresearch.de (localhost [IPv6:::1])
	by mobil-400-586.intern.dresearch.de (Postfix) with ESMTP id B09B62F397;
	Thu, 24 Feb 2011 08:10:49 +0100 (CET)
Message-ID: <4D660479.3050101@dresearch.de>
Date: Thu, 24 Feb 2011 08:10:49 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Lightning/1.0b1
	Thunderbird/3.0.11
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <4D64BD5E.6040805@dresearch.de>
	<AANLkTi=ez39+s8=GSRnoZ9N8sDWjQn75d0tR==0VSoDk@mail.gmail.com>
In-Reply-To: <AANLkTi=ez39+s8=GSRnoZ9N8sDWjQn75d0tR==0VSoDk@mail.gmail.com>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
X-MIME-Autoconverted: from 8bit to quoted-printable by einhorn.in-berlin.de id
	p1O7AmMl007929
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 24 Feb 2011 07:12:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/23/2011 11:07 PM, Khem Raj wrote:
> On Tue, Feb 22, 2011 at 11:55 PM, Steffen Sledz <sledz@dresearch.de> wr=
ote:
>> Again a clean build:
>>
>> OE:hipox sledz@mobil-400-586:~/work/openembedded> bitbake net-snmp
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
>> libtool: link: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
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
>> -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueab=
i/net-snmp-svn-r7.0/net-snmp/snmplib/.libs -L/home/sledz/work/OE-testing/=
tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib -L/home/sledz/work/=
OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/ne=
t-snmp/snmplib -L/home/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-=
linux-gnueabi/net-snmp-svn-r7.0/net-snmp/agent/helpers ./.libs/libnetsnmp=
agent.so helpers/.libs/libnetsnmphelpers.so ./.libs/libnetsnmpmibs.so /ho=
me/sledz/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-sn=
mp-svn-r7.0/net-snmp/agent/helpers/.libs/libnetsnmphelpers.so /home/sledz=
/work/OE-testing/tmp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r=
7.0/net-snmp/agent/.libs/libnetsnmpagent.so /home/sledz/work/OE-testing/t=
mp.6/work/armv5te-angstrom-linux-gnueabi/net-snmp-svn-r7.0/net-snmp/snmpl=
ib/.libs/libnetsnmp.so -ldl ../snmplib/.libs/libnetsnmp.so -lcrypto -lssl
>> ./.libs/libnetsnmpmibs.so: undefined reference to `pthread_create'
>> collect2: ld returned 1 exit status
>> make[1]: *** [snmpd] Error 1
>=20
> confgure could have a test to use/not use libpthread to link and this
> test may be failing for some reason and disabling libpthread from
> getting into
> linker commandline and resulting in this. look at config.log I would
> say and see what games it plays with libpthread tests if they are
> runtime
> tests then they wont succeed for sure.

Nothing suspicios in config.log:

...
configure:27538: checking pthread.h usability
configure:27555: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
arm926ej-s -Wl,-O1 -Wl,--hash-style=3Dgnu -mthumb-interwork -mno-thumb -c=
 -DNETSNMP_ENABLE_IPV6 -fexpensive-optimizations -frename-registers -fomi=
t-frame-pointer -O2 -ggdb2 -Ulinux -Dlinux=3Dlinux  conftest.c >&5
configure:27562: $? =3D 0
configure:27576: result: yes
configure:27580: checking pthread.h presence
configure:27595: arm-angstrom-linux-gnueabi-gcc -E  conftest.c
configure:27602: $? =3D 0
configure:27616: result: yes
configure:27649: checking for pthread.h
configure:27658: result: yes
...
ac_cv_header_pthread_h=3Dyes
...
#define _POSIX_PTHREAD_SEMANTICS 1
...
#define HAVE_PTHREAD_H 1
...

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


