Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNVRA-0005lg-4i for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:32:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNVOE-0006oZ-75 for openembedded-devel@lists.openembedded.org;
	Fri, 20 May 2011 21:29:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 21:29:38 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 May 2011 21:29:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 May 2011 21:29:24 +0200
Message-ID: <ir6fek$pn6$1@dough.gmane.org>
References: <1305916565-15441-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305916565-15441-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
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
X-List-Received-Date: Fri, 20 May 2011 19:32:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-05-11 20:36, raj.khem@gmail.com wrote:
> From: Andreas Oberritter <obi@opendreambox.org>
> 
> - KERNEL_VERSION may contain characters unsuitable for package
>   names, e.g. underscores. Use legitimize_package_name to replace
>   those characters.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> Acked-by: Phil Blundell <philb@gnu.org>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

I cherry-picked it before I read this mail :)

> ---
>  meta-oe/classes/kernel.bbclass |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
> index e1e8197..7498c2c 100644
> --- a/meta-oe/classes/kernel.bbclass
> +++ b/meta-oe/classes/kernel.bbclass
> @@ -238,8 +238,8 @@ RDEPENDS_kernel = "kernel-base"
>  # Allow machines to override this dependency if kernel image files are 
>  # not wanted in images as standard
>  RDEPENDS_kernel-base ?= "kernel-image"
> -PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
> -PKG_kernel-base = "kernel-${KERNEL_VERSION}"
> +PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> +PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>  ALLOW_EMPTY_kernel = "1"
>  ALLOW_EMPTY_kernel-base = "1"
>  ALLOW_EMPTY_kernel-image = "1"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1sEUMkyGM64RGpERAjvUAJ9gAyp9fGBU7hcAew6Wdz5plpPQlQCeOaBj
1921JJIJCRaUxllK+OjYX1g=
=4BLe
-----END PGP SIGNATURE-----



