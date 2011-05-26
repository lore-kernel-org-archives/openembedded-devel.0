Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPeLu-0002NP-FZ for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 19:28:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPdzc-0000rX-DP for openembedded-devel@lists.openembedded.org;
	Thu, 26 May 2011 19:05:04 +0200
Received: from ARennes-252-1-121-81.w2-11.abo.wanadoo.fr ([2.11.248.81])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2011 19:05:04 +0200
Received: from c.terrien by ARennes-252-1-121-81.w2-11.abo.wanadoo.fr with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 May 2011 19:05:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Christophe TERRIEN <c.terrien@yahoo.fr>
Date: Thu, 26 May 2011 16:48:41 +0000 (UTC)
Message-ID: <loom.20110526T181543-134@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 2.11.248.81 (Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.11) Gecko/20101013 Ubuntu/9.04 (jaunty) Firefox/3.6.11)
Subject: [linux-omap-psp do_package] problem to resolve QA issue about .debug directory
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
X-List-Received-Date: Thu, 26 May 2011 17:28:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

[linux-omap-psp do_package] problem to resolve QA issue about .debug directory


Hello,


I'm trying to build an Angström distribution for beagleboard with the last 
release of open embedded (tag release-2011.03). I'm blocked on the task 
do_package of package linux-omap-psp.

I have the folowing warnings like :
WARNING: /media/SW_Preload/cterrien_work/OE/tmp_release-2011.03/work/
beagleboard-angstrom-linux-gnueabi/
linux-omap-psp-2.6.32-r100+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/
package/lib/modules/2.6.32/kernel/sound/core/seq/.debug/snd-seq.ko may be 
corrupt; an unterminated string was found at the end of section __ksymtab_strings

And more important I have the following errors :
ERROR: QA Issue with kernel-module-mailbox-mach: non debug package contains 
.debug directory: kernel-module-mailbox-mach path /work/
beagleboard-angstrom-linux-gnueabi/
linux-omap-psp-2.6.32-r100+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155/
packages-split/kernel-module-mailbox-mach/lib/modules/2.6.32/kernel/
arch/arm/mach-omap2/.debug/mailbox_mach.ko

All errors concerns kernel-module-x packages.


I put here information about the build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "release-2011.03"
METADATA_REVISION = "8c6a371"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20110525"
TARGET_FPU        = "hard"

the distro used is angstrom-2008.1 
I wish to compile the target distribution : beagleboard-demo-image.

Please could you give me what to do in order to pass this step can continue the 
compilation of the distribution ?
I am a beginner in openembedded. In your solution, if you could indicate me 
what file to change or patch to apply it will help me.


PS : 2 similar posts but I have not found a successful solution :
  http://comments.gmane.org/gmane.linux.distributions.gumstix.general/51803
  http://comments.gmane.org/gmane.comp.handhelds.openembedded/14848








