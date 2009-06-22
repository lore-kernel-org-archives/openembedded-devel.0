Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MIljF-0000dD-Q9
	for Openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 17:46:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 1BF832C81D
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:35:24 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 741hXtsg6jvT
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:35:22 +0000 (UTC)
Received: from [192.168.0.2] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 327422C7FF
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jun 2009 15:35:22 +0000 (UTC)
Message-ID: <4A3FA4C3.3090107@gmail.com>
Date: Mon, 22 Jun 2009 17:35:31 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Added recipes/images/x11-jvm-image.bb for KaeilOS with JVM inclusion
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
X-List-Received-Date: Mon, 22 Jun 2009 15:46:42 -0000
Content-Type: text/x-diff;
	name="0001-Added-recipes-images-x11-jvm-image.bb-for-KaeilOS-wi.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="0001-Added-recipes-images-x11-jvm-image.bb-for-KaeilOS-wi.pa";
	filename*1="tch"

From 7314e01d8aeb1a890b4c1a3b621f41a72ec8d8e2 Mon Sep 17 00:00:00 2001
From: Marco Cavallini <m.cavallini@koansoftware.com>
Date: Mon, 22 Jun 2009 11:31:45 +0200
Subject: [PATCH] Added recipes/images/x11-jvm-image.bb for KaeilOS with JVM inclusion


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 recipes/images/x11-jvm-image.bb |   41 +++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 recipes/images/x11-jvm-image.bb

diff --git a/recipes/images/x11-jvm-image.bb b/recipes/images/x11-jvm-image.bb
new file mode 100644
index 0000000..8387112
--- /dev/null
+++ b/recipes/images/x11-jvm-image.bb
@@ -0,0 +1,41 @@
+# KaeilOS X11 image
+# plus JVM and OTHER
+
+ANGSTROM_EXTRA_INSTALL ?= ""
+XSERVER ?= "xserver-kdrive-fbdev"
+
+export IMAGE_BASENAME = "x11-jvm-image"
+
+DEPENDS = "task-base"
+
+ADD_JVM = "\
+    classpath \
+    classpath-common \
+    classpath-dev \
+    classpath-example \
+    classpath-gconf \
+    classpath-gtk \
+    classpath-tools \
+    jamvm \
+    cacao "
+
+ADD_OTHER = "\
+    ipkg "
+
+IMAGE_INSTALL = "\
+    ${XSERVER} \
+    task-base-extended \
+    angstrom-x11-base-depends \
+    angstrom-gpe-task-base \
+    angstrom-gpe-task-settings \
+    ${SPLASH} \
+    $(ADD_JVM) \
+    $(ADD_OTHER) \
+    ${ANGSTROM_EXTRA_INSTALL}"
+
+IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
+
+#zap root password for release images
+ROOTFS_POSTPROCESS_COMMAND += '${@base_conditional("DISTRO_TYPE", "release", "zap_root_password; ", "",d)}'
+
+inherit image
-- 
1.5.4.3


