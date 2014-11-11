Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 61A6865CC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:21:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43189145"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Nov 2014 16:18:25 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAB8LOv8012734
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 16:21:24 +0800
Received: from localhost.localdomain (10.167.226.35) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 11 Nov 2014 16:21:44 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 16:20:21 +0800
Message-ID: <1415694021-1932-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.35]
Subject: [PATCH] smem: add new recipe
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
X-List-Received-Date: Tue, 11 Nov 2014 08:21:41 -0000
Content-Type: text/plain

smem is a tool that can give numerous reports on memory usage on Linux systems.
Unlike existing tools, smem can report proportional set size (PSS),
which is a more meaningful representation of the amount of memory used
by libraries and applications in a virtual memory system.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/smem/smem_1.4.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/smem/smem_1.4.bb

diff --git a/meta-oe/recipes-support/smem/smem_1.4.bb b/meta-oe/recipes-support/smem/smem_1.4.bb
new file mode 100644
index 0000000..8d195d4
--- /dev/null
+++ b/meta-oe/recipes-support/smem/smem_1.4.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Report application memory usage in a meaningful way"
+DESCRIPTION = "smem is a tool that can give numerous reports on memory usage on Linux \
+systems. Unlike existing tools, smem can report proportional set size (PSS), \
+which is a more meaningful representation of the amount of memory used by \
+libraries and applications in a virtual memory system."
+HOMEPAGE = "http://www.selenic.com/smem/"
+SECTION = "Applications/System"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://www.selenic.com/smem/download/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "fe79435c3930389bfdb560255c802162"
+SRC_URI[sha256sum] = "2ea9f878f4cf3c276774c3f7e2a41977a1f2d64f98d2dcb6a15f1f3d84df61ec"
+
+do_compile() {
+        ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
+}
+
+do_install() {
+        install -d ${D}/${bindir}/
+        install -d ${D}/${mandir}/man8
+        install -m 0755 ${S}/smem ${D}${bindir}/
+        install -m 0755 ${S}/smemcap ${D}${bindir}/
+        install -m 0644 ${S}/smem.8 ${D}/${mandir}/man8/
+}
-- 
1.8.4.2


