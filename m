Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpKI-0006F0-83 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:54:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OOpFz-0004EH-82 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 11:50:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:50:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 11:50:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jun 2010 11:47:27 +0200
Message-ID: <hva6jf$vtv$3@dough.gmane.org>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-4-git-send-email-stefan@datenfreihafen.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1276625727-22991-4-git-send-email-stefan@datenfreihafen.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 3/4] netcat_0.7.1: Gettext is needed
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
X-List-Received-Date: Wed, 16 Jun 2010 09:54:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-06-10 20:15, Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> 
> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  recipes/netcat/netcat_0.7.1.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/netcat/netcat_0.7.1.bb b/recipes/netcat/netcat_0.7.1.bb
> index 7c4dfc5..918460b 100644
> --- a/recipes/netcat/netcat_0.7.1.bb
> +++ b/recipes/netcat/netcat_0.7.1.bb
> @@ -2,11 +2,11 @@ DESCRIPTION = "GNU Netcat"
>  HOMEPAGE = "http://netcat.sourceforge.net"
>  SECTION = "console/network"
>  LICENSE = "GPLv2"
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
>  
> -inherit autotools update-alternatives
> +inherit autotools update-alternatives gettext
>  
>  do_install_append() {
>  	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMGJ2vMkyGM64RGpERAnWzAKCeJxC2cHpPRhtznVC6eB6qya2K+QCguLPn
aCmGWQ3K0JJugOU+18UhTso=
=F7KA
-----END PGP SIGNATURE-----



