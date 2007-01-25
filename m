Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1H9v5D-0005VL-Aj
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jan 2007 04:15:27 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id AA6E695F33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2007 22:15:26 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Wed, 24 Jan 2007 22:15:26 -0500
X-Sasl-enc: dXIN2YQobv7PJ/VK4uirnXfUu2T5fzLdnfvbvkQZ1jej 1169694926
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id D36EB29655
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2007 22:15:25 -0500 (EST)
Message-ID: <45B820C1.1090100@whitby.id.au>
Date: Thu, 25 Jan 2007 13:45:13 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45B40165.6000506@whitby.id.au>	<45B4EDCD.1060609@dominion.kabel.utwente.nl>	<45B50D16.8060001@whitby.id.au>	<45B518A5.8000500@dominion.kabel.utwente.nl>	<45B5528F.3050108@whitby.id.au>	<45B59FD0.1000207@whitby.id.au>	<45B6609B.5080909@linuxdevelopment.de>
	<45B66852.6020801@whitby.id.au>
In-Reply-To: <45B66852.6020801@whitby.id.au>
Subject: RFC: customisable pivot-root functionality
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
X-List-Received-Date: Thu, 25 Jan 2007 03:15:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

As part of the "remove all slugos-specific stuff from OE, and make it
generally useful and available to multiple distributions" effort, I need
to replicate the current slugos-init pivot-root functionality, and I
want to do it in a way which might be useful for other OE platforms (or
at least is not tied to one specific NSLU2 distribution).  At a minimum,
I want to use it for a derivative of Angstrom, which I'm calling
"MokoSlug" and possible retro-fit it into the Unslung firmware too.

First I'll describe how it currently works, and then I'll ask for input
on how the same functionality might be useful on other OE platforms.

When an NSLU2 boots the OpenEmbedded-based SlugOS firmware, the kernel
and rootfs are loaded from internal flash.  The JFFS2 rootfs is
functional as-is on first boot, and has enough functionality
out-of-the-box to run ipkg update and ipkg install.  The trouble is that
there is not much room in an 8MB flash for a kernel, functional rootfs,
and additional packages.  Also, you don't want to be continually writing
to the internal flash (yes, you can use ramdisks for some things, but
you often want persistant regular changes to your rootfs that don't
require a copy-on-shutdown to preserve the information).

So we have a script called "turnup" which allows you to modify the jffs2
rootfs's /linuxrc file to load the rootfs from an external disk (or over
nfs for that matter).  I've included the help text from turnup at the
end of this message.

Then on the next boot, the new /linuxrc file is executed, and the rootfs
is loaded from external disk - giving you all the room in the world to
install new packages (without having to go through ipkg-link or bind
mount contortions).

The other advantage of this scheme is that if your external disk fails
(or is unplugged), then the boot falls back to the internal flash, which
has enough functionality to debug and fix the reasons why the boot from
external disk failed (assuming it wasn't your cat unplugging the usb cable).

So the questions are:

1) Is there similar functionality elsewhere in OE that I haven't seen,
and could just use as-is?

2) Would this functionality be of use to any other devices that use OE?

3) Who else is interested in giving input to, and reviewing the output
of, this effort?

Thanks,

-- Rod

[turnup script help follows]

root@nslu2:~$ turnup
usage: turnup command [options]
 commands:
  help
    output this help
  init
    correct errors in network information
    initialise network information when DHCP is not available
    change network information
  disk [-i] [-s<seconds>] <device>|<uuid> [mount options]
    With -i make <device> a bootable file system then (with or
    without -i) arrange for the next reboot to use that device.
    The device must already be formatted as a file system, with
    -i it must be completely empty, without it must contain an
    apparently bootable file system. -s (for example -s5)
    specifies a delay in seconds to wait at boot time before
    mounting the device.
  memstick [-i] <device>|<uuid> [mount options]
    Behaves as disk however options appropriate to a flash memory
    stick are automatically added
  nfs [-i] <nfs mount path> [mount options]
    <nfs mount path> must be a mountable NFS file system.  With
    -i the partition must be empty and is initialised with a
    bootable file system.  Without -i the partition must already
    contain a bootable file system.  In either case the NFS
    partition must be available to be mounted without root id
    sqashing (i.e. root must be root) and it will be selected
    as the root file system for subsequent reboots.
    A default set of -o options are provided, additional options
    may be given on the command line (multiple -o options will
    be combined into a single -o).
  flash
    Revert to booting from the flash disk on next reboot.
  ram
    Boot (once) into a ramdisk, subsequent boots will be to
    the flash file system.
  preserve
    Save the system configuration to the SysConf partition, you
    will need to create the SysConf partition from the boot loader
    before using this if SysConf does not already exist.  This
    just runs 'sysconf save'.
  restore
    Restore a previously saved system configuration.  This just
    runs 'sysconf restore'.
 disk formatting:
  The argument to 'nfs' or 'disk' must be an empty partition
  of sufficient size to hold the root file system (at least
  16MByte but more is recommended to allow package installation).
  An appropriate ext3 partition can be made using the command:

    mke2fs -j <device>  # for example: /dev/sda1

  An appropriate NFS partition can be emptied using 'rm', but
  must be set up (exported) on the NFS server.
root@nslu2:~$


