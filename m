Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 04AAA614A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 06:31:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7E6V9Hf004368
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 02:31:10 -0400 (EDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 23:31:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Aug 2013 14:30:53 +0800
Message-ID: <a4c39e85485f80316e6cefa9b6ad79d0838c83a2.1376461413.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376461413.git.hongxu.jia@windriver.com>
References: <cover.1376461413.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 01/13] meta-filesystems creation
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
X-List-Received-Date: Wed, 14 Aug 2013 06:31:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This layer contains filesystem related recipes.

[YOCTO #4178]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-filesystems/COPYING.MIT     |  17 +++++
 meta-filesystems/README          | 138 +++++++++++++++++++++++++++++++++++++++
 meta-filesystems/conf/layer.conf |  10 +++
 3 files changed, 165 insertions(+)
 create mode 100644 meta-filesystems/COPYING.MIT
 create mode 100644 meta-filesystems/README
 create mode 100644 meta-filesystems/conf/layer.conf

diff --git a/meta-filesystems/COPYING.MIT b/meta-filesystems/COPYING.MIT
new file mode 100644
index 0000000..89de354
--- /dev/null
+++ b/meta-filesystems/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+THE SOFTWARE.
diff --git a/meta-filesystems/README b/meta-filesystems/README
new file mode 100644
index 0000000..d2716f8
--- /dev/null
+++ b/meta-filesystems/README
@@ -0,0 +1,138 @@
+This README file contains information on the contents of the
+filesystems layer.
+
+Please see the corresponding sections below for details.
+
+
+Dependencies
+============
+
+This layer depends on:
+
+  URI: git://git.openembedded.org/bitbake
+  branch: master
+
+  URI: git://git.openembedded.org/openembedded-core
+  layers: meta
+  branch: master
+
+  URI: git://git.openembedded.org/meta-openembedded
+  layers: meta-oe
+  branch: master
+
+Patches
+=======
+
+Please submit any patches against the filesystems layer to the
+OpenEmbedded development mailing list (openembedded-devel@lists.openembedded.org)
+with '[meta-filesystems]' in the subject.
+
+Maintainers List:
+  physfs      Andreas Müller <schnitzeltony@googlemail.com>
+
+  fuse        Koen Kooi <koen@dominion.thruhere.net>
+              Philip Balister <philip@balister.org>
+              hongxu jia <hongxu.jia@windriver.com>
+
+  ifuse       Sander van Grieken <sander@outrightsolutions.nl>
+              Koen Kooi <koen@dominion.thruhere.net>
+
+  sshfs-fuse  Philip Balister <philip@balister.org>
+              Koen Kooi <koen@dominion.thruhere.net>
+
+  owfs        Otavio Salvador <otavio@ossystems.com.br>
+              Koen Kooi <koen@dominion.thruhere.net>
+              hongxu jia <hongxu.jia@windriver.com>
+
+  ntfs-3g-ntfsprogs  Otavio Salvador <otavio@ossystems.com.br>
+                     hongxu jia <hongxu.jia@windriver.com>
+
+  cramfs      Koen Kooi <koen@dominion.thruhere.net>
+
+  smbnetfs    Sander van Grieken <sander@outrightsolutions.nl>
+              Koen Kooi <koen@dominion.thruhere.net>
+
+  fuse-exfat  hongxu jia <hongxu.jia@windriver.com>
+
+  exfat-utils hongxu jia <hongxu.jia@windriver.com>
+
+  f2fs-tools  Martin Jansa <Martin.Jansa@gmail.com>
+              Koen Kooi <koen@dominion.thruhere.net>
+
+  xfsprogs    Koen Kooi <koen@dominion.thruhere.net>
+              hongxu jia <hongxu.jia@windriver.com>
+
+When sending single patches, please use something like:
+
+   git send-email -1 -M \
+        --to openembedded-devel@lists.openembedded.org \
+        --subject-prefix=meta-filesystems][PATCH
+
+
+Table of Contents
+=================
+
+  I. Adding the filesystems layer to your build
+ II. Misc
+
+
+I. Adding the filesystems layer to your build
+=================================================
+
+In order to use this layer, you need to make the build system aware of
+it.
+
+Assuming the filesystems layer exists at the top-level of your
+yocto build tree, you can add it to the build system by adding the
+location of the filesystems layer to bblayers.conf, along with any
+other layers needed. e.g.:
+
+  BBLAYERS ?= " \
+    /path/to/yocto/meta \
+    /path/to/yocto/meta-oe \
+    /path/to/yocto/meta-filesystems \
+    "
+
+
+II. Misc
+========
+
+  --- physfs ---
+  A library to provide abstract access to various archives
+
+  --- fuse ---
+  Filesystem in Userspace (FUSE) is a simple interface for userspace programs
+  to export a virtual filesystem to the Linux kernel.
+
+  --- ifuse ---
+  A fuse filesystem to access the contents of an iPhone or iPod Touch
+
+  --- sshfs-fuse ---
+  A filesystem client based on the SSH File Transfer Protocol
+
+  --- owfs ---
+  An easy way to use the 1-Wire file system
+
+  --- ntfs-3g-ntfsprogs ---
+  The ntfs-3g is a freely available read/write NTFS driver for Linux and
+  ntfsprogs includes utilities for doing all required tasks to NTFS partitions.
+
+  --- cramfs ---
+  Builds cramfs filesystems for embedded systems
+
+  --- smbnetfs ---
+  SMBNetFS is a Linux/FreeBSD filesystem that allow you to use samba/microsoft
+  network in the same manner as the network neighborhood in Microsoft Windows.
+
+  --- fuse-exfat ---
+  A read and write exFAT driver for FUSE
+
+  --- exfat-utils ---
+  Utilities to create, check, label and dump exFAT filesystem
+
+  --- f2fs-tools ---
+  Tools needed for creating and managing f2fs partitions
+
+  --- xfsprogs ---
+  It provides XFS filesystem utilities.
+
diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
new file mode 100644
index 0000000..d62d396
--- /dev/null
+++ b/meta-filesystems/conf/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
+	${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "filesystems"
+BBFILE_PATTERN_filesystems = "^${LAYERDIR}/"
+BBFILE_PRIORITY_filesystems = "6"
-- 
1.8.1.2


