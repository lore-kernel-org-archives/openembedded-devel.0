Return-Path: <rudolf.streif@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4A22365CBC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 20:19:59 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so26976864pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lJv9gOV2LJCHbvMCfvbjN68NUy2+l48NTWSvmSMzh8Y=;
	b=JgA1x+S7ekBHOeYxPvDFpjbrYCaAkUMahNGvuNmt01C9uMCRxpaYVtLO6eFW4oLQtE
	InDi8XxnnExTOHEO31HfYj1x75KmVe+3vXvSwOkVBaVVG7tUpDTolc8H2O9RXt7dECzh
	Qknz/523WPiniRJlzgg02mXcF+OscfHM8A6TOODgEo0P04mDwjI5378cLj3Tf/zhFM/W
	U2Vxj6yiDV2vb9jj+gd/uyR1u//qLykK1Lge1paJNfRy62ws7yMyOx2EYsveeenLleGy
	UgTcX6o8565KOVbe8GZt9CeQ8Yj8j3bjlU164blVMMOJAKxfzHWWe/FQCQdV/01fmL9K
	1vSg==
X-Received: by 10.68.195.231 with SMTP id ih7mr10021215pbc.26.1440102000254;
	Thu, 20 Aug 2015 13:20:00 -0700 (PDT)
Received: from rjs-mbpro.local (ip68-7-48-20.sd.sd.cox.net. [68.7.48.20])
	by smtp.gmail.com with ESMTPSA id
	s13sm5280770pdi.70.2015.08.20.13.19.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Aug 2015 13:19:59 -0700 (PDT)
From: Rudolf J Streif <rudolf.streif@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 13:19:02 -0700
Message-Id: <1440101942-6993-1-git-send-email-rudolf.streif@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] synergy: project has moved from synergy.googlecode.com
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
X-List-Received-Date: Thu, 20 Aug 2015 20:20:03 -0000

The synergy project on synergy.googlecode.com is defunct. The
sources cannot be downloaded from there anymore. The new project
home is synergy-project.org, but sources can only be downloaded
from ther with a login. The source code repo is on github.com/synergy.

New recipe to check out the code from GitHub. The code contains
zip archives for gmock and gtest, which need to be extracted before
do_configure.

Signed-off-by: Rudolf J Streif <rudolf.streif@gmail.com>
---
 meta-oe/recipes-support/synergy/synergy_git.bb | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy_git.bb

diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
new file mode 100644
index 0000000..8650685
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Synergy - control multiple computers with one keyboard and mouse"
+HOMEPAGE = "http://synergy-project.org"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f366945b209c5523e39889f636af00a"
+LICENSE = "GPL-2.0"
+SECTION = "x11/utils"
+
+DEPENDS = "libx11 libxtst libxinerama"
+
+SRC_URI = "git://github.com/synergy/synergy.git;protocol=http"
+
+# HEAD
+SRCREV_pn-synergy ?= "${AUTOREV}"
+
+# Version 1.7.4-rc8
+SRCREV_pn-synergy ?= "c734bab59ecb7703605e01438e6bff4338b5cb34"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+do_unpack_extra() {
+    cd ${S}/ext
+    for file in *.zip; do
+        fname="${file##*/}"
+        unzip $file -d ${fname%.*}
+    done
+}
+addtask unpack_extra after do_unpack before do_patch
+
+do_install() {
+    install -d ${D}/usr/bin
+    install -m 0755 ${S}/bin/synergy* ${D}/usr/bin/
+}
-- 
2.1.0


