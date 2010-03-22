Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nth83-0004ID-RC for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:53:17 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nth51-0005sO-Ey for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 13:50:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:50:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 13:50:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Mar 2010 13:35:30 +0100
Message-ID: <ho7o6i$nb2$9@dough.gmane.org>
References: <1269256016-13155-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1269256016-13155-2-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <1269256016-13155-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE] shadow: add 4.1.4
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
X-List-Received-Date: Mon, 22 Mar 2010 12:53:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <koen@openembedded.org>

On 22-03-10 12:06, Marcin Juszkiewicz wrote:
> From: Steve Sakoman <steve@sakoman.com>
> 
> ---
>  conf/checksums.ini             |    4 ++++
>  recipes/shadow/shadow_4.1.4.bb |   11 +++++++++++
>  2 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/shadow/shadow_4.1.4.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index a8b8cbf..952e9e3 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -23054,6 +23054,10 @@ sha256=7dc418c1d361123ffc5e45d61f1b97257940a8eb35d0bfbbc493381cc5b1f959
>  md5=45f77f33a6b2a5c09c28511ebb733b87
>  sha256=7fd6495d6c3e8dac7ba086c68abed4930c958a94afc15359223074614559e462
>  
> +[ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-4.1.4.tar.gz]
> +md5=e1072df927bfb4410ee4dfe26dd81a17
> +sha256=7e38a7826f6e71e89b55669e8343af05ae33ecfba99aad178cad45845d950a93
> +
>  [http://freedesktop.org/~hadess/shared-mime-info-0.20.tar.bz2]
>  md5=62184241d497d34138285bc248b3fabc
>  sha256=6febe616fb850f4319efa7017312abb796024e7ac20da37c4d2ce34afa41776c
> diff --git a/recipes/shadow/shadow_4.1.4.bb b/recipes/shadow/shadow_4.1.4.bb
> new file mode 100644
> index 0000000..393edce
> --- /dev/null
> +++ b/recipes/shadow/shadow_4.1.4.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "login/password utilities"
> +LICENSE = "GPL"
> +
> +inherit autotools
> +
> +SRC_URI = "ftp://pkg-shadow.alioth.debian.org/pub/pkg-shadow/shadow-${PV}.tar.gz"
> +
> +S = "${WORKDIR}/shadow-${PV}"
> +
> +CFLAGS_append = " -I../include"
> +

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLp2QSMkyGM64RGpERAi7gAKCqs18U9Sbktfxj+l8/orJfONcENwCgtl+b
l6NnUQcztgMQY2gPPEr4zw4=
=lumw
-----END PGP SIGNATURE-----



