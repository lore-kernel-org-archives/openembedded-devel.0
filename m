Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OecFj-0003v0-IX
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 01:11:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id D533943D3F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:10:44 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz D533943D3F
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280445044; i=@fjfi.cvut.cz; bh=edySfn3/yFPZhPSFZSkwartdkjc=;
	h=In-Reply-To:References:From:Date:Subject:To:Message-Id;
	b=T+/VGy4BBm2wpdd0J4ugnHXRTPCuMDktv9dB3wgcQCtTLs5m8cQWIkoC8Kb7R1MAG
	THnqhtuQBsNGvaFbPk+NQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id hOSNtw+6Wj-V
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:10:42 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 6107143D38
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 01:10:42 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 6107143D38
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 6107143D38
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 5431446774; Fri, 30 Jul 2010 01:10:42 +0200 (CEST)
In-Reply-To: <AANLkTimgJJsUZWSgW42aZH77fX2oboM=ahhCt_H0Z4y6@mail.gmail.com>
References: <AANLkTimgJJsUZWSgW42aZH77fX2oboM=ahhCt_H0Z4y6@mail.gmail.com>
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Thu, 29 Jul 2010 20:11:36 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100729231042.5431446774@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06, RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cmake-2.8.2: Add recipe for non-native cmake 2.8.2.
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
X-List-Received-Date: Thu, 29 Jul 2010 23:11:05 -0000

Tested on om-gta02:
* builds trivial C and C++ executable
* "include(FindPkgConfig)" correctly finds the cmake module
* pkg_check_modules correctly invokes pkg-config
* ccmake works

Also tested on babbage by Eduardo Lima (thanks for help).

Unfortunately, useful doc is not packaged. The reason is that the doc
is produced by running the built binaries. Changing this would probably
require a complex patch of the build process. Luckily, the doc is
still contained in the original binaries, so it's accessible on target
by e.g. cmake --help-full.

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 .../cmake-2.8.2/dont-run-cross-binaries.patch      |   13 ++++++
 recipes/cmake/cmake_2.8.2.bb                       |   46 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
 create mode 100644 recipes/cmake/cmake_2.8.2.bb

diff --git a/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch b/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
new file mode 100644
index 0000000..4a006f9
--- /dev/null
+++ b/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
@@ -0,0 +1,13 @@
+diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
+--- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
++++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
+@@ -518,7 +518,8 @@
+ 
+ # build the remaining subdirectories
+ ADD_SUBDIRECTORY(Source)
+-ADD_SUBDIRECTORY(Utilities)
++# Come on! Running the cross-binaries on host is not a good idea.
++#ADD_SUBDIRECTORY(Utilities)
+ ADD_SUBDIRECTORY(Tests)
+ 
+ # add a test
diff --git a/recipes/cmake/cmake_2.8.2.bb b/recipes/cmake/cmake_2.8.2.bb
new file mode 100644
index 0000000..41ba813
--- /dev/null
+++ b/recipes/cmake/cmake_2.8.2.bb
@@ -0,0 +1,46 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib"
+
+SRC_URI += "file://dont-run-cross-binaries.patch"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=bb.data.getVar("prefix", d, 1)
+    docdir=bb.data.getVar("docdir", d, 1)
+
+    if not docdir.startswith(prefix):
+	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+	docdir_stripped = docdir_stripped[1:]
+
+    bb.data.setVar("docdir_stripped", docdir_stripped, d)
+}
+
+EXTRA_OECMAKE=" \
+# Override default "doc" (this is relative to ${prefix})
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-2.8 \
+# Using system libs spares us some cmake cross trouble.
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+# This is compiler & target dependant, but it seems cmake does not in fact use this value.
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+# This disables large file support. Hopefully nobody processes >2G files on the target.
+# If you want to enable this, add -DWKSYS_LFS_WORKS=1
+    -DKWSYS_LFS_DISABLE=1 \
+"
+
+SRC_URI[md5sum] = "8c967d5264657a798f22ee23976ff0d9"
+SRC_URI[sha256sum] = "766ff169af798599d7dd42e41e9f4533d73942a2bb928235115412dce5b81406"
+
+FILES_${PN} += "${datadir}/cmake-2.8"
+
+# The doc is quite... absent. Just the licensing information is there.
+# Real doc was nuked by dont-run-cross-binaries.patch. Fixing the doc
+# generation would be quite complicated, as cmake build process innovatively
+# runs the generated binaries to extract help contained in them.
+# -> Fixing this is probably not worth it.
+FILES_${PN}-doc += "${docdir}/cmake-2.8"
-- 
1.7.1



