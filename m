Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeSZC-0004O2-An for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:52:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OeSYm-00041S-FD for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:50:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 14:50:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 14:50:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 29 Jul 2010 14:48:45 +0200
Message-ID: <i2rtbe$i98$2@dough.gmane.org>
References: <1280406377-23902-1-git-send-email-chase.maupin@ti.com>
	<1280406377-23902-2-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1280406377-23902-2-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] x-load: add signGP to sourceipk
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
X-List-Received-Date: Thu, 29 Jul 2010 12:52:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-07-10 14:26, Chase Maupin wrote:
> * When creating a source ipk for the x-load program copy the
>   signGP binary as well as this is needed when rebuilding.
> * Bump the PR for x-load-omap3pandora recipe.

NAK. If you want to have signgp, bitbake signgp-native. Including
'random' binaries from other recipes in packages is a no-no.

regards,

Koen


> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> ---
>  recipes/x-load/x-load-omap3pandora_git.bb |    2 +-
>  recipes/x-load/x-load.inc                 |    5 +++++
>  2 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/x-load/x-load-omap3pandora_git.bb b/recipes/x-load/x-load-omap3pandora_git.bb
> index 05dfc20..e9e6e49 100644
> --- a/recipes/x-load/x-load-omap3pandora_git.bb
> +++ b/recipes/x-load/x-load-omap3pandora_git.bb
> @@ -9,7 +9,7 @@ SRCREV = "b3646a83f9e67ec9a2de3182fd254557fd6ad9aa"
>  PROVIDES = "x-load"
>  
>  PV = "1.42+${PR}+gitr${SRCREV}"
> -PR ="r2"
> +PR ="r3"
>  PE = "1"
>  
>  SRC_URI = "git://git.openpandora.org/pandora-x-loader.git;branch=master;protocol=git"
> diff --git a/recipes/x-load/x-load.inc b/recipes/x-load/x-load.inc
> index 0699c01..e786ac1 100644
> --- a/recipes/x-load/x-load.inc
> +++ b/recipes/x-load/x-load.inc
> @@ -38,6 +38,11 @@ do_install () {
>  
>  FILES_${PN} = "/boot"
>  
> +do_create_srcipk_prepend() {
> +    mkdir -p ${WORKDIR}/sourceipk-tmp/psp/x-load/host-tools
> +    cp `which signGP` ${WORKDIR}/sourceipk-tmp/psp/x-load/host-tools/
> +}
> +
>  do_deploy () {
>  	install -d ${DEPLOY_DIR_IMAGE}
>  	install ${S}/x-load.bin.ift ${DEPLOY_DIR_IMAGE}/${XLOAD_IMAGE}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMUXitMkyGM64RGpERAhUYAKC6fLMHo4tdV74afqFSzzfW7JZ0XgCgrNnS
EbRbIAK7+yFW6gldUT+ETqs=
=JZx8
-----END PGP SIGNATURE-----



