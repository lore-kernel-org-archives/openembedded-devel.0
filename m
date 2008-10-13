Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpMkM-0008P9-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 14:42:02 +0200
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KpMfW-0005vS-Mq
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 14:37:02 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2008 14:37:07 +0200
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200810131437.09748.zecke@selfish.org>
Subject: [school] Class 2, Package Versioning Policy
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
X-List-Received-Date: Mon, 13 Oct 2008 12:42:02 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

after Koen's introduction to number theory (natural numbers and their order) 
let me continue with a class on Package Versioning.

Let me start with examples

# git-grep "^PV" packages/ | grep "git\\$" | grep SRCREV
packages/mesa/mesa-dri_git.bb:PV = "7.2+git${SRCREV}"
packages/u-boot/u-boot-omap3_git.bb:PV = "2008.10-rc1+${PR}+git${SRCREV}"
packages/xorg-driver/xf86-video-omapfb_git.bb:PV = "0.0.1+${PR}+git${SRCREV}"

Let me go through the errors:
	- As of policy and common standards we want to put a "r" in the revision. 
This means "7.2+gitr${SRCREV}". The same applies to svn, hg, monotone and any 
other scm system supporting a revision. If you checkout by date (SRCDATE) 
remove the "r" or switch the recipe to use SRCREV (this does not work for 
cvs).

       - Okay, never ever put PR into the PV. This is an evil hack and we have 
a known fix and it will land in the OpenEmbedded metadata. SRCPV will land in 
the OE metadata and will solve these issues rendering this hack obsolete.

thanks for listening, a bunch of fixes will come from OM.

	your janitor




