Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHh-0007an-H8
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:45 +0200
Received: by wera1 with SMTP id a1so281079wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=LykLrHGHzw7DdWZo3iysfCRflRYUGXE3WQ1RQFz28pQ=;
	b=fX1+y78ulzM0I8yRuBI5MnlCQoCZ46dClg6tISsnaYVH50rwtdeiNBaSU8ST2v5Fss
	5WCqV5A+XTtkZbVH4naElDlJ5CpXv1/jgjZ8x+tXg0siyVrIWJe99RDKcMTS5Oxi/jtl
	+heYYXLnfrkXrqLD/3TMC13+Qtgyh8c6JTd8dOgCs01bqTJRNrwHFehNre6d6oWquz5b
	c3Sx4JmXsTb5vCdjbbLr90ucodOTOv3SF5d39DUyDlpxKLGzTmVjbAGHo8xStMiboqqV
	630qOwYn2wBtRD8IAqzmh+eTH1yWWgyQuZ6uhJ1EBEvGUXawDTvsKKKHxmod1XI/lJhx
	c+0w==
Received: by 10.180.107.104 with SMTP id hb8mr12484400wib.8.1335951952220;
	Wed, 02 May 2012 02:45:52 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fz9sm43142925wib.3.2012.05.02.02.45.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:45:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:28 +0200
Message-Id: <1335951932-6143-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmVAHtjSzQyzhT5VAGJhNkBEYOh7MExQVdbn0Q89k3mITIybJM1S/XMpzYwfGlMJKl/hRrK
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 2/6] v4l-utils: update to 0.8.8
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
X-List-Received-Date: Wed, 02 May 2012 09:55:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb |   40 --------------------
 .../recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb |   39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
deleted file mode 100644
index c6100c1..0000000
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.4.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-DESCRIPTION = "v4l2 and IR applications"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
-                    file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
-
-DEPENDS = "jpeg"
-
-# libv4l was absorbed into this, let OE know that
-PROVIDES = "libv4l"
-
-PR = "r1"
-
-SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
-SRCREV = "v4l-utils-${PV}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
-
-do_compile() {
-	# fix up some ASNEEDED things
-	for i in $(find ${S} -name "Makefile") ; do
-		sed -i 's:-lrt:-lrt -lpthread:g' $i
-	done
-
-	oe_runmake
-}
-
-do_install() {
-	oe_runmake install
-}
-
-PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
-
-FILES_rc-keymaps = "${sysconfdir}/rc*"
-FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
-FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
-FILES_libv4l-dbg += "${libdir}/libv4l/.debug"
-FILES_libv4l-dev += "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgconfig/lib*"
-
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
new file mode 100644
index 0000000..18f361f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "v4l2 and IR applications"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
+                    file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
+
+DEPENDS = "jpeg"
+
+# libv4l was absorbed into this, let OE know that
+PROVIDES = "libv4l"
+
+SRC_URI = "git://linuxtv.org/v4l-utils.git;protocol=git"
+# 54f16ca8183dd8ae8bf4ccc07949795aff0301f5 -> v0.8.8 tag
+SRCREV = "54f16ca8183dd8ae8bf4ccc07949795aff0301f5"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+
+do_compile() {
+	# fix up some ASNEEDED things
+	for i in $(find ${S} -name "Makefile") ; do
+		sed -i 's:-lrt:-lrt -lpthread:g' $i
+	done
+
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake install
+}
+
+PACKAGES =+ "rc-keymaps libv4l libv4l-dbg libv4l-dev"
+
+FILES_rc-keymaps = "${sysconfdir}/rc*"
+FILES_${PN} = "${bindir} ${sbindir} ${base_libdir}/udev/rules.d/70-infrared.rules"
+FILES_libv4l += "${libdir}/libv4l/* ${libdir}/*.so.*"
+FILES_libv4l-dbg += "${libdir}/libv4l/.debug"
+FILES_libv4l-dev += "${libdir}/*.so ${includedir}/lib* ${libdir}/pkgconfig/lib*"
+
-- 
1.7.10



