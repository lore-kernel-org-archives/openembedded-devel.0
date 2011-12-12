Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1Ra1of-0001zl-W6
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Dec 2011 10:04:58 +0100
Received: by localhost (Postfix, from userid 1000)
	id 57623442EE6; Mon, 12 Dec 2011 09:58:03 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Dec 2011 09:58:01 +0100
Message-Id: <1323680281-3762-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] openjdk: fix problem on build hosts with linux kernel 3.x
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
X-List-Received-Date: Mon, 12 Dec 2011 09:04:58 -0000

see http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=7072341

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/openjdk/openjdk-6-common.inc |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/recipes/openjdk/openjdk-6-common.inc b/recipes/openjdk/openjdk-6-common.inc
index 54c45f8..59a7a56 100644
--- a/recipes/openjdk/openjdk-6-common.inc
+++ b/recipes/openjdk/openjdk-6-common.inc
@@ -10,7 +10,7 @@ ICEDTEA = "NEEDS TO BE SET"
 S = "${WORKDIR}/${ICEDTEA}"
 B = "${S}/build"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 SRC_URI = "\
   ${ICEDTEA_URI} \
@@ -208,6 +208,13 @@ do_configure_prepend() {
 
 do_configure_append() {
 	oe_runmake patch-ecj
+
+	for F in ${WORKDIR}/openjdk-src-dir/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk-ecj/hotspot/make/linux/Makefile ${WORKDIR}/icedtea6-1.8.5/build/openjdk/hotspot/make/linux/Makefile ;
+	do
+		sed -i \
+			-e"s|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 2.7%|SUPPORTED_OS_VERSION = 2.4% 2.5% 2.6% 3%|" \
+			$F
+	done
 }
 
 # Work around broken variable quoting in oe-stable 2009 and provide the variable
-- 
1.7.5.4



