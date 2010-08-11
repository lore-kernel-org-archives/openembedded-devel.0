Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjHIs-0008Jq-Jh for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:49:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjHIh-0004Gz-Sp for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:49:23 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 21:49:23 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 21:49:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Aug 2010 21:49:15 +0200
Message-ID: <i3uurs$q8t$1@dough.gmane.org>
References: <1281549944-13721-1-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <1281549944-13721-1-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libgles-omap3: use es5 version for 37x machines
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
X-List-Received-Date: Wed, 11 Aug 2010 19:49:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-08-10 20:05, Chase Maupin wrote:
> * Set BINLOCATION to use es5.x version for am37x-evm and
>   dm37x-evm machine types.
> * Bump PR

NAK, this patch doesn't do what you think it does. The current ES5.x
switching is already working like it should. What your patch does:

copy es2 into ES2.0/
don't copy es3 into ES3.0/
copy es5 into ES5.0
copy es5 into ES3.0

Even if the switching wasn't working, this is the *completely* wrong way
to fix it.


> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Signed-off-by: Brijesh Singh <bksingh@ti.com>
> ---
>  recipes/powervr-drivers/libgles-omap3.inc          |    2 +-
>  .../powervr-drivers/libgles-omap3_3.01.00.06.bb    |    4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
> index d183486..12839e6 100644
> --- a/recipes/powervr-drivers/libgles-omap3.inc
> +++ b/recipes/powervr-drivers/libgles-omap3.inc
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "libGLES for the omap3"
>  LICENSE = "proprietary-binary"
>  
> -PR = "r6"
> +PR = "r7"
>  
>  COMPATIBLE_MACHINE = "(dm37x-evm|am37x-evm|am3517-evm|beagleboard|cm-t35|igep0020|omap3-pandora|omap3-touchbook|omap3evm|omapzoom|omapzoom2|overo|palmpre)"
>  
> diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> index bb7994f..b3611a3 100644
> --- a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> +++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
> @@ -1,4 +1,6 @@
> -BINLOCATION = "${S}/gfx_rel_es3.x"
> +BINLOCATION_dm37x-evm = "${S}/gfx_rel_es5.x"
> +BINLOCATION_am37x-evm = "${S}/gfx_rel_es5.x"
> +BINLOCATION ?= "${S}/gfx_rel_es3.x"
>  
>  ES2LOCATION = "${S}/gfx_rel_es2.x"
>  ES3LOCATION = "${S}/gfx_rel_es3.x"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMYv67MkyGM64RGpERAvAYAJ9H5oJPSnLs7ez9XfgfnR3c4MS5HgCcDOvQ
jQJXncXmttvmaPqmdq8n7SM=
=l4tO
-----END PGP SIGNATURE-----



