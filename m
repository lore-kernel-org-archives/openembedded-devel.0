Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitperov@gmail.com>) id 1RZTMw-00018D-PZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Dec 2011 21:18:02 +0100
Received: by bkbzt4 with SMTP id zt4so4063665bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Dec 2011 12:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IGbWNiEdJWO5P1rkMrOM5dNg9iee+/hb2Yaar8TxBdk=;
	b=bUL9P175KceI2fZsKQOsaH+l/5ekkModS5HP8pPL+rP3UWiw026y/NayX79jVW6v8j
	iuzerY/2EqX38KnFG6FJ52IIwFlZk1am4SUpvivSh5PIPHSPH37NHzRSN6ZX7SzrELT1
	NgSCGoGw05Jrw5eULlgvTOQlyDJsxj1e1EdBM=
Received: by 10.204.130.90 with SMTP id r26mr6845221bks.46.1323547865547;
	Sat, 10 Dec 2011 12:11:05 -0800 (PST)
Received: from localhost.localdomain ([109.195.90.21])
	by mx.google.com with ESMTPS id j9sm18988159bkd.2.2011.12.10.12.11.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 12:11:04 -0800 (PST)
From: Vitaly Perov <vitperov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Dec 2011 00:10:21 +0400
Message-Id: <1323547821-19780-1-git-send-email-vitperov@gmail.com>
X-Mailer: git-send-email 1.7.6
Cc: Vitaly Perov <vit@vt-tech.eu>
Subject: [PATCH] ftplib: add initial version of recipe
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
X-List-Received-Date: Sat, 10 Dec 2011 20:18:02 -0000

From: Vitaly Perov <vit@vt-tech.eu>

---
 recipes/ftplib/ftplib_3.1.bb |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ftplib/ftplib_3.1.bb

diff --git a/recipes/ftplib/ftplib_3.1.bb b/recipes/ftplib/ftplib_3.1.bb
new file mode 100644
index 0000000..1dcdb3d
--- /dev/null
+++ b/recipes/ftplib/ftplib_3.1.bb
@@ -0,0 +1,38 @@
+#! /bin/sh
+
+DESCRIPTION = "A set of routines that implement the FTP protocol"
+HOMEPAGE = "http://nbpfaus.net/~pfau/ftplib/"
+LICENSE = "LGPLv2"
+
+PR = "r1"
+
+######################################################################################
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+SRC_URI = "http://nbpfaus.net/~pfau/ftplib/ftplib-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/ftplib-${PV}"
+
+######################################################################################
+
+SRC_URI[md5sum] = "c6af758ccbf806b28f022a587a41d9c5"
+SRC_URI[sha256sum] = "be524e1086cfe9d86afa832e1413dde79a4e88ee8ea5325a87ffaaf6620a0a2b"
+
+######################################################################################
+do_compile() {
+    cd linux && make
+}
+
+do_install() {
+    install -d ${D}/${libdir}
+    install -d ${D}/${includedir}
+    install -d ${D}/${bindir}
+    install -m 755 ${S}/linux/libftp.so.3.1 ${D}/${libdir}
+    install -m 755 ${S}/linux/libftp.a ${D}/${libdir}
+    install -m 644 ${S}/linux/ftplib.h ${D}/${includedir}
+    install -m 755 ${S}/linux/qftp ${D}/${bindir}
+    (cd ${D}/${libdir} && \
+     ln -sf libftp.so.3.1 libftp.so.3 && \
+     ln -sf libftp.so.3 libftp.so)
+}
-- 
1.7.6



