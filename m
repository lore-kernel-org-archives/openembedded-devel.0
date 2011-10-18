Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE006.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RGH7B-0005ZS-Mu
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 23:22:25 +0200
Received: from mail77-tx2-R.bigfish.com (10.9.14.246) by
	TX2EHSOBE006.bigfish.com (10.9.40.26) with Microsoft SMTP Server id
	14.1.225.22; Tue, 18 Oct 2011 21:01:29 +0000
Received: from mail77-tx2 (localhost.localdomain [127.0.0.1])	by
	mail77-tx2-R.bigfish.com (Postfix) with ESMTP id 9F4111B016B	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 21:01:28 +0000 (UTC)
X-SpamScore: -23
X-BigFish: VS-23(zz154cP9371K936eK1432N98dKzz1202hzz8275chz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail77-tx2 (localhost.localdomain [127.0.0.1]) by mail77-tx2
	(MessageSwitch) id 1318971688146486_12139;
	Tue, 18 Oct 2011 21:01:28 +0000 (UTC)
Received: from TX2EHSMHS018.bigfish.com (unknown [10.9.14.242])	by
	mail77-tx2.bigfish.com (Postfix) with ESMTP id B4AD911004E	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 21:01:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS018.bigfish.com
	(10.9.99.118) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 18 Oct 2011 21:01:24 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Tue, 18 Oct 2011 16:01:24 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Building multiple u-boot binaries in oe-core?
Thread-Index: AQHMjdkX/18+ri7+9UKjckbiuhyjWA==
Date: Tue, 18 Oct 2011 21:01:23 +0000
Message-ID: <CAEsOVNdnxbeQ_Kug6b033M=E-bCujoYiyQzcCH=+Qo6T9sMjQQ@mail.gmail.com>
References: <4E9C975D.60709@telia.com> <4E9D3547.4050809@telia.com>
	<j7jd54$gnc$1@dough.gmane.org>
In-Reply-To: <j7jd54$gnc$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Building multiple u-boot binaries in oe-core?
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
X-List-Received-Date: Tue, 18 Oct 2011 21:22:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B9B5971F96C28C4C86E98BAF41992036@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2011 at 3:25 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 18-10-11 10:13, Ulf Samuelsson schreef:
>> I added the functionality for building multiple u-boot binaries to
>> classic openembedded, but this has not been implemented in oe-core. I
>> find that rather useful. Anyone disagreeing?

I find this very useful and will need to do something similar soon if
you don't get to it first ;) I've already internally used some of your
old stuff I believe.

>> The core of this is:
>>
>> do_compile () { if ! [ "x${UBOOT_MACHINES}" =3D=3D "x" ] ; then for boar=
d in
>> ${UBOOT_MACHINES} ; do if ! [ `grep ${board}_config Makefile | wc -c` =
=3D=3D
>> 0 ] ; then mkdir -p binaries/${board} oe_runmake O=3Dbinaries/${board}
>> distclean oe_runmake O=3Dbinaries/${board} ${board}_config oe_runmake
>> O=3Dbinaries/${board} all fi done else oe_runmake ${UBOOT_MACHINE}
>> oe_runmake all fi }

For us UBOOT_MACHINES =3D "P4008DS P4080DS_SPIFLASH P4080DS_SDCARD P4080DS_=
NAND"

Sometimes u-boot has different final output images, so maybe having
the machine.conf files do something like

UBOOT_OUTPUT["P4080DS_NAND"] =3D u-boot-nand.bin

So we can automagically have this work in the u-boot recipe.

>> Note that I removed the _config part from UBOOT_MACHINES.

I think upstream u-boot does not require this anymore.

>> At the moment, the binary after youv'e done "make beagleboard_config;
>> make" will be called: u-boot-beagleboard_config-${PV}-${PR}.bin
>>
>> I think "u-boot-beagleboard-${PV}-${PR}.bin" is nicer.

I agree.

>> There aren't that many boards in oe-core at the moment.
>
> 4 qemu machine to be exact
>
>> Isn't this a good time to get rid of UBOOT_MACHINE altogher and/or
>> redefine it without the "_config"

Seems fine either way to me, but I tend to think UBOOT_MACHINE could go awa=
y.


> Not sure, there are a *lot* of BSPs out there where _config is expected t=
o
> be there.

Are these using an old u-boot?

-M=



