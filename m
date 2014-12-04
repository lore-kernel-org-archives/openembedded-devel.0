Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 95A0460670
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 09:39:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44494077"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 17:35:46 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB49chn9028330
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 17:38:43 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Dec 2014 17:39:13 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Dec 2014 17:38:46 +0800
Message-ID: <1417685927-17482-2-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1417685927-17482-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1417685927-17482-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH 1/2] libjs-jquery: Add new recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 09:39:10 -0000
Content-Type: text/plain

libjs-jquery is a javascript library for dynamic web application

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../recipes-support/libjs/libjs-jquery_1.7.1.bb    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
new file mode 100644
index 0000000..cf7c2d5
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-jquery_1.7.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "JavaScript library for dynamic web applications"
+LICENSE = "GPLv2+ & MIT"
+LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-jquery/copyright;md5=2b490904c50a58472452b6e9e1c81203"
+
+SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/main/j/jquery/${BPN}_${PV}-1ubuntu1_all.deb;subdir=${BP}"
+SRC_URI[md5sum] = "1ac8a9e4dfe18de22e65baec3dd53f8b"
+SRC_URI[sha256sum] = "0551e20c88035d80c00b552707573d62ee89e8e5a204d8b427a6020b065e2542"
+
+JQUERYDIR = "${datadir}/javascript/jquery"
+JQUERYDOCDIR = "${docdir}/libjs-jquery"
+
+do_install() {
+    install -d -m 0755 ${D}${JQUERYDIR}
+    install -m 0644 ${S}${JQUERYDIR}/jquery.js ${D}${JQUERYDIR}/
+    install -m 0644 ${S}${JQUERYDIR}/jquery.min.js ${D}${JQUERYDIR}/
+
+    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.lite.js
+    ln -sf jquery.min.js ${D}${JQUERYDIR}/jquery.pack.js
+
+    install -d -m 0644 ${D}${JQUERYDOCDIR}
+    install -m 0644 ${S}${JQUERYDOCDIR}/copyright ${D}${JQUERYDOCDIR}/
+}
+
+FILES_${PN} = "/usr/share/javascript/jquery"
-- 
1.8.3.1


