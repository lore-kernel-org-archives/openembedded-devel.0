Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF2F62132
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:09:27 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2HC9Rh3015030 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 07:09:27 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031707092827-1492282 ;
	Thu, 17 Mar 2016 07:09:28 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 14:08:59 +0200
Message-Id: <c9611b265dec7c82e796ce0b2724bea4ac51f7c7.1458216371.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458216371.git.adrian.ratiu@ni.com>
References: <614cbca3bdce23c4c67f78eab893a21ef6a50663.1458216371.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/17/2016 07:09:28 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/17/2016 07:09:28 AM,
	Serialize complete at 03/17/2016 07:09:28 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-17_03:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [meta-oe][PATCH 2/2] apache-websocket: Add recipe
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
X-List-Received-Date: Thu, 17 Mar 2016 12:09:27 -0000

From: Haris Okanovic <haris.okanovic@ni.com>

The apache-websocket module is an Apache 2.x server module that may be
used to process requests using the WebSocket protocol (RFC 6455) by an
Apache 2.x server. The module consists of a plugin architecture for
handling WebSocket messaging.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 .../apache-mod/apache-websocket_git.bb             | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
new file mode 100644
index 0000000..e2bd097
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -0,0 +1,32 @@
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
+PV = "1.1.1"
+
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+EXTRA_OECONF = "APACHECTL=${STAGING_DIR_TARGET}${sbindir}/apachectl"
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


