Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXB-00036J-Ti
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:28:50 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so10079208pad.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=SEljrLoP9YHeBrH2Y97usySYs8Fnu/+o9OzOah12h2c=;
	b=E2meBoy04UUcObMBMRrJMO9Xhzz6aTL1sRf1VvaGFWJTTGhSS7ybbx5vkgAaK7FZl3
	wDts5zvnfO1VXF1WQnH1GFXWAFx/P7tTtiNuGBkwPyxZLd6yGMzmeXj+0wBP4DJGT2qR
	S7sHKDL0hQEBLan/ifVrPD6DQQKKyej8PcxckaRRPMjxCH+SuFXO9iltd9+pzbbLDu01
	IGCz5FqEFLdf8bJW4LbH3EN8dmFs7N1e8r8WYQLqPH9381oA5aDJHhXju3lP3EsSbEmB
	qBhZVXf4U9l2EaaQuZp45/U0KT3uFHUzvOHNKjC1KKtsbn6gImDwNf2MzqiOGGpYMudC
	mXsw==
X-Received: by 10.66.86.101 with SMTP id o5mr168550008paz.15.1357463621660;
	Sun, 06 Jan 2013 01:13:41 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:31 -0800
Message-Id: <1357463568-26241-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2 08/25] liblockfile: Upgrade 1.06 -> 1.09
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../configure.patch                                |    0
 .../glibc-2.4.patch                                |    0
 .../install.patch                                  |    0
 .../ldflags.patch                                  |    0
 .../liblockfile/liblockfile_1.06.bb                |   21 -------------------
 .../liblockfile/liblockfile_1.09.bb                |   22 ++++++++++++++++++++
 6 files changed, 22 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-extended/liblockfile/{liblockfile-1.06 => liblockfile-1.09}/configure.patch (100%)
 rename meta-oe/recipes-extended/liblockfile/{liblockfile-1.06 => liblockfile-1.09}/glibc-2.4.patch (100%)
 rename meta-oe/recipes-extended/liblockfile/{liblockfile-1.06 => liblockfile-1.09}/install.patch (100%)
 rename meta-oe/recipes-extended/liblockfile/{liblockfile-1.06 => liblockfile-1.09}/ldflags.patch (100%)
 delete mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
 create mode 100644 meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
similarity index 100%
rename from meta-oe/recipes-extended/liblockfile/liblockfile-1.06/configure.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile-1.09/configure.patch
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch
similarity index 100%
rename from meta-oe/recipes-extended/liblockfile/liblockfile-1.06/glibc-2.4.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile-1.09/glibc-2.4.patch
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch
similarity index 100%
rename from meta-oe/recipes-extended/liblockfile/liblockfile-1.06/install.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile-1.09/install.patch
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch b/meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch
similarity index 100%
rename from meta-oe/recipes-extended/liblockfile/liblockfile-1.06/ldflags.patch
rename to meta-oe/recipes-extended/liblockfile/liblockfile-1.09/ldflags.patch
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
deleted file mode 100644
index 971eff1..0000000
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.06.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "File locking library."
-SECTION = "libs"
-LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35127b30003a121544b5d13a2ac868b6"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20050312T000000Z/pool/main/libl/liblockfile/liblockfile_${PV}.tar.gz \
-	   file://install.patch \
-	   file://configure.patch \
-	   file://ldflags.patch \
-	   file://glibc-2.4.patch"
-
-inherit autotools
-
-EXTRA_OECONF = "--enable-shared --enable-static"
-
-do_install () {
-	oe_runmake 'ROOT=${D}' INSTGRP='' install
-}
-
-SRC_URI[md5sum] = "2de88389da013488bfd31356523070c0"
-SRC_URI[sha256sum] = "14f9690328318d11f9ba13a9356a2c008bdd169b7a817f38cb7f9eb32cf7240e"
diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
new file mode 100644
index 0000000..c72e28d
--- /dev/null
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "File locking library."
+SECTION = "libs"
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ac284a60d48eaa4bc811cddc377fa341"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
+	   file://install.patch \
+	   file://configure.patch \
+	   file://ldflags.patch \
+          "
+
+SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
+SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-shared --enable-static"
+
+do_install () {
+	oe_runmake 'ROOT=${D}' INSTGRP='' install
+}
+
-- 
1.7.9.5



