Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQEd3-00063H-0K
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 10:12:13 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2033900fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ST5RsEKCnYj2aBng9BLn/HQstgxr7JxKH5LUvz9QVwU=;
	b=cZQPly6QoYAP0vOUSBj3WGL3XbxTWuM2QowNufkHVrdVmwvvKlSw3pOXzg7oLXtNk6
	1R82mJXaR+V+KwuB0G78On+FZZRKeWM9ELK4/SvbpAgHYUJnHkvI914ti8yd6wFVQMEL
	H1hFHRjgNGGNhQWrK8TL6dWwCRLL+si+F1Udc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=pGLoafAZSJP0Z/N8ASsWHyGxpwON1iUA8gV8S+b5QbL1jTVUvk8F3KOObgVryzifuf
	S+ypWO44nn6fIGbdl12cPWyEpvzP5gMXB3FSppz9CsVjerd7IvnWWRZfJq2vp3Ax6K9y
	qlaY17wmNZhgU99kP44WteISdRDEpx2J17O2o=
Received: by 10.223.97.219 with SMTP id m27mr929937fan.81.1306570148122;
	Sat, 28 May 2011 01:09:08 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c1sm87839faa.37.2011.05.28.01.09.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 01:09:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 May 2011 10:09:04 +0200
Message-Id: <1306570144-17979-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <20110528080123.GR3222@jama.jama.net>
References: <20110528080123.GR3222@jama.jama.net>
Subject: [PATCH] qt4: remove qte.sh from shared SRC_URI and PACKAGE_ARCH_palmpre
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
X-List-Received-Date: Sat, 28 May 2011 08:12:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/qt4/qt-4.6.3.inc          |    3 ---
 recipes/qt4/qt-4.7.3.inc          |    3 ---
 recipes/qt4/qt4-embedded.inc      |    3 ---
 recipes/qt4/qt4-embedded_4.6.3.bb |    4 ++++
 recipes/qt4/qt4-embedded_4.7.3.bb |    4 ++++
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
index a35d57a..36c6a56 100644
--- a/recipes/qt4/qt-4.6.3.inc
+++ b/recipes/qt4/qt-4.6.3.inc
@@ -19,9 +19,6 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://linux.conf \
            "
 
-# Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
-
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 do_configure_prepend() {
diff --git a/recipes/qt4/qt-4.7.3.inc b/recipes/qt4/qt-4.7.3.inc
index 2450144..b29d892 100644
--- a/recipes/qt4/qt-4.7.3.inc
+++ b/recipes/qt4/qt-4.7.3.inc
@@ -16,9 +16,6 @@ SRC_URI = "\
 	file://linux.conf \
 	"
 
-# Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
-
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 147126d..168a867 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -28,9 +28,6 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${
 # Set necessary variables in the profile
 SRC_URI += "file://qte.sh"
 
-# For the palmpre we ship a modified qte.sh
-PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
-
 S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
 
 QT_CONFIG_FLAGS += " \
diff --git a/recipes/qt4/qt4-embedded_4.6.3.bb b/recipes/qt4/qt4-embedded_4.6.3.bb
index fe49fdb..8c883f5 100644
--- a/recipes/qt4/qt4-embedded_4.6.3.bb
+++ b/recipes/qt4/qt4-embedded_4.6.3.bb
@@ -5,3 +5,7 @@ PR = "${INC_PR}.2"
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 require qt-${PV}.inc
+
+# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh lost
+# Set necessary variables in the profile
+SRC_URI += "file://qte.sh"
diff --git a/recipes/qt4/qt4-embedded_4.7.3.bb b/recipes/qt4/qt4-embedded_4.7.3.bb
index 7e3d4b8..47176a9 100644
--- a/recipes/qt4/qt4-embedded_4.7.3.bb
+++ b/recipes/qt4/qt4-embedded_4.7.3.bb
@@ -8,6 +8,10 @@ QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
 require qt-${PV}.inc
 
+# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh lost
+# Set necessary variables in the profile
+SRC_URI += "file://qte.sh"
+
 QT_CONFIG_FLAGS += " \
  -exceptions \
 "
-- 
1.7.5.rc3



