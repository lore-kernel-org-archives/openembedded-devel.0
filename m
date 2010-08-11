Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjHOM-0006Fg-EP for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:55:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjHOC-0006oB-Fl for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 21:55:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 21:55:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 21:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Aug 2010 21:50:51 +0200
Message-ID: <i3uuur$q8t$2@dough.gmane.org>
References: <1281555209-3993-1-git-send-email-jkridner@beagleboard.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <1281555209-3993-1-git-send-email-jkridner@beagleboard.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] u-boot: beagleboard: adjusted clocks to match PSP
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
X-List-Received-Date: Wed, 11 Aug 2010 19:55:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-08-10 21:33, Jason Kridner wrote:
> 
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
>  ...3-clocks-update-clock-setup-for-36XX-37XX.patch |    4 ++--
>  recipes/u-boot/u-boot_git.bb                       |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch b/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
> index 03da8ce..e5dbec6 100644
> --- a/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
> +++ b/recipes/u-boot/u-boot-git/beagleboard/0019-OMAP3-clocks-update-clock-setup-for-36XX-37XX.patch
> @@ -726,9 +726,9 @@ index 73063ec..2045e4e 100644
>  +per_36x_dpll_param:
>  +/*    SYSCLK    M       N      M2      M3      M4     M5      M6      m2DIV */
>  +.word 12000,    360,    4,     9,      16,     5,     4,      3,      1
> -+.word 13000,   1728,   12,     9,      32,     18,    8,      6,      2
> ++.word 13000,    864,   12,     9,      16,     9,     4,      3,      1
>  +.word 19200,    360,    7,     9,      16,     5,     4,      3,      1
> -+.word 26000,   1728,   12,     9,      32,     18,    8,      6,      2
> ++.word 26000,    432,   12,     9,      16,     9,     4,      3,      1
>  +.word 38400,    360,   15,     9,      16,     5,     4,      3,      1
>  +

Are those actually correct? Last time I looked at that bit Sakomans code
was cleaner and better. Dunno if the PSP tree has changed to fix that.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMYv8bMkyGM64RGpERAsXAAJ98FHv2Bubg84+TdLViQHZLHQtZTgCeK2BD
AWNAoQK6ufiWtDRu977ZdiY=
=wUvf
-----END PGP SIGNATURE-----



