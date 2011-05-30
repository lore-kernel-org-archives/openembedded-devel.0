Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QR4C0-0001WH-Il for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 17:15:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QR490-0008S1-0H for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 17:12:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 17:12:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 17:12:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 17:12:20 +0200
Message-ID: <is0c4k$fjg$1@dough.gmane.org>
References: <cover.1306766797.git.otavio@ossystems.com.br>
	<4b2cadd8890cb648045efa34ff601734486e1b51.1306766797.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4b2cadd8890cb648045efa34ff601734486e1b51.1306766797.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 1/1] freerdp-extension-xpunlimited: bump to fix a cache issue SRCREV
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
X-List-Received-Date: Mon, 30 May 2011 15:15:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Merged into master, thanks

On 30-05-11 16:47, Otavio Salvador wrote:
> The cache of servers needs to be stored into a directory into user
> $HOME and was failing in case it doesn't exist. This revision fixes
> it.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
> index 7e67a63..4fc6928 100644
> --- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
> +++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
> @@ -14,7 +14,7 @@ PR = "r0"
>  
>  inherit pkgconfig cmake
>  
> -SRCREV = "7b3b8538c8cb863f720ba5351aebc220e126a4b7"
> +SRCREV = "d27f90a0128c687ce74cc922dba8b7eeb33f0654"
>  SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
>  
>  S = "${WORKDIR}/git"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN47PUMkyGM64RGpERAmRFAJ9rMI3We8JBOU1NC6rFfnC4da/uFQCfTSSW
IZqWnjQ1P5uhzjxa6QGm8Cc=
=1M0f
-----END PGP SIGNATURE-----



