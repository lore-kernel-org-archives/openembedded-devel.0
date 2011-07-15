Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qhcv6-0006ys-1z for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 09:34:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QhcrE-0006CX-8H for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jul 2011 09:30:44 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 09:30:44 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2011 09:30:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 15 Jul 2011 09:30:30 +0200
Message-ID: <ivoqam$nge$1@dough.gmane.org>
References: <1310682924-2629-1-git-send-email-agnel.joel@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1310682924-2629-1-git-send-email-agnel.joel@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH v3] linux-omap-psp: Added patch to fix MMC timeout errors
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
X-List-Received-Date: Fri, 15 Jul 2011 07:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-07-11 00:35, Joel A Fernandes schreef:
> This fixes MMC errors due to timeouts, and is borrowed from Steve Sakoman's patch for the linux-omap-2.6.39 recipe (as noticed by Jason Kridner)
> 
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com> --- Changes since v2: * Applied the patch to the correct recipe (linux-omap-psp-2.6.32 instead of linux-omap-2.6.32) (Sorry!) * Moved author name to commit message> A link shared by Jason discussing the issue: 
> http://www.mail-archive.com/linux-omap@vger.kernel.org/msg42214.html

That needs to go in to the summary

> Paul, This is an actual problem that we experience and this patch seems to fix it.
> 
> Patch: http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/linux/linux-omap-2.6.39/sakoman/0024-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch ---

And you're missing a

- -MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOH+yWMkyGM64RGpERAjfIAJ0bAsRWsVUdkUIaVm5jcYEZ6dE4bACfVyBL
AuQu1mFvLC4wXniyiweDJb8=
=6zgI
-----END PGP SIGNATURE-----



