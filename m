Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIi6-0005nJ-9g
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:13:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2705931eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AGVKC+ar3aO59u/ki3bAHNYJJmT/l2bh/iGwqsQIBvc=;
	b=k7v3BNkdSP59T/F8s3anG870BlwYeWzLYKLhZsFOCBbHhycDRcR502cZz3um3XX/Bw
	/5HTHN0haBRJzJ7EaPprG0yc7ejcEOqFfWHMvY8XAyI61z16LnqzRecfdrWX9c2TaVGM
	zLvlgH4MdHiDRTVF13kZYeSoRS6Vj1Q/ohomP/c5kNpXr6p3WgZm/S5SIAuQLAkFdWTx
	wjBdnest2/lyPF5LnsXIjY/bCxb2DbpDGWTXkHeNFf3HQ6hpcbGIKONYwWReryeCnfpr
	Qh7R94223jok92YLgFQRmv03rK6LqI9Xgr9Tpke3prYv9trsTLh/jF05hmumWoblMILT
	mOug==
Received: by 10.14.221.9 with SMTP id q9mr34235571eep.3.1355680711315;
	Sun, 16 Dec 2012 09:58:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w44sm23874865eep.6.2012.12.16.09.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:57:58 +0100
Message-Id: <fdd5a210a9ca3a556f2f0ae726e3c553d18ca7f1.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 15/26] geos: add recipe
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
X-List-Received-Date: Sun, 16 Dec 2012 18:13:11 -0000

From: Jan Luebbe <jluebbe@debian.org>

* MJ: fixed packaging and QA issues

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/geos/geos.inc      | 19 +++++++++++++++++++
 meta-oe/recipes-navigation/geos/geos_3.3.2.bb |  7 +++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/geos/geos.inc
 create mode 100644 meta-oe/recipes-navigation/geos/geos_3.3.2.bb

diff --git a/meta-oe/recipes-navigation/geos/geos.inc b/meta-oe/recipes-navigation/geos/geos.inc
new file mode 100644
index 0000000..eda4ad3
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos.inc
@@ -0,0 +1,19 @@
+DESCRIPTION = "GEOS - Geometry Engine, Open Source"
+HOMEPAGE = "http://trac.osgeo.org/geos/"
+SECTION = "libs"
+
+INC_PR = "r0"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "http://download.osgeo.org/geos/geos-${PV}.tar.bz2"
+
+inherit autotools pkgconfig
+
+# libgeos-${PV}.so is needed in PV
+FILES_SOLIBSDEV = ""
+FIELS_${PN}-dev = "${libdir}/libgeos.so \
+                   ${libdir}/libgeos_c.so"
+FILES_${PN} += " ${libdir}/libgeos-${PV}.so"
+INSANE_SKIP_${PN} = "dev-so"
diff --git a/meta-oe/recipes-navigation/geos/geos_3.3.2.bb b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
new file mode 100644
index 0000000..e57ca6b
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos_3.3.2.bb
@@ -0,0 +1,7 @@
+require geos.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "5b7270c73fd1c516f368af8fd1962323"
+SRC_URI[sha256sum] = "ec64d3a92540a1618aa3b91dc1235caae1c370ec23afd59a2734062bf182ed5b"
+
-- 
1.8.0.2



