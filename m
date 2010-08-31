Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OqMFJ-0006oX-8J for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 10:31:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OqMEm-0006UB-Kd for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 10:30:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:30:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 10:30:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 31 Aug 2010 10:30:26 +0200
Message-ID: <i5iej2$qi2$1@dough.gmane.org>
References: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <AANLkTikcbgZQ8EkyCh3a7mby5VbXZ4Hp8bXRORPpZKsY@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-omap-psp-2.6.32 breaks iscsi-target
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
X-List-Received-Date: Tue, 31 Aug 2010 08:31:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-08-10 19:47, Frans Meulenbroeks wrote:
> The current beagleboard angstrom and minimal distro's (and maybe
> others) use the linux-omap-psp_2.6.32.bb recipe to build the kernel.
> 
> This one says:
> # This is the v2.6.32_OMAPPSP_03.00.01.06 branch
> SRCREV = "a6bad4464f985fdd3bed72e1b82dcbfc004d7869"
> 
> # The main PR is now using MACHINE_KERNEL_PR, for omap3 see
> conf/machine/include/omap3.inc
> MACHINE_KERNEL_PR_append = "+gitr${SRCREV}"
> 
> SRC_URI = "git://arago-project.org/git/people/sriram/ti-psp-omap.git;protocol=git;branch=master
> \
> 
> Building it creates:
> linux-omap-psp-2.6.32-r88+gitra6bad4464f985fdd3bed72e1b82dcbfc004d7869
> 
> However this is not a sound 2.6.32 tree. It contains this patch
> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=commit;h=c720c7e8383aff1cb219bddf474ed89d850336e3
> which was not in the mainstream kernel in 2.6.32

What a surprise, a vendor kernel has patches that aren't in mainline linux!

> (compare
> http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=blob;f=include/net/inet_sock.h;hb=c720c7e8383aff1cb219bddf474ed89d850336e3
> with
> http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=include/net/inet_sock.h;h=47004f35cc7eaf6f2b3cac2779ea7b7ccd5d9c1f;hb=HEAD
> ).
> 
> The patch mentioned above was integrated in a 2.6.33 rc version.
> 
> iscsi-utils uses the inet_sock struct, and contains code to access the
> daddr field of this struct. For versions <= .32 daddr is used. for
> higher versions inet_daddr is used.
> However the omap-psp kernel from arago does contain this patch  but
> reports as a .32 kernel causing a compiler errir when compiling
> iscsi_target (as the name the recipe expects is not there).
> 
> Not sure how to fix it. Changing the test in iscsi-target is not an
> option as then it does not work for official .32 kernels.
> Probably the best way to fix this is to use the above patch to revert
> the change.
> 
> anyone a better solution?

I can tell you right now that patching the psp kernel will not be
accepted, so patching the iscsi recipe is the way to go.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMfL2iMkyGM64RGpERAnaBAJ4glYrqGU/BeU7lh2TjOzBwkXF8ewCeNqyI
4wpc1emvnlEv5xsgE6HhqLY=
=H4DQ
-----END PGP SIGNATURE-----



