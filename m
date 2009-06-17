Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MGu5d-0008C3-D7
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 14:18:05 +0200
Received: (qmail 15858 invoked by uid 813007); 17 Jun 2009 12:07:39 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jun 2009 12:07:39 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2009 14:07:22 +0200
Message-Id: <1245240442-32628-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
Cc: Marcin Juszkiewicz <marcin@buglabs.net>
Subject: [STABLE][PATCH] fbprogress: make it work better
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
X-List-Received-Date: Wed, 17 Jun 2009 12:18:05 -0000

From: Marcin Juszkiewicz <marcin@buglabs.net>

- images are kept in /usr/share/fbprogress
- proper framebuffer is used
- include paths and libraries to link with are given in recipe instead
  of makefile

Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
---
 recipes/fbprogress/fbprogress_1.1.bb |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/recipes/fbprogress/fbprogress_1.1.bb b/recipes/fbprogress/fbprogress_1.1.bb
index 8d603b8..855d1ca 100644
--- a/recipes/fbprogress/fbprogress_1.1.bb
+++ b/recipes/fbprogress/fbprogress_1.1.bb
@@ -3,8 +3,8 @@ AUTHOR = "Angel Roman"
 HOMEPAGE = "http://www.buglabs.net/"
 LICENSE = "GPL"
 DEPENDS = "freetype zlib virtual/kernel"
-SRCREV = "9118"
-PR = "r1"
+SRCREV = "9405"
+PR = "r2"
 
 SRC_URI = "svn://svn.buglabs.net/bug/trunk;module=com.buglabs.bug.native.fbprogress;proto=svn \
            file://fbprogress-init"
@@ -13,14 +13,17 @@ S = "${WORKDIR}/com.buglabs.bug.native.fbprogress"
 
 inherit update-rc.d
 
-EXTRA_OEMAKE = "BUG_LINUX_SRC=${STAGING_KERNEL_DIR}"
+TARGET_CXXFLAGS += "-I${STAGING_INCDIR}/freetype2 -I${STAGING_KERNEL_DIR}/include"
+TARGET_LDFLAGS  += "-L${STAGING_LIBDIR} -lfreetype -lz"
 
 do_install() {
-  install -d ${D}/${sysconfdir}/fbprogress
-  install -m 0644 ${S}/images/* ${D}/${sysconfdir}/fbprogress/
-  install -d ${D}${layout_bindir}
-  install -m 0755 fbprogress ${D}${layout_bindir}
-  install -m 0755 fbprogress.sh ${D}${layout_bindir}
+  install -d ${D}/${datadir}/fbprogress
+  install -m 0644 ${S}/images/* ${D}/${datadir}/fbprogress/
+
+  install -d ${D}${bindir}
+  install -m 0755 fbprogress ${D}${bindir}
+  install -m 0755 fbprogress.sh ${D}${bindir}
+
   install -d ${D}/${sysconfdir}/init.d
   install -m 0755 ${WORKDIR}/fbprogress-init ${D}/${sysconfdir}/init.d/fbprogress
 }
-- 
1.6.3.1





