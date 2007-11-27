Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1Ix0bc-0005Wu-KO
	for openembedded-devel@openembedded.org; Tue, 27 Nov 2007 14:36:04 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 543EB55C1D
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Nov 2007 08:16:47 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Tue, 27 Nov 2007 08:16:47 -0500
X-Sasl-enc: 0vd9NHDb5Uzm5ImAaucrLb1miT4IERRW3ipzK3q918Ub 1196169406
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id 7A160A4C0
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Nov 2007 08:16:46 -0500 (EST)
Message-ID: <474C18A5.4030402@whitby.id.au>
Date: Tue, 27 Nov 2007 23:46:21 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: OpenEmbedded Developers <openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
Subject: RFC: Replacing ixp4xx-kernel with style-compliant updated linux-ixp4xx
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
X-List-Received-Date: Tue, 27 Nov 2007 13:36:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Now that SRCREV is assumed available in bitbake and OE, it is time to
revisit the ixp4xx-kernel recipes and use modern-day ways of doing things.

To accomplish this, I intend gradually replacing the ixp4xx-kernel
recipes with linux-ixp4xx recipes which more closely follow OE best
practices, and allow for sensible usage of linux-ixp4xx kernel recipes
for all ixp4xx devices (not just those used by nslu2-linux firmware).

For example:

1) Use SRC_URI and SRCREV to pull down the ixp4xx kernel patchset from
nslu2-linux.org, in the same way that linux-openmoko does it, instead of
doing in an nslu2-linux-specific way.

   The main advantages here are that the patchset tarball will be
permanently stored on the downloads mirror, and we can use sane-srcrevs
to control the svn revision of the patches that is used.  This removes
the complaint that OE is dependent upon a third-party svn repository.

2) Use the new linux.inc and remove the stuff that it already does

   The main advantage here is to do things the same way as other linux
recipes do, by including the same linux.inc file.  This also gives us
the opportunity to start to migrate things from linux-ixp4xx.inc to
linux.inc if they are applicable to a wider range of machines (e.g. the
endian patch I submitted earlier today).

3) Remove the python code which automatically determines the SRC_URI

   It's clear that this type of automation is not welcome, and has not
been used recently to it's full effect anyway, so we'll just remove it.

4) Move the arm-kernel-shim stuff out to a separate file or class,
instead of it being always part of ixp4xx kernel builds.  This stuff
should only happen when MACHINE is a variant of nslu2 with a stupid
bootloader, not when you're building for ixp4xx machines which have
sensible bootloaders (either a sensible vendor bootloader, or a
replacement Apex bootloader).  So it's probably a DISTRO thing, rather
than a MACHINE thing.

This will happen over the coming weeks, and I'll make sure the whole set
of linux-ixp4xx recipes and supporting files are in place well before
removing or changing any of the existing ixp4xx-kernel recipes.

Comments welcome.

-- Rod


