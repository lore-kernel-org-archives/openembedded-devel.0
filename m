Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UHwAC-0007ul-5d
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Mar 2013 14:01:18 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Mar 2013 13:44:20 +0100
Message-Id: <1363697060-22628-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-multimedia][PATCH] libmusicbrainz: fix subsequent invocations of do_configure
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
X-List-Received-Date: Tue, 19 Mar 2013 13:01:18 -0000

Every second invocation of do_configure failed with this error:

| CMake Error at src/CMakeLists.txt:19 (INCLUDE):
|   include could not find load file:
|
|     [...]/git/build-native/ImportExecutables.cmake

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb        |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index 051db7b..f6a8f53 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat neon"
 
 PV = "5.0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
@@ -21,8 +21,9 @@ inherit cmake pkgconfig
 
 do_configure_prepend() {
     # The native build really doesn't like being rebuilt, so delete
-    # it if it's already present.
-    rm -rf build-native
+    # it if it's already present. Also delete all other files not
+    # known to Git to fix subsequent invocations of do_configure.
+    git clean -dfx -e /.pc/ -e /patches/ .
     mkdir build-native
     cd build-native
     cmake -DCMAKE_C_FLAGS=${BUILD_CFLAGS} \
-- 
1.7.10.4



