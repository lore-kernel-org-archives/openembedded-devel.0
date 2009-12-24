Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NNmEV-0005HF-1e for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 12:51:58 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NNmCc-0004kN-4V
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 12:49:58 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 12:49:58 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 12:49:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Dec 2009 12:49:26 +0100
Message-ID: <hgvkg5$tfh$1@ger.gmane.org>
References: <1261647639-12424-1-git-send-email-camelguo@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <1261647639-12424-1-git-send-email-camelguo@gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Remove ANGSTROM_FEED_CONFIGS reference in base-image.bb
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
X-List-Received-Date: Thu, 24 Dec 2009 11:51:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

NAK, you don't address any of the concerns mentioned in the comment

On 24-12-09 10:40, Guo Hongruan wrote:
> Rmove ANGSTROM_FEED_CONFIGS reference in recipes/images/base-image.bb, so that it is distro-independent.
> ---
>  recipes/images/base-image.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/images/base-image.bb b/recipes/images/base-image.bb
> index 295e0ed..8b1ed23 100644
> --- a/recipes/images/base-image.bb
> +++ b/recipes/images/base-image.bb
> @@ -22,10 +22,9 @@ DISTRO_SSH_DAEMON ?= "dropbear"
>  
>  DISTRO_PACKAGE_MANAGER ?= "ipkg ipkg-collateral"
>  
> -# FIXME: We need a distro-indendent way of specifying feed configs.
>  # Once the RFC for the DISTRO_FEED_CONFIGS variable name is approved,
>  # we can remove this default definition and set it in the distro config.
> -DISTRO_FEED_CONFIGS ?= "${ANGSTROM_FEED_CONFIGS}"
> +DISTRO_FEED_CONFIGS ?= ""
>  
>  DEPENDS = "\
>  	task-boot \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLM1VGMkyGM64RGpERAsACAKCsiygVUBuW/7Swgh/CIupb5d8iqgCfe/0U
Nydk6bUz7rtQKmelrx27Kew=
=iI12
-----END PGP SIGNATURE-----



