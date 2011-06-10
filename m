Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QV6jM-0002Vm-RN for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 20:46:52 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QV6g9-0001Xw-Si for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 20:43:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2011 20:43:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2011 20:43:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 10 Jun 2011 20:43:22 +0200
Message-ID: <istoka$js7$1@dough.gmane.org>
References: <20110610182409.GE29476@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110610182409.GE29476@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] qt4-*-gles: add RPROVIDES for the main and -dev packages
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
X-List-Received-Date: Fri, 10 Jun 2011 18:46:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-06-11 20:24, Denys Dmytriyenko wrote:
> Select the proper provider in case someone RDEPENDS on -gles packages.

This wasn't done on purpose since it will break qt builds for anyone
that hasn't set a preferred provided *and* is inside the masking for the
gles recipe.

You'd be better of with something like this in local.conf:

RPROVIDES_pn-qt4-embedded-gles += "qt4-embedded"
RPROVIDES_pn-qt4-embedded-gles-dev = "qt4-embedded-dev"

Or blacklist the regular qt recipes.


> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes/qt4/qt4-embedded-gles_4.6.3.bb |    5 ++++-
>  recipes/qt4/qt4-embedded-gles_4.7.3.bb |    6 ++++--
>  recipes/qt4/qt4-x11-free-gles_4.6.3.bb |    4 +++-
>  recipes/qt4/qt4-x11-free-gles_4.7.3.bb |    4 +++-
>  4 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.3.bb b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> index 0b047fc..6f1253e 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.3.bb
> @@ -1,7 +1,10 @@
>  require qt4-embedded.inc
> -PR = "${INC_PR}.8"
> +PR = "${INC_PR}.9"
>  
>  PROVIDES += "qt4-embedded"
> +RPROVIDES_${PN} = "qt4-embedded"
> +RPROVIDES_${PN}-dev = "qt4-embedded-dev"
> +
>  QT_GLFLAGS = "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
>  
>  require qt-${PV}.inc
> diff --git a/recipes/qt4/qt4-embedded-gles_4.7.3.bb b/recipes/qt4/qt4-embedded-gles_4.7.3.bb
> index 8ab5a6c..b62cb60 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.7.3.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.7.3.bb
> @@ -2,11 +2,14 @@ DEFAULT_PREFERENCE = "-1"
>  
>  require qt4-embedded.inc
>  
> -PR = "${INC_PR}.10"
> +PR = "${INC_PR}.11"
>  
>  QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
>  
>  PROVIDES += "qt4-embedded"
> +RPROVIDES_${PN} = "qt4-embedded"
> +RPROVIDES_${PN}-dev = "qt4-embedded-dev"
> +
>  QT_GLFLAGS = "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
>   
>  FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
> @@ -16,4 +19,3 @@ require qt-${PV}.inc
>  QT_CONFIG_FLAGS += " \
>   -exceptions \
>  "
> -
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> index b7cbde5..34795ee 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.6.3.bb
> @@ -1,5 +1,5 @@
>  require qt4-x11-free.inc
> -PR = "${INC_PR}.7"
> +PR = "${INC_PR}.8"
>  
>  QT_GLFLAGS = "-opengl es2 -depths 16,24,32 "
>  
> @@ -15,3 +15,5 @@ FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  DEPENDS += "virtual/egl"
>  require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
> +RPROVIDES_${PN} = "qt4-x11-free"
> +RPROVIDES_${PN}-dev = "qt4-x11-free"
> diff --git a/recipes/qt4/qt4-x11-free-gles_4.7.3.bb b/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
> index c5fd6f3..93367e4 100644
> --- a/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
> +++ b/recipes/qt4/qt4-x11-free-gles_4.7.3.bb
> @@ -1,7 +1,7 @@
>  DEFAULT_PREFERENCE = "-1"
>  
>  require qt4-x11-free.inc
> -PR = "${INC_PR}.7"
> +PR = "${INC_PR}.8"
>  
>  QT_GLFLAGS = "-opengl es2 -depths 16,24,32 "
>  
> @@ -17,3 +17,5 @@ FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
>  DEPENDS += "virtual/egl"
>  require recipes/egl/egl.inc
>  PROVIDES += "qt4-x11-free"
> +RPROVIDES_${PN} = "qt4-x11-free"
> +RPROVIDES_${PN}-dev = "qt4-x11-free"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN8mXKMkyGM64RGpERAiUwAJ0XxlLV8yMCNJN/aYLtp0GVwIq7UgCfcdZn
vxS6tJzn2O5IvZTeTqE4PUQ=
=AbgQ
-----END PGP SIGNATURE-----



