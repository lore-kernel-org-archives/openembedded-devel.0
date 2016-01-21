Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 723CE6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 11:55:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 21 Jan 2016 03:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,325,1449561600"; d="scan'208";a="895311075"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2016 03:55:37 -0800
Date: Thu, 21 Jan 2016 13:58:09 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160121115809.GA6652@mbabyjoh-mobl.fi.intel.com>
References: <1448874823-23989-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1448874823-23989-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] libjpeg-turbo: remove recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 11:55:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

gentle ping.
(libjpeg-turbo was moved to oe-core on 2016-01-07)

On Mon, Nov 30, 2015 at 11:13:43AM +0200, Maxin B. John wrote:
> Remove libjpeg-turbo package from meta-oe as it will be moved to oe-core
> to replace libjpeg package.
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb    | 40 ----------------------
>  1 file changed, 40 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> 
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> deleted file mode 100644
> index e79f800..0000000
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and decompression"
> -HOMEPAGE = "http://libjpeg-turbo.org/"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
> -                    file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
> -                    file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
> -"
> -
> -DEPENDS = "nasm-native"
> -
> -BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> -SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
> -SRC_URI[sha256sum] = "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
> -
> -S = "${WORKDIR}/${BPN}-${BASEPV}"
> -
> -# Drop-in replacement for jpeg
> -PROVIDES = "jpeg"
> -RPROVIDES_${PN} += "jpeg"
> -RREPLACES_${PN} += "jpeg"
> -RCONFLICTS_${PN} += "jpeg"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF = "--with-jpeg8 "
> -
> -PACKAGES =+ "jpeg-tools libturbojpeg"
> -
> -DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
> -FILES_jpeg-tools = "${bindir}/*"
> -
> -FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
> -INSANE_SKIP_libturbojpeg = "dev-so"
> -
> -BBCLASSEXTEND = "native"
> -
> -LEAD_SONAME = "libjpeg.so.8"
> -- 
> 2.4.0
>
Best Regards,
Maxin

