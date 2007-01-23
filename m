Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H99Fd-0007au-38
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jan 2007 01:11:01 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 8E58F93CB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2007 19:11:00 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Mon, 22 Jan 2007 19:11:00 -0500
X-Sasl-enc: thSQL8AwqB+j2j+u7uLUZufjQGMmdm3G5ygm84uR/gHQ 1169511060
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id B4FDA10CC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2007 19:10:59 -0500 (EST)
Message-ID: <45B5528F.3050108@whitby.id.au>
Date: Tue, 23 Jan 2007 10:40:55 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>
	<45B518A5.8000500@dominion.kabel.utwente.nl>
In-Reply-To: <45B518A5.8000500@dominion.kabel.utwente.nl>
Subject: Deprecating ixp4xx, nslu2 in favour of endian-specific machine settings (Was: RFC on MACHINE_ENDIAN)
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
X-List-Received-Date: Tue, 23 Jan 2007 00:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>>> Koen, with that extra information and context, is your input to the
>>> consensus still the same?
> 
> I think adding two machines adheres to the principle of least surprise and makes is
> possible to build for the 2 machines in parallel (/me hugs bitbake trunk + machine-via-env).
> Also take a look at the amount of python in ixp4xx.conf to translate endianness into
> various settings. With 2 machines, you can do without the python, which makes it for new
> OE users look less arcane, and easier for python n00bs like me to modify.

OK, based on a good IRC conversation with Koen this morning, we're going
to do the following:

1) Replace ARCH_BYTE_SEX with IXP4XX_MACHINE_ENDIAN throughout OE

2) Set IXP4XX_MACHINE_ENDIAN in conf/machine/{ixp4xx,nslu2}{be,le}.conf
and deprecate conf/machine/{ixp4xx,nslu2}.conf in favour of the
endian-specific machines.

2) Make sure that any ixp4xx-specific file that uses
IXP4XX_MACHINE_ENDIAN also has a COMPATIBLE_MACHINE setting to match.

3) Replace any usage of IXP4XX_MACHINE_ENDIAN in a non-ixp4xx-specific
file with autofoo stuff to determine the endianness.

4) Clean up conf/machine/include/ixp4xx to use tune-xscale and
tune-thumb, and remove other variables which already have global OE
equivalents.

5) Replace _ixp4xx overrides with _ixp4xxle and _ixp4xxbe overrides
instead.  Similarly for nslu2.  This will be done as a second step (in
the meantime, I'll just add ixp4xx directly to the overrides as well as
${MACHINE}).

*** Note that this means that "ixp4xx" or "nslu2" will no longer be
valid MACHINE settings - you must use "ixp4xxle", "ixp4xxbe", "nslu2le",
or "nslu2be" instead.


Last chance for objections .... commits will start in 6 hours.

-- Rod


