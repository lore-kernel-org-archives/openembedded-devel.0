Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AE50D759D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 09:01:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,617,1427731200"; d="scan'208";a="97058816"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 17:05:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F8xXWB030504
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2015 16:59:33 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 17:01:19 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2015 16:52:14 +0800
Message-ID: <1434358336-34981-6-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434358336-34981-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 5/7] libtalloc: add new recipe
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
X-List-Received-Date: Mon, 15 Jun 2015 09:01:10 -0000
Content-Type: text/plain

libtalloc >= 2.0.8 is required by samba4

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../recipes-support/libtalloc/libtalloc_2.1.1.bb   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb

diff --git a/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb b/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
new file mode 100644
index 0000000..6285a3c
--- /dev/null
+++ b/meta-oe/recipes-support/libtalloc/libtalloc_2.1.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "Hierarchical, reference counted memory pool system with destructors"
+HOMEPAGE = "http://talloc.samba.org"
+SECTION = "libs"
+LICENSE = "LGPL-3.0+ & GPL-3.0+"
+
+SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
+                    file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
+
+SRC_URI[md5sum] = "5dffb86414218a91864ed4453ba9be07"
+SRC_URI[sha256sum] = "3e29ce6c3ba3c4f7c2d57ce8cf0fbc24c86618c519f2b2fb6a459025488b6174"
+
+inherit wafsamba
+
+S = "${WORKDIR}/talloc-${PV}"
+
+EXTRA_OECONF += "--disable-rpath \
+                 --disable-rpath-install \
+                 --bundled-libraries=NONE \
+                 --builtin-libraries=replace \
+                 --disable-silent-rules \
+                 --with-libiconv=${STAGING_DIR_HOST}${prefix}\
+                "
+
+PACKAGES += "pytalloc pytalloc-dbg pytalloc-dev"
+
+FILE_${PN} = "${libdir}/libtalloc.so.2 \
+                   ${libdir}/libtalloc.so.2.1.1"
+FILES_${PN}-dbg = "/usr/src/debug/ \
+                       ${libdir}/.debug/libtalloc.so.2.1.1"
+FILES_${PN}-dev = "${includedir}/ \
+                       ${libdir}/libtalloc.so \
+                       ${libdir}/pkgconfig/"
+
+FILES_pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+                  ${libdir}/libpytalloc-util.so.2 \
+                  ${libdir}/libpytalloc-util.so.2.1.1 \
+                 "
+FILES_pytalloc-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
+                      ${libdir}/.debug/libpytalloc-util.so.2.1.1"
+FILES_pytalloc-dev = "${libdir}/libpytalloc-util.so"
+RDEPENDS_pytalloc = "python"
-- 
1.8.4.2


