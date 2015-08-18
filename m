Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 46A5F60043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 20:09:27 +0000 (UTC)
Received: by qgeg42 with SMTP id g42so126943461qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=ltPTCVBEq9V4yisEq9KcgMWFz0hWlkceneyNHOVAf5g=;
	b=kzAf+uZe5MUzpaWCtm70/kpQ/MH92XbsT0C6aGIxyXxHMgZaXwWgEsp1x2vGzLzFqI
	JulQpYo6x0H92UqQV7bmMXOrjBOOuqxsjMpAT8OejHELQ6sp3S7JGbaEX+zm8QXOJ0aQ
	Ao2GPwSvgYK/1ow7RJnu5aM6xD3ULmmwrwG7c87WIQpOu77ZwEvsXb5aWFb9BIiB+F1m
	9OIZQWzYBXFascBzos+Hp5dshpZ0PgiX6lYUKYMpLOqFBpWe+BfhE7Yz5QfkASZwzfND
	KN/uh08gMmcaHCpvR8cGSjv9Bb5hJm2LyOZnEY+kFf0uUEScY/JSDKd67UHSMzTpEw2V
	jE6w==
X-Received: by 10.140.195.148 with SMTP id q142mr16394613qha.92.1439928568086; 
	Tue, 18 Aug 2015 13:09:28 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.148])
	by smtp.gmail.com with ESMTPSA id
	f106sm10753656qgd.30.2015.08.18.13.09.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 13:09:27 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Aug 2015 17:14:30 -0300
Message-Id: <1439928871-17797-2-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 2/3] Avoid parse time errors due to dependency on x11, for distros without x11
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
X-List-Received-Date: Tue, 18 Aug 2015 20:09:28 -0000

BitBake raises some errors when processing recipes that depend on x11
for distros that don't have x11 in DISTRO_FEATURES. To work around
that issue, REQUIRED_DISTRO_FEATURES = "x11" (from
distro_features_check.bbclass) has been set for the following recipes:

* cacao
* classpath
* jamvm
* openjdk-6-release
* openjdk-7-release

That makes BitBake skip those recipes during the cache generation
(they'd still be parsed, but ignored).

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 recipes-core/cacao/cacao_1.6.1.bb       | 4 +++-
 recipes-core/classpath/classpath.inc    | 4 +++-
 recipes-core/jamvm/jamvm.inc            | 4 +++-
 recipes-core/openjdk/openjdk-common.inc | 4 +++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
index 14ff019..d52f339 100644
--- a/recipes-core/cacao/cacao_1.6.1.bb
+++ b/recipes-core/cacao/cacao_1.6.1.bb
@@ -15,7 +15,9 @@ SRC_URI = "http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-
 SRC_URI[md5sum] = "2c18478404afd1cffdd15ad1e9d85a57"
 SRC_URI[sha256sum] = "eecc8bd1b528a028f43d9d1d0c06b97855bbf1d40e03826d911ebbc0b6971e12"
 
-inherit java autotools-brokensep update-alternatives pkgconfig
+inherit java autotools-brokensep update-alternatives pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF_class-native = "\
     --enable-debug \
diff --git a/recipes-core/classpath/classpath.inc b/recipes-core/classpath/classpath.inc
index 1bdfd78..0f760fe 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -7,7 +7,9 @@ LICENSE = "Classpath"
 
 PBN = "classpath"
 
-inherit autotools java gettext
+inherit autotools java gettext distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "virtual/javac-native fastjar-native zip-native gmp antlr-native gtk+ gconf libxtst file"
 
diff --git a/recipes-core/jamvm/jamvm.inc b/recipes-core/jamvm/jamvm.inc
index bed1c5d..9d9fef6 100644
--- a/recipes-core/jamvm/jamvm.inc
+++ b/recipes-core/jamvm/jamvm.inc
@@ -21,7 +21,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/jamvm/jamvm-${PV}.tar.gz \
           "
 
 
-inherit java autotools update-alternatives pkgconfig
+inherit java autotools update-alternatives pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # This uses 32 bit arm, so force the instruction set to arm, not thumb
 ARM_INSTRUCTION_SET = "arm"
diff --git a/recipes-core/openjdk/openjdk-common.inc b/recipes-core/openjdk/openjdk-common.inc
index dc26522..e3e597a 100644
--- a/recipes-core/openjdk/openjdk-common.inc
+++ b/recipes-core/openjdk/openjdk-common.inc
@@ -17,7 +17,9 @@ DEPENDS_append_libc-uclibc = " virtual/libiconv "
 # because structure sizes and/or alignment may differ.
 DEPENDS_append = " qemu-native "
 
-inherit java autotools gettext qemu pkgconfig
+inherit java autotools gettext qemu pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # OpenJDK uses slightly different names for certain arches. We need to know
 #	this to create some files which are expected by the build.
-- 
2.1.4


