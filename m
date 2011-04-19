Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7S1-00005o-Up for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:42:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QC7Pi-0006zg-4U for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 11:40:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:40:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 11:40:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 11:29:30 +0200
Message-ID: <iojklq$bte$2@dough.gmane.org>
References: <y> <1302718350-6429-1-git-send-email-eyalr@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1302718350-6429-1-git-send-email-eyalr@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] ti-wifi-utils: update to a newer git commit
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
X-List-Received-Date: Tue, 19 Apr 2011 09:42:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-04-11 20:12, Eyal Reizer wrote:
> * Change to a newer calibrator version supporting new wl12xx chips.
> * Add a PR number
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  recipes/ti/ti-wifi-utils_git.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_git.bb
> index 92edb7f..1ee5f2d 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -3,10 +3,11 @@ LICENSE = "TI-BSD"
>  
>  DEPENDS = "libnl"
>  
> +PR ="r1"
>  PV ="0.0"
>  PR_append = "+gitr${SRCPV}"
>  
> -SRCREV = "6de17deb67a1313b5cc8"
> +SRCREV = "7f63af54eb66e5b2515f92c59fcc19a8065ce481"
>  SRC_URI = "git://github.com/gxk/ti-utils.git;protocol=git"
>  
>  S = "${WORKDIR}/git"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrVX6MkyGM64RGpERAjU3AJ9yjrbT7qNHC8SiweGIVsHuccFozwCdEy0P
B5wnwkKmLAM0SzXQjRDX73w=
=Lvop
-----END PGP SIGNATURE-----



