Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1Md7fH-0003qn-Q3
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 21:14:44 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id 189903AB66
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 19:57:45 +0100 (IST)
Message-ID: <4A89A884.6030904@techworks.ie>
Date: Mon, 17 Aug 2009 19:59:16 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Documentation update about machine conf files
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
X-List-Received-Date: Mon, 17 Aug 2009 19:14:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm willing to update the manual, especially the section "Adding a new 
Machine". I would like to update the list or required variables (if it 
needs to) and add a list of optional but useful variables (see my 
previous post as well).
But i'm wondering if the the file conf/documentation.conf is a better 
place and/or a new conf/machine/machine.conf.sample could be written 
in the same way as the conf/local.conf.sample one.

Here is a list of things i would like to add for now:

  * PACKAGE_EXTRA_ARCHS
By default your machine will support the following package 
architectures: "all", "any", "noarch", "${TARGET_ARCH}" and 
"${MACHINE}". If you machine support more architectures, add them to 
this variable in order of priority

Default: empty

Example in conf/machine/at91sam9260ek.conf:
TARGET_ARCH = "arm"
PACKAGE_EXTRA_ARCHS = "armv4t armv5te"

  * KERNEL_CONSOLE:
Specify if and where you want a kernel serial console (passed on the 
kernel command line). The syntax is "<serial_device>,<speed>".

Default: "ttyS0"

Example in conf/machine/triton.conf:
KERNEL_CONSOLE = "ttys0,38400"

  * SERIAL_CONSOLE:
Specify if and where you want a serial console (inittab), the syntax 
is "<speed> <serial_device>".
TODO: it is supported by sysvinit, but is it still the case when 
busybox is used for init?

Default: empty

Example in conf/machine/fic-gta02.conf:
SERIAL_CONSOLE = "115200 ttySAC2"

  * USE_VT:
Specify if you want virtual consoles (/etc/inittab), 1 if you want, 
empty or anything else if you don't.
TODO: it is supported by sysvinit, but is it still the case when 
busybox is used for init?

Default: "1"

Example in conf/machine/htcblueangel.conf:
USE_VT = "0"

  * UBOOT_MACHINE, UBOOT_ENTRYPOINT:
If your machine use das u-boot, set UBOOT_MACHINE to the name of your 
machine as known by u-boot. UBOOT_ENTRYPOINT is used to generate your 
linux kernel image with uboot-mkimage.

Example in conf/machine/include/gumstix.inc:
UBOOT_ENTRYPOINT = "a0008000"

Default value for UBOOT_ENTRYPOINT: 20008000
Default value for UBOOT_MACHINE: ${MACHINE}_config


  * GUI_MACHINE_CLASS:
Specify if you machine has a big one or not! ;)
So use "bigscreen" if your machine has a big screen or "smallscreen" 
if our machine has a small screen.
TODO: Guidelines for the definition of big or small.

Default value: empty

Example in conf/machine/nokia800.conf:
GUI_MACHINE_CLASS = "bigscreen"


  * CMDLINE and CMDLINE_<machine>
TODO

  * KERNEL_IMAGETYPE
Depending of what kind of kernel image your machine is using, the 
distro you are running and the color of the 25369th pixel on your 
screen, some voodoo incantation will happen.
Possible values are: "bzImage", "uImage", "zImage", "vmlinux", 
"image", "linux"

Default: "zImage"

Example in conf/machine/epia.conf:
KERNEL_IMAGETYPE = "bzImage"

  * KERNEL_IMAGE_MAXSIZE
Use this variable if your kernel has to fit within a maximum sixe. if 
the generated kernel image is bigger than that you will get an error.
TODO: used only in linux.inc, does that mean that it's not checked
Default: empty

No example.

  * module_autoload_<module_name>
TODO, not sure the machine.conf is a place for this kind of things.

  * IMAGE_DEVICE_TABLES, IMAGE_DEVICE_TABLES:
TODO, already documented in image_class

  * USE_DEVFS:
TODO

Any comments are welcome! :)

Regards,
Chris


