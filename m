Received: from mail-wg0-f46.google.com ([74.125.82.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1SQQCM-0000LI-6F
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 May 2012 23:37:58 +0200
Received: by wgbdq10 with SMTP id dq10so2810879wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 May 2012 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8tjBdfyY6m9XGj5FS/pqLgUs2W/cvoHiDY8Rr6RKjB4=;
	b=THrb4UgOekBTDIvvxOKLQvu2enyS0kbQjDdi2FSuEwymdeUBsxKMX5ZSQl/NWuZiAW
	Tf+Ii/gSTcggDd8RYoVl4EKvOZo1XU7dvFecSxt41l65Kp5SH+LXV2c07yfp4y8zX3T+
	zLD+NwrC5TMCIx0UFfhaMGGFxCHUmpWRYntvriGAwAyLChfqDYt5gh5HlrbmyhIcshhz
	IKxtII00F1rj4cRLK1D5q0ToX8Ld0dkz7rfwbo8raeMtaVRu9QboT4ybGkGJK+1MhuWg
	PCwCANQ5X3MGelHNd4yh37no81032FLmPpCfsezOfMb7d/ptUV+s08ShytxyHdgQeadD
	Jy0A==
Received: by 10.180.88.233 with SMTP id bj9mr1063094wib.1.1336166890950;
	Fri, 04 May 2012 14:28:10 -0700 (PDT)
Received: from localhost.localdomain
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id f19sm702406wiw.11.2012.05.04.14.28.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 14:28:09 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 May 2012 23:25:08 +0200
Message-Id: <1336166708-14019-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libmodbus: ported recipe from classic and updated
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
X-List-Received-Date: Fri, 04 May 2012 21:37:58 -0000

* based on recipe by Radoslav Kolev which was in classic
* updated to latest released version 3.0.2
* also provide an _git version with up-to-date SRCREV and
DEFAULT_PREFERENCE = "-1"
* common part factorized as libmodbus.inc

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 meta-oe/recipes-extended/libmodbus/libmodbus.inc   |   13 +++++++++++++
 .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |    8 ++++++++
 .../recipes-extended/libmodbus/libmodbus_git.bb    |   13 +++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus.inc
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_git.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus.inc b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
new file mode 100644
index 0000000..8e0e011
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus.inc
@@ -0,0 +1,13 @@
+SUMMARY = "A Modbus library"
+DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
+implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
+QNX and Windows."
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+
+INC_PR = "r0"
+
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
new file mode 100644
index 0000000..7a99f72
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
@@ -0,0 +1,8 @@
+require libmodbus.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1aaacce9d9779d3a84f7d1a75774c943"
+SRC_URI[sha256sum] = "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
new file mode 100644
index 0000000..793a9d6
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_git.bb
@@ -0,0 +1,13 @@
+require libmodbus.inc
+
+SRCREV = "23dd803f3f2b7be668408fa938e8d665249b4fba"
+
+PV = "3.0.2+gitr${SRCPV}"
+
+PR = "${INC_PR}.0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://github.com/stephane/libmodbus;branch=master;protocol=git"
+S = "${WORKDIR}/git"
+
-- 
1.7.5.4



