Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1StaGG-0004CI-Ao
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 10:14:32 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so4724362bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Crt+DGZdZDaJtsmBg7Z1BXJDg/8awHxFIyVnSfFRqKw=;
	b=pyWrh1gA0V0YUQq/JumZa7oWzm0HDsVyhqFC6XWywHzH+NAZVf9f5eKftyqjzCr+2n
	25DyDS2F8ZHqphGEjqJPLF1NGhZhTlBDgfLHtZdZdks+MxYs5rKZsSAqroaoquzoPfyI
	wZXKVzvgBaklWoQe9KfjtwCi3AgaFwa7LQyp0UVgCu1uZSjP0oYU7J2CZyRb06rvajx5
	Eh7+kdMhJmFnX2NENCMlLleunHcdl12YvzImD+ayKXXXkCYIAoGRN5RoKDHp27J9ukLa
	sP69tPonFqMQKVTr4NosPiZlNr9IBeRnGUL7Dbb1eWs5623gbvM4D9bxqeVUaWrwsAUa
	zfYQ==
Received: by 10.204.145.90 with SMTP id c26mr9593509bkv.34.1343116986486;
	Tue, 24 Jul 2012 01:03:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm9654419bkc.3.2012.07.24.01.03.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 01:03:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:02:54 +0200
Message-Id: <b67c23022fb257be3b7fb06c4797389ce240f841.1343116924.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343116924.git.Martin.Jansa@gmail.com>
References: <cover.1343116924.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] gpsd: inherit pythonnative
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
X-List-Received-Date: Tue, 24 Jul 2012 08:14:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |    4 ++--
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb |    4 ++--
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 4f3d2d7..16fa739 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
@@ -21,7 +21,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
 SRC_URI[md5sum] = "c01353459faa68834309109d4e868460"
 SRC_URI[sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
 
-inherit scons update-rc.d python-dir
+inherit scons update-rc.d python-dir pythonnative
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 3cac186..1b1809f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r3"
+PR = "r4"
 
 DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
@@ -22,7 +22,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
 SRC_URI[md5sum] = "e96881798a0ab67aa3cd5f3249f0e536"
 SRC_URI[sha256sum] = "5ebb0b00c49421eb8fbead81342e5ce63e82065e5ff27da586f10e342b999171"
 
-inherit scons update-rc.d python-dir
+inherit scons update-rc.d python-dir pythonnative
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 1c7d76f..8404ba1 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
+PR = "r3"
 
 SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
 
@@ -25,7 +25,7 @@ SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
 "
 S = "${WORKDIR}/git"
 
-inherit scons update-rc.d python-dir
+inherit scons update-rc.d python-dir pythonnative
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
-- 
1.7.8.6



