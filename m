Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0426F4CD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Apr 2014 22:48:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3M006WUSNGR7L0@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	06 Apr 2014 17:47:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 32CB820357; Sun,
	06 Apr 2014 18:47:40 -0400 (EDT)
Date: Sun, 06 Apr 2014 18:47:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140406224739.GE3370@denix.org>
References: <1396327671-22282-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1396327671-22282-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-oe][PATCH] linuxptp: fix and simplify recipe, drop dependency on kernel
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
X-List-Received-Date: Sun, 06 Apr 2014 22:48:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

ping

On Tue, Apr 01, 2014 at 12:47:51AM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * Build script tries to locate the correct /usr/include/linux/net_tstamp.h just
> to see if it contains definition for HWTSTAMP_TX_ONESTEP_SYNC. But that header
> file hasn't changed in at least 5 years. The result of the check is to pass
> additional defines to the build, which can be passed via EXTRA_OEMAKE.
> 
> * The sed command on makefile wasn't even working, plus there's no AR, prefix
> is not used and better way is to use EXTRA_CFLAGS and EXTRA_LDFLAGS anyway.
> 
> * Neither autotools nor pkgconfig are use during the build, don't inherit them.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> index c708b13..10d6744 100644
> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
> @@ -2,20 +2,13 @@ DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -DEPENDS = "virtual/kernel"
> -
>  SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz"
>  
>  SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
>  SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
>  
> -inherit autotools pkgconfig
> -
> -EXTRA_OEMAKE = 'KBUILD_OUTPUT="${STAGING_KERNEL_DIR}" CROSS_COMPILE="${TARGET_PREFIX}"'
> -
> -do_configure_append () {
> -    find ${S} -name makefile | xargs sed -i 's,^\(CC\|CFLAGS\|prefix\|AR\)=,\1 ?=,g'
> -}
> +EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
> +		EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_ONESTEP_SYNC'"
>  
>  do_install () {
>      install -d ${D}/${bindir}
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

