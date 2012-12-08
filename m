Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Th8D3-00056z-0K
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Dec 2012 01:24:01 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so379122eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 16:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KIovfJfJIFzCReYnqhjm3gusHkqiqJcKknlcjHh1wpg=;
	b=E1BxGDI1p5+xlyFiWP3EbbuVS6hBlv5Le32abRKnZYJhOVkxMrOGTMSKEhMMmcnIIW
	DvYD9Ln/o0xtXKO0EpY78QTPqTBmF54zln9+NT6X6POLUGoekEWR1EjOcIRtU/YBbgxj
	0sdaUvJ7TFYygcdfV6VlVSeQjvYTOFjzwjSLl3YnyV6dmoGFkwBJvHLXHQ6OsbnQTbdU
	Gne6s2c1KL1y5wjnKLcjA+UFnDLMWjePT2iDWagJIr9eiGJZ7fIXSyblptDgLovEb8VK
	HCvPCMwjmBesWMVVc9rwN9d6L4FYLC7OAGkLHEh0KwWG0kGzignOwKOpl+mlIm8tJbMh
	5NWA==
Received: by 10.14.225.72 with SMTP id y48mr22121360eep.46.1354925373983;
	Fri, 07 Dec 2012 16:09:33 -0800 (PST)
Received: from mizar.localdomain
	(host83-229-dynamic.58-82-r.retail.telecomitalia.it. [82.58.229.83])
	by mx.google.com with ESMTPS id f49sm25909089eep.12.2012.12.07.16.09.32
	(version=SSLv3 cipher=OTHER); Fri, 07 Dec 2012 16:09:33 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Dec 2012 01:09:22 +0100
Message-Id: <1354925363-14602-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
References: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/4] linux-yocto_3.4: move CONFIG_PXA_SHARPSL=y to zaurus-pxa-common.cfg
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
X-List-Received-Date: Sat, 08 Dec 2012 00:24:01 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita.cfg          |    1 -
 recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg |    1 -
 .../linux/linux-yocto-3.4/poodle/poodle.cfg        |    1 -
 .../linux/linux-yocto-3.4/spitz/spitz.cfg          |    1 -
 recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg |    1 -
 .../linux/linux-yocto-3.4/zaurus-pxa-common.cfg    |    5 +++++
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
index 5e9d937..303a0b9 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
@@ -11,7 +11,6 @@ CONFIG_IWMMXT=y
 #
 # End-user Products (sorted by vendor name)
 #
-CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
 CONFIG_MACH_SPITZ=y
 CONFIG_MACH_BORZOI=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
index cded0f1..e888c26 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/c7x0/c7x0.cfg
@@ -1,7 +1,6 @@
 #
 # End-user Products (sorted by vendor name)
 #
-CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_CORGI=y
 CONFIG_MACH_SHEPHERD=y
 CONFIG_MACH_HUSKY=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
index d661b96..571df39 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/poodle/poodle.cfg
@@ -6,7 +6,6 @@ CONFIG_SHARP_LOCOMO=y
 #
 # End-user Products (sorted by vendor name)
 #
-CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_POODLE=y
 CONFIG_PXA25x=y
 
diff --git a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
index ca34fd6..86494df 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/spitz/spitz.cfg
@@ -6,7 +6,6 @@ CONFIG_IWMMXT=y
 #
 # End-user Products (sorted by vendor name)
 #
-CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_AKITA=y
 CONFIG_MACH_SPITZ=y
 CONFIG_MACH_BORZOI=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
index bdbac5c..085e1d2 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/tosa/tosa.cfg
@@ -1,7 +1,6 @@
 #
 # End-user Products (sorted by vendor name)
 #
-CONFIG_PXA_SHARPSL=y
 CONFIG_MACH_TOSA=y
 CONFIG_TOSA_BT=m
 CONFIG_PXA25x=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
index 88fd6a5..78d0e17 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/zaurus-pxa-common.cfg
@@ -4,6 +4,11 @@
 CONFIG_ARCH_PXA=y
 
 #
+# End-user Products (sorted by vendor name)
+#
+CONFIG_PXA_SHARPSL=y
+
+#
 # System MMU
 #
 CONFIG_PLAT_PXA=y
-- 
1.7.8.6



