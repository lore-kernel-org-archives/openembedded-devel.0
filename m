Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1Oz4Bx-0002hN-Ud
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:04:27 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 545D9491286
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:03:37 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 24 Sep 2010 11:03:36 +0200
Message-ID: <4C9C696B.4050800@dresearch.de>
Date: Fri, 24 Sep 2010 11:03:39 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285241444.3691.60.camel@mattotaupa>	<4C9B57F8.6000605@dresearch.de>
	<4C9B608F.4060602@dresearch.de>
In-Reply-To: <4C9B608F.4060602@dresearch.de>
X-OriginalArrivalTime: 24 Sep 2010 09:03:36.0899 (UTC)
	FILETIME=[5F7F5130:01CB5BC7]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libatasmart_0.13.bb: `No package 'libudev' found` and `./strpool: ./strpool: cannot execute binary file`
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
X-List-Received-Date: Fri, 24 Sep 2010 09:05:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 23.09.2010 16:13, schrieb Steffen Sledz:
> On 09/23/2010 03:36 PM, Steffen Sledz wrote:
>> Am 23.09.2010 13:30, schrieb Paul Menzel:
>>> Using =C8=A6ngstr=C3=B6m 2008.1 this error was not met though. But `d=
o_compile()`
>>> fails with `./strpool: cannot execute binary file`.
>>>
>>>         Log data follows:
>>>         | NOTE: make
>>>         |   CC     strpool.o
>>>         |   CCLD   strpool
>>>         | ./strpool atasmart.c atasmart.strpool.c
>>>         | ./strpool: ./strpool: cannot execute binary file
>>>         | make: *** [atasmart.strpool.c] Error 126
>>>         | FATAL: oe_runmake failed
>>>         | ERROR: Function do_compile failed
>>>         NOTE: package libatasmart-0.13-r1: task do_compile: Failed
>>>
>>> But as far as I understand the recipe takes care of that by compiling
>>> `strpool` for the build host [2].
>>>
>>>         do_compile_prepend() {
>>>         	rm strpool -f
>>>         	${BUILD_CC} -o strpool strpool.c
>>>         	chmod +x strpool
>>>         }
>>> ...
>>> [2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/d=
evicekit/libatasmart_0.13.bb?id=3D67ab615dac83b0460fa1b88dfb11c72d7c93e25=
9
>>
>> I hit the same problem. But just when building libatasmart for the fir=
st time. A second build succeeds.
>=20
> I tried the following to find the cause for this.
>=20
> First i added
>=20
>   pwd
>   file strpool
>=20
> to the do_compile_prepend().
>=20
> Aftre running
>=20
>   bitbake libatasmart -c clean
>   bitbake libatasmart
>=20
> i saw
>=20
>   ERROR: log data follows (/home/sledz/work/HydraIP/OE/tmp.6/work/armv5=
te-angstrom-linux-gnueabi/libatasmart-0.13-r1/temp/log.do_compile.29576)
>   | /home/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnuea=
bi/libatasmart-0.13-r1/git
>   | strpool: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), =
dynamically linked (uses shared libs), for GNU/Linux 2.6.4, not stripped
>   ...
>=20
> Then i called a devshell
>=20
>   bitbake libatasmart -c devshell
>=20
> Within it
>=20
>   > pwd
>   /home/sledz/work/HydraIP/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi=
/libatasmart-0.13-r1/git
>   > file strpool
>   strpool: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamicall=
y linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
>=20
> So the binary has changed in between.

I did some deeper research. The do_compile_prepend code from Koen(?) did =
not help here.

Makefile.am contains a target "noinst_PROGRAMS =3D strpool" which is used=
 to create atasmart.strpool.c.

For the creation of this target strpool there are no special rules. There=
for it is build for the target (and overwrites the strpool built from do_=
compile_prepend) instead of the build host. :(

Is anybody able to write down a rule for strpool fixing this?

Steffen



