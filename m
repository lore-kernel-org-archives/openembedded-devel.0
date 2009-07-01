Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58t-0003BC-3x
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:51 +0200
Received: (qmail 31276 invoked by uid 813007); 1 Jul 2009 18:54:55 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:54 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:55 +0200
Message-Id: <1246474496-16704-5-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011818.18407.marcin@juszkiewicz.com.pl>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [STABLE][PATCH 040/125] openssl-native: removed FILESPATH setting which is not needed
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:51 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/openssl/openssl-native_0.9.7g.bb |    2 --
 recipes/openssl/openssl-native_0.9.7m.bb |    2 --
 recipes/openssl/openssl-native_0.9.8g.bb |    2 --
 recipes/openssl/openssl-native_0.9.8j.bb |    2 --
 4 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/recipes/openssl/openssl-native_0.9.7g.bb b/recipes/openssl/openssl-native_0.9.7g.bb
index 14f6d92..dfe3ab5 100644
--- a/recipes/openssl/openssl-native_0.9.7g.bb
+++ b/recipes/openssl/openssl-native_0.9.7g.bb
@@ -8,8 +8,6 @@ SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
             file://gnueabi-arm.patch;patch=1"
 
-FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 do_install() {
 	:
 }
diff --git a/recipes/openssl/openssl-native_0.9.7m.bb b/recipes/openssl/openssl-native_0.9.7m.bb
index b00dc5e..445b6e9 100644
--- a/recipes/openssl/openssl-native_0.9.7m.bb
+++ b/recipes/openssl/openssl-native_0.9.7m.bb
@@ -12,8 +12,6 @@ SRC_URI += "file://debian.patch;patch=1 \
             file://armeb.patch;patch=1;pnum=0 \
             file://gnueabi-arm.patch;patch=1"
 
-FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 do_install() {
 	:
 }
diff --git a/recipes/openssl/openssl-native_0.9.8g.bb b/recipes/openssl/openssl-native_0.9.8g.bb
index 1ad90a0..a5aa9ec 100644
--- a/recipes/openssl/openssl-native_0.9.8g.bb
+++ b/recipes/openssl/openssl-native_0.9.8g.bb
@@ -16,8 +16,6 @@ SRC_URI += "file://debian.patch;patch=1 \
 
 PARALLEL_MAKE = ""
 
-FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 do_install() {
 	:
 }
diff --git a/recipes/openssl/openssl-native_0.9.8j.bb b/recipes/openssl/openssl-native_0.9.8j.bb
index 5f3e307..7189cec 100644
--- a/recipes/openssl/openssl-native_0.9.8j.bb
+++ b/recipes/openssl/openssl-native_0.9.8j.bb
@@ -16,8 +16,6 @@ SRC_URI += "file://configure-targets.patch;patch=1 \
 
 PARALLEL_MAKE = ""
 
-FILESPATH = "${@base_set_filespath( ['${FILE_DIRNAME}/openssl-${PV}', '${FILE_DIRNAME}/openssl', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
-
 do_install() {
 	:
 }
-- 
1.6.3.1





