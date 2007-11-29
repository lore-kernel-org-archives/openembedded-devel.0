Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1Ixi1G-0007CZ-Cx
	for openembedded-devel@openembedded.org; Thu, 29 Nov 2007 12:57:26 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 8C975529C4
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Nov 2007 06:54:24 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Thu, 29 Nov 2007 06:54:24 -0500
X-Sasl-enc: bGjMXVjXZ/c6CebvDAkBstw6a09l1Y/ffy4LrX7VbOuM 1196337264
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id DF30410FCC
	for <openembedded-devel@openembedded.org>;
	Thu, 29 Nov 2007 06:54:23 -0500 (EST)
Message-ID: <474EA852.7090306@whitby.id.au>
Date: Thu, 29 Nov 2007 22:23:54 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
Subject: RFC: auto eth0 and auto eth1 in netbase
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
X-List-Received-Date: Thu, 29 Nov 2007 11:57:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Some machines don't have consoles, so the only way to access them on the
first boot after a reflash is via the network.

Of course, an 'auto' keyword is required for this, and netbase currently
has none.

Is there any reason why at least eth0 should not have an 'auto' keyword?

Should this be OE-wide, only for Angstrom (koen thinks eth0 and eth1
should be auto), or only for specific machines (in which case, does
anyone object to ixp4xx having auto eth0)?

-- Rod


