Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2MWC-0007FI-B9 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:41:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O2MSo-00010W-PD for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 12:38:26 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 12:38:26 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 12:38:26 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 15 Apr 2010 12:38:14 +0200
Message-ID: <hq6qam$j9v$1@dough.gmane.org>
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
	<1271327750-29247-3-git-send-email-koen@openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100406 Shredder/3.0.5pre
In-Reply-To: <1271327750-29247-3-git-send-email-koen@openembedded.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux-davinci git: add hack for hawkboard machine ID
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
X-List-Received-Date: Thu, 15 Apr 2010 10:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ignore this one, it was lingering in my git send-email outbox

On 15-04-10 12:35, Koen Kooi wrote:
> From: Koen Kooi <k-kooi@ti.com>
> 
> Signed-off-by: Koen Kooi <k-kooi@ti.com>
> ---
> diff --git a/recipes/linux/linux-davinci_git.bb b/recipes/linux/linux-davinci_git.bb
> index ee28d90..87f6824 100644
> --- a/recipes/linux/linux-davinci_git.bb
> +++ b/recipes/linux/linux-davinci_git.bb
> @@ -85,3 +85,10 @@ SRC_URI_append_da850-omapl138-evm = "file://logo_linux_clut224.ppm \
>  SRC_URI_append_hawkboard          = "file://logo_linux_clut224.ppm \
>                                       file://da850_omapl138_opp456mhz.patch;patch=1 \
>                                       file://patch_hawk.diff;patch=1"
> +
> +
> +do_configure_prepend_hawkboard() {
> +	sed -i s:2157:2495:g ${S}/arch/arm/tools/mach-types
> +}
> +
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLxuyWMkyGM64RGpERAggXAJsE+vrFBkI1FD1WbD9ojcm33TXc0ACfTtLp
nDOGj7Bwd/7Hod0yp3ISDf4=
=Wl74
-----END PGP SIGNATURE-----



