Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEiho-0002rg-Lh for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:53:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEifP-0001hP-6S for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 15:51:03 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 15:51:03 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2011 15:51:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Apr 2011 15:50:50 +0200
Message-ID: <ip6ijr$k1a$1@dough.gmane.org>
References: <1303813776-6345-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1303821303-447-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303821303-447-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH, v2] openssl: enforce libdir=lib
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
X-List-Received-Date: Tue, 26 Apr 2011 13:53:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-04-11 14:35, Enrico Scholz wrote:
> From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
> 
> openssl tries to detect multlib environments and assigns libdir=lib64
> e.g. for x86_64 targets.  This breaks OE assumptions about the location
> of pkgconfig files and causes build failures.
> 
> Patch gives the directory name to openssl which is used as libdir by
> OE.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  recipes/openssl/openssl.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
> index 24b517d..b029f3b 100644
> --- a/recipes/openssl/openssl.inc
> +++ b/recipes/openssl/openssl.inc
> @@ -97,7 +97,7 @@ do_configure () {
>          if [ "x$useprefix" = "x" ]; then
>                  useprefix=/
>          fi        
> -	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl $target
> +	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --libdir=`basename ${libdir}`

Why not plain ${base_libdir}?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNts26MkyGM64RGpERAq5EAJ9BRkrtdasB0pmyg0ej5Kdz6Er2nQCfd8dm
vQ53lFJ3MAmGWl9RI+m/Ayo=
=65EV
-----END PGP SIGNATURE-----



