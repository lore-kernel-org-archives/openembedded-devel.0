Received: from www.dynamicdevices.co.uk ([89.200.136.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1Sxk4n-0005JU-5y
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 21:31:53 +0200
Received: from cpc8-live22-2-0-cust106.know.cable.virginmedia.com
	([82.42.168.107] helo=[127.0.0.1])
	by www.dynamicdevices.co.uk with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <ajlennon@dynamicdevices.co.uk>) id 1Sxjsz-0000OI-NV
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 19:19:41 +0000
Message-ID: <501D75E4.5060505@dynamicdevices.co.uk>
Date: Sat, 04 Aug 2012 20:20:04 +0100
From: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Boot issues when installing oe-core image from a USB ISO image
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
X-List-Received-Date: Sat, 04 Aug 2012 19:31:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I've been experimenting with blowing the "live" ISO image to a USB stick 
to install to a target drive.
(DISTRO=pokey, MACHINE=atom-pc, BBLAYERS as in my previous email - meta, 
meta-oe, meta-yocto)

I had a few issues with the install script (included as comments below), 
but eventually Grub installs
and reports success. However when I boot from the drive I just get the 
Grub CLI.

Having investigated a little it seems as though the Grub now used is 
Grub 1.99, which seems to
implement Grub2 changes to use a grub.cfg configuration file rather than 
the menu.lst configuration
mechanism.

The install file appears to check for a /etc/grub.d/40_custom and if 
this is present will use it to
create grub.cfg. However if this is not present it'll try to create a 
menu.lst, which appears to be
then be ignored by Grub (which is what was happening for me)

I see there's a 40_custom file referenced and installed by the 
grub_1.99.bb recipe in meta/recipes-bsp/grub
but for some reason this isn't present on my file-systems built out of, 
e.g. core-image-base/core-image-sato

Perhaps if the live image is specified as a target then the dependency 
magic needs to ensure that the grub
package is pulled into the file-system image (or perhaps if the 
install.sh is modified to reference a different
configuration file that will be present in the ram f/s image) ?

NB. When I add in "grub" as a dependency in the build image, then 
installation seems to work, I get the expected
grub menu and can boot.

A couple of other minor observations:

- the installer script ignores removable media targets. My use-case is 
for installation to another USB stick
   and I tend to think the option of installation to nominally removable 
media such as USB sticks might be
   useful to others too (e.g. installation from an external USB stick/CD 
to a USB device installed internally
   into a system)

- the installer won't work with USB sticks from manufacturers with 
"Disk" in the name (e.g. Sandisk").
   Adding a "| grep MB" into the pipe seems to fix this for me but it's 
a bit of a hack.

- the installer doesn't seem to correctly set the partition type for the 
swap partition it creates. (Might be
   useful to have the option to disable swap partition creation for 
flash-based target devices)

- there seems to be a potential issue with the target partition sizes 
created, resulting from the maths in
    the installer script, resulting in partitions that are not on 
cylinder boundaries, which fdisk seems to complain
    about.

Cheers,

Alex




