Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R6fBk-0008AP-1k
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 11:03:24 +0200
Received: by wwf27 with SMTP id 27so1543541wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Sep 2011 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Wwz8Yy4bquMYrePixz3kgxrIK1rozwK9oFqLWJu4iQU=;
	b=qsVVZsmZISX33XWubtTwEWfLMWaALi1w2ES8D0Jy8vKT/QHRHiMPkPdR7vqxLfdi53
	URnJMa9kfHYCNv6CBRoHFIWWU5D00sb6S70OLiNtr3BV6QmfOG2M2Kw01E9GEApQAp56
	qIy+Xq7lyxMsE0nZF8FxscwuQo1pQlxieEG8c=
Received: by 10.227.9.1 with SMTP id j1mr1887281wbj.12.1316681884498;
	Thu, 22 Sep 2011 01:58:04 -0700 (PDT)
Received: from localhost.localdomain ([193.56.60.160])
	by mx.google.com with ESMTPS id n21sm10557034wbp.2.2011.09.22.01.58.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 01:58:02 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
From: Tristan Lelong <tristan.lelong@blunderer.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 10:57:49 +0200
Message-Id: <1316681869-14204-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v4] libroxml: Add version 2.1.1
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
X-List-Received-Date: Thu, 22 Sep 2011 09:03:24 -0000

libroxml is a small fast and powerful xml library
build successfully using org.openembedded.dev with DISTRO=minimal and MACHINE = "i686-generic"
build successfully using org.openembedded.dev with DISTRO=minimal and MACHINE = "ppce500v2"
tested using projects unit tests on powerpc binaries

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 recipes/libroxml/libroxml.inc      |   24 ++++++++++++++++++++++++
 recipes/libroxml/libroxml_2.1.1.bb |    5 +++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libroxml/libroxml.inc
 create mode 100644 recipes/libroxml/libroxml_2.1.1.bb

diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
new file mode 100644
index 0000000..2ee03eb
--- /dev/null
+++ b/recipes/libroxml/libroxml.inc
@@ -0,0 +1,24 @@
+DESCRIPTION = "Small, fast and powerful xml library"
+AUTHOR = "Tristan Lelong <tristan.lelong@libroxml.net>"
+HOMEPAGE = "http://www.libroxml.net"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2.1+"
+INC_PR = "r0"
+
+SRC_URI = "http://libroxml.googlecode.com/files/${P}.tar.gz"
+
+do_install() {
+	install -D -m 755 ${S}/roxml ${D}/${bindir}/roxml
+	install -D -m 755 ${S}/libroxml.so.0 ${D}/${libdir}/libroxml.so.0
+	install -D -m 644 ${S}/libroxml.a ${D}/${libdir}/libroxml.a
+	install -D -m 644 ${S}/inc/roxml.h ${D}/${includedir}/roxml.h
+	ln -s libroxml.so.0 ${D}/${libdir}/libroxml.so
+}
+
+PACKAGES += "roxml roxml-dbg"
+FILES_${PN} = "${libdir}/libroxml.so.0"
+FILES_${PN}-dev = "${libdir}/libroxml.a ${libdir}/libroxml.so ${includedir}/roxml.h"
+FILES_${PN}-dbg = "${libdir}/.debug/libroxml.so.0"
+FILES_roxml = "${bindir}/roxml"
+FILES_roxml-dbg = "${bindir}/.debug/roxml"
diff --git a/recipes/libroxml/libroxml_2.1.1.bb b/recipes/libroxml/libroxml_2.1.1.bb
new file mode 100644
index 0000000..c47e1b7
--- /dev/null
+++ b/recipes/libroxml/libroxml_2.1.1.bb
@@ -0,0 +1,5 @@
+require libroxml.inc
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "dc8342d0490bff5a507dbf1de3426102"
+SRC_URI[sha256sum] = "e4e91b610614d6cb1204ac9abbb417368fe84654c7de58134b436cfd00f1a244"
-- 
1.7.5.4



