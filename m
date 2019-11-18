Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E210E7F81C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 01:40:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xAI1eu3e000772
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Nov 2019 17:40:56 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 17 Nov 2019 17:40:38 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
Date: Mon, 18 Nov 2019 09:40:35 +0800
Message-ID: <20191118014035.15189-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch] thunar: 1.8.9 -> 1.8.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 01:40:57 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The tarball name uses all lower case now, so SRC_URI and S are not
needded to be set in the recipe which have been configured in
xfce.bbclass already.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../thunar/{thunar_1.8.9.bb => thunar_1.8.10.bb}           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.9.bb => thunar_1.8.10.bb} (74%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
similarity index 74%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
index ff020d0c7..ef64b8f5a 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.10.bb
@@ -8,11 +8,8 @@ inherit xfce gobject-introspection distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
-SRC_URI[md5sum] = "fd1166e879294e4490d5fa9dccfdd9da"
-SRC_URI[sha256sum] = "7a758e7ac03501c520c304f8845353315c954d429b17d591b8eea8b14f1350b9"
-
-S = "${WORKDIR}/Thunar-${PV}/"
+SRC_URI[md5sum] = "85c7394d82542d5a023f1f5baef109d8"
+SRC_URI[sha256sum] = "3d448d81c0e49efbaa5ae6bf34ac3c88a614178a1127afaee6b3a1b5ee12e709"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1


