Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeSX7-0008EA-NK for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:49:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeSWj-0002Y8-1i for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:47:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 14:47:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 14:47:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 29 Jul 2010 14:47:49 +0200
Message-ID: <i2rt9l$i98$1@dough.gmane.org>
References: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] x-load_git: defined config for dm37x and am37x machines
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
X-List-Received-Date: Thu, 29 Jul 2010 12:52:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-07-10 14:26, Chase Maupin wrote:
> * Defined the XLOAD_MACHINE value for dm37x-evm and am37x-evm
>   machine types.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/x-load/x-load_git.bb |    4 +++-

NAK, please put those in the machine.confs, that would make it work for
xload releases as well.

regards,

Koen

>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/x-load/x-load_git.bb b/recipes/x-load/x-load_git.bb
> index cbcbf17..a14d6cb 100644
> --- a/recipes/x-load/x-load_git.bb
> +++ b/recipes/x-load/x-load_git.bb
> @@ -9,7 +9,7 @@ SRCREV_beagleboard = "1c9276af4d6a5b7014a7630a1abeddf3b3177563"
>  
>  PV = "1.42+${PR}+gitr${SRCREV}"
>  PV_beagleboard = "1.44+${PR}+gitr${SRCREV}"
> -PR ="r15"
> +PR ="r16"
>  PE = "1"
>  
>  SRC_URI = "git://gitorious.org/x-load-omap3/mainline.git;branch=master;protocol=git"
> @@ -34,11 +34,13 @@ PV_omap3evm = "1.46+${PR}+gitr${SRCREV}"
>  SRC_URI_dm37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
>  SRCREV_dm37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
>  PV_dm37x-evm = "1.46+${PR}+gitr${SRCREV}"
> +XLOAD_MACHINE_dm37x-evm = "omap3evm_config"
>  
>  # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
>  SRC_URI_am37x-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
>  SRCREV_am37x-evm = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
>  PV_am37x-evm = "1.46+${PR}+gitr${SRCREV}"
> +XLOAD_MACHINE_dm37x-evm = "omap3evm_config"
>  
>  # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
>  SRC_URI_am3517-evm = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUXh1MkyGM64RGpERAk+kAJ46GwRDNgiFhm6WTTPKu75PB9Db5ACfb/V7
1JZxc1cbt+oBtdygOlw0m54=
=OPfU
-----END PGP SIGNATURE-----



