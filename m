Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R6MBi-00053R-Vl
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Sep 2011 14:46:07 +0200
Received: by wyh5 with SMTP id 5so2163477wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2011 05:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=BZeE3/EAXQRt0qL6E13mZfwpATVaCTHfoIiMrs/QNLM=;
	b=U+smf+4Pnxw+I3wtoZ4WqwDCcuAlyfp79om/1pkaZFzoRuFk7gVipeawiMq7zr4ySx
	4dkGj1wazeUansjbceYo4gqY/JcBsZivvDlneUBRneMgAxVVs02OTx0RUenSWIRzH6sG
	99Wpa6oupt3ebD91HWSV9zVMLUlJ6uQyV+H/s=
Received: by 10.227.199.16 with SMTP id eq16mr678184wbb.48.1316608848619;
	Wed, 21 Sep 2011 05:40:48 -0700 (PDT)
Received: from localhost.localdomain ([92.103.82.100])
	by mx.google.com with ESMTPS id j18sm6769896wbo.6.2011.09.21.05.40.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 05:40:48 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
From: Tristan Lelong <tristan.lelong@blunderer.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2011 14:40:29 +0200
Message-Id: <1316608829-30502-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v3] libroxml: Add version 2.1.1
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
X-List-Received-Date: Wed, 21 Sep 2011 12:46:07 -0000

libroxml is a small fast and powerful xml library
build successfully using org.openembedded.dev with DISTRO=minimal and MACHINE = "i686-generic"
build successfully using org.openembedded.dev with DISTRO=minimal and MACHINE = "ppce500v2"
tested using projects unit tests on powerpc binaries

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 recipes/libroxml/libroxml.inc      |   21 +++++++++++++++++++++
 recipes/libroxml/libroxml_2.1.1.bb |    5 +++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libroxml/libroxml.inc
 create mode 100644 recipes/libroxml/libroxml_2.1.1.bb

diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
new file mode 100644
index 0000000..eed21d1
--- /dev/null
+++ b/recipes/libroxml/libroxml.inc
@@ -0,0 +1,21 @@
+DESCRIPTION = "Small, fast and powerful xml library"
+AUTHOR = "Tristan Lelong <tristan.lelong@libroxml.net>"
+HOMEPAGE = "http://www.libroxml.net"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+INC_PR = "r1"
+
+SRC_URI = "http://libroxml.googlecode.com/files/${P}.tar.gz"
+
+do_install() {
+	install -D -m 755 ${S}/roxml ${D}/${bindir}/roxml
+	install -D -m 755 ${S}/libroxml.so.0 ${D}/${libdir}/libroxml.so.0
+	install -D -m 644 ${S}/inc/roxml.h ${D}/${includedir}/roxml.h
+	ln -s /usr/lib/libroxml.so.0 ${D}/${libdir}/libroxml.so
+}
+
+PACKAGES = ${PN} ${PN}-dev roxml
+FILES_${PN} = ${libdir}/libroxml.so.0
+FILES_${PN}-dev = ${libdir}/libroxml.so ${includedir}/roxml.h
+FILES_roxml = ${bindir}/roxml
diff --git a/recipes/libroxml/libroxml_2.1.1.bb b/recipes/libroxml/libroxml_2.1.1.bb
new file mode 100644
index 0000000..0852930
--- /dev/null
+++ b/recipes/libroxml/libroxml_2.1.1.bb
@@ -0,0 +1,5 @@
+require libroxml.inc
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "dc8342d0490bff5a507dbf1de3426102"
+SRC_URI[sha256sum] = "e4e91b610614d6cb1204ac9abbb417368fe84654c7de58134b436cfd00f1a244"
-- 
1.7.5.4



