Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RF886-0001dM-Ch
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 19:34:38 +0200
Received: by pzk33 with SMTP id 33so4147493pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JkwIu5cX8bJgSgFcoEPRecLXLdn11qiiD+9ugaj+L3w=;
	b=hroaDgOUUYHNCWZKvpY/ssB5+sYVErhor/AawIqhjKPn6wNZR83LjJYCyn9R1e3L81
	5bwYe6fawVgBTg3A+/gbBhU2Z4OPoguIh50Cgr0Do475g05Uo6eNIewoYBhDPnPvi/Na
	sTLC2kEmp04bn3CVGp16L0HfaYBMUequBRbDQ=
Received: by 10.68.34.137 with SMTP id z9mr22548308pbi.76.1318699726244;
	Sat, 15 Oct 2011 10:28:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id y4sm33445346pbe.4.2011.10.15.10.28.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 10:28:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 10:28:32 -0700
Message-Id: <1318699712-6518-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] binutils-cross: Sync with oe-core
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
X-List-Received-Date: Sat, 15 Oct 2011 17:34:38 -0000

Now we have own copy of binutils-cross in meta-oe
we need to sync with oe-core periodically

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/binutils/binutils-cross.inc   |    4 ++++
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/binutils/binutils-cross.inc b/meta-oe/recipes-devtools/binutils/binutils-cross.inc
index 4b90972..595fb20 100644
--- a/meta-oe/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta-oe/recipes-devtools/binutils/binutils-cross.inc
@@ -1,10 +1,14 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+INHIBIT_DEFAULT_DEPS = "1"
+INHIBIT_AUTOTOOLS_DEPS = "1"
+
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
                 --disable-werror \
+                --disable-nls \
                 --enable-poison-system-directories"
 
 do_install () {
diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
index ea61136..d0f889c 100644
--- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
+++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r8"
+PR = "r9"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
-- 
1.7.5.4



