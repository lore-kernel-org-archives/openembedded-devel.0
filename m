Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAjgl-0007VM-KW
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Sep 2012 17:44:47 +0200
Received: by pbcwy7 with SMTP id wy7so1468930pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2012 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3cIGaw0bzIuzO++0IKEn77dKGy4hnbXml/8NWvnl2Yg=;
	b=n/uep/epSV1YQPznWoTFm4PtRSke51rKcGcXxMikMV6SJfKkNXQapkKJmSbodvwYhO
	waMLn8VyCx2pg10PTL8eCy0hA9hQ4YTWv4gb+uJ/M3yfRm/Ay1vlWI5Be8C+33aQmz0U
	gUX7vVl6s5f55RnOFcwQoLQl5RF2USr1srQc2BV0IpPGrALgf0EQbOT5v3rZlxEjrRMp
	FJ2GwGoqgj/q3v6ylWPS30Two7YU1ssL5WtR0L7pKJwCpgzLeOy1o/BvUBH4b1Jhzv+7
	lDFqDVBcpOaRumqSLdzXA5T3pwvoN8HcfnAeey833nYXhPtHWzPonlU/4OYyG8yrW64v
	Qplw==
Received: by 10.66.85.4 with SMTP id d4mr16882460paz.11.1347204738326;
	Sun, 09 Sep 2012 08:32:18 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hr9sm6373451pbc.36.2012.09.09.08.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Sep 2012 08:32:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2012 08:31:18 -0700
Message-Id: <1347204678-22970-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-opie][PATCH] recipes: inherit packagegroup instead of obsoleted task bbclass
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
X-List-Received-Date: Sun, 09 Sep 2012 15:44:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-opie/tasks/task-opie-16mb.bb   |    2 +-
 recipes-opie/tasks/task-opie-all.bb    |    2 +-
 recipes-opie/tasks/task-opie-apps.bb   |    2 +-
 recipes-opie/tasks/task-opie-games.bb  |    2 +-
 recipes-opie/tasks/task-opie.bb        |    2 +-
 recipes-opie/tasks/task-xqtlauncher.bb |    2 +-
 recipes-qtopia/tasks/task-qpe.bb       |    2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-opie/tasks/task-opie-16mb.bb b/recipes-opie/tasks/task-opie-16mb.bb
index 34f81f6..eb684d5 100644
--- a/recipes-opie/tasks/task-opie-16mb.bb
+++ b/recipes-opie/tasks/task-opie-16mb.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 PR = "r5"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-opie/tasks/task-opie-all.bb b/recipes-opie/tasks/task-opie-all.bb
index 3f3a33b..d9c0a74 100644
--- a/recipes-opie/tasks/task-opie-all.bb
+++ b/recipes-opie/tasks/task-opie-all.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r3"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-opie/tasks/task-opie-apps.bb b/recipes-opie/tasks/task-opie-apps.bb
index 2cb0981..b019a87 100644
--- a/recipes-opie/tasks/task-opie-apps.bb
+++ b/recipes-opie/tasks/task-opie-apps.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 PR = "r1"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-opie/tasks/task-opie-games.bb b/recipes-opie/tasks/task-opie-games.bb
index 0193532..d00fdb5 100644
--- a/recipes-opie/tasks/task-opie-games.bb
+++ b/recipes-opie/tasks/task-opie-games.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r1"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-opie/tasks/task-opie.bb b/recipes-opie/tasks/task-opie.bb
index 64e6492..2c626c6 100644
--- a/recipes-opie/tasks/task-opie.bb
+++ b/recipes-opie/tasks/task-opie.bb
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PR = "r16"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-opie/tasks/task-xqtlauncher.bb b/recipes-opie/tasks/task-xqtlauncher.bb
index 242307f..8bef8b7 100644
--- a/recipes-opie/tasks/task-xqtlauncher.bb
+++ b/recipes-opie/tasks/task-xqtlauncher.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r1"
 
-inherit task
+inherit packagegroup
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
diff --git a/recipes-qtopia/tasks/task-qpe.bb b/recipes-qtopia/tasks/task-qpe.bb
index 10567c9..7353e71 100644
--- a/recipes-qtopia/tasks/task-qpe.bb
+++ b/recipes-qtopia/tasks/task-qpe.bb
@@ -3,7 +3,7 @@ SECTION = "opie/base"
 LICENSE = "MIT"
 PR = "r10"
 
-inherit task
+inherit packagegroup
 
 PACKAGES = "task-qpe-applets task-qpe-games task-qpe-inputmethods \
 	task-qpe-multimedia task-qpe-emulators task-qpe-applications \
-- 
1.7.9.5



