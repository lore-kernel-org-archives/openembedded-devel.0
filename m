Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E6A817231B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 07:50:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44794451"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Dec 2014 15:47:28 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sBA7oOG6015246
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 15:50:24 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 10 Dec 2014 15:50:53 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Dec 2014 15:50:37 +0800
Message-ID: <1418197837-22977-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20141209175107.GP2470@jama>
References: <20141209175107.GP2470@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH v2] libjs-sizzle: Add new recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 07:50:54 -0000
Content-Type: text/plain

libjs-sizzle is a pure-javascript CSS selector engine

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb

diff --git a/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb b/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
new file mode 100644
index 0000000..ad0f9c6
--- /dev/null
+++ b/meta-oe/recipes-support/libjs/libjs-sizzle_1.9.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Pure-JavaScript CSS selector engine"
+LICENSE = "GPLv2+ & MIT & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://usr/share/doc/libjs-sizzle/copyright;md5=9b35efb1635ff8f06d1984376b06ee5a"
+
+SRC_URI = "http://kr.archive.ubuntu.com/ubuntu/pool/universe/s/sizzle/${BPN}_${PV}-1_all.deb;subdir=${BP}"
+SRC_URI[md5sum] = "748b8805e21caed658f6765f7c491d46"
+SRC_URI[sha256sum] = "2a6468763c40a30f6f7d0df8906cd17aaebd6edaa5478aeaffd7b6b5fb8abd35"
+
+SIZZLEDIR = "${datadir}/javascript/sizzle"
+SIZZLEDOCDIR = "${docdir}/libjs-sizzle"
+
+do_install() {
+    install -d -m 0755 ${D}${SIZZLEDIR}
+    install -m 0644 ${S}${SIZZLEDIR}/sizzle.js ${D}${SIZZLEDIR}/
+    install -m 0644 ${S}${SIZZLEDIR}/sizzle.min.js ${D}${SIZZLEDIR}/
+    install -d -m 0755 ${D}${SIZZLEDOCDIR}
+    install -m 0644 ${S}${SIZZLEDOCDIR}/* ${D}${SIZZLEDOCDIR}/
+}
+
+FILES_${PN} = "/usr/share/javascript/sizzle/"
-- 
1.8.3.1


