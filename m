Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1E48F73695
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 10:49:19 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t9QAnJhJ021658; Mon, 26 Oct 2015 05:49:19 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015102605491919-753680 ;
	Mon, 26 Oct 2015 05:49:19 -0500 
Date: Mon, 26 Oct 2015 12:49:14 +0200
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Zhiquan Li <zhiquan.li@windriver.com>
Message-ID: <20151026124914.2854e87e@adi-pc-linux>
In-Reply-To: <1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
References: <1445594855-39110-1-git-send-email-zhiquan.li@windriver.com>
	<1445594855-39110-2-git-send-email-zhiquan.li@windriver.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 10/26/2015 05:49:19 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 10/26/2015 05:49:19 AM,
	Serialize complete at 10/26/2015 05:49:19 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-10-26_09:, , signatures=0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] snort: fix m4 causes out of memory during configure [ LIN8-299 ]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Oct 2015 10:49:20 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2015 18:07:35 +0800
Zhiquan Li <zhiquan.li@windriver.com> wrote:

> Issue: LIN8-299
> 
> There is an incorrect m4_define() in configure.in which will result in an
> infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
> commented out. We follow this solution to fix it.
> 
> Upstream-Status: Backport
> 
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151023
> 
> Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> ---
>  .../snort/snort/m4-oom-during-configure.patch       | 21 +++++++++++++++++++++
>  .../recipes-connectivity/snort/snort_2.9.6.0.bb     | 16 +++-------------
>  2 files changed, 24 insertions(+), 13 deletions(-)
>  create mode 100644 meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> 
> diff --git a/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> new file mode 100644
> index 0000000..2250611
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/snort/snort/m4-oom-during-configure.patch
> @@ -0,0 +1,21 @@
> +Upstream-Status: Backport
> +
> +There is an incorrect m4_define() in configure.in which will result in an
> +infinite recursion, and it doesn't make sense, since snort 2.9.7 it has been
> +commented out. We follow this solution to fix it.
> +

Doesn't it make more sense to upgrade the snort recipe to >2.9.7 than
backporting this fix?

> +Signed-off-by: Zhiquan Li <zhiquan.li@windriver.com>
> +
> +--- a/configure.in	2015-10-22 13:58:50.743367251 +0800
> ++++ b/configure.in	2015-10-22 13:59:13.855366117 +0800
> +@@ -1100,8 +1100,8 @@
> + # Define PKG_CHECK_MODULES if it doesnt already exist. 
> + #file_ This prevents './configure' from erroring on machines that dont have
> + # 'pkgconfig' installed.
> +-m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES], 
> +-     [echo "PKG_CHECK_MODULES not defined"])])
> ++#m4_ifdef([PKG_CHECK_MODULES],[], [m4_define([PKG_CHECK_MODULES],
> ++#     [echo "PKG_CHECK_MODULES not defined"])])
> +
> + if test "x$enable_rzb_saac" = "xyes"; then
> +     AC_CHECK_PROG(PKG_CONFIG,pkg-config,yes)
> diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> index 66653c6..65dc524 100644
> --- a/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> +++ b/meta-networking/recipes-connectivity/snort/snort_2.9.6.0.bb
> @@ -6,19 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
>  
>  DEPENDS = "libpcap libpcre daq libdnet util-linux"
>  
> -# Blacklist:
> -#
> -# http://errors.yoctoproject.org/Errors/Details/8936/
> -#
> -# snort failure is again very nasty, because it's m4 which eats all
> -# available memory and swap before it's killed by OOM killer.
> -# 
> -# Luckily it always picked m4
> -# 
> -# [Wed Feb 18 19:00:51 2015] Out of memory: Kill process 28522 (m4) score 961 or sacrifice child
> -# [Wed Feb 18 19:10:51 2015] Out of memory: Kill process 45228 (m4) score 958 or sacrifice child
> -# ...
> -PNBLACKLIST[snort] ?= "BROKEN: autotools processing causes OOM condition on configure"
>  
>  SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>              file://snort.init \
> @@ -26,6 +13,7 @@ SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
>              file://disable-dap-address-space-id.patch \
>              file://0001-libpcap-search-sysroot-for-headers.patch \
>              file://not-hardcoded-libdir.patch \
> +            file://m4-oom-during-configure.patch \
>  "
>  
>  SRC_URI[tarball.md5sum] = "18111f6de3989ca89add36077a7c2659"
> @@ -45,6 +33,8 @@ EXTRA_OECONF = " \
>  	--disable-static-daq \
>  	--with-dnet-includes=${STAGING_INCDIR} \
>  	--with-dnet-libraries=${STAGING_LIBDIR} \
> +	--with-libpcre-includes=${STAGING_INCDIR} \
> +	--with-libpcre-libraries=${STAGING_INCDIR} \
>  	"
>  
>  # if you want to disable it, you need to patch configure.in first


