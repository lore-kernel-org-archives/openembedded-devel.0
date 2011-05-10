Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJhuX-00055v-11 for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:03:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJhrt-0001UC-MM for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:00:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:00:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:00:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 10:00:22 +0200
Message-ID: <iqaram$fvf$1@dough.gmane.org>
References: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304974747-21466-1-git-send-email-schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] u-boot: add 2011.03
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
X-List-Received-Date: Tue, 10 May 2011 08:03:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Both patches applied, thanks!

On 09-05-11 22:59, Andreas Mueller wrote:
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
> ---
>  recipes/u-boot/u-boot_2011.03.bb |   19 +++++++++++++++++++
>  1 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/u-boot/u-boot_2011.03.bb
> 
> diff --git a/recipes/u-boot/u-boot_2011.03.bb b/recipes/u-boot/u-boot_2011.03.bb
> new file mode 100644
> index 0000000..8ab385f
> --- /dev/null
> +++ b/recipes/u-boot/u-boot_2011.03.bb
> @@ -0,0 +1,19 @@
> +PR = "r0"
> +require u-boot.inc
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
> +SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
> +SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
> +
> +
> +TARGET_LDFLAGS = ""
> +
> +inherit base
> +
> +do_compile () {
> +       oe_runmake ${UBOOT_MACHINE}
> +       oe_runmake all
> +}
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFNyPCWMkyGM64RGpERAuBdAJj0e9VUON1cJTrw4LBqeKEGcUa0AJ48qY/X
6d9zrl1zR64i8V6an0O6hw==
=FNTC
-----END PGP SIGNATURE-----



