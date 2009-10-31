Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1N48Lj-0005QA-BB
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Oct 2009 08:26:14 +0100
Received: from gandalf.denix.org ([71.251.63.147]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KSD00BPCB95S15D@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	31 Oct 2009 02:24:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3329D14AF60; Sat,
	31 Oct 2009 03:24:41 -0400 (EDT)
Date: Sat, 31 Oct 2009 03:24:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091031072441.GC16188@denix.org>
References: <1256913650-22661-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1256913650-22661-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [STABLE][PATCH] omap3 sgx modules: merge in fixes from	.dev
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
X-List-Received-Date: Sat, 31 Oct 2009 07:26:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 30, 2009 at 03:40:50PM +0100, Koen Kooi wrote:
> From: Koen Kooi <k-kooi@ti.com>
> 
> Signed-off-by: Koen Kooi <k-kooi@ti.com>
> Signed-off-by: Koen Kooi <koen@openembedded.org>

I'm seeing double here... :)

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  .../omap3-sgx-modules/proc-interface.patch         |   18 ++++++++++--------
>  .../omap3-sgx-modules_1.3.13.1607.bb               |    8 +++-----
>  2 files changed, 13 insertions(+), 13 deletions(-)
>  mode change 100644 => 100755 recipes/powervr-drivers/omap3-sgx-modules/proc-interface.patch
> 
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules/proc-interface.patch b/recipes/powervr-drivers/omap3-sgx-modules/proc-interface.patch
> old mode 100644
> new mode 100755
> index 831b3ed..185191f
> --- a/recipes/powervr-drivers/omap3-sgx-modules/proc-interface.patch
> +++ b/recipes/powervr-drivers/omap3-sgx-modules/proc-interface.patch
> @@ -1,20 +1,22 @@
> -Index: omap3-sgx-modules-1.3.13.1607/services4/srvkm/env/linux/proc.c
> -===================================================================
> ---- omap3-sgx-modules-1.3.13.1607.orig/services4/srvkm/env/linux/proc.c
> -+++ omap3-sgx-modules-1.3.13.1607/services4/srvkm/env/linux/proc.c
> -@@ -134,7 +134,6 @@ int CreateProcEntry(const char * name, r
> +--- ./services4/srvkm/env/linux/proc.c.orig	2009-10-09 13:46:40.000000000 -0500
> ++++ ./services4/srvkm/env/linux/proc.c	2009-10-09 13:48:36.000000000 -0500
> +@@ -134,7 +134,9 @@
>   
>       if (file)
>       {
> --        file->owner = THIS_MODULE;
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,31)
> +         file->owner = THIS_MODULE;
> ++#endif
>   		file->read_proc = rhandler;
>   		file->write_proc = whandler;
>   		file->data = data;
> -@@ -165,7 +164,6 @@ int CreateProcReadEntry(const char * nam
> +@@ -165,7 +167,9 @@
>   
>       if (file)
>       {
> --        file->owner = THIS_MODULE;
> ++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,31)
> +         file->owner = THIS_MODULE;
> ++#endif
>   
>           return 0;
>       }
> diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> index ea57fd2..9bd77ad 100644
> --- a/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> +++ b/recipes/powervr-drivers/omap3-sgx-modules_1.3.13.1607.bb
> @@ -7,15 +7,13 @@ SRC_URI = "file://omap3-sgx-modules-${PV}.tar.bz2 \
>             file://0002-Compile-fixes-for-DSS2.patch;patch=1 \
>             file://rotation-dss2.patch;patch=1 \
>             file://build_es3.x_sgx.patch;patch=1 \
> +           file://proc-interface.patch;patch=1 \
>  "
>  
> -SRC_URI_append_omapzoom2 = " file://proc-interface.patch;patch=1"
> -SRC_URI_append_omap3evm = " file://proc-interface.patch;patch=1"
> -SRC_URI_append_omap3517-evm = " file://proc-interface.patch;patch=1"
> -
> -
>  PVRBUILD = "release"
>  
> +INHIBIT_PACKAGE_STRIP = "1"
> +
>  MAKE_TARGETS = " BUILD=${PVRBUILD}"
>  
>  do_install() {
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


