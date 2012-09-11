Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBUMU-0003Ob-Ki
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 19:34:58 +0200
Received: by wibhn17 with SMTP id hn17so807845wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=9uGjo2c3vwGnnxU0amKLdqGwuF0LiURvhqw2ivXw1Qs=;
	b=IT2D6iaQGl/8wVi+O0QSksl4XePWLWQEv7H21+6YAGChqE6BgyHqFKzH4K3yg25EDU
	XUB/s/BC2saDpk2+l2ke8MXVhz2o01iC/z1vu8dLwn6ffWbu0jmgiKOAXlthu+rhbn5V
	PNTPEWj5ykfC2haqJzg2iwPZA4Q+4q0uK+tPjyT1bBkpaZ7xBUE2UibsTtO3cRzO52sV
	U8JdrBGnPw47CearWf7wXaVqj0WN0Oj/CD8kD7gIILshvcmE52O9WWQJ0/pu+bO479tv
	+biBbdeilUqSMmB0v94vFxMPc+9cDj6kMrlFQiNvqGyQJFqfo/EhSUBUDvwa/yt2o0md
	RxWg==
Received: by 10.217.2.146 with SMTP id p18mr10634113wes.198.1347384147501;
	Tue, 11 Sep 2012 10:22:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fr4sm5267883wib.8.2012.09.11.10.22.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 10:22:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 19:22:24 +0200
Message-Id: <d010c0650b8331d97e5cf5681930f73da7de2d29.1347384123.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347384123.git.Martin.Jansa@gmail.com>
References: <cover.1347384123.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 6/6] mcnavi: fix do_configure_prepend to be reentrant
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
X-List-Received-Date: Tue, 11 Sep 2012 17:34:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
index f4d594f..35c304c 100644
--- a/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
+++ b/meta-oe/recipes-navigation/mcnavi/mcnavi_0.3.3.bb
@@ -4,6 +4,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
 DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5"
 
+PR = "r1"
+
 SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
 SRC_URI[md5sum] = "acc07debcdb3ef448b95e6a6cfcf53d8"
 SRC_URI[sha256sum] = "d3ce1f5901f13985d877b2b6ad06b64094ba43a4e13cbfe06c7cb2f1abdda309"
@@ -12,7 +14,7 @@ S = "${WORKDIR}/${PN}"
 
 do_configure_prepend() {
   # for some reason our mysql_config returns just sysroot/include_dir while mysql.h is in include_dir/mysql
-  sed -i 's#`mysql_config --include`#`mysql_config --include`/mysql#g' ${S}/configure.ac
+  sed -i 's#`mysql_config --include`$#`mysql_config --include`/mysql#g' ${S}/configure.ac
 }
 
 inherit autotools
-- 
1.7.12



