Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AFDC360232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Dec 2014 02:13:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44473323"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Dec 2014 10:10:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB42DYUt032215
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Dec 2014 10:13:34 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 4 Dec 2014 10:14:04 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Dec 2014 10:13:40 +0800
Message-ID: <1417659220-8645-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] libutempter: Add new recipe
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
X-List-Received-Date: Thu, 04 Dec 2014 02:13:59 -0000
Content-Type: text/plain

Libutempter provides interface for terminal emulators such as
screen and xterm to record user sessions to utmp and wtmp files.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../libutempter/libutempter_1.1.6.bb               | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb

diff --git a/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
new file mode 100644
index 0000000..e1dccd6
--- /dev/null
+++ b/meta-oe/recipes-support/libutempter/libutempter_1.1.6.bb
@@ -0,0 +1,36 @@
+SUMMARY = "A privileged helper for utmp/wtmp updates"
+DESCRIPTION = "\
+This library provides interface for terminal emulators such as \
+screen and xterm to record user sessions to utmp and wtmp files."
+HOMEPAGE = "ftp://ftp.altlinux.org/pub/people/ldv/utempter"
+SECTION = "System Environment/Libraries"
+LICENSE = "GPLv2 GPLv2+ LGPLv2 MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+
+SRC_URI = "ftp://ftp.altlinux.org/pub/people/ldv/utempter/${BP}.tar.bz2"
+SRC_URI[md5sum] = "b43827806923903aba2bc7cd3a2d45b7"
+SRC_URI[sha256sum] = "b898565f31ced7e5c1fa0a2eaa0f6ff0ed862b5fe375d26375b64bfbdfeac397"
+
+CFLAGS += "-DLIBEXECDIR=$(libexecdir)"
+
+do_compile() {
+    oe_runmake                      \
+        libdir=${libdir}            \
+        libexecdir=${libexecdir}    \
+}
+
+do_install() {
+    oe_runmake install              \
+        DESTDIR=${D}                \
+        libdir="${libdir}"          \
+        libexecdir="${libexecdir}"  \
+        includedir=${includedir}    \
+        mandir=${mandir}
+
+        rm -f ${D}${libdir}/*.a
+}
+
+FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN} += "${libexecdir}/utempter/utempter"
+
+FILES_${PN}-dbg += "${libexecdir}/utempter/.debug/utempter"
-- 
1.8.3.1


