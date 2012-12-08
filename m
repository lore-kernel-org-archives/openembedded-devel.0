Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Th8Cz-00056s-UW
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Dec 2012 01:23:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so592831eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cw87ApRuNpLoEq0OUp7h/5Fp7Q97vgaWc+kT/OErN2k=;
	b=Xcnb8/Xe1FGPpipnGvCrU0gqp60cRYL3AW4DxDuSHu0g1GPn4Nhe71T1r+4Bg8lPi7
	7bHoRqu7wZAhPUKuWBA5ltkbLjd6S/dkg6AbyHK42tjadpBVeieDQfqjGx+C9pmtmbzd
	iPqjS68R+9jbeJatqcqo9A7t/HoxpEV9mkC/e0lnY6uWizndwY1I4d5CAI1Wj1JD4JnC
	zByniB0T7G9DGJC8kTGGcMqjA0L3bMCDXRuEfMyZy4ENzj0Nwtiv6l05hGn5rm8HyDA8
	BfyaPhvq9BRTMnPACd3B/MwIpCmTupiH85e3bFWHIQ7raY6vPVPTjbZKqvTjTBqNtlAQ
	rOQA==
Received: by 10.14.205.198 with SMTP id j46mr22433063eeo.27.1354925370670;
	Fri, 07 Dec 2012 16:09:30 -0800 (PST)
Received: from mizar.localdomain
	(host83-229-dynamic.58-82-r.retail.telecomitalia.it. [82.58.229.83])
	by mx.google.com with ESMTPS id f49sm25909089eep.12.2012.12.07.16.09.29
	(version=SSLv3 cipher=OTHER); Fri, 07 Dec 2012 16:09:29 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Dec 2012 01:09:20 +0100
Message-Id: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH 1/4] linux-yocto_3.4: move CONFIG_MMU=y to zaurus-hardware.cfg
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
X-List-Received-Date: Sat, 08 Dec 2012 00:23:58 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita.cfg          |    1 -
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |    1 -
 .../linux/linux-yocto-3.4/collie/collie.cfg        |    1 -
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |    1 -
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |    1 -
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |    1 -
 .../linux/linux-yocto-3.4/zaurus-hardware.cfg      |    5 +++++
 7 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
index 59feb2d..a8445d6 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_PXA=y
 CONFIG_GPIO_PCA953X=y
 
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
index 2d12380..d421e46 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_PXA=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
index ed3d507..5c0a7bf 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/collie/collie.cfg
@@ -6,7 +6,6 @@ CONFIG_KERNEL_LZMA=y
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_SA1100=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
index 0da402d..4b14575 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_PXA=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
index be1f9a0..50d40da 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_PXA=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
index 75786b6..9053a5e 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
@@ -1,7 +1,6 @@
 #
 # System Type
 #
-CONFIG_MMU=y
 CONFIG_ARCH_PXA=y
 
 #
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
index 554faa8..1336bf0 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-hardware.cfg
@@ -31,6 +31,11 @@ CONFIG_HAVE_CLK=y
 CONFIG_HAVE_DMA_API_DEBUG=y
 
 #
+# System Type
+#
+CONFIG_MMU=y
+
+#
 # Power management options
 #
 CONFIG_SUSPEND=y
-- 
1.7.8.6



