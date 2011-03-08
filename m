Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pwy1e-0004I3-FO for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 15:36:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pwy07-0002GG-Hm for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 15:35:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 15:35:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Mar 2011 15:35:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 08 Mar 2011 15:34:50 +0100
Message-ID: <il5eqa$fkr$1@dough.gmane.org>
References: <il56eoMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1299588887-18797-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1299588887-18797-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH v3] gupnp_0.13.4/gupnp-av_0.5.9: disable introspection
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
X-List-Received-Date: Tue, 08 Mar 2011 14:36:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-03-11 13:54, Steffen Sledz wrote:
> Introspection uses host tools within compile stage. Missing tools or
> tools of wrong version result in errors like
> 
> |   GEN    GUPnP-1.0.gir
> | Couldn't find include 'Soup-2.4.gir' (search path: ...)
> 
> or
> 
> |   GEN    GUPnP-1.0.gir
> | /usr/share/gir-1.0/Soup-2.4.gir: Incompatible version 1.0 (supported: 1.2)
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/upnp/gupnp-av_0.5.9.bb |    3 +++
>  recipes/upnp/gupnp_0.13.4.bb   |    3 ++-
>  2 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/upnp/gupnp-av_0.5.9.bb b/recipes/upnp/gupnp-av_0.5.9.bb
> index 0370e91..f3e1d50 100644
> --- a/recipes/upnp/gupnp-av_0.5.9.bb
> +++ b/recipes/upnp/gupnp-av_0.5.9.bb
> @@ -2,8 +2,11 @@ LICENSE = "LGPL"
>  DEPENDS = "gupnp"
>  
>  require gupnp.inc
> +PR = "r1"
>  
>  SRC_URI[md5sum] = "5940df3c1152894685c3fc38ee95fd78"
>  SRC_URI[sha256sum] = "a909129997f79dcb6d35221ce205854d64c47a7390843e420cfba753485087bd"
>  
>  inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--enable-introspection=no"
> diff --git a/recipes/upnp/gupnp_0.13.4.bb b/recipes/upnp/gupnp_0.13.4.bb
> index 07266a1..54c62ea 100644
> --- a/recipes/upnp/gupnp_0.13.4.bb
> +++ b/recipes/upnp/gupnp_0.13.4.bb
> @@ -2,13 +2,14 @@ LICENSE = "LGPL"
>  DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gtk-doc-native libgee"
>  
>  require gupnp.inc
> +PR = "r1"
>  
>  SRC_URI[md5sum] = "0d562f5f02534c70c3743b2c514db8ba"
>  SRC_URI[sha256sum] = "7974953f38a41236c875c3df509abc43e8218b5925fdc18212a73b1ae0d0e7e8"
>  
>  inherit autotools pkgconfig
>  
> -EXTRA_OECONF = "--disable-gtk-doc"
> +EXTRA_OECONF = "--disable-gtk-doc --enable-introspection=no"
>  
>  do_configure() {
>  	libtoolize --force

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNdj6KMkyGM64RGpERAr0yAJ9h1jGsGXsPvrVpxl4nU3QBBisCQgCdGJYz
bQmbubPaE1llFQXEY74wkMk=
=WDeX
-----END PGP SIGNATURE-----



