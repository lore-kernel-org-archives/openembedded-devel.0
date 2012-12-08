Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Th8D1-00056t-Di
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Dec 2012 01:23:59 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so592837eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 16:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Y6Xc2hlJwR5g9NGcdt6ornjmEPuAEl9IwqcY7jLk6o0=;
	b=Fo6QV0mh4+QQgz2HTOuwtkMzvltWnB1LOOB+DmkpI1WOdcRmsLR2NsADPcblXnrhHU
	YMZoRzN4DYCCpy9QUbBiqDy5AwXWK44wdkIW7ZHsmaE3XA4d6c8aJXv//bqurIgmoDSy
	EVOUJWIpvZcKcCFNOJiHsr+6TLqCaqLSwYjVC7dTVasN4EpmSv5AU6gN5hyU6i9QCpDD
	vXTxd/gpj/6tmiX+LiEVtt4OxSqPUvw/MGxUbjhIWTAmePd/tAwcdw5BsYH+CiPzfiX4
	Iv8sZrAyBZPhgScKq2iGBOMmc/u+9QGhkAEuaz85Ucp+4pa2prDHJtOeCF/9wdb7sdAb
	4Gsw==
Received: by 10.14.220.71 with SMTP id n47mr21959010eep.39.1354925372437;
	Fri, 07 Dec 2012 16:09:32 -0800 (PST)
Received: from mizar.localdomain
	(host83-229-dynamic.58-82-r.retail.telecomitalia.it. [82.58.229.83])
	by mx.google.com with ESMTPS id f49sm25909089eep.12.2012.12.07.16.09.30
	(version=SSLv3 cipher=OTHER); Fri, 07 Dec 2012 16:09:31 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Dec 2012 01:09:21 +0100
Message-Id: <1354925363-14602-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
References: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/4] linux-yocto_3.4: move CONFIG_ARCH_PXA=y to zaurus-pxa-common.cfg
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
X-List-Received-Date: Sat, 08 Dec 2012 00:23:59 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita.cfg          |    1 -
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |    5 -----
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |    5 -----
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |    5 -----
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |    5 -----
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |    5 +++++
 6 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
index a8445d6..5e9d937 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_ARCH_PXA=y
 CONFIG_GPIO_PCA953X=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
index d421e46..cded0f1 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
@@ -1,9 +1,4 @@
 #
-# System Type
-#
-CONFIG_ARCH_PXA=y
-
-#
 # End-user Products (sorted by vendor name)
 #
 CONFIG_PXA_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
index 4b14575..d661b96 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
@@ -1,9 +1,4 @@
 #
-# System Type
-#
-CONFIG_ARCH_PXA=y
-
-#
 # Processor Features
 #
 CONFIG_SHARP_LOCOMO=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
index 50d40da..ca34fd6 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
@@ -1,9 +1,4 @@
 #
-# System Type
-#
-CONFIG_ARCH_PXA=y
-
-#
 # Processor Features
 #
 CONFIG_IWMMXT=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
index 9053a5e..bdbac5c 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
@@ -1,9 +1,4 @@
 #
-# System Type
-#
-CONFIG_ARCH_PXA=y
-
-#
 # End-user Products (sorted by vendor name)
 #
 CONFIG_PXA_SHARPSL=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
index e2f6724..88fd6a5 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
@@ -1,4 +1,9 @@
 #
+# System Type
+#
+CONFIG_ARCH_PXA=y
+
+#
 # System MMU
 #
 CONFIG_PLAT_PXA=y
-- 
1.7.8.6



