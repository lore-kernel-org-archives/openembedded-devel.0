Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 35FE2601F5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 05:55:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44482712"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 13:52:42 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB45tdoB012816
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 13:55:39 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Dec 2014 13:56:09 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Dec 2014 13:55:48 +0800
Message-ID: <1417672548-32155-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] libp11: Add new recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 05:56:01 -0000
Content-Type: text/plain

Libp11 is a library implementing a small layer on top of PKCS
make using PKCS

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/libp11/libp11_0.2.8.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/libp11/libp11_0.2.8.bb

diff --git a/meta-oe/recipes-support/libp11/libp11_0.2.8.bb b/meta-oe/recipes-support/libp11/libp11_0.2.8.bb
new file mode 100644
index 0000000..cac7062
--- /dev/null
+++ b/meta-oe/recipes-support/libp11/libp11_0.2.8.bb
@@ -0,0 +1,23 @@
+inherit autotools pkgconfig
+
+SUMMARY = "Library for using PKCS"
+DESCRIPTION = "\
+Libp11 is a library implementing a small layer on top of PKCS \
+make using PKCS"
+HOMEPAGE = "http://www.opensc-project.org/libp11"
+SECTION = "Development/Libraries"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
+DEPENDS = "libtool openssl"
+
+SRC_URI = "git://github.com/OpenSC/libp11.git"
+SRCREV = "7d56d89fcad6440d108bbbccfb1ebd958e7eb740"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF = "--disable-static"
+
+do_install_append () {
+    rm -rf ${D}${libdir}/*.la
+    rm -rf ${D}${docdir}/${BPN}
+}
-- 
1.8.3.1


