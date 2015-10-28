Return-Path: <prvs=736b72a50=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 7F599755F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:08:28 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArcMAIm5MFasEApK/2dsb2JhbABEGoQKbwaqYYkAggWFB4YJFwyFeIILAQEBAQEBgQuFBwEtKIEWDgWINQg7uEMBjBgBAQEBBgIhglKEJYlMQoI1DEOBMQWHRYVWiSKFHIlhSIcPijSIUIJ1HIFXcQGENUGBBgEBAQ
X-IPAS-Result: ArcMAIm5MFasEApK/2dsb2JhbABEGoQKbwaqYYkAggWFB4YJFwyFeIILAQEBAQEBgQuFBwEtKIEWDgWINQg7uEMBjBgBAQEBBgIhglKEJYlMQoI1DEOBMQWHRYVWiSKFHIlhSIcPijSIUIJ1HIFXcQGENUGBBgEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Oct 2015 13:07:19 +0100
Message-ID: <1446034039-1169-1-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [meta-java][PATCH v2] openjdk-7: update to IcedTea 2.6.2 OpenJDK 7u91b01
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 12:08:31 -0000
Content-Type: text/plain

IcedTea 2.6.2 provides OpenJDK 7u91, which adds the October 2015 security
updates. For more details see:
http://blog.fuseyism.com/index.php/2015/10/23/security-icedtea-2-6-2-for-openjdk-7-released/

Furthermore the patches directory for OpenJDK-7 was renamed to avoid the version number.
This makes it easier for upgrades and to see diff's between patches.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
v2: rename patches folder to patches-openjdk-7
	send patch generated with "format-patch -M"
---
 README                                             |  2 +-
 ...lease-85b01.inc => openjdk-7-release-91b01.inc} |  2 +-
 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb      | 35 ----------------------
 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb      | 35 ++++++++++++++++++++++
 .../build-hacks.patch                              |  0
 .../fix_hotspot_crosscompile.patch                 |  0
 .../icedtea-crosscompile-fix.patch                 |  0
 ...a-jdk-build-nio-gensor-genuc-gensc-static.patch |  0
 .../icedtea-jdk-nio-use-host-cc.patch              |  0
 .../icedtea-jdk-rmi-crosscompile.patch             |  0
 .../icedtea-xawt-crosscompile-fix.patch            |  0
 .../icedtea-zero-hotspotfix.patch                  |  0
 .../{openjdk-7-85b01 => patches-openjdk-7}/jvm.cfg |  0
 13 files changed, 37 insertions(+), 37 deletions(-)
 rename recipes-core/openjdk/{openjdk-7-release-85b01.inc => openjdk-7-release-91b01.inc} (97%)
 delete mode 100644 recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
 create mode 100644 recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/build-hacks.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/fix_hotspot_crosscompile.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-crosscompile-fix.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-jdk-nio-use-host-cc.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-jdk-rmi-crosscompile.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-xawt-crosscompile-fix.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/icedtea-zero-hotspotfix.patch (100%)
 rename recipes-core/openjdk/{openjdk-7-85b01 => patches-openjdk-7}/jvm.cfg (100%)

diff --git a/README b/README
index 69821ed..acbe7cb 100644
--- a/README
+++ b/README
@@ -60,7 +60,7 @@ PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
 
 #For openjdk7:
-PREFERRED_VERSION_openjdk-7-jre = "85b01-2.6.1"
+PREFERRED_VERSION_openjdk-7-jre = "91b01-2.6.2"
 PREFERRED_VERSION_icedtea7-native = "2.1.3"
 
 #Sometimes the following is needed:
diff --git a/recipes-core/openjdk/openjdk-7-release-85b01.inc b/recipes-core/openjdk/openjdk-7-release-91b01.inc
similarity index 97%
rename from recipes-core/openjdk/openjdk-7-release-85b01.inc
rename to recipes-core/openjdk/openjdk-7-release-91b01.inc
index cbb28c7..19e640f 100644
--- a/recipes-core/openjdk/openjdk-7-release-85b01.inc
+++ b/recipes-core/openjdk/openjdk-7-release-91b01.inc
@@ -2,7 +2,7 @@ require openjdk-7-common.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-FILESPATH =. "${FILE_DIRNAME}/openjdk-7-85b01:"
+FILESPATH =. "${FILE_DIRNAME}/patches-openjdk-7:"
 
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
diff --git a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb b/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
deleted file mode 100644
index 1ca3b08..0000000
--- a/recipes-core/openjdk/openjdk-7_85b01-2.6.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require openjdk-7-release-85b01.inc
-
-PR = "${INC_PR}.1"
-
-SRC_URI[iced.md5sum] = "efac44117a94b9d3278988959e336e05"
-SRC_URI[iced.sha256sum] = "491866e57199b0bc99d716be3eabaab97d9f6a698d1a652d748baeddeedfe963"
-
-CORBA_CHANGESET = "2545636482d6"
-SRC_URI[corba.md5sum] = "7e821a5fb388d7ba0e29bcadbafea7ac"
-SRC_URI[corba.sha256sum] = "e91886a9e5e1bf5a481bf1bdc9f51a73cfadfc785e06a9d0af754c18b4c7d07a"
-
-JAXP_CHANGESET = "ffbe529eeac7"
-SRC_URI[jaxp.md5sum] = "d28f58c41fa71553cf110e0a2d1fdf05"
-SRC_URI[jaxp.sha256sum] = "2bd11bbd6a9ca5374353db5fa6c45cba1645e628af3c03e614fee1a79baec271"
-
-JAXWS_CHANGESET = "b9776fab65b8"
-SRC_URI[jaxws.md5sum] = "87aaa809c958e45ab882001cdf03a7dd"
-SRC_URI[jaxws.sha256sum] = "1892b1366b9ae90ceb41547067ca79c3e113ecc1eb8bcf447c81768d25b1a1a5"
-
-JDK_CHANGESET = "61d3e001dee6"
-SRC_URI[jdk.md5sum] = "01c56e39df95192cb2542f961b846e1c"
-SRC_URI[jdk.sha256sum] = "4bf866f2da37b7391fa89d205eaa8ad21c56953a922d8969ccfbd77b982dfba9"
-
-LANGTOOLS_CHANGESET = "9c6e1de67d7d"
-SRC_URI[langtools.md5sum] = "b47e31b700ba156e86599eef5994550c"
-SRC_URI[langtools.sha256sum] = "b5fbf91d0af014deb8a3ae3e8ee8d807f8c859351bc5bb767b3597cbe14b8acd"
-
-OPENJDK_CHANGESET = "39b2c4354d0a"
-SRC_URI[openjdk.md5sum] = "3732dfebef27c22ef39fd2280c8fd0ac"
-SRC_URI[openjdk.sha256sum] = "05725e6d4abccf657ed56064d03a2f0ef38363e2ff96011921c948341bcaebe6"
-
-# hotspot changeset taken from hotspot/tags
-HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
-SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
-SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
diff --git a/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
new file mode 100644
index 0000000..2cc79d1
--- /dev/null
+++ b/recipes-core/openjdk/openjdk-7_91b01-2.6.2.bb
@@ -0,0 +1,35 @@
+require openjdk-7-release-91b01.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[iced.md5sum] = "a16b3e800030db9d9b35f80dfd11883a"
+SRC_URI[iced.sha256sum] = "c19eafacd23c81179934acab123511c424cd07c094739fa33778bf7cc80e14d0"
+
+CORBA_CHANGESET = "a4d55c5cec23"
+SRC_URI[corba.md5sum] = "e673f3df063c54d0dda32963e4980605"
+SRC_URI[corba.sha256sum] = "0b3bfa11c912c44b83248f5bb9c630c292409c6137951cd249f8f24c344ec4ad"
+
+JAXP_CHANGESET = "f1202fb27695"
+SRC_URI[jaxp.md5sum] = "2088e60c6893b1ecf127be3c2bcd4dd8"
+SRC_URI[jaxp.sha256sum] = "53de0b094e2bcc173153f5d2fcd3886e8bd9feedec6510474e27ab38472088fc"
+
+JAXWS_CHANGESET = "14c411b1183c"
+SRC_URI[jaxws.md5sum] = "d2474c78e7e300b1b8ebb767209df587"
+SRC_URI[jaxws.sha256sum] = "2c176962cab52263d3b819a303fa0ac29216a3edcddf75b39595e073da13580f"
+
+JDK_CHANGESET = "db69ae53157a"
+SRC_URI[jdk.md5sum] = "5de142350438baf9e4afee021966681a"
+SRC_URI[jdk.sha256sum] = "782c8636475eef9f130718006c20be55974055a8505e241768816f6afd431666"
+
+LANGTOOLS_CHANGESET = "73356b81c5c7"
+SRC_URI[langtools.md5sum] = "f607b5d230c96afb33da25d9f9968b30"
+SRC_URI[langtools.sha256sum] = "eac950fb11b55ecae9a3fec6127cfe48595d02c10a8cad0525b64160463eedf2"
+
+OPENJDK_CHANGESET = "601ca7147b8c"
+SRC_URI[openjdk.md5sum] = "d5c5a54d79e0cf9456c370e578aadbd1"
+SRC_URI[openjdk.sha256sum] = "c1e6924bddff0ddec318364c60f4e0843c1186a0aa9911ce6cf2fd81164cd6a7"
+
+# hotspot changeset taken from hotspot/tags
+HOTSPOT_CHANGESET = "3f1b4a1fe4a2"
+SRC_URI[hotspot.md5sum] = "106b2ec0a8798fbe07f3d838568bd0d8"
+SRC_URI[hotspot.sha256sum] = "39bc54bf343e1dce404b8c95285c0457a8d0a7c7aedfb55055aff9795dd36a85"
diff --git a/recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch b/recipes-core/openjdk/patches-openjdk-7/build-hacks.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/build-hacks.patch
rename to recipes-core/openjdk/patches-openjdk-7/build-hacks.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch b/recipes-core/openjdk/patches-openjdk-7/fix_hotspot_crosscompile.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/fix_hotspot_crosscompile.patch
rename to recipes-core/openjdk/patches-openjdk-7/fix_hotspot_crosscompile.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-crosscompile-fix.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-crosscompile-fix.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-nio-use-host-cc.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-nio-use-host-cc.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-nio-use-host-cc.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-rmi-crosscompile.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-jdk-rmi-crosscompile.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-jdk-rmi-crosscompile.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-xawt-crosscompile-fix.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-xawt-crosscompile-fix.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-xawt-crosscompile-fix.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch b/recipes-core/openjdk/patches-openjdk-7/icedtea-zero-hotspotfix.patch
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/icedtea-zero-hotspotfix.patch
rename to recipes-core/openjdk/patches-openjdk-7/icedtea-zero-hotspotfix.patch
diff --git a/recipes-core/openjdk/openjdk-7-85b01/jvm.cfg b/recipes-core/openjdk/patches-openjdk-7/jvm.cfg
similarity index 100%
rename from recipes-core/openjdk/openjdk-7-85b01/jvm.cfg
rename to recipes-core/openjdk/patches-openjdk-7/jvm.cfg
-- 
2.1.4


