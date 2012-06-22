Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gizero@gmail.com>) id 1Shz46-0001cI-ET
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 10:18:02 +0200
Received: by wgbdr1 with SMTP id dr1so1347679wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2012 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uXTe8VMh8DWuISfz3Q3isDGTh2lsUFymPxoFuuwBOT8=;
	b=gR+Hn31ZAOx2xP9j76orursR6cYTI9Bd91xBBOg863Lchk7oZ/3wIrjinDZ59I9ujT
	PmOj0IvVY2KK2lJ5LlVohAQVF909IRJoASBWr6HKuzY7Syk3HuMBt+Z/O62jjh+bCina
	3qNDEpbu1PJOOpV6LFF64kSoZfHjDKzPxhJF3VBOztmdy3+CoDPrl5QOFppjKPqKMcnn
	H+aw6CO/PAKMg3YNhCfMpeAwPQvFshOuuZTpK+yzyb2y7xMZMMBA5sKHO+aVogMMD4MJ
	/lhLc3sFBVtN9nBCJfiZOcN7ptAmLGva8L+b4DD5k66mYQR7D5el04IZESyeUdzYweYA
	nmpg==
Received: by 10.180.19.138 with SMTP id f10mr2658529wie.19.1340352435717;
	Fri, 22 Jun 2012 01:07:15 -0700 (PDT)
Received: from localhost.localdomain
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPS id z8sm97941736wiy.1.2012.06.22.01.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 01:07:14 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 10:06:51 +0200
Message-Id: <1340352411-20305-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] libmodbus: update to 3.0.3
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
X-List-Received-Date: Fri, 22 Jun 2012 08:18:02 -0000

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libmodbus/libmodbus_3.0.2.bb  |   16 ----------------
 .../recipes-extended/libmodbus/libmodbus_3.0.3.bb  |   16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
 create mode 100644 meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb

diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
deleted file mode 100644
index 03b7fcc..0000000
--- a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A Modbus library"
-DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
-implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
-QNX and Windows."
-HOMEPAGE = "http://www.libmodbus.org/"
-SECTION = "libs"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
-
-SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "1aaacce9d9779d3a84f7d1a75774c943"
-SRC_URI[sha256sum] = "927ec90e0e299a7d4ec7086b1e2590566bdfc3bbc22e12204229361c029f2615"
diff --git a/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
new file mode 100644
index 0000000..e6dde2c
--- /dev/null
+++ b/meta-oe/recipes-extended/libmodbus/libmodbus_3.0.3.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A Modbus library"
+DESCRIPTION = "libmodbus is a C library designed to provide a fast and robust \
+implementation of the Modbus protocol. It runs on Linux, Mac OS X, FreeBSD, \
+QNX and Windows."
+HOMEPAGE = "http://www.libmodbus.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://github.com/downloads/stephane/libmodbus/libmodbus-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+SRC_URI[md5sum] = "b5042d833c6c132e6fb2551af133a342"
+SRC_URI[sha256sum] = "6fc7cf91f7293e522afde6ae5fc605c6cd7bdca4ee2ec953db5bb91158ab8677"
-- 
1.7.5.4



