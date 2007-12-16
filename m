Received: from [66.111.4.27] (helo=out3.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J3plf-0008Jq-Uu
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2007 10:26:40 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 13DDC7D983
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 04:21:58 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Sun, 16 Dec 2007 04:21:58 -0500
X-Sasl-enc: k97V3y40f4HUK9rlOXGuQ0F93NZENpG1iRiE9H5GmSxd 1197796917
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 12C5D3CC7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 04:21:56 -0500 (EST)
Message-ID: <4764EDFB.9000801@whitby.id.au>
Date: Sun, 16 Dec 2007 19:50:59 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [ANN] New 'base-image' created (Was: [RFC] Add ipkg to minimal image)
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
X-List-Received-Date: Sun, 16 Dec 2007 09:26:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Based on the good discussion and constructive feedback related to my RFC
about adding ipkg to minimal image, I have decided to create a new
image, whose name truly reflects it's intention.

I hereby name 'base-image' as the smallest possible image which allows
you to ssh into a device via it's native network interface, and install
packages from feeds across the network into internal flash or onto an
attached storage device.

It is "larger" than minimal-image (cause a number of people quite
rightly wanted minimal image to strictly remain only that which is
required to boot and get ssh access to the device, and nothing else),
but is "smaller" than console-image (which has a whole lot of stuff in
it which could easily be installed over the network from package feeds
after boot rather than being in the initial rootfs).

It is required to always be small enough to fit in the internal flash of
an NSLU2 (as an example of the smaller end of flash sizes that OE
supports), and features will be removed from the image to ensure that
this is always the case.  Any feature that can be installed using the
package manager after the first boot is always fair game for removal at
any time, and patches are welcome to make base-image as small as
possible while still retaining the ability to subsequently install that
feature.  Yes, this size restriction is part of the definition of this
image.

Since there was no clear consensus on how to indicate which package
manager is used by a particular distro, I have defaulted it to ipkg.
Patches are welcome to make it support other package management systems
(i.e. deb), but these must be done in a distro-independent way (i.e. you
must RFC and get agreement on how *all* of OE chooses a package manager,
not just how one particular distro chooses a package manager), since
this image is designed to work with any distro, not just (for example)
Angstrom.

-- Rod



