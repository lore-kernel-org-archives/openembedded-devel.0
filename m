Received: from smtprelay-h21.telenor.se ([195.54.99.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Pk0Tu-0007FB-RR
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 21:36:14 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h21.telenor.se (Postfix) with ESMTP id 96C2AEA708
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 21:35:21 +0100 (CET)
X-SENDER-IP: [83.227.56.243]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ahw4ADqsRk1T4zjzPGdsb2JhbACIXpwaDAEBAQE1L74WgxeCNwSMIQ
X-IronPort-AV: E=Sophos;i="4.60,405,1291590000"; d="scan'208";a="170542729"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 31 Jan 2011 21:35:21 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jan 2011 21:35:18 +0100
Message-Id: <1296506118-4702-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] Add support for at91sam9m10 H/W video decoder
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
X-List-Received-Date: Mon, 31 Jan 2011 20:36:15 -0000

---
 .../at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb    |   41 ++++++++
 recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb      |   49 ++++++++++
 recipes/images/x11-at91sam9m10-image.bb            |  102 ++++++++++++++++++++
 3 files changed, 192 insertions(+), 0 deletions(-)
 create mode 100644 recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
 create mode 100644 recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
 create mode 100644 recipes/images/x11-at91sam9m10-image.bb

diff --git a/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb b/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
new file mode 100644
index 0000000..8010bd4
--- /dev/null
+++ b/recipes/at91sam9m10-vdec/gst-plugin-on2-8170_1.0.bb
@@ -0,0 +1,41 @@
+# This is the support library for AT91SAM9M10 On2 8170 video decoder.
+DESCRIPTION = "Library for AT91SAM9M10 On2 8170 video decoder"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = ""
+
+COMPATIBLE_MACHINE = (at91sam9m10ekes|at91sam9m10g45ek)
+
+PR = "r1"
+
+DEPENDS = "glib-2.0 gstreamer on2-8170-libs"
+CFLAGS += "-I${STAGING_INCDIR}/glib-2.0 -I${STAGING_INCDIR}/gstreamer-0.10 -I${STAGING_INCDIR}/libxml2/"
+GST_MAJORMINOR=0.10
+PROVIDES += "gstx170"
+
+SRC_URI = "ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/gst-plugin-x170-${PV}.tar.gz"
+S = ${WORKDIR}/gst-plugin-x170-${PV}
+
+inherit autotools
+
+FILES_${PN} = " \
+	${libdir}/gstreamer-${GST_MAJORMINOR}/*.so \
+	"
+
+FILES_${PN}-dev = " \
+	${libdir}/gstreamer-${GST_MAJORMINOR}/*.so \
+	${libdir}/gstreamer-${GST_MAJORMINOR}/*.a \
+	${libdir}/gstreamer-${GST_MAJORMINOR}/*.la \
+	"
+
+do_stage() {
+	echo staging ...
+	oe_libinstall -s -a -C ${S}/src/.libs libgstx170   ${STAGING_LIBDIR}
+	install -m 0644  ${S}/src/gstx170.h  ${STAGING_INCDIR}/
+}
+
+do_install() {
+	echo install ...
+	install -d ${D}/${libdir}/gstreamer-${GST_MAJORMINOR}
+	oe_libinstall -s -C ${S}/src/.libs/ libgstx170   ${D}/${libdir}/gstreamer-${GST_MAJORMINOR}
+}
diff --git a/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb b/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
new file mode 100644
index 0000000..7fa95aa
--- /dev/null
+++ b/recipes/at91sam9m10-vdec/on2-8170-libs_1.0.bb
@@ -0,0 +1,49 @@
+# This is the support library for Hantro X170 video decoder.
+DESCRIPTION = "Library for Hantro X170 video decoder"
+SECTION = "libs"
+PRIORITY = "optional"
+
+COMPATIBLE_MACHINE = (at91sam9m10ekes|at91sam9m10g45ek)
+
+PR = "r1"
+PROVIDES += "hantro-libs"
+SRC_URI ="ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/on2-8170-libs-1.0.tar.gz"
+
+inherit autotools
+S = ${WORKDIR}/on2-8170-libs-${PV}
+
+FILES_${PN} = " \
+	${libdir}/*.so \
+	"
+
+FILES_${PN}-dev = " \
+	${libdir}/*.so \
+	${libdir}/*.a  \
+	${libdir}/*.la \
+	${includedir}/*.h  \
+	"
+
+
+SRC_URI_append = ""
+
+do_stage() {
+	oe_libinstall -s -a -C ${S}   libdwlx170   ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libdecx170h  ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libx170j     ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libdecx170m2 ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libdecx170m  ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libdecx170p  ${STAGING_LIBDIR}
+	oe_libinstall -s -a -C ${S}   libdecx170v  ${STAGING_LIBDIR}
+	
+	install -m 0644 ${S}/*.h ${STAGING_INCDIR}/
+}
+
+do_install() {
+	oe_libinstall -s  -C ${S}  libdwlx170   ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libdecx170h  ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libx170j     ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libdecx170m2 ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libdecx170m  ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libdecx170p  ${D}/${libdir}/
+	oe_libinstall -s  -C ${S}  libdecx170v  ${D}/${libdir}/
+}
diff --git a/recipes/images/x11-at91sam9m10-image.bb b/recipes/images/x11-at91sam9m10-image.bb
new file mode 100644
index 0000000..416ae63
--- /dev/null
+++ b/recipes/images/x11-at91sam9m10-image.bb
@@ -0,0 +1,102 @@
+#Angstrom X11 at91sam9 image
+
+XSERVER ?= ""
+	
+ANGSTROM_EXTRA_INSTALL += " \
+	gpe-irc \
+	gpe-sketchbook \
+	gpe-filemanager \
+	gpe-tetris \
+	gpe-go \
+	gpe-calendar \
+	gpe-contacts \
+	gpe-edit \
+	gpe-gallery \
+	gpe-calculator \
+	gpe-clock \
+	gpe-terminal \
+	gpe-watch \
+	matchbox-panel-hacks \
+	gpe-scap \
+	gpe-windowlist \
+	gpe-mixer \
+	usbview \
+	mplayer \
+	thttpd \
+	madplay \
+	alsa-utils-aplay \
+	alsa-utils-amixer \
+	iperf \
+	dosfstools \
+	mtd-utils \
+#	nbench-byte \
+	gpe-mini-browser \
+	pointercal \
+	gstreamer \
+	gst-plugins-base \
+	gst-plugins-good \
+	gst-plugins-bad \
+	gst-plugins-ugly \
+	gst-plugin-avi \
+	gst-plugin-mpegstream \
+	gst-plugin-qtdemux \
+	gst-plugin-mpegvideoparse \
+	gst-plugin-asf \
+	gst-plugin-alsa \
+	gst-plugin-ossaudio \
+	gst-plugin-audioresample \
+	gst-plugin-audioconvert \
+	gst-plugin-ximagesink \
+	gst-plugin-fbdevsink \
+	gst-plugin-faad \
+	gst-plugin-mad \    
+	gst-plugin-playbin \
+	gst-plugin-decodebin \
+	gst-plugin-typefindfunctions \
+	gst-ffmpeg \
+	gst-plugin-on2-8170 \
+	on2-8170-libs \
+	owl-wifi \
+	"
+
+export IMAGE_BASENAME = "x11-at91sam9m10-image"
+
+DEPENDS = "task-base"
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    task-base-extended \
+    angstrom-x11-base-depends \
+    angstrom-gpe-task-base \
+    angstrom-gpe-task-settings \
+    ${ANGSTROM_EXTRA_INSTALL}"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+at91sam9m10_rootfs_postprocess() {
+   curdir=$PWD
+   cd ${IMAGE_ROOTFS}
+
+   # add init script to cratee hantro modules /dev files
+   echo 'MAJOR=`cat /proc/devices |grep hx170|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
+   echo 'mknod /dev/hx170 c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
+   echo 'MAJOR=`cat /proc/devices |grep memalloc|cut -f1 -d\ `' >> ${IMAGE_ROOTFS}//etc/init.d/hantro
+   echo 'mknod /dev/memalloc c $MAJOR 0' >> ${IMAGE_ROOTFS}/etc/init.d/hantro
+   chmod a+x  ${IMAGE_ROOTFS}/etc/init.d/hantro
+   cd ${IMAGE_ROOTFS}/etc/rc5.d
+   ln -s ../init.d/hantro S51hantro
+
+   # back on track
+   cd $curdir
+}
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += "set_image_autologin; "
+
+#we dont need the kernel in the image
+ROOTFS_POSTPROCESS_COMMAND += "rm -f ${IMAGE_ROOTFS}/boot/*Image*; "
+
+#load sam9m10 vdec modules and create file descriptor at boot
+ROOTFS_POSTPROCESS_COMMAND += "at91sam9m10_rootfs_postprocess; "
+
+inherit image
-- 
1.6.3.3



