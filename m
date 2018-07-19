Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id B4A897198F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:59:17 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id AEC0115B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:59:17 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <20180719094903.2071-1-dv@pseudoterminal.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <39407a94-39c9-a5d7-f2c0-b35037fc2707@pseudoterminal.org>
Date: Thu, 19 Jul 2018 11:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180719094903.2071-1-dv@pseudoterminal.org>
Subject: Re: [meta-oe][PATCH] libnice: Upgrade to 0.1.14
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
X-List-Received-Date: Thu, 19 Jul 2018 09:59:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Sorry, forgot to label this v2. Slight change to the commit message - 
GStreamer 1.14 instead of 1.14.0, since WebRTC is an introduction to 
1.14.x overall.


On 2018-07-19 11:49, Carlos Rafael Giani wrote:
> This is the minimum version needed by the new GStreamer 1.14 WebRTC
> support (not to be confused with the WebRTC DSP support).
>
> New packageconfigs were added to make the GStreamer 0.10 and 1.0
> support configurable.
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>   .../{libnice_0.1.13.bb => libnice_0.1.14.bb}   | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
>   rename meta-oe/recipes-support/farsight/{libnice_0.1.13.bb => libnice_0.1.14.bb} (55%)
>
> diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.13.bb b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
> similarity index 55%
> rename from meta-oe/recipes-support/farsight/libnice_0.1.13.bb
> rename to meta-oe/recipes-support/farsight/libnice_0.1.14.bb
> index 48c8221a3..775257f93 100644
> --- a/meta-oe/recipes-support/farsight/libnice_0.1.13.bb
> +++ b/meta-oe/recipes-support/farsight/libnice_0.1.14.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Interactive Connectivity Establishment library"
>   DESCRIPTION = "Libnice is an implementation of the IETF's draft Interactive Connectivity Establishment standard (ICE)."
>   HOMEPAGE = "http://nice.freedesktop.org/wiki/"
>   SRC_URI = "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
> -SRC_URI[md5sum] = "3226faeaf48a9150ada00da2e2865959"
> -SRC_URI[sha256sum] = "61112d9f3be933a827c8365f20551563953af6718057928f51f487bfe88419e1"
> +SRC_URI[md5sum] = "c9b9b74b8ae1b3890e4bd93f1b70e8ff"
> +SRC_URI[sha256sum] = "be120ba95d4490436f0da077ffa8f767bf727b82decf2bf499e39becc027809c"
>   
>   LICENSE = "LGPLv2.1 & MPLv1.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
> @@ -11,17 +11,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c42325015702feda4f4d2f19a55b767 \
>                       file://COPYING.MPL;md5=3c617710e51cdbe0fc00716f056dfb1a \
>   "
>   
> -DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +DEPENDS = "glib-2.0 gnutls"
>   
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "gstreamer1.0"
>   PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
> +PACKAGECONFIG[gstreamer0.10] = "--with-gstreamer-0.10,--without-gstreamer-0.10,gstreamer gst-plugins-base"
> +PACKAGECONFIG[gstreamer1.0] = "--with-gstreamer,--without-gstreamer,gstreamer1.0 gstreamer1.0-plugins-base"
>   
>   inherit autotools pkgconfig gtk-doc gobject-introspection
>   
> -FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
> -FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
> -FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
> -FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
> +FILES_${PN} += "${libdir}/gstreamer-0.10/*.so ${libdir}/gstreamer-1.0/*.so"
> +FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-1.0/*.la"
> +FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-1.0/*.a"
> +FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug ${libdir}/gstreamer-1.0/.debug"
>   
>   do_configure_prepend() {
>       mkdir ${S}/m4 || true


