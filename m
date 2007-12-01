Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1IySwD-0002HI-BC
	for openembedded-devel@openembedded.org; Sat, 01 Dec 2007 15:03:25 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 3072358026
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Dec 2007 09:00:07 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 01 Dec 2007 09:00:07 -0500
X-Sasl-enc: TtuEeYm7aAerYVklp2/eS5XzA/Bz7WHfbx/3UJrbSKqw 1196517606
Received: from [192.168.18.13] (CPE-121-209-18-182.sa.bigpond.net.au
	[121.209.18.182])
	by mail.messagingengine.com (Postfix) with ESMTP id D8FF3255D6
	for <openembedded-devel@openembedded.org>;
	Sat,  1 Dec 2007 09:00:05 -0500 (EST)
Message-ID: <475168C5.4050208@whitby.id.au>
Date: Sun, 02 Dec 2007 00:29:33 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
Subject: How to get certain kernel modules and packages included in the rootfs, but based on the kernel version
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
X-List-Received-Date: Sat, 01 Dec 2007 14:03:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I need some advice on how to use MACHINE_ESSENTIAL-*

I'm testing an Angstrom minimal image by switching between the
known-good-in-slugos 2.6.21.6 linux-ixp4xx kernel (where we don't yet
have all the modules and firmware included in the Angstrom minimal image
needed to bring up the network successfully), and the to-be-tested
2.6.23.8 linux-ixp4xx kernel (which has a problem with MAC addresses and
DHCP on initial boot).

The set of kernel modules and additional packages required for the
ixp4xx machine differs depending on the kernel version selected.

For the 2.6.21.6 kernel, I need to make sure a particular set of kernel
modules are in the minimal image rootfs so that networking will come up
on boot.  These modules cannot be compiled into the kernel.

For the 2.6.23.8 kernel, due to a change in the open source ethernet
drivers, I need to make sure a completely different set of kernel
modules are in the minimal image rootfs.

I had thought of doing this in ixp4xx.conf, using MACHINE_ESSENTIAL_*.
The trouble is that I don't know how to make that conditional on which
kernel is being used in the image.

I then tried putting specific MACHINE_ESSENTIAL_* stuff in each of the
two different kernel recipes, but later realised that that's not going
to work at all (it needs to be in a .conf file for task-boot to see it).

Does anyone have any other ideas on how I do achieve this?

Basically, I need a way for the selection of the kernel version to
affect the set of packages and kernel modules which are guaranteed to be
included in a minimal image.

-- Rod


