Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HGqwC-0004Eh-En
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Feb 2007 07:14:48 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 3B66D1AE7C8;
	Tue, 13 Feb 2007 01:14:46 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Tue, 13 Feb 2007 01:14:46 -0500
X-Sasl-enc: gMR84Nscaqxk/GT9vt3cN67/mn7EGEq7HcsJXEazASRI 1171347285
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id C840C17C24;
	Tue, 13 Feb 2007 01:14:43 -0500 (EST)
Message-ID: <45D1574C.8090009@whitby.id.au>
Date: Tue, 13 Feb 2007 16:44:36 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Cc: "Mike \(mwester\)" <mwester@nslu2-linux.org>,
	Andy Wilcox <andy@protium.com>
Subject: RFC: madwifi-ng patch rationalisation and version update
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
X-List-Received-Date: Tue, 13 Feb 2007 06:14:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

There are currently some slugos-specific patches in madwifi-ng
(specifically to enable the Atheros wifi cards in devices like the
DSM-G600 and the Iomega NAS100d.

There are also some previous arm xscale patches which are almost identical.

>   -rw-r--r-- 1 rwhitby rwhitby  619 2007-01-26 04:12 10-xscale-be-elf-copts.patch
>   -rw-r--r-- 1 rwhitby rwhitby  553 2007-01-26 04:12 10-xscale-le-elf-copts.patch
>   -rw-r--r-- 1 rwhitby rwhitby  677 2007-01-06 14:32 slugos-VFP-wackelf.patch
>   -rw-r--r-- 1 rwhitby rwhitby  433 2007-01-06 14:32 slugos-xscale-be-elf-copts.patch
>   -rw-r--r-- 1 rwhitby rwhitby  367 2007-01-06 14:32 slugos-xscale-le-elf-copts.patch

We intend updating the 10-xscale patches with the contents of the
corresponding slugos-xscale patches, and unconditionally applying the
slugos-VFP-wackelf patch (after renaming it appropriately).

We also intend updating madwifi-ng to a later snapshot (e.g.
r2100-20070210), cause the current version won't build against 2.6.20
due to changes in the INIT_WORK kernel macro.

The difference between the 10-xscale patches and the slugos-xscale
patches is the removal of the "-msoft-float -mfp=2" compiler options.
This is required to match the binary HAL objects which come from madwifi.

The "wackelf" patch then edits the ELF headers on the proprietary HAL
stuff to match the floating point used in the kernel -- it can do that
because there's no actual FP performed.  It just needs to match to make
the linker happy.

If there are no objections in the next 24 hours, we will do this in the
next 48 hours.

If there are other people using the madwifi package, please contact me
so we can get this change tested by you before applying it.  Note that
we're referring to madwifi-ng (which I couldn't find any other reference
to in OE other than slugos and openprotium), not madwifi-modules (which
is used directly by a number of distros).

-- Rod


