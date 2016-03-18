Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id D603C73189
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:36:26 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2IDaQQI014843; Fri, 18 Mar 2016 08:36:26 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031808362649-1545039 ;
	Fri, 18 Mar 2016 08:36:26 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 15:35:55 +0200
Message-Id: <eb3bbaf13efdeab2c1bcf9fffa47902b9a316c3f.1458307633.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458307633.git.adrian.ratiu@ni.com>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458307633.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/18/2016 08:36:26 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/18/2016 08:36:26 AM,
	Serialize complete at 03/18/2016 08:36:26 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-18_07:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [meta-oe][PATCH v3 2/2] apache-websocket: Add recipe
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
X-List-Received-Date: Fri, 18 Mar 2016 13:36:28 -0000

From: Haris Okanovic <haris.okanovic@ni.com>

The apache-websocket module is an Apache 2.x server module that may be
used to process requests using the WebSocket protocol (RFC 6455) by an
Apache 2.x server. The module consists of a plugin architecture for
handling WebSocket messaging.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../apache-mod/apache-websocket_git.bb             | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
new file mode 100644
index 0000000..da33115
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Websocket module for Apache web server"
+DESCRIPTION = "Process requests using the WebSocket protocol (RFC 6455)"
+HOMEPAGE = "https://github.com/jchampio/${PN}/"
+SECTION = "net"
+LICENSE = "Apache-2.0"
+
+inherit autotools-brokensep pkgconfig
+
+DEPENDS = "apache2 apache2-native"
+RDEPENDS_${PN} += "apache2"
+
+# Original (github.com/disconnect/apache-websocket) is dead since 2012, the
+# fork contains patches from the modules ML and fixes CVE compliance issues
+SRC_URI = "git://github.com/jchampio/apache-websocket.git"
+
+SRCREV = "f5230d8c520dccf8631da94bf90c23f3c1100dcc"
+
+PV = "0.1.1"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+EXTRA_OECONF = "APACHECTL=${STAGING_DIR_TARGET}${sbindir}/apachectl \
+                LIBTOOL=${STAGING_DIR_TARGET}${bindir_crossscripts}/${HOST_SYS}-libtool"
+
+do_install() {
+    install -d ${D}${libdir}/apache2/modules/
+    install ${B}/.libs/mod_websocket.so ${D}${libdir}/apache2/modules/
+}
+
+FILES_${PN} += " ${libdir}/apache2/modules/* "
+FILES_${PN}-dbg += " ${libdir}/apache2/modules/.debug/* "
-- 
2.7.3


