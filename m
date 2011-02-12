Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Po2yd-0000R1-IR
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 01:04:40 +0100
Received: by pxi17 with SMTP id 17so489502pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MuXfXb7cTpc8x0yVmDd0cuA0WvTwuuVIaAKg4Emf600=;
	b=VaULfqREAQ8IDX7bwIDDcNG/vv4YEBomjq7u3tpPBzuRV2CQiHWsodzGUwMRiRLE8N
	r8yuBfFFORzEVYBMNIApq05Hjvt51+/Vd8ObUXyU6BXVyOhMlZZQ2hFLpMD6Dk1EzblE
	TdnM5gNMSTdCLlTy3yFpN/ONPX73N81XXnYdU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nQgQGlYMsDxsIpBg4isMDKXLH120rxprO1DN5zfncWSFqktXO6nKhrUavMRJFZubKR
	FmbZcfMf5IU+byHZqwEttK+y9Qj5M9iwXXUz7ZsyXHHIUKVrY2jKufTuj0dHrf3h3iKx
	3D573pUiTIsT8UMKn6NqR8gZ+DQDGFsvIgX/0=
Received: by 10.142.231.4 with SMTP id d4mr808538wfh.428.1297469011127;
	Fri, 11 Feb 2011 16:03:31 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id f5sm1700876wfo.16.2011.02.11.16.03.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Feb 2011 16:03:30 -0800 (PST)
Date: Fri, 11 Feb 2011 16:03:22 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110212000322.GD1010@gmail.com>
References: <1296507563-5509-1-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
In-Reply-To: <1296507563-5509-1-git-send-email-ulf.samuelsson@atmel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH v2] Add support for at91sam9m10 H/W video decoder
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
X-List-Received-Date: Sat, 12 Feb 2011 00:04:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/01/11 21:59), Ulf Samuelsson wrote:
> 
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> ---
>  .../at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb    |   41 ++++++++
>  recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb      |   49 ++++++++++
>  recipes/images/x11-at91sam9m10-image.bb            |  102 ++++++++++++++++++++
>  3 files changed, 192 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
>  create mode 100644 recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
>  create mode 100644 recipes/images/x11-at91sam9m10-image.bb
> 
> diff --git a/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb b/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
> new file mode 100644
> index 0000000..8010bd4
> --- /dev/null
> +++ b/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
> @@ -0,0 +1,41 @@
> +# This is the support library for AT91SAM9M10 On2 8170 video decoder.
> +DESCRIPTION = "Library for AT91SAM9M10 On2 8170 video decoder"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +LICENSE = ""
> +
> +COMPATIBLE_MACHINE = (at91sam9m10ekes|at91sam9m10g45ek)
> +
> +PR = "r1"
> +
> +DEPENDS = "glib-2.0 gstreamer on2-8170-libs"
> +CFLAGS += "-I${STAGING_INCDIR}/glib-2.0 -I${STAGING_INCDIR}/gstreamer-0.10 -I${STAGING_INCDIR}/libxml2/"
> +GST_MAJORMINOR=0.10
> +PROVIDES += "gstx170"
> +
> +SRC_URI = "ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/gst-plugin-x170-${PV}.tar.gz"
> +S = ${WORKDIR}/gst-plugin-x170-${PV}
> +
> +inherit autotools
> +
> +FILES_${PN} = " \
> +	${libdir}/gstreamer-${GST_MAJORMINOR}/*.so \
> +	"
> +
> +FILES_${PN}-dev = " \
> +	${libdir}/gstreamer-${GST_MAJORMINOR}/*.so \
> +	${libdir}/gstreamer-${GST_MAJORMINOR}/*.a \
> +	${libdir}/gstreamer-${GST_MAJORMINOR}/*.la \
> +	"
> +
> +do_stage() {
> +	echo staging ...
> +	oe_libinstall -s -a -C ${S}/src/.libs libgstx170   ${STAGING_LIBDIR}
> +	install -m 0644  ${S}/src/gstx170.h  ${STAGING_INCDIR}/
> +}
> +
> +do_install() {
> +	echo install ...
> +	install -d ${D}/${libdir}/gstreamer-${GST_MAJORMINOR}
> +	oe_libinstall -s -C ${S}/src/.libs/ libgstx170   ${D}/${libdir}/gstreamer-${GST_MAJORMINOR}
> +}
> diff --git a/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb b/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
> new file mode 100644
> index 0000000..7fa95aa
> --- /dev/null
> +++ b/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
> @@ -0,0 +1,49 @@
> +# This is the support library for Hantro X170 video decoder.
> +DESCRIPTION = "Library for Hantro X170 video decoder"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +
> +COMPATIBLE_MACHINE = (at91sam9m10ekes|at91sam9m10g45ek)
> +
> +PR = "r1"
> +PROVIDES += "hantro-libs"
> +SRC_URI ="ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/on2-8170-libs-1.0.tar.gz"
> +
> +inherit autotools
> +S = ${WORKDIR}/on2-8170-libs-${PV}
> +
> +FILES_${PN} = " \
> +	${libdir}/*.so \
> +	"
> +
> +FILES_${PN}-dev = " \
> +	${libdir}/*.so \
> +	${libdir}/*.a  \
> +	${libdir}/*.la \
> +	${includedir}/*.h  \
> +	"
> +
> +
> +SRC_URI_append = ""
> +
> +do_stage() {
> +	oe_libinstall -s -a -C ${S}   libdwlx170   ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170h  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libx170j     ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170m2 ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170m  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170p  ${STAGING_LIBDIR}
> +	oe_libinstall -s -a -C ${S}   libdecx170v  ${STAGING_LIBDIR}
> +	
> +	install -m 0644 ${S}/*.h ${STAGING_INCDIR}/
> +}


do_stage is obsolete get rid of it.

> +
> +do_install() {
> +	oe_libinstall -s  -C ${S}  libdwlx170   ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libdecx170h  ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libx170j     ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libdecx170m2 ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libdecx170m  ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libdecx170p  ${D}/${libdir}/
> +	oe_libinstall -s  -C ${S}  libdecx170v  ${D}/${libdir}/
> +}
> diff --git a/recipes/images/x11-at91sam9m10-image.bb b/recipes/images/x11-at91sam9m10-image.bb
> new file mode 100644
> index 0000000..416ae63
> --- /dev/null
> +++ b/recipes/images/x11-at91sam9m10-image.bb
> @@ -0,0 +1,102 @@
> +#Angstrom X11 at91sam9 image
> +
> +XSERVER ?= ""
> +	
> +ANGSTROM_EXTRA_INSTALL += " \
> +	gpe-irc \
> +	gpe-sketchbook \
> +	gpe-filemanager \
> +	gpe-tetris \
> +	gpe-go \
> +	gpe-calendar \
> +	gpe-contacts \
> +	gpe-edit \
> +	gpe-gallery \
> +	gpe-calculator \
> +	gpe-clock \
> +	gpe-terminal \
> +	gpe-watch \
> +	matchbox-panel-hacks \
> +	gpe-scap \
> +	gpe-windowlist \
> +	gpe-mixer \
> +	usbview \
> +	mplayer \
> +	thttpd \
> +	madplay \
> +	alsa-utils-aplay \
> +	alsa-utils-amixer \
> +	iperf \
> +	dosfstools \
> +	mtd-utils \
> +#	nbench-byte \
> +	gpe-mini-browser \
> +	pointercal \
> +	gstreamer \
> +	gst-plugins-base \
> +	gst-plugins-good \
> +	gst-plugins-bad \
> +	gst-plugins-ugly \
> +	gst-plugin-avi \
> +	gst-plugin-mpegstream \
> +	gst-plugin-qtdemux \
> +	gst-plugin-mpegvideoparse \
> +	gst-plugin-asf \
> +	gst-plugin-alsa \
> +	gst-plugin-ossaudio \
> +	gst-plugin-audioresample \
> +	gst-plugin-audioconvert \
> +	gst-plugin-ximagesink \
> +	gst-plugin-fbdevsink \
> +	gst-plugin-faad \
> +	gst-plugin-mad \    
> +	gst-plugin-playbin \
> +	gst-plugin-decodebin \
> +	gst-plugin-typefindfunctions \
> +	gst-ffmpeg \
> +	gst-plugin-on2-8170 \
> +	on2-8170-libs \
> +	owl-wifi \


Not all distros might use ANGSTROM_EXTRA_INSTALL
just to let you know. If you are supporting angstrom distro
then locking packages in machine config as you do might 
conflict with angtrom's policies make sure those conglicts
with respect to patches dont happen.
	"
> +
> +export IMAGE_BASENAME = "x11-at91sam9m10-image"
> +
> +DEPENDS = "task-base"
> +IMAGE_INSTALL = "\
> +    ${XSERVER} \
> +    task-base-extended \
> +    angstrom-x11-base-depends \
> +    angstrom-gpe-task-base \
> +    angstrom-gpe-task-settings \
> +    ${ANGSTROM_EXTRA_INSTALL}"
> +
> +IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
> +
> +at91sam9m10_rootfs_postprocess() {
> +   curdir=$PWD
> +   cd ${IMAGE_ROOTFS}
> +
> +   # add init script to cratee hantro modules /dev files
> +   echo 'MAJOR=`cat /proc/devices |grep hx170|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
> +   echo 'mknod /dev/hx170 c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   echo 'MAJOR=`cat /proc/devices |grep memalloc|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
> +   echo 'mknod /dev/memalloc c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   chmod a+x  ${IMAGE_ROOTFS}/etc/init.d/hantro
> +   cd ${IMAGE_ROOTFS}/etc/rc5.d
> +   ln -s ../init.d/hantro S51hantro
> +
> +   # back on track
> +   cd $curdir
> +}
> +
> +#zap root password for release images
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
> +ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
> +
> +#we dont need the kernel in the image
> +ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
> +
> +#load sam9m10 vdec modules and create file descriptor at boot
> +ROOTFS_POSTPROCESS_COMMAND += "at91sam9m10_rootfs_postprocess; "
> +
> +inherit image
> -- 
> 1.6.3.3
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


