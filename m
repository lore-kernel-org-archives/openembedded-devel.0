Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TFRVc-0008Rz-4p
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Sep 2012 17:20:44 +0200
Received: by wibhq4 with SMTP id hq4so2741160wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Sep 2012 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+OWnbxlGLdhhCJH6EKDVyvAc5bdXvk/yBtvJvFQvkfM=;
	b=Dne6zpDl/7N/iua0pWeahzxA1NNaaG4cyWs3f0O8JwfNHQOU9qSY7Xb+I/TpTE7gOw
	8GBLnM9DyXCbk5zjfRs/hWHvEQxF4DjKpdHYINMGzLuoL21tio30PUdTokOL2ZryUdui
	xz34lBRidXmEW4TQPLMa7kmf6ClrpLYCh8b3yAS6VBLF1eo6e5X9BVyLxlWxk9B+w7f1
	dszf+D2iyVv7ANrPyLjo2wgA77JaGNSpllS4BwdCdh7ldMtcgLwb7DzVMn12t1aPIR3F
	lYFUdxp4WA1E/EI2Edqqf1+6vYLXtai+N+DqWUmpEouL5AxXJUlw4vhWaq0qz+KBLpcl
	oDaw==
Received: by 10.180.84.104 with SMTP id x8mr3484419wiy.20.1348326479084;
	Sat, 22 Sep 2012 08:07:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm4049705wiz.0.2012.09.22.08.07.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:07:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Sep 2012 17:07:41 +0200
Message-Id: <ac89f82dc84c9222318642f6b75d5a3dad324594.1348320947.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1348320947.git.Martin.Jansa@gmail.com>
References: <cover.1348320947.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] lzma: replace oe.process.run with subprocess.call in do_unpack, drop NATIVE_INSTALL_WORKS
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
X-List-Received-Date: Sat, 22 Sep 2012 15:20:44 -0000

* oe.process was removed in
  http://git.openembedded.org/openembedded-core/commit/meta/lib/oe?id=d56062cbf92ef206bf06c767befacb66927a9a36

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lzma/lzma.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lzma/lzma.inc b/meta-oe/recipes-support/lzma/lzma.inc
index 9718600..457d7f4 100644
--- a/meta-oe/recipes-support/lzma/lzma.inc
+++ b/meta-oe/recipes-support/lzma/lzma.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "LZMA is a general compression method. LZMA provides high compress
 HOMEPAGE = "http://www.7-zip.org/"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://lzma.txt;md5=20251cdc2e3793cceab11878d0aa11b1"
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://downloads.sourceforge.net/sevenzip/lzma${@bb.data.getVar('PV',d,1).replace('.','')}.tar.bz2;subdir=${BPN}-${PV} \
            file://001-large_files.patch \
@@ -14,10 +14,10 @@ SRC_URI = "http://downloads.sourceforge.net/sevenzip/lzma${@bb.data.getVar('PV',
 EXTRA_OEMAKE = "-f makefile.gcc"
 
 do_unpack_append() {
-    import oe.process
+    import subprocess
     # Replace MS-DOS line-endings with Unix style line-endings
-    oe.process.run("find . -type f -print0 | xargs -0 sed 's/\r$//' -i",
-               cwd=d.getVar("S", True))
+    subprocess.call("find . -type f -print0 | xargs -0 sed 's/\r$//' -i",
+                     cwd=d.getVar("S", True), shell=True)
 }
 
 do_compile() {
@@ -32,5 +32,4 @@ do_install() {
         oe_libinstall -a -C C/LzmaUtil liblzma ${D}${libdir}
 }
 
-NATIVE_INSTALL_WORKS = "1"
 BBCLASSEXTEND = "native"
-- 
1.7.12



