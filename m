Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letay-0005eW-E7
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:20 +0100
Received: (qmail 28770 invoked by uid 813007); 4 Mar 2009 15:54:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:27 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQJ-0001Fz-NR; Wed, 04 Mar 2009 16:54:19 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:22 +0100
Message-Id: <1236182004-4523-68-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 68/70] libxml2-native: really enable Python extension
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

---
 packages/libxml/libxml2-native.inc      |    5 ++---
 packages/libxml/libxml2-native_2.7.2.bb |    2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/packages/libxml/libxml2-native.inc b/packages/libxml/libxml2-native.inc
index 603f48d..b819f95 100644
--- a/packages/libxml/libxml2-native.inc
+++ b/packages/libxml/libxml2-native.inc
@@ -1,7 +1,6 @@
 DESCRIPTION = "GNOME XML library"
 DEPENDS = "python-native"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libxml2-${PV}"
-PR = "r3"
 
 SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz"
 S = "${WORKDIR}/libxml2-${PV}"
@@ -9,10 +8,10 @@ S = "${WORKDIR}/libxml2-${PV}"
 inherit distutils-base autotools native pkgconfig
 
 EXTRA_OECONF = "\
-  --with-python=${STAGING_INCDIR}/${PYTHON_MAJMIN} \
+  --with-python=${PYTHON_DIR} \
   --without-debug \
   --without-legacy \
-  --without-catalog \
+  --with-catalog \
   --without-docbook \
   --with-c14n \
 "
diff --git a/packages/libxml/libxml2-native_2.7.2.bb b/packages/libxml/libxml2-native_2.7.2.bb
index 48e3598..bcbfb66 100644
--- a/packages/libxml/libxml2-native_2.7.2.bb
+++ b/packages/libxml/libxml2-native_2.7.2.bb
@@ -1,2 +1,2 @@
 require libxml2-native.inc
-PR = "r0"
+PR = "r1"
-- 
1.6.1.3





