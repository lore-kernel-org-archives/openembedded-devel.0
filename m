Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Ryj7I-0007PV-Hm
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2012 13:10:16 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CD378F812C8; Sat, 18 Feb 2012 04:52:51 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0D926F8125E;
	Sat, 18 Feb 2012 04:52:51 -0700 (MST)
Message-ID: <4F3F9112.3050700@mlbassoc.com>
Date: Sat, 18 Feb 2012 04:52:51 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F3EED56.3080400@palm.com>
In-Reply-To: <4F3EED56.3080400@palm.com>
Subject: Re: runqemu?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Feb 2012 12:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-02-17 17:14, Rich Pixley wrote:
> What do I need to do to be able to run core-image-minimal on Ubuntu-11.10 amd64?
>
> --rich
>
> cd /home/rich/projects/webos/openembedded-core && . ./oe-init-build-env && runqemu qemux86
>
> ### Shell environment set up for builds. ###
>
> You can now run 'bitbake <target>'
>
> Common targets are:
> core-image-minimal
> core-image-sato
> meta-toolchain
> meta-toolchain-sdk
> adt-installer
> meta-ide-support
>
> You can also run generated qemu images with a command like 'runqemu qemux86'
>
>
> Continuing with the following parameters:
> KERNEL: [/home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/bzImage-qemux86.bin]
> ROOTFS: [/home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/core-image-minimal-qemux86.ext3]
> FSTYPE: [ext3]
> Setting up tap interface under sudo
> Acquiring lockfile for tap0...
> WARNING: distccd not present, no distcc support loaded.
> Running qemu...
> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qemu -kernel
> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/bzImage-qemux86.bin -net nic,vlan=0 -net tap,vlan=0,ifname=tap0,script=no,downscript=no -hda
> /home/rich/projects/webos/openembedded-core/build/tmp-eglibc/deploy/images/core-image-minimal-qemux86.ext3 -show-cursor -usb -usbdevice wacom-tablet -vga vmware -enable-gl
> -no-reboot -m 128 --append "vga=0 root=/dev/hda rw mem=128M ip=192.168.7.2::192.168.7.1:255.255.255.0 oprofile.timer=1 "
> Enabling opengl
> Could not initialize SDL(No available video device) - exiting
> Set 'tap0' nonpersistent
> Releasing lockfile of preconfigured tap device 'tap0'

This looks like qemu couldn't find a [graphic] display to use.

Did you run this locally from a desktop environment?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


