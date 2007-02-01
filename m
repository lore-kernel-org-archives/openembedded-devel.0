Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HCjBH-0007vl-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Feb 2007 22:09:19 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id CDDDD9D961
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 16:09:18 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Thu, 01 Feb 2007 16:09:18 -0500
X-Sasl-enc: +3fP2bUNaiESI4i8uE/8xztHesyLQO3roSPJ1zipLAcJ 1170364158
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 1169E18D74
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2007 16:09:17 -0500 (EST)
Message-ID: <45C256FA.5080504@whitby.id.au>
Date: Fri, 02 Feb 2007 07:39:14 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: RFC: New version of linphone (console only unless there are objections)
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
X-List-Received-Date: Thu, 01 Feb 2007 21:09:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I have checked in linphone_1.6.0.bb for your edification (with
preferred_version = -1).  This will be used with yeaphone-0.1.bb to
allow a cheap usb handset connected to an NSLU2 to be a VoIP solution.

I am just packaging this - the work was done by Thomas Reitmayr (see
http://www.devbase.at/voip/yeaphone.php for details).

There are commented-out sections for GPE support, but (as far as I know)
 they have never been tested.

Unless anyone objects (i.e. they want GPE support, and are willing to
test it in 1.6.0 and maintain it), I propose removing the
default_preference=-1 in a couple of days time and making the
console-only 1.6.0 version the default version in OE.

If someone does object and is willing to maintain the GPE version, then
I am happy to rename the console-only version to linphone-console, and
to split out the common bits to a .inc file.  But *only* if someone is
willing to maintain the GPE version as I have no OE device with a GUI (yet).

Any objections?

-- Rod


