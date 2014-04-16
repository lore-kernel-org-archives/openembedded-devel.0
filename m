Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3366765E4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 18:12:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2014 11:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,873,1389772800"; d="scan'208";a="521790383"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2014 11:12:48 -0700
Received: from irsectmgbld0302.ir.intel.com (irsectmgbld0302.ir.intel.com
	[163.33.26.92])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s3GICl8S019469; Wed, 16 Apr 2014 19:12:47 +0100
Received: from irsectmgbld0302.ir.intel.com (localhost [127.0.0.1])
	by irsectmgbld0302.ir.intel.com with ESMTP id s3GIClFp058123;
	Wed, 16 Apr 2014 19:12:47 +0100
Received: (from kmsywula@localhost)
	by irsectmgbld0302.ir.intel.com with œ id s3GICl92058119;
	Wed, 16 Apr 2014 19:12:47 +0100
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Apr 2014 19:11:12 +0100
Message-Id: <1397671872-57992-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.8.2
Cc: martin.jansa@gmail.comexit, koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] bitlbee: add bitlbee-3.2.1
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
X-List-Received-Date: Wed, 16 Apr 2014 18:12:56 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 .../recipes-connectivity/bitlbee/bitlbee_3.2.1.bb  | 61 ++++++++++++++++++++++
 .../recipes-connectivity/bitlbee/files/init-script | 31 +++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
 create mode 100644 meta-oe/recipes-connectivity/bitlbee/files/init-script

diff --git a/meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb b/meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
new file mode 100644
index 0000000..449e6a0
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bitlbee/bitlbee_3.2.1.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Bitlbee is an IRC to IM gateway that support multiple IM protocols."
+HOMEPAGE = "http://www.bitlbee.org/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "glib-2.0 openssl"
+
+SRC_URI = "http://get.bitlbee.org/src/${P}.tar.gz \
+           file://init-script"
+
+SRC_URI[md5sum] = "6ee7c7a99eb59dfcf0307fcf44c14105"
+SRC_URI[sha256sum] = "00f411dd7d6d28f30f0e73e46c9cbe88b4006e7f03adfe07b90a97280a290f59"
+
+S = "${WORKDIR}/bitlbee-${PV}"
+
+EXTRA_OECONF = "--prefix=/usr \
+                --datadir=/usr/share/bitlbee \
+                --etcdir=/etc/bitlbee \
+                --oscar=0 \
+                --ssl=openssl"
+
+do_configure () {
+    # NOTE: bitlbee's configure script is not an autotool creation, 
+    # so we do not use the default autotools_do_configure.
+    ./configure ${EXTRA_OECONF} || die "./configure failed"
+}
+
+do_compile () {
+    make CC="${CC}" LD="${LD}" || die "make failed"
+    
+    # make bitlbeed forking server
+    cd ${S}/utils
+    ${CC} bitlbeed.c -o bitlbeed || die "bitlbeed failed to compile"
+}
+
+do_install () {
+    # install bitlbee
+    install -d ${D}${localstatedir}/lib/bitlbee
+    make install DESTDIR=${D} || die "install failed"
+    make install-etc DESTDIR=${D} || die "install failed"
+
+    # copy bitlbee forking server
+    install ${S}/utils/bitlbeed ${D}${sbindir}/bitlbeed
+
+    # copy init script
+    install -d ${D}${sysconfdir}/init.d
+    install ${WORKDIR}/init-script ${D}${sysconfdir}/init.d/bitlbee
+    sed -i -e "s:BITLBEED_EXEC:${sbindir}/bitlbeed:" ${D}${sysconfdir}/init.d/bitlbee
+    sed -i -e "s:BITLBEED_OPTS::" ${D}${sysconfdir}/init.d/bitlbee
+
+    # copy bitlbee utils
+    install -d ${D}${datadir}/bitlbee
+    cp ${S}/utils/* ${D}${datadir}/bitlbee/
+    rm ${D}${datadir}/bitlbee/bitlbeed*
+}
+
+pkg_postinst_${PN} () {
+    chown nobody:nogroup ${localstatedir}/lib/bitlbee
+    chmod 700 ${localstatedir}/lib/bitlbee
+}
diff --git a/meta-oe/recipes-connectivity/bitlbee/files/init-script b/meta-oe/recipes-connectivity/bitlbee/files/init-script
new file mode 100644
index 0000000..3ec3fdf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bitlbee/files/init-script
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+case "$1" in
+    start)
+    	echo "Starting bitlbee daemon"
+	start-stop-daemon --start --startas BITLBEED_EXEC \
+		-c nobody:nogroup  --exec BITLBEED_EXEC -- \
+		BITLBEED_OPTS /usr/sbin/bitlbee
+	[ $? -eq 0 ] || echo $? "Failed to start bitlbee daemon"
+    ;;
+
+    stop)
+        echo "Stopping bitlbee daemon"
+	start-stop-daemon --stop --signal 9 \
+	                 --exec BITLBEED_EXEC
+	[ $? -eq 0 ] || echo $? "Failed to stop bitlbee daemon"
+    ;;
+
+    restart)
+    	$0 stop
+    	sleep 1
+    	$0 start
+    ;;
+
+    *)
+        echo "usage: $0 { start | stop }"
+    	exit 1
+    ;;
+esac
+
+exit 0
-- 
1.8.2


