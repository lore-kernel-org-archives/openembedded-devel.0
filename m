Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H9RkT-00053G-WA
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jan 2007 20:56:06 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 68A0B93F8B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2007 14:56:05 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Tue, 23 Jan 2007 14:56:05 -0500
X-Sasl-enc: SjRo3WjPORwNJo5KwxLtTibW2v0DtN1HrOutT4F8dyPI 1169582164
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 9C29E10F13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2007 14:56:04 -0500 (EST)
Message-ID: <45B66852.6020801@whitby.id.au>
Date: Wed, 24 Jan 2007 06:26:02 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>	<45B59FD0.1000207@whitby.id.au>
	<45B6609B.5080909@linuxdevelopment.de>
In-Reply-To: <45B6609B.5080909@linuxdevelopment.de>
Subject: Re: Removal of the proprietary Intel IXP ethernet driver (ixp4{00, 25}-eth, ixp-osal, ixp4xx-csr) from OE
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
X-List-Received-Date: Tue, 23 Jan 2007 19:56:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Robert W=F6rle wrote:
> Rod Whitby schrieb:
>> For a long time, the only way to use the internal ethernet port for
>> ixp4xx devices was to use the proprietary intel driver.  The driver
>> could not be linked with the kernel, and tainted the kernel.
>>
>> Thankfully, that has now changed with the development of the open sour=
ce
>> ixp npe kernel driver, which is GPL and can be freely linked with the
>> kernel.  Note that the microcode firmware blob (ixp4xx-npe) which need=
s
>> to be loaded by the driver is still Intel Proprietary and requires a
>> click-through license on any firmware image that includes it.
>>  =20
> Dear Rod
>=20
> Im not having such hardware but i am  interested in this drivers setup.
> Do you think this code can be of any example ?

The Intel code?  No.  It's horrible code.  Subscribe to
linux-arm-kernel, and follow the patch review of the ixp4xx ethernet
driver that's happening right now if you want to see a good example of a
GPL rewrite of proprietary code and how to load firmware.

> I am in a similar
> situation where i am confronted with a propriatory hardware driver.
> Maybe that intel code as such is able to show me an good example of a
> "firmware loading gpl module" and i could alter my code in such similar
> way.

The intel code does not load the firmware, it has it compiled into the
driver (which is what makes it unable to be linked to the kernel).  The
open source driver does load the firmware from a separate file or MTD
partition.  The open source driver is built by the ixp4xx-kernel
package, which remains in OE for your viewing pleasure.

> Maybe the manufacturer looks at this and can go free with it also .
> Could you explain to me the "click-through" license ?  Does one need to
> agree on that on every module load or when will this come to play ?

Go to the intel site.  Try to download the ixp4xx software, and then
read the license which is presented to you.  I am not a lawyer, so I
cannot explain it to you - you really need to accept it on your own
behalf, or have your lawyer explain it to you.

-- Rod


