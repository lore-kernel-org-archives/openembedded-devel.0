Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TyoBI-0003o2-9T
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 19:39:30 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jan 2013 10:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,540,1355126400"; d="scan'208";a="276689544"
Received: from unknown (HELO helios.localnet) ([10.252.123.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2013 10:23:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 18:23:35 +0000
Message-ID: <1401930.q6lfBquIS0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.4 (Linux/3.5.0-22-generic; KDE/4.9.4; i686; ; )
In-Reply-To: <1359108650-32596-1-git-send-email-zhenhua.luo@freescale.com>
References: <1359108650-32596-1-git-send-email-zhenhua.luo@freescale.com>
MIME-Version: 1.0
Cc: B29882@freescale.com, b28405@freescale.com,
	Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: Re: [meta-oe/meta-webserver] apache2: fix the race issue of parallel installation
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
X-List-Received-Date: Fri, 25 Jan 2013 18:39:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 25 January 2013 18:10:50 Zhenhua Luo wrote:
> fix following race issue when do parallel install
> 
> | mkdir: cannot create directory
> | `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_n
> | etworking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
> ...
> 
> | mkdir: cannot create directory
> | `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_n
> | etworking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
> | make[1]: *** [install-man] Error 1
> | make[1]: *** Waiting for unfinished jobs....
> 
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  .../recipes-httpd/apache2/apache2_2.4.3.bb         |    3 ++-
>  ...httpd-2.4.3-fix-race-issue-of-dir-install.patch |   21
> ++++++++++++++++++++ 2 files changed, 23 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-di
> r-install.patch
> 
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
> b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb index
> 9179bca..a221e1d 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://httpd.apache.org/"
>  DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
> -PR = "r0"
> +PR = "r1"
> 
>  SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://server-makefile.patch \
> @@ -16,6 +16,7 @@ SRC_URI =
> "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
> file://apache-configure_perlbin.patch \
>             file://replace-lynx-to-curl-in-apachectl-script.patch \
>             file://apache-ssl-ltmain-rpath.patch \
> +           file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
>             file://init"
> 
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
> diff --git
> a/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-
> dir-install.patch
> b/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-
> dir-install.patch new file mode 100644
> index 0000000..b948753
> --- /dev/null
> +++
> b/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-
> dir-install.patch @@ -0,0 +1,21 @@
> +Upstream-Status: Pending
> +
> +fix following race issue when do parallel install
> +| mkdir: cannot create directory
> `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_net
> working-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists +...
> +| mkdir: cannot create directory
> `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_net
> working-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists +|
> make[1]: *** [install-man] Error 1
> +| make[1]: *** Waiting for unfinished jobs....
> +
> +-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> +--- httpd-2.4.3/build/mkdir.sh.orig	2013-01-25 03:47:21.565255420 -0600
> ++++ httpd-2.4.3/build/mkdir.sh	2013-01-25 03:46:17.833051230 -0600
> +@@ -39,7 +39,7 @@
> +         esac
> +         if test ! -d "$pathcomp"; then
> +             echo "mkdir $pathcomp" 1>&2
> +-            mkdir "$pathcomp" || errstatus=$?
> ++            mkdir -p "$pathcomp" || errstatus=$?
> +         fi
> +         pathcomp="$pathcomp/"
> +     done

Merged, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


