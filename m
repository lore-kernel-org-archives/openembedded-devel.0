Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H94cn-0006Jy-KH
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jan 2007 20:14:37 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 18477931C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2007 14:14:37 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Mon, 22 Jan 2007 14:14:37 -0500
X-Sasl-enc: H+2/3nHt69GPF0gxiCJqwKomflbWF/gLJqziMcnWLGKW 1169493276
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 035D310D6D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2007 14:14:35 -0500 (EST)
Message-ID: <45B50D16.8060001@whitby.id.au>
Date: Tue, 23 Jan 2007 05:44:30 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>
	<45B4EDCD.1060609@dominion.kabel.utwente.nl>
In-Reply-To: <45B4EDCD.1060609@dominion.kabel.utwente.nl>
Subject: Re: RFC: Adding a new global MACHINE_ENDIAN variable
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
X-List-Received-Date: Mon, 22 Jan 2007 19:14:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Rod Whitby schreef:
>>> There exist machines (like the ixp4xx range of processors) which can be
>>> run in either little-endian or big-endian mode, and both modes are
>>> supported by OE.
>>>
>>> I propose a new "MACHINE_ENDIAN" (naming courtesy of RP) variable to do
>>> this selection (i.e. for machines that support both, the build can be
>>> selected in local.conf).
> 
> No, that's just needles confusion, just make a .inc file (like ixp4xx.inc) that has the
> common bits and 2 machine files that set up the appropriate endiannes stuff. That way you
> can use machine overrides to configure stuff instead of putting more anonymous python
> functions in the metadata.

There currently is an ARCH_BYTE_SEX "magic" variable (which nslu2-linux
added), which is used 77 times in OE as it stands today (mostly in
SlugOS files).  First thing I will do is replace that with
MACHINE_ENDIAN (as it's a better name).

As for MACHINE_ENDIAN as a magic variable, to do as you suggest requires
that there be an easy way to have a "machine architecture" override
(i.e. ixp4xx) as well as the usual "actual machine/board" override (i.e.
nslu2le).  Currently there is only one such override in place, which
means that in *every* place that there currently is an _ixp4xx override
in the metadata, that needs to have 2 other duplicates of that line (one
for _nslu2le and one for _nslu2be) added in each of those .bb files.

I'm happy to go down that path instead of the MACHINE_ENDIAN path (if
that's the consensus of all the OE core team members - RP and koen
currently have diametrically opposed opinions on this - what do others
think?).  But I will need a way of inserting "ixp4xxle/be" and "ixp4xx"
in the set of overrides for both nslu2le and nslu2be machines.  I expect
this will need to be done in the ixp4xx.conf file by some hacky python
which looks for ${MACHINE} in the override list and adds "ixp4xxle/be"
and "ixp4xx" after it.

Koen, with that extra information and context, is your input to the
consensus still the same?

RP, does Koen's reply change your recommendation (to use MACHINE_ENDIAN)?

[Note that I'll be changing ARCH_BYTE_SEX to MACHINE_ENDIAN first
everywhere it exists, for clarity sake, as a first step.]

-- Rod (just looking for consensus before acting ...)


