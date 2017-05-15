Return-Path: <clement.perrochaud@openmailbox.org>
X-Greylist: delayed 327 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 16:35:51 UTC
Received: from mail.openmailbox.org (lb1.openmailbox.org [5.79.108.160])
	by mail.openembedded.org (Postfix) with ESMTP id B3D3872F28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 16:35:51 +0000 (UTC)
Received: by mail.openmailbox.org (Postfix, from userid 20002)
	id 5C26F5001B5; Mon, 15 May 2017 18:30:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=openmailbox.org;
	s=openmailbox; t=1494865825;
	bh=7BFo7vT8jRHcjW9R+gUerX4VmbegyjYzkhUZIa9o6PE=;
	h=Date:From:To:Subject:From;
	b=FTiGH/gdLVI+UzFPEZ7O1KiSbH4cNPqNXJ1rDhdp2iSn7aYklGXBgNKAu9V/h1T2W
	9WwKgdJ2LC9G1nQHZTc19xs41UenUn9KjBp1ivmVQqFkCAJDJ/g/8tdLOSNrCBolbT
	WH3lSimwroMBSzLd6Thiloq7TW8FuCHRv9YFi0jo=
Received: from www.openmailbox.org (unknown [10.0.0.3])
	by mail.openmailbox.org (Postfix) with ESMTP id 99A7150EF94
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 18:30:23 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 15 May 2017 18:30:23 +0200
From: clement.perrochaud@openmailbox.org
To: openembedded-devel@lists.openembedded.org
Message-ID: <b6a126b1859da5f97b77cdf15d26bf0a@openmailbox.org>
X-Sender: clement.perrochaud@openmailbox.org
User-Agent: Roundcube Webmail/1.0.6
Subject: [meta-oe][PATCH] xf86-video-geode: Update to 2.11.18
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 May 2017 16:35:52 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

This release includes the patch required for 2.11.16 and fixes the
build issue.
Removed from blacklist.

Signed-off-by: Clément Perrochaud <clement.perrochaud@openmailbox.org>
---
  ...1-Add-config.h-include-to-src-lx_memory.c.patch | 41 
----------------------
  .../xorg-driver/xf86-video-geode_2.11.16.bb        | 16 ---------
  .../xorg-driver/xf86-video-geode_2.11.18.bb        | 12 +++++++
  3 files changed, 12 insertions(+), 57 deletions(-)
  delete mode 100644 
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
  delete mode 100644 
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
  create mode 100644 
meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb

diff --git 
a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch 
b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
deleted file mode 100644
index fcd2f684b..000000000
--- 
a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 621d946e56efac2c779b83b1a5c6b645169c4ebd Mon Sep 17 00:00:00 2001
-From: "Brian A. Lloyd" <brian.lloyd@familyhonor.net>
-Date: Wed, 1 Oct 2014 12:35:18 +0300
-Subject: [PATCH] Add config.h include to src/lx_memory.c
-
-The src/lx_memory.c file uses the xf86.h header file.  This file must 
have
-HAVE_STRNDUP defined before calling it when the building platform has a 
strndup
-function.  When using config.h, this file doesn't have that define and 
so fails
-to compile.
-
-The attached patch adds the conditional config.h to this file so it may 
compile
-on the affected platforms.
-
-The patch is trivial and may be included and used under whatever 
licensing
-desired.
-
-Closes: Free Desktop Bug #84541
-
-Signed-off-by: Brian A. Lloyd <brian.lloyd@familyhonor.net>
-Upstream-Status: Backport
----
- src/lx_memory.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/lx_memory.c b/src/lx_memory.c
-index f26d280..992446f 100644
---- a/src/lx_memory.c
-+++ b/src/lx_memory.c
-@@ -22,6 +22,9 @@
-  * contributors may be used to endorse or promote products derived 
from this
-  * software without specific prior written permission.
-  */
-+#if HAVE_CONFIG_H
-+#include "config.h"
-+#endif
-
- #include "xf86.h"
- #include "geode.h"
---
-2.1.1
-
diff --git 
a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb 
b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
deleted file mode 100644
index e543413ad..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-LIC_FILES_CHKSUM = 
"file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
-
-SUMMARY = "X.org server -- Geode GX2/LX display driver"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
-SRC_URI[md5sum] = "35fa387f6a33f6b22a56ce4bda424392"
-SRC_URI[sha256sum] = 
"38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7"
-
-COMPATIBLE_HOST = "i.86.*-linux"
-
-RDEPENDS_${PN} += "xserver-xorg-module-exa"
-
-# 2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/gx_driver.c:376:20: 
error: implicit declaration of function 'xf86MapVidMem' 
[-Werror=implicit-function-declaration]
-PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build - the recipe 
will be removed on 2017-09-01 unless the issue is fixed"
diff --git 
a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb 
b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
new file mode 100644
index 000000000..0c338c5f3
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.18.bb
@@ -0,0 +1,12 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+LIC_FILES_CHKSUM = 
"file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
+
+SUMMARY = "X.org server -- Geode GX2/LX display driver"
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "7d049187ee3640087e99f4267de6baf1"
+SRC_URI[sha256sum] = 
"d6ece9a862a68be3cdf86a87e0e1ba5e199168b8d075129646638f53649ba9e8"
+
+COMPATIBLE_HOST = "i.86.*-linux"
+
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
-- 
2.12.2



