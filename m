Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSKp-0003Hn-K3 for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 09:03:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSHF-0006rs-5J for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 09:00:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:00:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:00:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 08:57:32 +0200
Message-ID: <iubu0s$jkv$4@dough.gmane.org>
References: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] gcc-common-4.6.inc: Set ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Tue, 28 Jun 2011 07:03:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-06-11 21:32, Khem Raj wrote:
> Otherwise it will compile libgcc in thumb mode when thumb
> mode is selected and libgcc in thumb mode does not work
> well.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> index 059f441..e5a1fba 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> @@ -1,3 +1,4 @@
>  # this will prepend this layer to FILESPATH
>  FILESEXTRAPATHS := "${THISDIR}/gcc-4.6"
> -PRINC = "0"
> +PRINC = "1"
> +ARM_INSTRUCTION_SET = "arm"

Thanks, applied.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOCXtbMkyGM64RGpERArJkAJ0Z3VLPnr/R5V/q54eMDv+7hU5NUQCcCbPU
OPr+3vAQzTwSq5HQRStntPQ=
=yR3e
-----END PGP SIGNATURE-----



