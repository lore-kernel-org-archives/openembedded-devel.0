Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1JRGss-0004AP-62
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 02:03:00 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 821959242C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2008 20:02:14 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 18 Feb 2008 20:02:14 -0500
X-Sasl-enc: m4E0379NKVnE+f3trIrL0Bv/9kbmj34Mby8dH5rwrEeH 1203382934
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id AEDB3AC91
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2008 20:02:13 -0500 (EST)
Message-ID: <47BA2A77.8090603@whitby.id.au>
Date: Tue, 19 Feb 2008 11:31:43 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200802182052.30981.mickey@vanille-media.de>	<20080218222716.7fb73014@widy.localdomain>	<1203371664.8578.46.camel@dax.rpnet.com>
	<200802190131.16052.mickey@vanille-media.de>
In-Reply-To: <200802190131.16052.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: rod@whitby.id.au
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: DISTRO override logic in angstrom.inc
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
X-List-Received-Date: Tue, 19 Feb 2008 01:03:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Monday 18 February 2008 22:54:24 Richard Purdie wrote:
>> I'm voting in favour of:
>>
>> DISTRO_OVERRIDES ?= ${DISTRO}
>> OVERRIDES
>> ="local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${
>> BUILD_OS}:fail-fast:pn-${PN}"
>>
>> and then angstrom sets:
>>
>> DISTRO_OVERRIDES = "angstrom"
>>
>> and openmoko sets:
>>
>> DISTRO_OVERRIDES = "openmoko:angstrom"
>>
>> Note there is no longer any use of := and that the main list of
>> overrides is only written in one place rather than spread out per distro
>> which could cause maintenance problems in the future.

Can we do the same for MACHINE at the same time?

nslu2, for instance, needs to use ixp4xx overrides and does the same
thing that openmoko did with angstrom overrides.

-- Rod


