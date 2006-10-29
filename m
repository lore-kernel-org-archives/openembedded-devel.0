Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GeBey-00078s-Ah
	for openembedded-devel@openembedded.org; Sun, 29 Oct 2006 15:29:12 +0100
Received: (qmail 15531 invoked by uid 813007); 29 Oct 2006 14:28:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 29 Oct 2006 14:28:40 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Oct 2006 15:28:39 +0100
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200610291528.40663.openembedded@hrw.one.pl>
Subject: RFC: handling of machine/distro features stuff
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
X-List-Received-Date: Sun, 29 Oct 2006 14:29:12 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Currently OpenEmbedded use overrides based on DISTRO, MACHINE, TARGET_ARCH 
and few others. I want to suggest start of using also 
{MACHINE,DISTRO}_FEATURES because we have some stuff in metadata which 
make sense only on some targets only - for example madwifi is limited to 
PCI devices only.

Why do this at all? Let me take wpa-supplicant 0.5.x as example.

I'm building own distribution for my PDA devices and want to use latest 
possible software. But wpa-supplicant 0.5.1 depends on madwifi which 
cannot be build because my target device does not have PCI bus support. If 
I remove madwifi stuff from wpa-supplicant recipe then I will get working 
version. But this cannot be pushed back into repo because NSLU2 related 
distros want version with madwifi support.

Solution can be adding checking for pci support in 
{MACHINE,DISTRO}_FEATURES and only then enable madwifi support:

DEPENDS = "gnutls \ 
${@base_contains("DISTRO_FEATURES", "pci", "madwifi", "",d)}"

Same stuff can go into madwifi recipe so it will get skipped if target 
device lack PCI support.


-- 
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               Life's not fair. But the root password helps.




