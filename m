Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZeV6-0001oC-C2 for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 09:38:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZeRf-0000Yh-8v for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 09:35:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 09:35:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 09:35:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Jun 2011 09:35:11 +0200
Message-ID: <ituqbf$ch6$1@dough.gmane.org>
References: <1308786540-27041-1-git-send-email-tom_rini@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1308786540-27041-1-git-send-email-tom_rini@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] kernel.bbclass: Stage System.map with KERNEL_VERSION suffix
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
X-List-Received-Date: Thu, 23 Jun 2011 07:38:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-06-11 01:49, Tom Rini wrote:
> Without this, images will fail now that kernel-abiversion is back.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Applied, thanks.

> ---
>  meta-oe/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
> index 743ca68..ecd3313 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -155,6 +155,7 @@ kernel_do_install() {
>  		cp -fR ${S}/* $kerneldir
>  	fi
>  	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> +	install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
>  
>  	#
>  	# Clean and remove files not needed for building modules.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOAuyvMkyGM64RGpERAr6IAKCEviG2eBoVBX2p02RCnCCVJlLWgwCfaxKE
wZD467jhy00HGTIQFXQHJcs=
=2oXR
-----END PGP SIGNATURE-----



