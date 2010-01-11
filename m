Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NURZY-0001wa-2U
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 22:13:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 27AD9600798
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 16:11:04 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23290-02 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 11 Jan 2010 16:11:04 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id EBFAE4C3E6A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 16:11:03 -0500 (EST)
Message-ID: <4B4B93E8.7090202@cbnco.com>
Date: Mon, 11 Jan 2010 16:11:04 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B4B9189.3080906@rambler.ru>
In-Reply-To: <4B4B9189.3080906@rambler.ru>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Building x86_64 target
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
X-List-Received-Date: Mon, 11 Jan 2010 21:13:15 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I think there are a few people building for x86_64 using out-of-tree 
configurations. Here's my machine config for an HP Proliant server, for 
what it's worth. It contains a few ugly hacks. I've seen smarter, less 
ugly ways of doing it, submitted as patches - but I don't think they got 
applied up till now.

The config below was written before the staging changes a few months 
back, so there are some references to e.g. layout_libdir that may need 
to be changed to libdir.

##########################################
PREFERRED_VERSION_linux = "2.6.31"

TARGET_ARCH = "x86_64"

# We can't reuse the same -native builds as 32-bit machines, because
# ours need to be staged into staging/blah/lib64 instead of lib.
# Set blah to x86_64-buildoe64-linux to keep them separate.
BUILD_VENDOR = "-buildoe64"

layout_base_libdir = "${layout_base_prefix}/lib64"
layout_libdir = "${layout_exec_prefix}/lib64"

# Some packages install files into /lib/packagename, not /lib64/packagename.
FILES_${PN} += "${prefix}/lib/${PN}/*"
FILES_${PN}-dbg += "${prefix}/lib/${PN}/.debug"

# glibc's sysdeps/unix/sysv/linux/configure script only fixes
# libc_cv_slibdir if prefix is "/usr". With prefix of "", we need to fix it
# so libc libs don't get installed into /lib.
export libc_cv_slibdir="/lib64"

# Serial console settings for sysvinit
SERIAL_CONSOLE = "57600 ttyS0"
USE_VT = "0"

MACHINE_FEATURES = "kernel26 pci ext2 x86"

PREFERRED_PROVIDER_virtual/kernel = "linux"

KERNEL_IMAGETYPE = "bzImage"

MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"

udevdir = "/dev"
OLDEST_KERNEL = "2.6.17"
GLIBC_ADDONS = "nptl"
GLIBC_EXTRA_OECONF = "--with-tls"

# Make task-boot include bootloader
MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "syslinux-extlinux syslinux-mbr"
##########################################

Mike

Perepelica Alexander wrote:
> Hello!
> 
> Why OE don't provide default configs for x86_64 target (on market exists
> many industrial PC with core 2 duo and other 64-bit CPU) is this some
> forbidden themes or nobody build target for thouse CPU?
> 
> Thank you!
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



