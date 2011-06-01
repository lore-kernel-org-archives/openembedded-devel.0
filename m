Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRoQ4-0002fX-Mb for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 18:37:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRo1i-0008J0-OA for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 18:12:10 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 18:12:10 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 18:12:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 01 Jun 2011 18:11:54 +0200
Message-ID: <is5oca$sls$1@dough.gmane.org>
References: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1306934980-19272-1-git-send-email-matteo.facchinetti@sirius-es.it>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Wed, 01 Jun 2011 16:37:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-06-11 15:29, Matteo Facchinetti wrote:
> From: Matteo Facchinetti <engineering@sirius-es.it>
> 
> Compile task fail with error:
> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
> 
> Fix it forcing right path in configuration.
> 
> 
> Signed-off-by: Matteo Facchinetti <engineering@sirius-es.it>
> ---
>  recipes/wxwidgets/wxbase_2.8.9.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/wxwidgets/wxbase_2.8.9.bb b/recipes/wxwidgets/wxbase_2.8.9.bb
> index fb18710..7d593ad 100644
> --- a/recipes/wxwidgets/wxbase_2.8.9.bb
> +++ b/recipes/wxwidgets/wxbase_2.8.9.bb
> @@ -9,7 +9,8 @@ SRC_URI += "file://Makefile.in.patch"
>  EXTRA_OECONF = " --disable-gui \
>                   --enable-largefile \
>                   --enable-gpe \
> -                 --without-subdirs"
> +                 --without-subdirs \
> +                 --with-sdl-prefix=${D}"

Usually that means you end with with references to $WORKDIR in the
target binaries, is this one safe?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5mTKMkyGM64RGpERAnjwAKC3KIkvLgvakTbi3WSVG4ihihnzvwCfRP22
jjC8gtfzfU3s4gmNSzFKLqs=
=93i7
-----END PGP SIGNATURE-----



