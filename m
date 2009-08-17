Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1Md7Pz-0003EK-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 20:58:58 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id 34F6F3AB65
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 19:41:56 +0100 (IST)
Message-ID: <4A89A4D0.2000002@techworks.ie>
Date: Mon, 17 Aug 2009 19:43:28 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Few questions about <machine>.conf
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
X-List-Received-Date: Mon, 17 Aug 2009 18:58:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to find the best way to add machine specific dependencies 
packages to the various images i can build (i'm mainly interested in 
base-image and console-image). I'm using the origin/stable/2009 branch 
with angstrom-2008.1 distro.

To find what oe offered to me, i went through the oe user's manual, 
conf/documentation.conf and start greping all around the place.

The list of variables I get by greping the machine conf files was 
really bigger than what i could find in the documentation, so to 
clarify my mind and the user manual if it needs too, here are some 
simple questions:

When writing a new machine conf file, are these variable the only ones 
which are required?
TARGET_ARCH
MACHINE_FEATURES
PREFERRED_PROVIDER_virtual/kernel

When writing a new machine conf file, are these variable allowed, do 
they really have effect, does that make sense to use them here, and 
finally can/should we use "=", "+=" or "?="  to set them?

  * Extra image commands
EXTRA_IMAGECMD_<image_type>
EXTRA_IMAGECMD_<image_type>_<machine>

The first one is documented in the manual, but is the second form 
allowed? if so is it recommended to use this form?

  * Image dependency
EXTRA_IMAGEDEPENDS
EXTRA_IMAGE_DEPENDS
BOOTSTRAP_EXTRA_RDEPENDS
MACHINE_ESSENTIAL_EXTRA_RDEPENDS
MACHINE_EXTRA_RDEPENDS
MACHINE_EXTRA_RDEPENDS_append
MACHINE_EXTRA_RRECOMMENDS

MACHINE_ESSENTIAL_EXTRA_RDEPENDS sounds like the best one to use for 
machine specific dependencies, what about the other ones?

  * PREFERRED_VERSION_<package>

Can this one be used to force a specific linux kernel version for 
example? Or does it have to be managed in linux-<version> recipe via 
DEFAULT_PREFERENCE_<machine>?

  * VENDOR, VOLATILE_STORAGE_SIZE

These 2 ones seems useless


Any comments welcome!

Regards,
Chris


