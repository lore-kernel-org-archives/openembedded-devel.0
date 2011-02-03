Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PkxzP-0006WB-C1
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 13:08:43 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id CE595491282;
	Thu,  3 Feb 2011 13:07:48 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Feb 2011 13:07:49 +0100
Message-ID: <4D4A9A94.6030108@dresearch.de>
Date: Thu, 03 Feb 2011 13:07:48 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Holger Freyther <holger+oe@freyther.de>
References: <4D4929CB.6040009@dresearch.de>	<4D49552D.3010705@dresearch.de>	<4D4A6796.1070006@dresearch.de>	<AANLkTinyw5W+jaZVba1LyAn5h1c-1kCDt9vXPBERhzk2@mail.gmail.com>	<4D4A88FC.3090706@dresearch.de>
	<4D4A91D9.2040406@freyther.de> <4D4A96A0.4080402@dresearch.de>
	<4D4A9739.6040909@freyther.de>
In-Reply-To: <4D4A9739.6040909@freyther.de>
X-OriginalArrivalTime: 03 Feb 2011 12:07:49.0075 (UTC)
	FILETIME=[F9A28A30:01CBC39A]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: profiling howto?
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
X-List-Received-Date: Thu, 03 Feb 2011 12:08:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 03.02.2011 12:53, schrieb Holger Freyther:
> On 02/03/2011 12:50 PM, Steffen Sledz wrote:
>=20
>>>
>>> find . -name config.log... there will be a config.log...
>>
>> You're right. Sorry. It was somewhat hidden in a subdir. See attached =
file.
>=20
> Please take a look yourself. config.log is a bit weird, the error is no=
t at
> the bottom... but searching for the output of the last test... you will=
 see
> the failure...

The output says
------------------->snip<------------------
configure:5992: checking for .preinit_array/.init_array/.fini_array suppo=
rt
configure:6005: arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3D=
arm926ej-s -mthumb-interwork -mno-thumb -I/SCRATCH/SSZ/HydraIP/profiling/=
OE/tmp.6/sysroots/armv5te-angstrom-linux-gnueabi/usr/include -pg  -pg -L/=
SCRATCH/SSZ/HydraIP/profiling/OE/tmp.6/sysroots/armv5te-angstrom-linux-gn=
ueabi/usr/lib -Wl,-rpath-link,/SCRATCH/SSZ/HydraIP/profiling/OE/tmp.6/sys=
roots/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dg=
nu -o conftest conftest.c
		     -static -nostartfiles -nostdlib 1>&5
/tmp/ccaARULp.o: In function `_start':
conftest.c:(.text+0xc): undefined reference to `mcount'
/tmp/ccaARULp.o: In function `__start':
conftest.c:(.text+0x28): undefined reference to `mcount'
/tmp/ccaARULp.o: In function `foo':
conftest.c:(.text+0x44): undefined reference to `mcount'
collect2: ld returned 1 exit status
configure:6008: $? =3D 1
configure:6021: result: no
configure:6024: error: Need linker with .init_array/.fini_array support.
------------------->snip<------------------

The related code in configure seems to be
------------------->snip<------------------
    cat > conftest.c <<EOF
int _start (void) { return 0; }
int __start (void) { return 0; }
int foo (void) { return 1; }
int (*fp) (void) __attribute__ ((section (".init_array"))) =3D foo;
EOF
------------------->snip<------------------

But i've no idea what the real problem is. It looks like it's not related=
 to the ".init_array" but to the missing `mcount' symbol.

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



