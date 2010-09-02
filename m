Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OrA70-0001F4-PP
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 15:46:05 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OrA6Q-0005y5-MF from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 06:45:18 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 2 Sep 2010 15:45:06 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Sep 2010 19:44:08 +0600
Message-Id: <1283435048-13602-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 02 Sep 2010 13:45:06.0371 (UTC)
	FILETIME=[0D51B930:01CB4AA5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH V2] sqlite: Merge target and native recipe using BBCLASSEXTEND, Remove native recipe
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
X-List-Received-Date: Thu, 02 Sep 2010 13:46:41 -0000

* Merge target and native recipes using BBCLASSEXTEND, Set BBCLASSEXTEND = "native"
* Bump PR to "r7"
* Remove sqlite-native_2.8.17 recipe

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/sqlite/sqlite-native_2.8.17.bb |   16 ----------------
 recipes/sqlite/sqlite_2.8.17.bb        |    4 +++-
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/recipes/sqlite/sqlite-native_2.8.17.bb b/recipes/sqlite/sqlite-native_2.8.17.bb
deleted file mode 100644
index a3100fc..0000000
--- a/recipes/sqlite/sqlite-native_2.8.17.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-# This is put at the top to override do_stage later
-inherit native
-
-require sqlite_${PV}.bb
-
-DEPENDS = "readline-native ncurses-native"
-
-FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/sqlite-${PV}"
-
-S = "${WORKDIR}/sqlite-${PV}"
-
-do_install() {
-	:
-}
-
-PACKAGES = ""
diff --git a/recipes/sqlite/sqlite_2.8.17.bb b/recipes/sqlite/sqlite_2.8.17.bb
index b83c583..537db42 100644
--- a/recipes/sqlite/sqlite_2.8.17.bb
+++ b/recipes/sqlite/sqlite_2.8.17.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 PRIORITY = "optional"
 DEPENDS = "readline ncurses"
 LICENSE = "PD"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.hwaci.com/sw/sqlite/sqlite-${PV}.tar.gz \
        file://mainmk_build_dynamic.patch \
@@ -54,3 +54,5 @@ FILES_${PN} = "${libdir}/*.so.*"
 
 SRC_URI[md5sum] = "838dbac20b56d2c4292e98848505a05b"
 SRC_URI[sha256sum] = "3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37"
+
+BBCLASSEXTEND = "native"
-- 
1.6.3.3



