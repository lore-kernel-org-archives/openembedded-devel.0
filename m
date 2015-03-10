Return-Path: <magnus@minimum.se>
Received: from mail.glesys.se (mail.glesys.se [195.238.77.166])
	by mail.openembedded.org (Postfix) with ESMTP id 7C94673A07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 12:20:54 +0000 (UTC)
Received: from DEV095.hms.se (smtp.hms.se [88.131.56.171])
	(Authenticated sender: magnus@minimum.se)
	by mail.glesys.se (Postfix) with ESMTPSA id 07E836010B4;
	Tue, 10 Mar 2015 13:18:00 +0100 (CET)
From: Magnus Olsson <magnus@minimum.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 13:19:54 +0100
Message-Id: <1425989994-22071-1-git-send-email-magnus@minimum.se>
X-Mailer: git-send-email 1.9.1
Subject: [meta-java][PATCH] initials: silence "populate_sysroot manifest not found" warnings
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
X-List-Received-Date: Tue, 10 Mar 2015 12:20:54 -0000

A number of recipes in meta-java use autotools.bbclass for building; internally
it uses the sstate-control populate_sysroot manifests to locate and copy
aslocals for configure dependencies as part of the do_configure step.
The manifest path differs depending on if it's a native package or not so
autotools.bbclass looks at the package name to determine if its native or not
(it's native if it ends with "-native").

The warnings are emitted because a few (native) recipes in meta-java (such as
cacao-initial, classpath-initial and more) are incorrectly being classified as
non-native by autotools.bbclass, which makes it look for the manifest in the
wrong place and finally gives up with the warning:

WARNING: /home/oe/tmp-glibc/sstate-control/manifest-mymachine-libecj-bootstrap.populate_sysroot not found

This happens for cacao-initial, classpath-initial, ecj-initial, libecj-boostrap,
jamvm-initial and jikes-initial since they are all native and rely on autotools.

This patch renames the recipes so they end with -native, e.g ecj-initial-native.
It also updates the recipes so they DEPEND on the corresponding new name. This
helps autotools.bbclass to properly classify the recipes are native and silence
the warnings.

Signed-off-by: Magnus Olsson <magnus@minimum.se>
---
 .../cacao/{cacao-initial_0.98.bb => cacao-initial-native_0.98.bb}       | 2 +-
 recipes-core/cacao/cacao_1.6.1.bb                                       | 2 +-
 .../{classpath-initial_0.93.bb => classpath-initial-native_0.93.bb}     | 0
 recipes-core/classpath/classpath-native_0.99.bb                         | 2 +-
 recipes-core/ecj/ecj-bootstrap-native.bb                                | 2 +-
 recipes-core/ecj/{ecj-initial.bb => ecj-initial-native.bb}              | 2 +-
 .../ecj/{libecj-bootstrap_3.6.2.bb => libecj-bootstrap-native_3.6.2.bb} | 0
 recipes-core/ecj/libecj-bootstrap.inc                                   | 2 +-
 .../jamvm/{jamvm-initial_1.4.5.bb => jamvm-initial-native_1.4.5.bb}     | 2 +-
 recipes-core/jamvm/jamvm.inc                                            | 2 +-
 recipes-core/jikes/{jikes-initial.bb => jikes-initial-native.bb}        | 2 +-
 11 files changed, 9 insertions(+), 9 deletions(-)
 rename recipes-core/cacao/{cacao-initial_0.98.bb => cacao-initial-native_0.98.bb} (97%)
 rename recipes-core/classpath/{classpath-initial_0.93.bb => classpath-initial-native_0.93.bb} (100%)
 rename recipes-core/ecj/{ecj-initial.bb => ecj-initial-native.bb} (95%)
 rename recipes-core/ecj/{libecj-bootstrap_3.6.2.bb => libecj-bootstrap-native_3.6.2.bb} (100%)
 rename recipes-core/jamvm/{jamvm-initial_1.4.5.bb => jamvm-initial-native_1.4.5.bb} (94%)
 rename recipes-core/jikes/{jikes-initial.bb => jikes-initial-native.bb} (90%)

diff --git a/recipes-core/cacao/cacao-initial_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
similarity index 97%
rename from recipes-core/cacao/cacao-initial_0.98.bb
rename to recipes-core/cacao/cacao-initial-native_0.98.bb
index ad9436b..181faca 100644
--- a/recipes-core/cacao/cacao-initial_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -8,7 +8,7 @@ PROVIDES = "virtual/java-initial"
 
 inherit native autotools-brokensep
 
-DEPENDS = "zlib-native libtool-native fastjar-native classpath-initial jikes-initial"
+DEPENDS = "zlib-native libtool-native fastjar-native classpath-initial-native jikes-initial-native"
 
 SRC_URI = "\
         http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2; \
diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 2bd06c6..9f07946 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-DEPENDS_class-native = "zlib-native libtool-native ecj-initial fastjar-native classpath-native"
+DEPENDS_class-native = "zlib-native libtool-native ecj-initial-native fastjar-native classpath-native"
 PROVIDES_class-native = "virtual/java-native"
 
 DEPENDS = "zlib libtool classpath virtual/javac-native"
diff --git a/recipes-core/classpath/classpath-initial_0.93.bb b/recipes-core/classpath/classpath-initial-native_0.93.bb
similarity index 100%
rename from recipes-core/classpath/classpath-initial_0.93.bb
rename to recipes-core/classpath/classpath-initial-native_0.93.bb
diff --git a/recipes-core/classpath/classpath-native_0.99.bb b/recipes-core/classpath/classpath-native_0.99.bb
index ece10c3..02951b9 100644
--- a/recipes-core/classpath/classpath-native_0.99.bb
+++ b/recipes-core/classpath/classpath-native_0.99.bb
@@ -1,7 +1,7 @@
 require classpath-native.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=af0004801732bc4b20d90f351cf80510"
-DEPENDS += "ecj-initial"
+DEPENDS += "ecj-initial-native"
 
 PR = "${INC_PR}.0"
 
diff --git a/recipes-core/ecj/ecj-bootstrap-native.bb b/recipes-core/ecj/ecj-bootstrap-native.bb
index c9be269..e159c9d 100644
--- a/recipes-core/ecj/ecj-bootstrap-native.bb
+++ b/recipes-core/ecj/ecj-bootstrap-native.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
                    "
 PR = "r1"
 
-DEPENDS = "libecj-bootstrap virtual/java-native"
+DEPENDS = "libecj-bootstrap-native virtual/java-native"
 
 PROVIDES = "virtual/javac-native"
 
diff --git a/recipes-core/ecj/ecj-initial.bb b/recipes-core/ecj/ecj-initial-native.bb
similarity index 95%
rename from recipes-core/ecj/ecj-initial.bb
rename to recipes-core/ecj/ecj-initial-native.bb
index 45317a6..ed334ed 100644
--- a/recipes-core/ecj/ecj-initial.bb
+++ b/recipes-core/ecj/ecj-initial-native.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.eclipse.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-DEPENDS = "libecj-bootstrap"
+DEPENDS = "libecj-bootstrap-native"
 
 SRC_URI = "file://ecj-initial.in"
 
diff --git a/recipes-core/ecj/libecj-bootstrap_3.6.2.bb b/recipes-core/ecj/libecj-bootstrap-native_3.6.2.bb
similarity index 100%
rename from recipes-core/ecj/libecj-bootstrap_3.6.2.bb
rename to recipes-core/ecj/libecj-bootstrap-native_3.6.2.bb
diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index cd9d90f..9fb4156 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.eclipse.org/"
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/EPL-1.0;md5=57f8d5e2b3e98ac6e088986c12bf94e6"
 
-DEPENDS = "fastjar-native jikes-initial virtual/java-initial"
+DEPENDS = "fastjar-native jikes-initial-native virtual/java-initial"
 
 INC_PR = "r5"
 
diff --git a/recipes-core/jamvm/jamvm-initial_1.4.5.bb b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
similarity index 94%
rename from recipes-core/jamvm/jamvm-initial_1.4.5.bb
rename to recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
index 4c64f6a..25b42b0 100644
--- a/recipes-core/jamvm/jamvm-initial_1.4.5.bb
+++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
+DEPENDS = "zlib-native classpath-initial-native jikes-initial-native libffi-native"
 
 PROVIDES = "virtual/java-initial"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 094b22b..5893cbc 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib classpath virtual/javac-native libffi"
-DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial libffi-native"
+DEPENDS_virtclass-native = "zlib-native classpath-native ecj-initial-native libffi-native"
 
 RDEPENDS_${PN} = "classpath"
 RDEPENDS_${PN}_virtclass-native = ""
diff --git a/recipes-core/jikes/jikes-initial.bb b/recipes-core/jikes/jikes-initial-native.bb
similarity index 90%
rename from recipes-core/jikes/jikes-initial.bb
rename to recipes-core/jikes/jikes-initial-native.bb
index 4e6e870..239dea3 100644
--- a/recipes-core/jikes/jikes-initial.bb
+++ b/recipes-core/jikes/jikes-initial-native.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Initial Java 1.4-compatible (and not higher) compiler"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-DEPENDS = "jikes-native classpath-initial"
+DEPENDS = "jikes-native classpath-initial-native"
 
 S = "${WORKDIR}"
 
-- 
1.9.1


