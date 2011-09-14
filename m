Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <blunderer@gmail.com>) id 1R3r23-0003kt-9A
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 17:05:47 +0200
Received: by wyh5 with SMTP id 5so199055wyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=leHyBMn48CrKH5OcKZGEv7SAbFpuosfh3X4hxNPwnJ4=;
	b=IuCOss9fdF9uYmX1BAwq8/O5hLELPXWFxsn41vV0fnC2L+3gbenbAX+tiO2479nKaM
	z+6ijxjDg8/XhK1Byz/IaugrsI/Kk/JN7mzAaWqxOb+Uv/b/suOYZFF1gUt6ribqucRI
	t6oolweuFa3QFDrQIjcu4fTQYm+9HQpQC/Qt4=
Received: by 10.227.154.71 with SMTP id n7mr4643082wbw.47.1316012433911;
	Wed, 14 Sep 2011 08:00:33 -0700 (PDT)
Received: from localhost.localdomain ([92.103.82.100])
	by mx.google.com with ESMTPS id fp5sm4375399wbb.2.2011.09.14.08.00.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 08:00:33 -0700 (PDT)
Sender: tristan <blunderer@gmail.com>
From: tristan.lelong@blunderer.org
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 17:00:11 +0200
Message-Id: <1316012411-28874-1-git-send-email-tristan.lelong@blunderer.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH v2] libroxml: Add version 2.1.0
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
X-List-Received-Date: Wed, 14 Sep 2011 15:05:47 -0000

From: Tristan Lelong <tristan.lelong@blunderer.org>

libroxml is a small fast and powerful xml library

Signed-off-by: Tristan Lelong <tristan.lelong@blunderer.org>
---
 recipes/libroxml/libroxml.inc      |   19 +++++++++++++++++++
 recipes/libroxml/libroxml_2.1.0.bb |    6 ++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libroxml/libroxml.inc
 create mode 100644 recipes/libroxml/libroxml_2.1.0.bb

diff --git a/recipes/libroxml/libroxml.inc b/recipes/libroxml/libroxml.inc
new file mode 100644
index 0000000..06322fe
--- /dev/null
+++ b/recipes/libroxml/libroxml.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "Small, fast and powerful xml library"
+AUTHOR = "Tristan Lelong <tristan.lelong@libroxml.net>"
+HOMEPAGE = "http://www.libroxml.net"
+SECTION = "libs"
+PRIORITY = "optional"
+INC_PR = "r0"
+LICENSE = "LGPL"
+
+SRC_URI = "http://libroxml.googlecode.com/files/libroxml-2.1.0.tar.gz"
+
+inherit pkgconfig
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES= ${PN} roxml
+FILES_${PN} = ${libdir}/libroxml.so.0
+FILES_roxml = ${bindir}/roxml
diff --git a/recipes/libroxml/libroxml_2.1.0.bb b/recipes/libroxml/libroxml_2.1.0.bb
new file mode 100644
index 0000000..b3669e1
--- /dev/null
+++ b/recipes/libroxml/libroxml_2.1.0.bb
@@ -0,0 +1,6 @@
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ad1903efa241914baec2fd432a176549"
+SRC_URI[sha256sum] = "bf2d908c330e28e5470fe9a841438b78025dc1406742fc54aad6fa8db401229a"
+
+require libroxml.inc
-- 
1.7.5.4



