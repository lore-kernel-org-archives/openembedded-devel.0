Return-Path: <martin@geanix.com>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 23 Aug 2018 12:17:53 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id BED8974966
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2018 12:17:53 +0000 (UTC)
Received: from xps.local (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 10D781C1281;
	Thu, 23 Aug 2018 14:11:15 +0200 (CEST)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Aug 2018 14:11:08 +0200
Message-Id: <20180823121108.16874-1-martin@geanix.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH] ell: update to 0.8
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
X-List-Received-Date: Thu, 23 Aug 2018 12:17:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove backported patch and make reconfiguration work by allowing the
build-aux folde to exist already.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta-oe/recipes-core/ell/{ell_0.6.bb => ell_0.8.bb} | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-core/ell/{ell_0.6.bb => ell_0.8.bb} (58%)

diff --git a/meta-oe/recipes-core/ell/ell_0.6.bb b/meta-oe/recipes-core/ell/ell_0.8.bb
similarity index 58%
rename from meta-oe/recipes-core/ell/ell_0.6.bb
rename to meta-oe/recipes-core/ell/ell_0.8.bb
index 399eddb07..0428cab28 100644
--- a/meta-oe/recipes-core/ell/ell_0.6.bb
+++ b/meta-oe/recipes-core/ell/ell_0.8.bb
@@ -7,14 +7,11 @@ SECTION = "libs"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "59ff3160fe55a841e662f8776f0520f2038235f4"
-SRC_URI = " \
-    git://git.kernel.org/pub/scm/libs/ell/ell.git \
-    file://0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch \
-"
+SRCREV = "d572281caedef357c392a7c9aa65a3b21a18cfdb"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
 
 do_configure_prepend () {
-    mkdir ${S}/build-aux
+    mkdir -p ${S}/build-aux
 }
 
 DEPENDS = "dbus"
-- 
2.18.0


