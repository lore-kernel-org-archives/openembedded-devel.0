Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4yoW-0001ob-Q9
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 20:13:51 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so3466645eek.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:57:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=O5fXlyxwwbEdLmMprWHlGplrQ53cSJU6G0yDTC8p91k=;
	b=XBHCPim2g3ocH0MUJT1klGxFAI7sE3wqrYEjVYVG6BYc8Qi6oiwZ5BekOGnQQX92zk
	8pYMtKsjGeNd4vdiVUY8swuV3t+USi90vYmZ8fcJXMqu2SaxYRAEbrV5twEq52KiOCp1
	3YhYmFnfRasF8fALykF6fVOeDaRcU6Kmu2N6onE2G4rGhUP1N65QxTKGPiTSIYcA/xyM
	RygnwxlYc7WR++HL/jsq17+6Cm97oLa7rcfwD59KBT3fc5utfdpH3lIV9dwDoNZlkV1s
	pabn7hEKuUOydSJcNjWqyRxtE1p7IpxCOXOnCjgvIE2grTzkSVvWSbXRXyLY3IR+btCv
	4NTA==
X-Received: by 10.14.225.133 with SMTP id z5mr53239566eep.15.1360609038260;
	Mon, 11 Feb 2013 10:57:18 -0800 (PST)
Received: from localhost.localdomain (5-13-217-124.residential.rdsnet.ro.
	[5.13.217.124])
	by mx.google.com with ESMTPS id q5sm64034955eep.11.2013.02.11.10.57.16
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 10:57:17 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 20:57:05 +0200
Message-Id: <1360609028-8921-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlsKOH423+Y++FdewvXtTcPxcY8DvFwoRhxLGSztKOIDuf7SELvDMOw6zdOrVWKoi9n5ogx
Subject: [meta-oe][PATCH 1/4] x264: Add patch to remove default flags -mcpu=cortex-a8 and -mfpu=neon
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
X-List-Received-Date: Mon, 11 Feb 2013 19:13:53 -0000

-march flag is not in CFLAGS so this will always default to -mcpu=cortex-a8
-mfpu=neon. Obviously wrong for other machines.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../don-t-default-to-cortex-a9-with-neon.patch     |   20 ++++++++++++++++++++
 meta-oe/recipes-multimedia/x264/x264_git.bb        |    6 +++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch

diff --git a/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch b/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
new file mode 100644
index 0000000..b844d88
--- /dev/null
+++ b/meta-oe/recipes-multimedia/x264/x264/don-t-default-to-cortex-a9-with-neon.patch
@@ -0,0 +1,20 @@
+-march flag is not in CFLAGS so this will always default to -mcpu=cortex-a8
+-mfpu=neon.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: git/configure
+===================================================================
+--- git.orig/configure	2013-02-10 16:26:40.666343682 +0200
++++ git/configure	2013-02-10 16:27:49.198341677 +0200
+@@ -703,9 +703,6 @@
+ fi
+
+ if [ $asm = auto -a $ARCH = ARM ] ; then
+-    # set flags so neon is built by default
+-    echo $CFLAGS | grep -Eq '(-mcpu|-march|-mfpu)' || CFLAGS="$CFLAGS -mcpu=cortex-a8 -mfpu=neon"
+-
+     if  cc_check '' '' '__asm__("rev ip, ip");' ; then      define HAVE_ARMV6
+         cc_check '' '' '__asm__("movt r0, #0");'         && define HAVE_ARMV6T2
+         cc_check '' '' '__asm__("vadd.i16 q0, q0, q0");' && define HAVE_NEON
diff --git a/meta-oe/recipes-multimedia/x264/x264_git.bb b/meta-oe/recipes-multimedia/x264/x264_git.bb
index 7d7579f..056c25c 100644
--- a/meta-oe/recipes-multimedia/x264/x264_git.bb
+++ b/meta-oe/recipes-multimedia/x264/x264_git.bb
@@ -4,9 +4,13 @@ HOMEPAGE = "http://www.videolan.org/developers/x264.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PR = "r1"
+
 DEPENDS = "yasm-native"
 
-SRC_URI = "git://git.videolan.org/x264.git"
+SRC_URI = "git://git.videolan.org/x264.git \
+    file://don-t-default-to-cortex-a9-with-neon.patch \
+    "
 SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
 
 PV = "r2230+git"
-- 
1.7.9.5



