Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QTbTZ-0001yJ-VZ for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 17:12:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QTbQR-0002dv-Ru for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 17:09:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 17:09:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 17:09:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 06 Jun 2011 17:08:54 +0200
Message-ID: <isiqi6$9rp$1@dough.gmane.org>
References: <1307372795-32445-1-git-send-email-eyalr@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1307372795-32445-1-git-send-email-eyalr@ti.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] crda: fix regulatory domain agent for building with libnl2
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
X-List-Received-Date: Mon, 06 Jun 2011 15:12:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-06-11 17:06, Eyal Reizer wrote:
> This patch allows building the wireless regulatory domain agent with
> libnl version 2.
> 
> Signed-off-by: Eyal Reizer <eyalr@ti.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/crda/crda_1.1.1.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/crda/crda_1.1.1.bb b/recipes/crda/crda_1.1.1.bb
> index cc19b90..046a9b7 100644
> --- a/recipes/crda/crda_1.1.1.bb
> +++ b/recipes/crda/crda_1.1.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
>  SECTION = "base"
>  PRIORITY = "optional"
>  LICENSE = "ISC"
> -PR = "r1"
> +PR = "r2"
>  
>  DEPENDS = "libgcrypt libnl python-native python-m2crypto-native"
>  RDEPENDS_${PN} = "udev"
> @@ -12,6 +12,8 @@ SRC_URI = "http://wireless.kernel.org/download/crda/${P}.tar.bz2;name=crda \
>  	http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2009.11.25-regulatory.bin;name=reg \
>  	"
>  
> +CFLAGS += " -DCONFIG_LIBNL20"
> +
>  do_compile() {
>  	oe_runmake all_noverify
>  }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN7O2GMkyGM64RGpERAplzAJ4rmp92Ycbmq3DF6JoCT259jHkD6gCeMYhg
dkyvRZPwLIZjVSDXzYwa/wk=
=taj6
-----END PGP SIGNATURE-----



