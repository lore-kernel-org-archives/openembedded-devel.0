Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MbqXC-0004jv-Gu
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 08:45:09 +0200
Received: from gandalf.denix.org ([71.255.235.240]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KOC003DYSN0KCI3@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	14 Aug 2009 01:28:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7A1B214AF5F; Fri,
	14 Aug 2009 02:28:12 -0400 (EDT)
Date: Fri, 14 Aug 2009 02:28:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090814062812.GF22344@denix.org>
References: <1250186755-16090-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1250186755-16090-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] libtool: Remove FILESDIR, use INC_PR and	FILESPATHPKG
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
X-List-Received-Date: Fri, 14 Aug 2009 06:45:11 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Aug 13, 2009 at 11:05:55AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/libtool/libtool-cross_1.5.10.bb  |    3 +--
>  recipes/libtool/libtool-cross_1.5.22.bb  |    3 +--
>  recipes/libtool/libtool-cross_1.5.24.bb  |    3 +--
>  recipes/libtool/libtool-cross_2.2.4.bb   |    2 +-
>  recipes/libtool/libtool-cross_2.2.6a.bb  |    2 +-
>  recipes/libtool/libtool-native_1.5.10.bb |    3 +--
>  recipes/libtool/libtool-native_1.5.22.bb |    3 +--
>  recipes/libtool/libtool-native_1.5.24.bb |    3 +--
>  recipes/libtool/libtool-native_2.2.4.bb  |    2 +-
>  recipes/libtool/libtool-native_2.2.6a.bb |    2 +-
>  recipes/libtool/libtool-sdk_1.5.10.bb    |    3 +--
>  recipes/libtool/libtool-sdk_2.2.4.bb     |    4 ++--
>  recipes/libtool/libtool-sdk_2.2.6a.bb    |    2 +-
>  recipes/libtool/libtool.inc              |    4 +++-
>  recipes/libtool/libtool_1.5.10.bb        |    2 +-
>  recipes/libtool/libtool_1.5.22.bb        |    2 +-
>  recipes/libtool/libtool_1.5.24.bb        |    2 +-
>  recipes/libtool/libtool_1.5.6.bb         |    2 +-
>  recipes/libtool/libtool_2.2.4.bb         |    2 +-
>  recipes/libtool/libtool_2.2.6a.bb        |    2 +-
>  20 files changed, 23 insertions(+), 28 deletions(-)
> 
> diff --git a/recipes/libtool/libtool-cross_1.5.10.bb b/recipes/libtool/libtool-cross_1.5.10.bb
> index 7374f10..256e71c 100644
> --- a/recipes/libtool/libtool-cross_1.5.10.bb
> +++ b/recipes/libtool/libtool-cross_1.5.10.bb
> @@ -1,9 +1,8 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r10"
> +PR = "${INC_PR}.0"
>  PACKAGES = ""
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://rpath-control.patch;patch=1 \
>                     file://libdir-la.patch;patch=1 \
>                     file://libdir-la2.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-cross_1.5.22.bb b/recipes/libtool/libtool-cross_1.5.22.bb
> index c44b051..9490311 100644
> --- a/recipes/libtool/libtool-cross_1.5.22.bb
> +++ b/recipes/libtool/libtool-cross_1.5.22.bb
> @@ -3,9 +3,8 @@ DEFAULT_PREFERENCE = "-1"
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  PACKAGES = ""
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
>                     file://tag.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-cross_1.5.24.bb b/recipes/libtool/libtool-cross_1.5.24.bb
> index cf6cc18..2a7e4d7 100644
> --- a/recipes/libtool/libtool-cross_1.5.24.bb
> +++ b/recipes/libtool/libtool-cross_1.5.24.bb
> @@ -1,9 +1,8 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  PACKAGES = ""
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
>                     file://tag.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-cross_2.2.4.bb b/recipes/libtool/libtool-cross_2.2.4.bb
> index dd8b598..e2c6bbe 100644
> --- a/recipes/libtool/libtool-cross_2.2.4.bb
> +++ b/recipes/libtool/libtool-cross_2.2.4.bb
> @@ -1,6 +1,6 @@
>  require libtool.inc
>  require libtool_${PV}.bb
> -PR = "r24"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "\
>    file://cross_compile.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-cross_2.2.6a.bb b/recipes/libtool/libtool-cross_2.2.6a.bb
> index 1b2defb..b26e7cc 100644
> --- a/recipes/libtool/libtool-cross_2.2.6a.bb
> +++ b/recipes/libtool/libtool-cross_2.2.6a.bb
> @@ -1,6 +1,6 @@
>  require libtool.inc
>  require libtool_${PV}.bb
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "\
>    file://cross_compile.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-native_1.5.10.bb b/recipes/libtool/libtool-native_1.5.10.bb
> index 59b323d..362aea2 100644
> --- a/recipes/libtool/libtool-native_1.5.10.bb
> +++ b/recipes/libtool/libtool-native_1.5.10.bb
> @@ -1,8 +1,7 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r10"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +PR = "${INC_PR}.0"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://libdir-la2.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-native_1.5.22.bb b/recipes/libtool/libtool-native_1.5.22.bb
> index 16db0bb..4d660f4 100644
> --- a/recipes/libtool/libtool-native_1.5.22.bb
> +++ b/recipes/libtool/libtool-native_1.5.22.bb
> @@ -3,8 +3,7 @@ DEFAULT_PREFERENCE = "-1"
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r0"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +PR = "${INC_PR}.0"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
>                     file://tag.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-native_1.5.24.bb b/recipes/libtool/libtool-native_1.5.24.bb
> index 1b0cb90..9536881 100644
> --- a/recipes/libtool/libtool-native_1.5.24.bb
> +++ b/recipes/libtool/libtool-native_1.5.24.bb
> @@ -3,8 +3,7 @@ SECTION = "devel"
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r0"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +PR = "${INC_PR}.0"
>  SRC_URI_append = " file://libdir-la.patch;patch=1 \
>                     file://prefix.patch;patch=1 \
>                     file://tag.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-native_2.2.4.bb b/recipes/libtool/libtool-native_2.2.4.bb
> index bfef6a6..06564c7 100644
> --- a/recipes/libtool/libtool-native_2.2.4.bb
> +++ b/recipes/libtool/libtool-native_2.2.4.bb
> @@ -1,6 +1,6 @@
>  require libtool.inc
>  require libtool_${PV}.bb
> -PR = "r20"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "\
>    file://cross_compile.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-native_2.2.6a.bb b/recipes/libtool/libtool-native_2.2.6a.bb
> index c5a4a99..e699a2f 100644
> --- a/recipes/libtool/libtool-native_2.2.6a.bb
> +++ b/recipes/libtool/libtool-native_2.2.6a.bb
> @@ -1,6 +1,6 @@
>  require libtool.inc
>  require libtool_${PV}.bb
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "\
>    file://cross_compile.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-sdk_1.5.10.bb b/recipes/libtool/libtool-sdk_1.5.10.bb
> index e068b53..21e408d 100644
> --- a/recipes/libtool/libtool-sdk_1.5.10.bb
> +++ b/recipes/libtool/libtool-sdk_1.5.10.bb
> @@ -1,8 +1,7 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r0"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +PR = "${INC_PR}.0"
>  SRC_URI_append = " file://rpath-control.patch;patch=1 \
>                     file://libdir-la.patch;patch=1 \
>                     file://libdir-la2.patch;patch=1 \
> diff --git a/recipes/libtool/libtool-sdk_2.2.4.bb b/recipes/libtool/libtool-sdk_2.2.4.bb
> index f2c3c62..0e9ae9b 100644
> --- a/recipes/libtool/libtool-sdk_2.2.4.bb
> +++ b/recipes/libtool/libtool-sdk_2.2.4.bb
> @@ -1,8 +1,8 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r2"
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +PR = "${INC_PR}.0"
> +
>  SRC_URI_append = " file://cross_compile.patch;patch=1"
>  
>  S = "${WORKDIR}/libtool-${PV}"
> diff --git a/recipes/libtool/libtool-sdk_2.2.6a.bb b/recipes/libtool/libtool-sdk_2.2.6a.bb
> index 88ec4df..263879b 100644
> --- a/recipes/libtool/libtool-sdk_2.2.6a.bb
> +++ b/recipes/libtool/libtool-sdk_2.2.6a.bb
> @@ -1,7 +1,7 @@
>  require libtool.inc
>  require libtool_${PV}.bb
>  
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  SRC_URI_append = " file://cross_compile.patch;patch=1"
>  
>  inherit sdk
> diff --git a/recipes/libtool/libtool.inc b/recipes/libtool/libtool.inc
> index 1976129..9cc7401 100644
> --- a/recipes/libtool/libtool.inc
> +++ b/recipes/libtool/libtool.inc
> @@ -6,4 +6,6 @@ HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
>  LICENSE = "GPL"
>  SECTION = "devel"
>  
> -FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libtool-${PV}"
> +INC_PR = "r24"
> +
> +FILESPATHPKG=. "libtool-${PV}:"
> diff --git a/recipes/libtool/libtool_1.5.10.bb b/recipes/libtool/libtool_1.5.10.bb
> index 428a06a..8fd2cdf 100644
> --- a/recipes/libtool/libtool_1.5.10.bb
> +++ b/recipes/libtool/libtool_1.5.10.bb
> @@ -1,5 +1,5 @@
>  require libtool.inc
> -PR = "r5"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://autotools.patch;patch=1 \
> diff --git a/recipes/libtool/libtool_1.5.22.bb b/recipes/libtool/libtool_1.5.22.bb
> index 4bed784..88116f0 100644
> --- a/recipes/libtool/libtool_1.5.22.bb
> +++ b/recipes/libtool/libtool_1.5.22.bb
> @@ -1,7 +1,7 @@
>  DEFAULT_PREFERENCE = "-1"
>  
>  require libtool.inc
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://autotools.patch;patch=1 \
> diff --git a/recipes/libtool/libtool_1.5.24.bb b/recipes/libtool/libtool_1.5.24.bb
> index 7bdad1b..2ab7358 100644
> --- a/recipes/libtool/libtool_1.5.24.bb
> +++ b/recipes/libtool/libtool_1.5.24.bb
> @@ -1,7 +1,7 @@
>  DEFAULT_PREFERENCE = "-1"
>  
>  require libtool.inc
> -PR = "r1"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>             file://autotools.patch;patch=1 \
> diff --git a/recipes/libtool/libtool_1.5.6.bb b/recipes/libtool/libtool_1.5.6.bb
> index 7fd9b81..6827ea9 100644
> --- a/recipes/libtool/libtool_1.5.6.bb
> +++ b/recipes/libtool/libtool_1.5.6.bb
> @@ -1,7 +1,7 @@
>  # Exists for compatibility with certain distributions (e.g. Maemo).
>  
>  require libtool.inc
> -PR = "r2"
> +PR = "${INC_PR}.0"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> diff --git a/recipes/libtool/libtool_2.2.4.bb b/recipes/libtool/libtool_2.2.4.bb
> index 8e6682f..6de7336 100644
> --- a/recipes/libtool/libtool_2.2.4.bb
> +++ b/recipes/libtool/libtool_2.2.4.bb
> @@ -1,5 +1,5 @@
>  require libtool.inc
> -PR = "r17"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz"
>  S = "${WORKDIR}/libtool-${PV}"
> diff --git a/recipes/libtool/libtool_2.2.6a.bb b/recipes/libtool/libtool_2.2.6a.bb
> index e2996c7..c69a937 100644
> --- a/recipes/libtool/libtool_2.2.6a.bb
> +++ b/recipes/libtool/libtool_2.2.6a.bb
> @@ -1,5 +1,5 @@
>  require libtool.inc
> -PR = "r2"
> +PR = "${INC_PR}.0"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> -- 
> 1.5.4.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


