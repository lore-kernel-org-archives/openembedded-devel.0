Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id C948271633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 23:16:15 +0000 (UTC)
Received: by pacgr6 with SMTP id gr6so5352565pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+Wgvt4Am2hf1gaqrXyuMZG21HohcKFyz2lgKQdfIc8Q=;
	b=azxXBlhcDtpUJplghFgwGHWHiy9vWqh8f7QC/csMhHU8IbLBmxzTY5EwLgMakBE2o2
	pUlNn3wmJpwdiK9VS/84KU0DFaVrPEvxCQBgqKgal4mGC3QR+ty7lAHtB90YxLVxT5y7
	NHe7kE4fgKINFKPmofXp7mHfKjg4hilbVzexCZ3p4wfPrUo7sXJBezWIlRFSRt7oKtT2
	HOMvVhO9zIIVCDR+3bg+SxXQ1K4kGK8iD0SOQUUgamORuVJQsg6WIHO0gD5iFOjQ6D0Y
	9UqJ2PLiG0SQb97PveE84Xznczwk0CJd1ZAvcG0o9LGxnb5S/3S5LnLcr3RiCeza7yMW
	ISdQ==
X-Received: by 10.68.244.137 with SMTP id xg9mr61721667pbc.27.1440544575639;
	Tue, 25 Aug 2015 16:16:15 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	kn8sm13559189pab.38.2015.08.25.16.16.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Aug 2015 16:16:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2015 16:16:08 -0700
Message-Id: <1440544569-21142-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-java][PATCH 1/2] Revert "Avoid parse time errors due to dependency on x11, for distros without x11"
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
X-List-Received-Date: Tue, 25 Aug 2015 23:16:19 -0000

This reverts commit 24b98ac3a6ca7fadfba24709aac8d0b71316e299.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-core/cacao/cacao_1.6.1.bb       | 4 +---
 recipes-core/classpath/classpath.inc    | 4 +---
 recipes-core/jamvm/jamvm.inc            | 4 +---
 recipes-core/openjdk/openjdk-common.inc | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index d52f339..14ff019 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -15,9 +15,7 @@ SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-
 SRC_URI[md5sum] = "2c18478404afd1cffdd15ad1e9d85a57"
 SRC_URI[sha256sum] = "eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
 
-inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit java autotools-brokensep update-alternatives pkgconfig
 
 EXTRA_OECONF_class-native = "\
     --enable-debug \
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 0f760fe..1bdfd78 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -7,9 +7,7 @@ LICENSE = "Classpath"
 
 PBN = "classpath"
 
-inherit autotools java gettext distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit autotools java gettext
 
 DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native gtk+ gconf libxtst file"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index 9d9fef6..bed1c5d 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -21,9 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "
 
 
-inherit java autotools update-alternatives pkgconfig distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit java autotools update-alternatives pkgconfig
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index e3e597a..dc26522 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,9 +17,7 @@ DEPENDS_append_libc-uclibc = " virtual/libiconv "
 # because structure sizes and/or alignment may differ.
 DEPENDS_append = " qemu-native "
 
-inherit java autotools gettext qemu pkgconfig distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit java autotools gettext qemu pkgconfig
 
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
-- 
2.1.4


