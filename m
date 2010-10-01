Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P1dd8-0005dN-R2
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Oct 2010 13:18:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6CE743148368
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Oct 2010 13:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YtTmOVilG+ir; Fri,  1 Oct 2010 13:18:03 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id C9FF33148EF9;
	Fri,  1 Oct 2010 13:18:02 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 01 Oct 2010 11:18:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Oct 2010 11:17:33 +0000
Message-Id: <1285931854-17148-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] cdfs-2.6.27: initial recipe
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
X-List-Received-Date: Fri, 01 Oct 2010 11:18:24 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/cdfs/cdfs_2.6.27.bb                        |   20 +++++++++++++
 .../0001-Fix-compile-error-with-linux-2.6.32.patch |   30 ++++++++++++++++++++
 2 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 recipes/cdfs/cdfs_2.6.27.bb
 create mode 100644 recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch

diff --git a/recipes/cdfs/cdfs_2.6.27.bb b/recipes/cdfs/cdfs_2.6.27.bb
new file mode 100644
index 0000000..282bed7
--- /dev/null
+++ b/recipes/cdfs/cdfs_2.6.27.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "CDfs filesystem"
+HOMEPAGE = "http://users.elis.ugent.be/~mronsse/cdfs/"
+SECTION = "kernel/modules"
+LICENSE = "GPL"
+
+SRC_URI = " \
+        http://users.elis.ugent.be/~mronsse/cdfs/download/${P}.tar.bz2 \
+        file://0001-Fix-compile-error-with-linux-2.6.32.patch \
+"
+SRC_URI[md5sum] = "ac64c014a90e3c488394832ea29605b3"
+SRC_URI[sha256sum] = "d034f6c6d9578fe2addfaeceaa101584a4a1fc9f27d825c340baebd345d8d724"
+
+inherit module
+
+do_install() {
+        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+        oe_runmake -C "${STAGING_KERNEL_DIR}" DEPMOD=echo INSTALL_MOD_PATH="${D}" SUBDIRS="${S}" ${MODULE_MAKE_FLAGS} modules_install
+}
+
+PACKAGES = "${PN}"
diff --git a/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch b/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch
new file mode 100644
index 0000000..742164d
--- /dev/null
+++ b/recipes/cdfs/files/0001-Fix-compile-error-with-linux-2.6.32.patch
@@ -0,0 +1,30 @@
+From 4aff257b7615a1b387797cd8dcc76aed3cc69ab8 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Mon, 7 Jun 2010 12:05:19 +0000
+Subject: [PATCH] Fix compile error with linux-2.6.32
+
+root.c: In function 'cdfs_init':
+root.c:646: error: 'CLONE_FS' undeclared (first use in this function)
+root.c:646: error: (Each undeclared identifier is reported only once
+root.c:646: error: for each function it appears in.)
+root.c:646: error: 'CLONE_FILES' undeclared (first use in this function)
+root.c:646: error: 'CLONE_SIGHAND' undeclared (first use in this function)
+---
+ root.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/root.c b/root.c
+index 966a855..0801051 100644
+--- a/root.c
++++ b/root.c
+@@ -25,6 +25,7 @@
+ #include "cdfs.h"
+ 
+ #include <linux/module.h>
++#include <linux/sched.h>
+ 
+ 
+ /*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*
+-- 
+1.5.6.5
+
-- 
1.7.1



