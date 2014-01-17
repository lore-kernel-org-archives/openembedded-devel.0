Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id B2B8F60154
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 14:59:25 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2180728eei.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2014 06:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ZGFTgTwrx6DZ+8Zp0pCioR0Kj6iKeANq5UEntGENJhY=;
	b=zFSKjcYs1uAvWeAtfq5H5gQzIgzr5kSFyWpNzt/fRlw5yIvS9Kbgc/FHI1wTrOFhv/
	H/JqqgmPvSggvMfFEar2e7RK1rNgLAB0c3847V/5SXURRjvEECjVk6AVXmK6KdYTSvBx
	HUn1lYo6bduUo4+DR0X0EuAfHKjwhzIaRgT0FFilpKqDkZHF0HTDQLF1Qw33ZYfhyAEb
	xyRHt+mZhdmUNatIkvo0nhYIRzyVR5hSUcv/LueDbk/y03SRuTuzB4DbSzi7nFq/kNOw
	TbnyuPRgqv2F9PXed+bFg/s0QpsN0Ptv3KQWrb6WU0tfk6NVTgdq4QKlgYshp7uqx0uH
	QwDA==
X-Received: by 10.14.203.6 with SMTP id e6mr2980602eeo.33.1389970765666;
	Fri, 17 Jan 2014 06:59:25 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id m47sm27471971eey.7.2014.01.17.06.59.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 06:59:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2014 15:59:18 +0100
Message-Id: <1389970758-23207-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qttools: add target build
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
X-List-Received-Date: Fri, 17 Jan 2014 14:59:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this does not build much yet but I was looking for qdbus

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/qttools.inc                         | 12 ++++++++
 ...t-help-fix-linking-of-dependent-libraries.patch | 32 ++++++++++++++++++++++
 recipes-qt/qt5/qttools_5.2.0.bb                    |  5 ++++
 3 files changed, 49 insertions(+)
 create mode 100644 recipes-qt/qt5/qttools.inc
 create mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
 create mode 100644 recipes-qt/qt5/qttools_5.2.0.bb

diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
new file mode 100644
index 0000000..e96a678
--- /dev/null
+++ b/recipes-qt/qt5/qttools.inc
@@ -0,0 +1,12 @@
+DEPENDS += "qtbase"
+
+QT_MODULE = "qttools"
+
+require qt5.inc
+
+SRC_URI += " \
+	file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
+"
+
+FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
+
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
new file mode 100644
index 0000000..0f95333
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -0,0 +1,32 @@
+From 26228d3ed02a4a244d01b3cc2bf3633f25797bb7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 17 Jan 2014 14:33:19 +0100
+Subject: [PATCH] assistant/help: fix linking of dependent libraries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+else we get:
+| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not found (try using -rpath or -rpath-link)
+| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/assistant/help/help.pro | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
+index ed75c37..a2c55c7 100644
+--- a/src/assistant/help/help.pro
++++ b/src/assistant/help/help.pro
+@@ -70,3 +70,5 @@ HEADERS += qhelpenginecore.h \
+ # access to clucene
+ HEADERS += qhelpsearchindexwriter_clucene_p.h \
+     qhelpsearchindexreader_clucene_p.h
++
++LIBS += -lQt5CLucene
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qttools_5.2.0.bb b/recipes-qt/qt5/qttools_5.2.0.bb
new file mode 100644
index 0000000..0effa1b
--- /dev/null
+++ b/recipes-qt/qt5/qttools_5.2.0.bb
@@ -0,0 +1,5 @@
+require qt5-${PV}.inc
+require ${PN}.inc
+
+SRC_URI[md5sum] = "76a0992967b6d02220ecb69a5ba04ef1"
+SRC_URI[sha256sum] = "ff331510ecb776b3059953e216e9fa7a4c0736eeb148c4cf11acc8150811b7f0"
-- 
1.8.3.1


