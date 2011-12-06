Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXxvC-0005CC-5j for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 17:31:10 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXxoc-0004eA-4c for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 17:24:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 17:24:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 17:24:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 06 Dec 2011 17:24:03 +0100
Message-ID: <jblfj1$mnj$1@dough.gmane.org>
References: <1323177679-8736-1-git-send-email-guillaume.gardet@oliseo.fr>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323177679-8736-1-git-send-email-guillaume.gardet@oliseo.fr>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] Fix git URL to linux-omap git repo.
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
X-List-Received-Date: Tue, 06 Dec 2011 16:31:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-12-11 14:21, Guillaume GARDET schreef:
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr> --- 
> recipes/linux/linux-omap_2.6.29.bb |    2 +- 1 files changed, 1
> insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/linux/linux-omap_2.6.29.bb
> b/recipes/linux/linux-omap_2.6.29.bb index a87fb25..3248dc3 100644 ---
> a/recipes/linux/linux-omap_2.6.29.bb +++
> b/recipes/linux/linux-omap_2.6.29.bb @@ -17,7 +17,7 @@ SRCREV =
> "58cf2f1425abfd3a449f9fe985e48be2d2555022" # The main PR is now using
> MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc PR_append
> = "+gitr${SRCREV}"
> 
> -SRC_URI =
> "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap-2.6.git;protocol=git
> \ +SRC_URI =
> "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git
> \ file://defconfig"

Acked-by: Koen Kooi <k-kooi@ti.com>

But which machine is still using such an old kernel?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7eQaEACgkQMkyGM64RGpE3/wCfSG7fhgerwSWAQ92KvXp6jdK0
b2MAoI+O9/UI3xiEvUpqs/iJ7ejsY/od
=eomX
-----END PGP SIGNATURE-----



