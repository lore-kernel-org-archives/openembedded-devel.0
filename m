Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J6beU-0007b0-6I
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2007 01:58:42 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 222A34C3D9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2007 19:53:15 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Sun, 23 Dec 2007 19:53:15 -0500
X-Sasl-enc: 17J9aEYaGt51vJnsX9OkWAgB8jY4Ag5teu7wqVI/crJO 1198457594
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 4BB93FB29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2007 19:53:13 -0500 (EST)
Message-ID: <476F02B0.7090405@whitby.id.au>
Date: Mon, 24 Dec 2007 11:22:00 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <476D5DCE.6080703@student.utwente.nl>
In-Reply-To: <476D5DCE.6080703@student.utwente.nl>
X-Enigmail-Version: 0.95.5
Subject: Base image dependencies
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
X-List-Received-Date: Mon, 24 Dec 2007 00:58:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> As part of the OE-testlab I wrote a .dot generator for image contents
> and made a png of
> Angstrom-base-image-glibc-ipk-2007.11RC2-ixp4xxbe.rootfs.tar.gz:
> 
> http://ewi546.ewi.utwente.nl/tmp/test-nolibc-noupdate-nq8.png
> 
> This shows the Depends: (solid lines) and Recommends: (dashed lines)
> fields of the installed packages, but with 'libgcc', 'libc6' and
> 'update_' filtered out for readability.

As a result of this excellent analysis by Koen (thanks!), I'm trimming
task-distro-base and task-machine-base out of base-image.  There are too
many things that distros and machines add using DISTRO_EXTRA_* and
MACHINE_EXTRA_* which are not strictly required to boot, get networking
up, and run ipkg install.

For example, the x86.conf file adds "kernel-modules" to
MACHINE_EXTRA_RDEPENDS which would mean that a base-image for x86 has
*all* kernel modules included in the rootfs.  Things like avahi, whilst
very convenient, are also not strictly required and can be installed
later using tasks.

In my opinion, anything that a machine needs to boot, be accessible by
the default network interface, and be able to run a package manager (if
one happens to be installed by some other means) should be included in
MACHINE_ESSENTIAL_* (and therefore becomes part of task-boot).

Perhaps we also need a corresponding DISTRO_ESSENTIAL_* set of variables
for things that distro requires to boot and be accessible by the default
network interface, and be able to run a package manager (if one happens
to be installed by some other means).  Feed configs would fit into this
category.

-- Rod


