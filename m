Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H2dGM-00039m-7d
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jan 2007 01:48:50 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7527778nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2007 16:47:32 -0800 (PST)
Received: by 10.49.20.15 with SMTP id x15mr16584658nfi.1167958052181;
	Thu, 04 Jan 2007 16:47:32 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id m16sm94209674nfc.2007.01.04.16.47.31;
	Thu, 04 Jan 2007 16:47:32 -0800 (PST)
Date: Fri, 5 Jan 2007 02:47:45 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <108417931.20070105024745@gmail.com>
To: kernel-discuss@handhelds.org, openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: DefconfigMan - a tool to manage consistent Linux kernel defconfigs across architectures and machines
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
X-List-Received-Date: Fri, 05 Jan 2007 00:48:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

[Crossposted to few related mailing lists]

Greetings,

          I'd like to announce a tool I've been working on for the last
few weeks, which allows to create machine-specific defconfigs templates
from high-level descriptions of required features. The initial
release, 0.5 is available at
https://sourceforge.net/project/showfiles.php?group_id=184224 .

          By this time, it was tested on 3 iPaq models: h3900, h4000
(PXA25x) and hx4700 (PXA27x) and works up to expectations. I'd
appreciate any feedback/test results/suggestions/discussion regarding
this tool and task which it tries to handle.

          In more detail the motivation behind this tool and how it
works are described in the README quoted below:

===============
Linux Kernel Defconfig Manager
==============================

Intro and Motivation
--------------------

This is a tool to create and manage Linux kernel configuration files for
different architectures and subarchitectures consistently, based on the
high-level hierarchial descriptions of different "machines" with their
hardware features and "distributions" with their usage/policy features.
For example, you can request defconfigman to make a kernel configs to
boot your devices via NFS - and it will does so, selecting suitable builtin
network driver for various types of hardware - NE2000-based card for you 
x86 desktop system, USB Ethernet gadget driver for your ARM-based PDA,
and WiFi chipset for you MIPS-based wireless router.

Defconfigman also handle propogation and consistency of constraints.
Example of propogation was already shown - based on NFS boot's need to have
builtin network driver, defconfigman will select one suitable for specific
machine. Example of unification and validation of constraints is following:
generally, we want USB gadget drivers to be built as modules, so we can
use different gadgets at runtime. But if we want NFS boot, then we need
builtin network driver, and if the only choice is USB ethernet gadget, then
we can't have other gadgets modular (at least, kernel config doesn't allow 
us). In this case, we either switch to non-modular config, is distro just
"recommended" modular gadgets, or throw an error, as it applies unsatisfiable
requirements - to have both NFS boot on USB-only networking device and 
modular USB gadgets.

Users of "desktop" systems may ask why bother with all above, if there're
such things as initrd, etc. Well, initrd is exactly production-level feature.
If you do active low-level development, initrd may be just an extra hop -
after all, it's easier to build a kernel, than a kernel plus initrd/initramfs.
Add to this issues of embedded systems, like special requirements for initrd
(they likely would be different from standard PC box, so initrd for them
might need to be done not like for PC), more limited ability for diagnostics,
or plain inability to use initrd at all, and feature of creating preconfigured
kernel with same features for different embedded hardware won't seem that 
useless.

And still, that only one part of story of embedded development hardships.
Another part is that embedded system are often and inherently SOC 
(system-on-chip) based. And due to peculiarities of SOCs, it's often
required to build separate kernels even for close CPU models of the same
family, with good example being Intel XScale PXA25x and PXA27x CPUs of
ARM architecture. So, it would be a bit of chore to maintain separate 
defconfigs for these two CPUs - even if they were different in one 
CONFIG option, you'd need to run menuconfig twice on each of them to
change anything, or at least to edit two files manually. Add to this need
to support extra features of some CPU, and workaround bugs, and - you
would write simple script to generate defconfigs from single template,
right? So did I, and above describes into what defconfigman evolved ;-).

How it works
------------

Defconfigmap operates with 3 types of notions - kernel features, distro features,
and machine features. All of them are however syntactically represented with 
the same instrument - a feature structure, being a named collection of keys
with associated values. Keys may refer either to other feature structures, or 
directly to kernel config options. Values are per kernel standard 'n', 'm', 
or 'y'. Values are "bound" to keys by one of two operators - weak or strong
assignment. Weak assignments can be overriden (with either weak or srong 
assignment), whereas it is error to assign another (non-equal) value to
strongly bound feature.

Machine Features
----------------

There is an abstract model of what a "machine" is, with feature names defined
for each functional part/block of typical machine (provided model is based on
typical PDA design). You define specific machine by providing "implementation"
for these abstract features in terms of standard kernel CONFIG's. For example,
there's a "machine.screen" feature for display surface of a machine. For some
machine named "h4000" you would have in "h4000-features.conf" file:

[machine.screen]
PXAFB=y
MACH_H4000_LCD=y

meaning that to support h4000's screen, driver for PXA CPU's interternal 
framebuffer controller is needed, plus device-specific shim driver for LCD
control.


Kernel Features
---------------

While machine feature are clearly represent machine- and hardware-specific
aspects of complete kernel config, kernel feature represent machine-independent
features. It's not always easy to draw the line between the too, so it is matter
of convention. For example, for PDA hardware it is pretty natural to consider
general I2C bus support as kernel feature, and only specific chips which
master the bus, or at all connected to it - as machine dependencies.

As there may be pretty many kernel features, they are separated into kernel
subsystems and kernel features per se. Again, line between them is set by
convention. For example, mentioned I2C support is treated as I2C subsystem, 
while ability to boot from NFS - as a feature.


Distro Features
---------------

Distro config and features is what ties machine and kernel features together.
That's where you specifies that particular distro wants any machine's screen,
keys, and touchscreen drivers to be builtin, while sound, bluetooth and WiFi - 
modular, that there's should be support for EXT2 system, but without extended
attributes, it should be able to boot from NFS, use preemptive kernel if 
possible, and EABI if built for ARM systems.


Using Defconfigman
------------------

There is a Makefile provided which creates defconfigs for some handheld models
maintained in Handhelds.org kernel tree. Just run "make" to generate them. 
Generated defconfigs still require extra "resolution" pass to be suitable for
direct use. As usual, this would be done within kernel tree with standard
"make oldconfig". Unfortuantly, "make oldconfig" (and "make silentoldconfig"
for that matter) appears to be pretty buggy in 2.6, and can easily go into 
infinite loop with some hand-edited/automatically produced configs.
"mke menuconfig" was found to be robust, but obviously it requires some
manual interaction. Fixing this issue is on TODO, and for now please do 
following:

1. Copy gererated defconfig to the toplevel directory of the kernel tree.
2. Rename it to .config.
3. Run "make menuconfig".
4. Immediately select "Exit".
5. Select "Yes" at the request to save configuration.

After this, .config is fully complete, and can be built against.


Acknowledgements
================
Defconfiman is strongly influenced by OpenEmbedded cross-build system,
http://www.openembedded.org . Concept of heaving different sets of machines,
distros, their features, and combining them into single config by propogating 
constraints is based on its "task-base" feature, and is further elaboration 
of it. Defconfig itself concieved to address area not handled good enough 
(so far) by OE - while it provides flexible ways to build packages and file 
system images based on various requirements and constraints, one thing it 
doesn't address is handling kernel configuration consistently across different 
machines for which a distro is built. Defconfiman picks up just there.
===============

  

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



