Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H8mnS-0002pC-UK
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jan 2007 01:12:27 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 349038D3E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2007 19:12:26 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Sun, 21 Jan 2007 19:12:26 -0500
X-Sasl-enc: Oj5rqV0TmnbD5dF14/vdF+OpjzLL+G4qibsVJONhIlT0 1169424745
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 6835614DAC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2007 19:12:25 -0500 (EST)
Message-ID: <45B40165.6000506@whitby.id.au>
Date: Mon, 22 Jan 2007 10:42:21 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: RFC: Adding a new global MACHINE_ENDIAN variable
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
X-List-Received-Date: Mon, 22 Jan 2007 00:12:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

There exist machines (like the ixp4xx range of processors) which can be
run in either little-endian or big-endian mode, and both modes are
supported by OE.

I propose a new "MACHINE_ENDIAN" (naming courtesy of RP) variable to do
this selection (i.e. for machines that support both, the build can be
selected in local.conf).

NSLU2-Linux has previously had an "ARCH_BYTE_SEX" variable for this
purpose - I would move all instances of that to the new variable name.
I would also update Angstrom to use the new global variable name instead
of reusing the nslu2-linux-specific variable (which will be deprecated).

The supported values of the variable would be "be" and "le".

-- Rod


