Received: from [89.149.200.90] (helo=mail.kynisk.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <repvik@kynisk.com>) id 1GjhgI-0005Ox-8p
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Nov 2006 20:41:22 +0100
Received: from [10.0.0.22] (54.84-48-194.nextgentel.com [84.48.194.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kynisk.com (Postfix) with ESMTP id 023519A8D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2006 20:39:21 +0100 (CET)
Message-ID: <4558CA77.1040609@kynisk.com>
Date: Mon, 13 Nov 2006 20:41:43 +0100
From: =?UTF-8?B?w5h5dmluZCBSZXB2aWs=?= <repvik@kynisk.com>
User-Agent: Thunderbird 1.5.0.7 (X11/20060918)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20061113125712.36362.qmail@web35013.mail.mud.yahoo.com>
In-Reply-To: <20061113125712.36362.qmail@web35013.mail.mud.yahoo.com>
Subject: Re: What distro for ixp425
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Nov 2006 19:41:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Nguyen Kien wrote:
> My group is developing a smart router with Intel IXP425 XScale and I us=
e openembedded to building a small linux system for our product.=20
> In openembedded distro conf directory, there are many distros, which di=
stro is best for me?
>=20
> I built debianslug for my nslu2 ( intel ixp4xx ) device, run ok. Is it =
the best choice, if i built debianslug for my product.

So far, the debianslug distro isn't the best choice for the ixp4xx,=20
since debianslug runs LE, and has ~30% lower network performance than=20
OpenSlug, which is BE.

> Thanks for your ideas!

It'd be nice if any patches needed to run on your board made it into the=20
nslu2-linux kernel repo (or even better, mainstream).

>  Hardware configuration   CPU  533 MHz  IXP425 - XScale architecture, A=
RM core   RAM  128 to 256 MB  SDRAM operating at 133 MHz  =20
 >Primary storage  128 Mbit  Parallel flash   Secondary storage  512 MB=20
  Optional NAND flash   LAN interface  01 Ethernet  10/100 mbps
 >WAN interface  04 Ethernet  10/100 mbps   General purpose interface=20
01 USB  USB v1.1 - may attaches additional storage
>Peripheral bus  01 PCI  Mini PCI 33MHz   Console interface  01 RS-232  1=
15200 8N1  =20
 >Display  5x7 led + various leds  5x7 3 color led panel   Peripheral=20
01 Microcontroller  8 bit AVR   Miscellaneous  ICE JTAG, 8bit DIP=20
switch, Battery backed RTC
> http://ftd.routeskeeper.com

Please use a mail client that wraps. The hardware configuration ends up=20
as one incredibly long line which is annoying to read.

=C3=98yvind Repvik
SlugOS package manager


