Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IydzB-0006ZZ-O1
	for openembedded-devel@openembedded.org; Sun, 02 Dec 2007 02:51:09 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 9BC7E5973C
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Dec 2007 20:47:52 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sat, 01 Dec 2007 20:47:52 -0500
X-Sasl-enc: K2iYuMr7C8nOorf+39tFL8DLbO2VmlQAu5FpisT5cHuW 1196560072
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 5F89236EE
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Dec 2007 20:47:51 -0500 (EST)
Message-ID: <47520EA7.8030507@whitby.id.au>
Date: Sun, 02 Dec 2007 12:17:19 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
Subject: RFC: Inclusion of bootloader utilities in task-base
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
X-List-Received-Date: Sun, 02 Dec 2007 01:51:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Some MACHINE configurations have FEATURES defined for 'uboot' and
'redboot'.  It looks like these are intended to identify the bootloader
used on that machine.

These turn on additions to RDEPENDS in task-base for some bootloader
utilities.

RFC #1: Is putting bootloader utilities in task-base a good idea in the
first place?  Surely it's something that you either need for first boot
(in which case it should be in the more primitive task-boot list), or
it's something you use rarely after first boot (in which case it
shouldn't be  wasting precious flash space in a task-base list but
should just be ipkg installed when needed).

RFC #2: Shouldn't these be RRECOMMENDS unless they are absolutely
critical, so that you can ipkg remove them if you don't want them.

RFC #3: I want to add an 'apex' FEATURE for the Apex bootloader, and
have that enable the 'apex-env' utility.  Any objections?  It would be
done in the way decided by RFC #2, and subject to an RFC #1 decision.

RFC #4: If a machine (like the ixp4xx) can use a number of different
bootloaders (redboot and apex in the case of the NSLU2), should they all
be listed as features in machine.conf?

-- Rod


