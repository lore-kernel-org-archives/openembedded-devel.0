Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UHe2r-0003bD-8t
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Mar 2013 18:40:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2013 10:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,865,1355126400"; d="scan'208";a="308284212"
Received: from unknown (HELO helios.localnet) ([10.255.13.178])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2013 10:23:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Song.Li@windriver.com
Date: Mon, 18 Mar 2013 17:23:33 +0000
Message-ID: <2450571.LuEge4Cxcy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-25-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1362817572-14365-1-git-send-email-Song.Li@windriver.com>
References: <1362817572-14365-1-git-send-email-Song.Li@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-devel@lists.openembedded.org,
	Pradeep.Tumati@windriver.com
Subject: Re: [meta-webserver][PATCH] apache2:fix PN to BPN to avoid do_package warning
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
X-List-Received-Date: Mon, 18 Mar 2013 17:40:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 09 March 2013 16:26:12 Song.Li@windriver.com wrote:
> From: Song.Li <Song.Li@windriver.com>
> 
> Some files weren't shipped in package when do
> a multilib build.This is caused by PN various.
> change them to BPN.
> 
> Signed-off-by: Song.Li <Song.Li@windriver.com>
> ---
>  recipes-httpd/apache2/apache2_2.4.2.bb |   27 +++++++++++++--------------
>  1 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/recipes-httpd/apache2/apache2_2.4.2.bb
> b/recipes-httpd/apache2/apache2_2.4.2.bb index af8c4ca..af285d6 100644
> --- a/recipes-httpd/apache2/apache2_2.4.2.bb
> +++ b/recipes-httpd/apache2/apache2_2.4.2.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://httpd.apache.org/"
>  DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
>  SECTION = "net"
>  LICENSE = "Apache-2.0"
> -PR = "r3"
> +PR = "r4"
> 
>  SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
>             file://server-makefile.patch \
> @@ -105,40 +105,39 @@ LEAD_SONAME = "libapr-1.so.0"
> 
>  PACKAGES = "${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
> 
> -CONFFILES_${PN} = "${sysconfdir}/${PN}/httpd.conf \
> -		   ${sysconfdir}/${PN}/magic \
> -		   ${sysconfdir}/${PN}/mime.types \
> -		   ${sysconfdir}/init.d/${PN} "
> +CONFFILES_${PN} = "${sysconfdir}/${BPN}/httpd.conf \
> +		   ${sysconfdir}/${BPN}/magic \
> +		   ${sysconfdir}/${BPN}/mime.types \
> +		   ${sysconfdir}/init.d/${BPN} "
> 
>  # we override here rather than append so that .so links are
>  # included in the runtime package rather than here (-dev)
>  # and to get build, icons, error into the -dev package
> -FILES_${PN}-dev = "${datadir}/${PN}/build \
> -		${datadir}/${PN}/icons \
> -		${datadir}/${PN}/error \
> +FILES_${PN}-dev = "${datadir}/${BPN}/build \
> +		${datadir}/${BPN}/icons \
> +		${datadir}/${BPN}/error \
>  		${bindir}/apr-config ${bindir}/apu-config \
>  		${libdir}/apr*.exp \
> -		${includedir}/${PN} \
> +		${includedir}/${BPN} \
>  		${libdir}/*.la \
>  		${libdir}/*.a"
> 
>  # manual to manual
> -FILES_${PN}-doc += " ${datadir}/${PN}/manual"
> +FILES_${PN}-doc += " ${datadir}/${BPN}/manual"
> 
>  #
>  # override this too - here is the default, less datadir
>  #
>  FILES_${PN} =  "${bindir} ${sbindir} ${libexecdir} ${libdir}/lib*.so.*
> ${sysconfdir} \ ${sharedstatedir} ${localstatedir} /bin /sbin /lib/*.so* \
> -		${libdir}/${PN}"
> +		${libdir}/${BPN}"
> 
>  # we want htdocs and cgi-bin to go with the binary
> -FILES_${PN} += "${datadir}/${PN}/htdocs ${datadir}/${PN}/cgi-bin"
> +FILES_${PN} += "${datadir}/${BPN}/htdocs ${datadir}/${BPN}/cgi-bin"
> 
>  #make sure the lone .so links also get wrapped in the base package
>  FILES_${PN} += "${libdir}/lib*.so ${libdir}/pkgconfig/*"
> 
> -FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
> +FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
> 
>  RDEPENDS_${PN} += "openssl libgcc"
> -

I'm afraid this is still not correct - there are still references to PN that 
should be changed to BPN in EXTRA_OECONF and do_install_append.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


