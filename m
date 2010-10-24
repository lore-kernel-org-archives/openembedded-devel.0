Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PA0Hm-0007Pw-BZ for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 15:06:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PA0H5-00055s-SX for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 15:06:11 +0200
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 15:06:11 +0200
Received: from k.kooi by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 15:06:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Oct 2010 15:06:03 +0200
Message-ID: <ia1avs$p2e$1@dough.gmane.org>
References: <1287905629-20148-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1287905629-20148-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] psplash: don't put initscripts to RDEPENDS
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
X-List-Received-Date: Sun, 24 Oct 2010 13:06:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-10-10 09:33, Martin Jansa wrote:
> * different distros or images are using different initscripts
> * sane image usually has some initscripts installed

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/psplash/psplash.inc |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
> index efd6a0c..baddd62 100644
> --- a/recipes/psplash/psplash.inc
> +++ b/recipes/psplash/psplash.inc
> @@ -2,14 +2,13 @@ DESCRIPTION = "Userspace framebuffer boot logo based on usplash."
>  HOMEPAGE = "http://projects.o-hand.com/psplash"
>  SECTION = "base"
>  LICENSE = "GPL"
> -RDEPENDS_${PN} = "initscripts"
>  PROVIDES = "virtual/psplash"
>  RPROVIDES_${PN} = "virtual-psplash"
>  RCONFLICTS_${PN} = "exquisite"
>  
>  SRCREV = "422"
>  PV = "0.0+svnr${SRCPV}"
> -PR = "r33"
> +PR = "r34"
>  
>  # You can create your own pslash-poky-img.h by doing
>  # ./make-image-header.sh <file>.png POKY

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMxC87MkyGM64RGpERAuA3AJ0esj4n2KeJfNcCAlx8fZhBkW0gUwCdEwWD
R1sZ/1qsjhGZQw3OlbpQ3fc=
=2ZL6
-----END PGP SIGNATURE-----



