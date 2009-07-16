Received: from [206.46.173.17] (helo=vms173017pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MRaaS-00062M-UE
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jul 2009 01:42:05 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMW0079VEIU0V1A@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	16 Jul 2009 18:28:07 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 73B7E14AF5F; Thu,
	16 Jul 2009 19:28:06 -0400 (EDT)
Date: Thu, 16 Jul 2009 19:28:06 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090716232806.GD32273@denix.org>
References: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] util-linux-ng: Do not provide libblkid.
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
X-List-Received-Date: Thu, 16 Jul 2009 23:42:05 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jul 16, 2009 at 02:31:20PM -0700, Khem Raj wrote:
> 	Currently we let utils-linux-ng provide
> 	libblkid package which then ends up being
> 	provided twice once from e2fsprogs-libs and
> 	once from util-linux-ng. Future versions might
> 	move libblkid and libuuid to utils-linux-ng
> 	till then we will use e2fsprogs-libs provided one
> 	on the system
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

May I co-sign it with you? :) If not, then change it to ack...

Signed-off-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/util-linux-ng/util-linux-ng.inc       |   15 ++-------------
>  recipes/util-linux-ng/util-linux-ng_2.13.1.bb |    1 +
>  recipes/util-linux-ng/util-linux-ng_2.14.bb   |    1 +
>  recipes/util-linux-ng/util-linux-ng_2.15.bb   |    1 +
>  4 files changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
> index 59d2f08..44cd94c 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -1,14 +1,14 @@
>  DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
>  SECTION = "base"
>  LICENSE = "GPL"
> -DEPENDS = "udev zlib ncurses virtual/libintl e2fsprogs-libs"
> +DEPENDS = "udev zlib ncurses virtual/libintl"
>  
>  inherit autotools_stage
>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -INC_PR = "r6"
> +INC_PR = "r7"
>  
>  # allows for a release candidate
>  RC ?= ""
> @@ -16,7 +16,6 @@ RC ?= ""
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v${PV}/util-linux-ng-${PV}${RC}.tar.bz2"
>  
>  PACKAGES =+ "util-linux-ng-fdisk util-linux-ng-cfdisk util-linux-ng-sfdisk util-linux-ng-swaponoff util-linux-ng-losetup util-linux-ng-umount util-linux-ng-mount util-linux-ng-readprofile "
> -PACKAGES_DYNAMIC = "libblkid*"
>  
>  FILES_${PN}-doc += "/usr/share/misc/getopt/getopt-*.*"
>  FILES_${PN} = "${bindir} ${sbindir} ${base_bindir} ${base_sbindir}"
> @@ -139,16 +138,6 @@ do_install () {
>  	ln -sf ${sbindir}/shutdown ${D}${sbindir}/fasthalt
>  }
>  
> -python populate_packages_prepend () {
> -	ulinxng_libdir = bb.data.expand('${libdir}', d)
> -	ulinxng_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
> -	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev', allow_links=True)
> -	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
> -	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends='${PN}-dev')
> -	do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so\.*', 'lib%s', 'util-linux-ng %s library', extra_depends='', allow_links=True)
> -}
> -
> -
>  pkg_postinst_${PN} () {
>  	update-alternatives --install ${base_bindir}/dmesg dmesg dmesg.${PN} 100
>  	update-alternatives --install ${base_bindir}/kill kill kill.${PN} 100
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> index c239b15..73e6023 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.13.1.bb
> @@ -1,4 +1,5 @@
>  require util-linux-ng.inc
> +DEPENDS += "e2fsprogs-libs"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/util-linux-ng/v2.13/util-linux-ng-${PV}${RC}.tar.bz2"
>  #SRC_URI += "file://util-linux_2.12r-12.diff.gz;patch=1"
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.14.bb b/recipes/util-linux-ng/util-linux-ng_2.14.bb
> index d7eafd3..b5972a9 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.14.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.14.bb
> @@ -1,4 +1,5 @@
>  require util-linux-ng.inc
> +DEPENDS += "e2fsprogs-libs"
>  
>  PR = "${INC_PR}"
>  
> diff --git a/recipes/util-linux-ng/util-linux-ng_2.15.bb b/recipes/util-linux-ng/util-linux-ng_2.15.bb
> index 0c2416f..396b41d 100644
> --- a/recipes/util-linux-ng/util-linux-ng_2.15.bb
> +++ b/recipes/util-linux-ng/util-linux-ng_2.15.bb
> @@ -1,4 +1,5 @@
>  require util-linux-ng.inc
> +DEPENDS += "e2fsprogs-libs"
>  
>  PR = "${INC_PR}"
>  
> -- 
> 1.5.4.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


