Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5F3-0003gI-0v
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:13:13 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400IB5A5GHZ01@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:00:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5EE0914AF5F; Wed,
	01 Jul 2009 15:00:49 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:00:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701190049.GA20815@denix.org>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
	<1246474461-16671-3-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474461-16671-3-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 008/125] glibc: In various old recipes add	RPROVIDES virtual-libc-dev, bump PR. In some cases we also add in	'libc-dev' if nothing was being provided and add RDEPENDS +=	linux-libc-headers-dev if that was missing.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:13:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

This is the longest subject/short-description I've ever seen! :)

 Subject: Re: [oe] [STABLE][PATCH 008/125] glibc: In various old recipes add
	RPROVIDES virtual-libc-dev, bump PR. In some cases we also add in
	'libc-dev' if nothing was being provided and add RDEPENDS +=
	linux-libc-headers-dev if that was missing.

On Wed, Jul 01, 2009 at 08:54:09PM +0200, Marcin Juszkiewicz wrote:
> From: Tom Rini <trini@embeddedalley.com>
> 
> Acked-by: Leon Woestenberg <leon@sidebranch.com>
> Acked-by: Mike Westerhof <mwester@dls.net>
> Signed-off-by: Tom Rini <trini@embeddedalley.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/glibc/glibc_2.2.5.bb             |    5 +++--
>  recipes/glibc/glibc_2.3.2+cvs20040726.bb |    5 ++++-
>  recipes/glibc/glibc_2.3.2.bb             |    5 +++--
>  recipes/glibc/glibc_2.3.3+cvs20041128.bb |    5 ++++-
>  recipes/glibc/glibc_2.3.3+cvs20050221.bb |    5 ++++-
>  recipes/glibc/glibc_2.3.3+cvs20050420.bb |    5 ++++-
>  recipes/glibc/glibc_2.3.3.bb             |    5 +++--
>  recipes/glibc/glibc_2.3.5+cvs20050627.bb |    6 +++++-
>  recipes/glibc/glibc_2.3.6.bb             |    5 ++++-
>  recipes/glibc/glibc_2.4.bb               |    3 ++-
>  recipes/glibc/glibc_cvs.bb               |    3 ++-
>  11 files changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/recipes/glibc/glibc_2.2.5.bb b/recipes/glibc/glibc_2.2.5.bb
> index 7cb6681..5b3fbb4 100644
> --- a/recipes/glibc/glibc_2.2.5.bb
> +++ b/recipes/glibc/glibc_2.2.5.bb
> @@ -1,7 +1,7 @@
>  require glibc.inc
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
> -PR = "r20"
> +PR = "r21"
>  
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
> @@ -41,7 +41,8 @@ DEPENDS_catchsegv = "libsegfault"
>  FILES_glibc-pcprofile = "/lib/libpcprofile.so"
>  FILES_glibc-thread-db = "/lib/libthread_db*"
>  FILES_localedef = "${bindir}/localedef"
> -RPROVIDES_glibc-dev += "libc-dev"
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  #	   file://noinfo.patch;patch=1 \
>  #	   file://ldconfig.patch;patch=1;pnum=0 \
> diff --git a/recipes/glibc/glibc_2.3.2+cvs20040726.bb b/recipes/glibc/glibc_2.3.2+cvs20040726.bb
> index f0521d4..754c85f 100644
> --- a/recipes/glibc/glibc_2.3.2+cvs20040726.bb
> +++ b/recipes/glibc/glibc_2.3.2+cvs20040726.bb
> @@ -3,7 +3,7 @@ require glibc.inc
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
> -PR = "r30"
> +PR = "r31"
>  
>  GLIBC_ADDONS ?= "linuxthreads"
>  
> @@ -31,6 +31,9 @@ SRC_URI_append_openmn = " file://ldsocache-varrun.patch;patch=1"
>  S = "${WORKDIR}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.3.2.bb b/recipes/glibc/glibc_2.3.2.bb
> index 891d9da..2d2663f 100644
> --- a/recipes/glibc/glibc_2.3.2.bb
> +++ b/recipes/glibc/glibc_2.3.2.bb
> @@ -1,6 +1,6 @@
>  require glibc.inc
>  
> -PR = "r19"
> +PR = "r20"
>  
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
> @@ -38,7 +38,8 @@ DEPENDS_catchsegv = "libsegfault"
>  FILES_glibc-pcprofile = "/lib/libpcprofile.so"
>  FILES_glibc-thread-db = "/lib/libthread_db*"
>  FILES_localedef = "${bindir}/localedef"
> -RPROVIDES_glibc-dev += "libc-dev"
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  SRC_URI = "ftp://ftp.gnu.org/gnu/glibc/glibc-${PV}.tar.gz \
>  	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-linuxthreads-2.3.2.tar.gz \
> diff --git a/recipes/glibc/glibc_2.3.3+cvs20041128.bb b/recipes/glibc/glibc_2.3.3+cvs20041128.bb
> index 560347d..02be256 100644
> --- a/recipes/glibc/glibc_2.3.3+cvs20041128.bb
> +++ b/recipes/glibc/glibc_2.3.3+cvs20041128.bb
> @@ -3,7 +3,7 @@ require glibc.inc
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
> -PR = "r15"
> +PR = "r16"
>  
>  GLIBC_ADDONS ?= "linuxthreads"
>  
> @@ -50,6 +50,9 @@ SRC_URI_append_openmn = " file://ldsocache-varrun.patch;patch=1"
>  S = "${WORKDIR}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.3.3+cvs20050221.bb b/recipes/glibc/glibc_2.3.3+cvs20050221.bb
> index e0becb8..4eff27f 100644
> --- a/recipes/glibc/glibc_2.3.3+cvs20050221.bb
> +++ b/recipes/glibc/glibc_2.3.3+cvs20050221.bb
> @@ -3,7 +3,7 @@ require glibc.inc
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
> -PR = "r15"
> +PR = "r16"
>  
>  GLIBC_ADDONS ?= "linuxthreads"
>  
> @@ -35,6 +35,9 @@ SRC_URI_append_openmn = " file://ldsocache-varrun.patch;patch=1"
>  S = "${WORKDIR}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.3.3+cvs20050420.bb b/recipes/glibc/glibc_2.3.3+cvs20050420.bb
> index 1ae3518..65654dc 100644
> --- a/recipes/glibc/glibc_2.3.3+cvs20050420.bb
> +++ b/recipes/glibc/glibc_2.3.3+cvs20050420.bb
> @@ -5,7 +5,7 @@ DEFAULT_PREFERENCE_i586 = "0"
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs"
> -PR = "r13"
> +PR = "r14"
>  
>  GLIBC_ADDONS ?= "linuxthreads"
>  
> @@ -36,6 +36,9 @@ SRC_URI_append_openmn = " file://ldsocache-varrun.patch;patch=1"
>  S = "${WORKDIR}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.3.3.bb b/recipes/glibc/glibc_2.3.3.bb
> index 03711f7..05a8581 100644
> --- a/recipes/glibc/glibc_2.3.3.bb
> +++ b/recipes/glibc/glibc_2.3.3.bb
> @@ -1,6 +1,6 @@
>  require glibc.inc
>  
> -PR = "r16"
> +PR = "r17"
>  
>  DEFAULT_PREFERENCE_sh3 = "-99"
>  
> @@ -41,7 +41,8 @@ DEPENDS_catchsegv = "libsegfault"
>  FILES_glibc-pcprofile = "/lib/libpcprofile.so"
>  FILES_glibc-thread-db = "/lib/libthread_db*"
>  FILES_localedef = "${bindir}/localedef"
> -RPROVIDES_glibc-dev += "libc-dev"
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  SRC_URI = "ftp://ftp.gnu.org/gnu/glibc/glibc-${PV}.tar.gz \
>  	   ftp://ftp.gnu.org/pub/gnu/glibc/glibc-linuxthreads-${PV}.tar.gz \
> diff --git a/recipes/glibc/glibc_2.3.5+cvs20050627.bb b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
> index c9d0b66..5fa4010 100644
> --- a/recipes/glibc/glibc_2.3.5+cvs20050627.bb
> +++ b/recipes/glibc/glibc_2.3.5+cvs20050627.bb
> @@ -2,7 +2,7 @@ require glibc.inc
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs-2.3.5"
>  SRCDATE = "20050627"
> -PR = "r22"
> +PR = "r23"
>  
>  #Doesnt build for sh3
>  DEFAULT_PREFERENCE_sh3="-1"
> @@ -28,6 +28,7 @@ python __anonymous () {
>  }
>  
>  RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  #	   file://noinfo.patch;patch=1
>  #	   file://ldconfig.patch;patch=1;pnum=0
> @@ -66,6 +67,9 @@ SRC_URI_append_sh4 = " file://no-z-defs.patch;patch=1 \
>  S = "${WORKDIR}/libc"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.3.6.bb b/recipes/glibc/glibc_2.3.6.bb
> index 8442a15..ab167da 100644
> --- a/recipes/glibc/glibc_2.3.6.bb
> +++ b/recipes/glibc/glibc_2.3.6.bb
> @@ -1,6 +1,6 @@
>  require glibc.inc
>  
> -PR = "r4"
> +PR = "r5"
>  
>  #FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/glibc-2.3.6', '${FILE_DIRNAME}/orig/glibc', '${FILE_DIRNAME}/orig/files', '${FILE_DIRNAME}/orig' ], d)}"
>  
> @@ -35,6 +35,9 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
>  S = "${WORKDIR}/glibc-${PV}"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  
> +RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
> +
>  EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>  	        --without-cvs --disable-profile --disable-debug --without-gd \
>  		--enable-clocale=gnu \
> diff --git a/recipes/glibc/glibc_2.4.bb b/recipes/glibc/glibc_2.4.bb
> index 8ee1000..54fe487 100644
> --- a/recipes/glibc/glibc_2.4.bb
> +++ b/recipes/glibc/glibc_2.4.bb
> @@ -1,6 +1,6 @@
>  require glibc.inc
>  
> -PR = "r20"
> +PR = "r21"
>  
>  #add the hosts that are confirmed to be working to COMPATIBLE_HOSTi
>  COMPATIBLE_HOST = '(i.86.*-linux|sh.*-linux)'
> @@ -34,6 +34,7 @@ python __anonymous () {
>  }
>  
>  RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  #	   file://noinfo.patch;patch=1
>  #	   file://ldconfig.patch;patch=1;pnum=0
> diff --git a/recipes/glibc/glibc_cvs.bb b/recipes/glibc/glibc_cvs.bb
> index 186c7d6..26d29f0 100644
> --- a/recipes/glibc/glibc_cvs.bb
> +++ b/recipes/glibc/glibc_cvs.bb
> @@ -1,7 +1,7 @@
>  require glibc.inc
>  
>  FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/glibc-cvs-2.3.5"
> -PR = "r11"
> +PR = "r12"
>  PV = "2.3.5+cvs${SRCDATE}"
>  
>  GLIBC_ADDONS ?= "ports,linuxthreads"
> @@ -25,6 +25,7 @@ python __anonymous () {
>  }
>  
>  RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
> +RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>  
>  #	   file://noinfo.patch;patch=1
>  #	   file://ldconfig.patch;patch=1;pnum=0
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


