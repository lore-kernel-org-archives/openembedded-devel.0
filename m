Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N5vPT-000252-96
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 07:01:30 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSM00HNJGNNSK85@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	05 Nov 2009 00:00:00 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D7DA014AF60; Thu,
	05 Nov 2009 00:59:44 -0500 (EST)
Date: Thu, 05 Nov 2009 00:59:44 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091105055944.GE30116@denix.org>
References: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [STABLE][PATCH 1/3] clutter.inc: rework armv7a machines a	bit and add omap3517-evm to compatible machines
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
X-List-Received-Date: Thu, 05 Nov 2009 06:01:30 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Nov 04, 2009 at 01:32:03PM +0100, Koen Kooi wrote:
> From: Koen Kooi <koen@openembedded.org>
> 
> Signed-off-by: Koen Kooi <k-kooi@ti.com>

Is it a correct assumption that all armv7a machines will be OMAP3-based with 
GLES? :) Would SOC_FEATURES fit here better?

Acked-by: Denys Dmytriyenko <denis@denix.org>

> 
> ---
>  recipes/clutter/clutter.inc |   18 +++++-------------
>  1 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
> index e900c43..7bce3e2 100644
> --- a/recipes/clutter/clutter.inc
> +++ b/recipes/clutter/clutter.inc
> @@ -2,7 +2,7 @@ DESCRIPTION = "Clutter graphics library"
>  HOMEPAGE = "http://www.clutter-project.org/"
>  LICENSE = "LGPL"
>  
> -COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|beagleboard|overo|omap3evm)"
> +COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|omap3517-evm|beagleboard|overo|omap3evm)"
>  
>  STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
>  BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
> @@ -20,6 +20,10 @@ EXTRA_OECONF_mx31litekit = "${BASE_CONF} --with-flavour=eglnative"
>  PACKAGE_ARCH_mx31litekit = "${MACHINE_ARCH}"
>  LDFLAGS_append_mx31litekit = " -lpvrNULLWSEGL -lstdc++ "
>  
> +DEPENDS_armv7a = "${STDDEPENDS} libgles-omap3 tslib"
> +EXTRA_OECONF_armv7a = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
> +PACKAGE_ARCH_armv7a = "${MACHINE_ARCH}"
> +
>  DEPENDS_omap-3430ldp = "${STDDEPENDS} libgles-omap3 tslib"
>  EXTRA_OECONF_omap-3430ldp = "${BASE_CONF} --with-flavour=eglx"
>  PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
> @@ -28,18 +32,6 @@ DEPENDS_omap-3430sdp = "${STDDEPENDS} libgles-omap3 tslib"
>  EXTRA_OECONF_omap-3430sdp = "${BASE_CONF} --with-flavour=eglx"
>  PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
>  
> -DEPENDS_beagleboard = "${STDDEPENDS} libgles-omap3 tslib"
> -EXTRA_OECONF_beagleboard = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
> -PACKAGE_ARCH_beagleboard = "${MACHINE_ARCH}"
> -
> -DEPENDS_omap3evm = "${STDDEPENDS} libgles-omap3 tslib"
> -EXTRA_OECONF_omap3evm = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
> -PACKAGE_ARCH_omap3evm = "${MACHINE_ARCH}"
> -
> -DEPENDS_overo = "${STDDEPENDS} libgles-omap3 tslib"
> -EXTRA_OECONF_overo = "${BASE_CONF} --with-flavour=eglx --with-gles=2.0"
> -PACKAGE_ARCH_overo = "${MACHINE_ARCH}"
> -
>  DEPENDS_mx31ads = "${STDDEPENDS} libgles-mx31 tslib"
>  EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
>  PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


