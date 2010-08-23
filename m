Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSoS-0003kF-MX for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:55:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSo4-0003Rx-Gq for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:55:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:55:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:55:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Aug 2010 10:48:46 +0200
Message-ID: <i4tcle$qie$5@dough.gmane.org>
References: <1282509368-7791-1-git-send-email-jkridner@beagleboard.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1282509368-7791-1-git-send-email-jkridner@beagleboard.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard.conf: get a console prompt on the monitor
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
X-List-Received-Date: Mon, 23 Aug 2010 08:55:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-08-10 22:36, Jason Kridner wrote:
> 
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
>  conf/machine/beagleboard.conf |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
> index 579bcc6..91c4129 100644
> --- a/conf/machine/beagleboard.conf
> +++ b/conf/machine/beagleboard.conf
> @@ -24,6 +24,9 @@ EXTRA_IMAGECMD_jffs2 = "-lnp "
>  # Guesswork
>  SERIAL_CONSOLE = "115200 ttyS2"
>  
> +USE_VT = "1"
> +SYSVINIT_ENABLED_GETTYS = "0"
> +
>  UBOOT_MACHINE = "omap3_beagle_config"
>  
>  # do ubiattach /dev/ubi_ctrl -m 4

This is missing a PR bump in sysvinit
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMcjXtMkyGM64RGpERAszmAKC1d1yWpHJ3jdrNdceWEmuIGCjRHgCguukw
PPLFfas8i38basLzLNWjuG4=
=b2o1
-----END PGP SIGNATURE-----



