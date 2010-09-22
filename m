Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OyUiA-0005aS-Fg for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 21:10:36 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OyUi5-0003vc-JY for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 21:10:29 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 21:10:29 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 21:10:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Sep 2010 21:10:19 +0200
Message-ID: <i7dkar$2hg$1@dough.gmane.org>
References: <4C9950D0.7000907@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <4C9950D0.7000907@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 19:10:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

As a general remark to your current patch series, I think there is some
confusion what COMPATIBLE_MACHINE is for. To me it's signals "this
recipe is specific to a *machine*", not "this recipe is missing files to
make it work without other archs/machines".

The cases:

spidermonkey/firefox/numpy: needs jsautocfg.h for each arch, no need for
COMPATIBLE_MACHINE or COMPATIBLE_ARCH, people need to add support for
their archs

u-boot-env/pivotboot: needs a file for each machine to work properly,
but adding an (empty) fallback file is the way to go since it's only
used in deploy/.

Tacking on COMPATIBLE_{MACHINE,HOST} would just hide the problems and
make fixing it more more tedious than it needs to be. For kernel and
uboot C_M is used to make bitbake do the right thing since they all
share the same PN.

That's my take on the situation, dunno if it's the consensus or not.

regards,

Koen

On 22-09-10 02:41, Graham Gower wrote:
> From b90a9fef712cc934863ee786b2d2dedc37d6902d Mon Sep 17 00:00:00 2001
> From: Graham Gower <graham.gower@gmail.com>
> Date: Wed, 22 Sep 2010 09:39:00 +0930
> Subject: [PATCH 1/5] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
> 
> 
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
>  recipes/at91bootstrap/at91bootstrap.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/at91bootstrap/at91bootstrap.inc b/recipes/at91bootstrap/at91bootstrap.inc
> index 2160f64..dfe143a 100644
> --- a/recipes/at91bootstrap/at91bootstrap.inc
> +++ b/recipes/at91bootstrap/at91bootstrap.inc
> @@ -1,6 +1,7 @@
>  DESCRIPTION = "at91bootstrap: loaded into internal SRAM by AT91 BootROM"
>  SECTION = "bootloaders"
>  
> +COMPATIBLE_MACHINE = "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam9260ek|at91sam9xeek|at91sam9261ek)"
>  SRC_URI = "ftp://www.at91.com/pub/buildroot/${PN}-${PV}.tar.bz2 \
>  	   file://defconfig \
>             "

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMmlSbMkyGM64RGpERAtR1AKChk2g0bwBLsiyDaAsw94CZsWt9fwCfRw0L
bkqI5S6ortqh1+QHpHVQm1s=
=re7X
-----END PGP SIGNATURE-----



