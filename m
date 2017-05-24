Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 7219D77E69
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 07:26:13 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1dDQgI-000658-8c for openembedded-devel@lists.openembedded.org;
	Wed, 24 May 2017 09:26:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 May 2017 09:26:04 +0200
Message-ID: <og3ci6$m5n$1@blaine.gmane.org>
References: <1495567031-12494-1-git-send-email-maryan.pricak@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
In-Reply-To: <1495567031-12494-1-git-send-email-maryan.pricak@gmail.com>
Subject: Re: [meta-oe][PATCH] libteam: Initial support
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
X-List-Received-Date: Wed, 24 May 2017 07:26:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Op 23-05-17 om 21:17 schreef Marian Pritsak:
> libteam is a library for controlling team network device.
> Provides utils package for network device configuration.
> 
> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
> ---
>  meta-oe/recipes-support/libteam/libteam_1.26.bb | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb
> 
> diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.26.bb
> new file mode 100644
> index 0000000..f4a4572
> --- /dev/null
> +++ b/meta-oe/recipes-support/libteam/libteam_1.26.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "Library for controlling team network device"
> +HOMEPAGE = "http://www.libteam.org/"
> +SECTION = "libs/network"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "libnl libdaemon jansson"
> +
> +SRC_URI = "git://github.com/jpirko/libteam"
> +SRCREV = "8c1cea00a21950089058e4e33ea1f7bf4deaddeb"
> +
> +SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
> +SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN} = "${libdir}/libteam.so.*"

${libdir}/libteam${SOLIBS}

> +
> +PACKAGES += "${PN}-dctl ${PN}-utils"
> +FILES_${PN}-dctl = "${libdir}/libteamdctl.so.* \

${libdir}/libteamdctl${SOLIBS}

> +"
> +FILES_${PN}-utils = "${bindir}/bond2team \
> +                     ${bindir}/teamd \
> +                     ${bindir}/teamdctl \
> +                     ${bindir}/teamnl \
> +"
> +
> +RDEPENDS_${PN}-utils = "bash"
> +
> 



