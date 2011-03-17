Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q02HT-0005yh-Mk
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 02:45:39 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI600HFGI519I14@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Mar 2011 20:43:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8761F14AF6A; Wed,
	16 Mar 2011 21:43:49 -0400 (EDT)
Date: Wed, 16 Mar 2011 21:43:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110317014349.GN3042@denix.org>
References: <1300325100-29332-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1300325100-29332-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] cairo: disable native atomic operations, conflicts with libatomics-ops
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
X-List-Received-Date: Thu, 17 Mar 2011 01:45:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

An alternative solution, is to build libatomics-ops with emulated CAS (Compare 
And Swap), as otherwise those non-emulated primitives are not available on 
armel and sparc, according to [1]

Let me know if fixing libatomics-ops is more preferable and I'll make a patch. 
But I figured that since cairo used to build w/o atomic ops anyway, it's safer 
to just forcefully disable the check for them.

[1] http://us.generation-nt.com/answer/bug-566850-ao-compare-swap-full-not-available-armel-sparc-help-169012241.html

BTW, the correct name is libatomic-ops and not libatomics-ops, like it's named 
in OE...

-- 
Denys


On Wed, Mar 16, 2011 at 09:25:00PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * Add --disable-atomic to configure, otherwise it finds previously staged
> libatomics-ops from pulseaudio, which doesn't have the necessary primitives:
> 
> | In file included from cairo-reference-count-private.h:40,
> |                  from cairo-types-private.h:45,
> |                  from cairoint.h:242,
> |                  from cairo-analysis-surface.c:37:
> | cairo-atomic-private.h: In function '_cairo_atomic_int_cmpxchg_return_old_fallback':
> | cairo-atomic-private.h:218: error: implicit declaration of function 'AO_compare_and_swap_full'
> | cairo-atomic-private.h:218: warning: nested extern declaration of 'AO_compare_and_swap_full'
> 
> * From my previous builds I see that cairo used to build before libatomics-ops
> was staged, avoiding this issue.
> * Also, add INC_PR to cairo.inc and use it in recipes
> * Start INC_PR from r4 to account for one of the older versions
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes/cairo/cairo-directfb_1.6.4.bb |    2 +-
>  recipes/cairo/cairo.inc               |    5 +++++
>  recipes/cairo/cairo_1.10.0.bb         |    3 +--
>  recipes/cairo/cairo_1.4.10.bb         |    3 +--
>  recipes/cairo/cairo_1.8.0.bb          |    2 +-
>  recipes/cairo/cairo_1.8.10.bb         |    3 +--
>  recipes/cairo/cairo_1.8.8.bb          |    4 +---
>  recipes/cairo/cairomm_1.8.4.bb        |    3 ++-
>  8 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/recipes/cairo/cairo-directfb_1.6.4.bb b/recipes/cairo/cairo-directfb_1.6.4.bb
> index b4fea9a..3670eab 100644
> --- a/recipes/cairo/cairo-directfb_1.6.4.bb
> +++ b/recipes/cairo/cairo-directfb_1.6.4.bb
> @@ -12,7 +12,7 @@ EXTRA_OECONF += " --enable-directfb \
>  LDFLAGS_append += " -ldirectfb"
>  CFLAGS_append  += " -I${STAGING_INCDIR}/directfb"
>  
> -PR = "r1"
> +PR = "${INC_PR}.1"
>  
>  S = "${WORKDIR}/cairo-${PV}"
>  
> diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> index c60d7d9..3dcc14c 100644
> --- a/recipes/cairo/cairo.inc
> +++ b/recipes/cairo/cairo.inc
> @@ -4,10 +4,15 @@ DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
>  DESCRIPTION = "Cairo graphics library"
>  LICENSE = "MPL LGPL"
>  
> +INC_PR = "r4"
> +
>  #check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points 
>  require cairo-fpu.inc
>  EXTRA_OECONF += "${@get_cairo_fpu_setting(bb, d)}"
>  
> +# Disable check for atomic functions, as it fails with libatomics-ops staged
> +EXTRA_OECONF += " --disable-atomic"
> +
>  inherit autotools pkgconfig 
>  
>  PACKAGES =+ "cairo-trace cairo-trace-dev libcairo-script-interpreter libcairo-gobject"
> diff --git a/recipes/cairo/cairo_1.10.0.bb b/recipes/cairo/cairo_1.10.0.bb
> index 58e2481..177c615 100644
> --- a/recipes/cairo/cairo_1.10.0.bb
> +++ b/recipes/cairo/cairo_1.10.0.bb
> @@ -1,10 +1,9 @@
>  require cairo.inc
>  
> -PR = "r1"
> +PR = "${INC_PR}.1"
>  
>  SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=cairo \
>  "
>  
>  SRC_URI[cairo.md5sum] = "70a2ece66cf473d976e2db0f75bf199e"
>  SRC_URI[cairo.sha256sum] = "0f2ce4cc4615594088d74eb8b5360bad7c3cc3c3da9b61af9bfd979ed1ed94b2"
> -
> diff --git a/recipes/cairo/cairo_1.4.10.bb b/recipes/cairo/cairo_1.4.10.bb
> index 544479b..c334c34 100644
> --- a/recipes/cairo/cairo_1.4.10.bb
> +++ b/recipes/cairo/cairo_1.4.10.bb
> @@ -5,8 +5,7 @@ DEFAULT_PREFERENCE = "-1"
>  SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
>  file://stats.patch;p=1"
>  
> -PR = "r0"
> -
> +PR = "${INC_PR}.0"
>  
>  SRC_URI[md5sum] = "5598a5e500ad922e37b159dee72fc993"
>  SRC_URI[sha256sum] = "594e78a66044898c321e378d47faf43b665b23ba638834d2787e344ba13e5132"
> diff --git a/recipes/cairo/cairo_1.8.0.bb b/recipes/cairo/cairo_1.8.0.bb
> index a4225e8..e7cdeb7 100644
> --- a/recipes/cairo/cairo_1.8.0.bb
> +++ b/recipes/cairo/cairo_1.8.0.bb
> @@ -3,7 +3,7 @@ require cairo.inc
>  SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
>            "
>  
> -
> +PR = "${INC_PR}.0"
>  
>  SRC_URI[md5sum] = "4ea70ea87b47e92d318d4e7f5b940f47"
>  SRC_URI[sha256sum] = "827acee89ba3e8e762fbb23165cf8d455e7d95e1e50984e6882b2070a7f3abae"
> diff --git a/recipes/cairo/cairo_1.8.10.bb b/recipes/cairo/cairo_1.8.10.bb
> index 884a6a7..8339b81 100644
> --- a/recipes/cairo/cairo_1.8.10.bb
> +++ b/recipes/cairo/cairo_1.8.10.bb
> @@ -1,6 +1,6 @@
>  require cairo.inc
>  
> -PR = "r3"
> +PR = "${INC_PR}.3"
>  
>  SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=cairo \
>             file://dolt-fix.patch \
> @@ -9,4 +9,3 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz;name=cairo \
>  
>  SRC_URI[cairo.md5sum] = "b60a82f405f9400bbfdcf850b1728d25"
>  SRC_URI[cairo.sha256sum] = "572bada15596ec8708392db1af8b93a1af75ca47690348154e2841f3a6f08439"
> -
> diff --git a/recipes/cairo/cairo_1.8.8.bb b/recipes/cairo/cairo_1.8.8.bb
> index de12f13..b0280a9 100644
> --- a/recipes/cairo/cairo_1.8.8.bb
> +++ b/recipes/cairo/cairo_1.8.8.bb
> @@ -1,4 +1,4 @@
> -PR = "r1"
> +PR = "${INC_PR}.1"
>  
>  require cairo.inc
>  
> @@ -6,7 +6,5 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
>             file://dolt-fix.patch \
>            "
>  
> -
> -
>  SRC_URI[md5sum] = "d3e1a1035ae563812d4dd44a74fb0dd0"
>  SRC_URI[sha256sum] = "3c51d3de5dc4596e01a6675acd3c86c2c99c00f02e8fad5493758a29fe451c90"
> diff --git a/recipes/cairo/cairomm_1.8.4.bb b/recipes/cairo/cairomm_1.8.4.bb
> index 672dcb5..19b7618 100644
> --- a/recipes/cairo/cairomm_1.8.4.bb
> +++ b/recipes/cairo/cairomm_1.8.4.bb
> @@ -1,9 +1,10 @@
>  require cairo.inc
>  
> +PR = "${INC_PR}.0"
> +
>  DEPENDS = "cairo libsigc++-2.0"
>  DESCRIPTION = "C++ bindings for Cairo graphics library"
>  
>  SRC_URI = "http://cairographics.org/releases/cairomm-${PV}.tar.gz;name=archive"
>  SRC_URI[archive.md5sum] = "559afbc47484ba3fad265e38a3dafe90"
>  SRC_URI[archive.sha256sum] = "a28ec6d9af8f93d09076f32cd77de35f9d74a517def5dea12cb8cc2ce3a6c8f1"
> -
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


