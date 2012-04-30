Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKx-0004Uh-Bl
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:55 +0200
Received: by mail-wi0-f169.google.com with SMTP id hm17so2032732wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Mi/hEoquNZ9Q3OaCQ/kmwvTGzMcIHgYrGy8EmFUrtdw=;
	b=fyxtiB9WaTLY6zl1D0Mcb27xSNORZsXd6Y5DrDGkFyjMI3N4PUFwh7vattvjJ+f2A5
	kzLrI+LObCv/GDNEAudgld97mNTKc+ILdTpeddE2j6kPum5XIScxYBrChehL8u3AY9B5
	8W6yqcAlvtMyDhceV03oyajJpU5l/pDrMmJ7zWlC922efM4UgX+mVxlkRA6EuQozGnQ0
	ww1YE7yrLVEiyduMIEetsivwhn7hfu/DFWVY3ppVGgcFK4hB8nvKLL4CG6Z+Pq0bkK7r
	sRjYcGCTu32bHxyNoDspshE07Go/k3Y/gDZdsuUrE7an4RRN0DG/NPDhwatu03q+KSMS
	i2lA==
Received: by 10.180.19.202 with SMTP id h10mr12880782wie.0.1335767655620;
	Sun, 29 Apr 2012 23:34:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm41895179wib.8.2012.04.29.23.34.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:04 +0200
Message-Id: <112193fcdfa67a581b5a218a2c766d507f972746.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/16] gpsd: export PKG_CONFIG with PKG_CONFIG_SYSROOT_DIR
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:55 -0000

* python-scons-native executes pkg-config with wrong environment and as result -I/usr/include/libusb-1.0 is returned

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 7502f9a..37fb79d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -41,6 +41,7 @@ EXTRA_OESCONS = " \
 
 do_compile_prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
 
     export BUILD_SYS="${BUILD_SYS}"
@@ -49,6 +50,7 @@ do_compile_prepend() {
 
 do_install_prepend() {
     export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
     export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
 
     export BUILD_SYS="${BUILD_SYS}"
-- 
1.7.8.6



