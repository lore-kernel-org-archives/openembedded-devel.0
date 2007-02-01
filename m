Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HClgK-0005WY-3A
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Feb 2007 00:49:32 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 2F3119DFAF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 18:49:31 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Thu, 01 Feb 2007 18:49:31 -0500
X-Sasl-enc: FRiX2erbqTplbqtCwHKHfDDE4uaN+bnUtA1/LVRN9aej 1170373770
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 3075224CC0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 18:49:29 -0500 (EST)
Message-ID: <45C27C89.2040300@whitby.id.au>
Date: Fri, 02 Feb 2007 10:19:29 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1170370106.14763@gatekeeper.stellarwerx.com>
In-Reply-To: <1170370106.14763@gatekeeper.stellarwerx.com>
Subject: Re: New IXP4XX-based Machine
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
X-List-Received-Date: Thu, 01 Feb 2007 23:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Mark Gollahon wrote:
> Rod Whitby wrote ..
>> That was a bug in the newly rewritten ixp4xx conf which I believe is now
>> fixed.
> 
> Great!  When was the diff applied?  I'd like to get it.

Probably on Sunday:
Commit by rwhitby on org.oe.dev :: r0e933978... / (26 files in 10 dirs):
ixp4xx-related files: Replaced IXP4XX_MACHINE_ENDIAN with
SITEINFO_ENDIANESS throughout OE, removing all instances of
ixp4xx-specific ENDIAN checks in the OE metadata.

> Right now its not much more than a bunch of MACHINE_EXTRA_RDEPENDS and
> MACHINE_EXTRA_RRECOMMENDS settings thanks to your changes.  However, there
> is an embedded four-port eth switch chip in the box.  Since the
> manufacturer had to patch a number of areas in the Intel drivers to get it
> to work originally, I am expecting to have to do the same with the GPL
> ixp4xx eth drivers.  That would mean kernel patches, which would probably
> mean its own kernel .bb, etc.

Actually, it would be good for you to talk to the GPL ethernet driver
author, and get those patches upstream.

> From what I've seen of OE, it seems easier
> to support a new machine .conf along with its own kernel .bb than trying
> to shim a new kernel config in an old machine .conf (oh, BTW, to build for
> *this machine*, you have to use *that machine's* .conf file, but make
> PREFERRED_PROVIDER_virtual/kernel be *this*).  Newbies are already 
> overwhelmed by OE's sheer configurability, throwing yet another exception
> in on this just doesn't seem right to me.

Agreed.  What's the machine?  Got any internal photos ;-)

>> I'm willing to work with you to get this right.
> 
> I know - thank you.  I just wish I had discovered what was the issue with
> building the root filesys image before now....

Let's work together, and make sure that ixp4xx{be,le}.conf are files
that can be used for (included in) a number of such machine configurations.

-- Rod


