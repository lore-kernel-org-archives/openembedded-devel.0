Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anilm@mistralsolutions.com>) id 1QIFIy-0003cW-Kc
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 09:18:28 +0200
Received: by mail-iw0-f175.google.com with SMTP id 10so2741239iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 00:15:50 -0700 (PDT)
Received: by 10.42.26.83 with SMTP id e19mr2161317icc.387.1304666150057;
	Fri, 06 May 2011 00:15:50 -0700 (PDT)
Received: from anilm@mistralsolutions.com ([122.166.13.232])
	by mx.google.com with ESMTPS id f28sm1241573ibh.67.2011.05.06.00.15.47
	(version=SSLv3 cipher=OTHER); Fri, 06 May 2011 00:15:49 -0700 (PDT)
Date: Fri, 6 May 2011 12:45:45 +0530
From: Anil Kumar <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <4dc3a025.5c3ae70a.4d3e.5577@mx.google.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: koen@dominion.thruhere.net, srinath@mistralsolutions.com,
	paulepanter@users.sourceforge.net, nagendra@mistralsolutions.com
Subject: [PATCH] linux-omap-psp-2.6.32: Makefile change to revert AM3517EVM support and add CraneBoard support
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
X-List-Received-Date: Fri, 06 May 2011 07:18:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

     This patch rectifies the drivers/usb/musb/Makefile to accommodate
     both AM3517EVM and CraneBoard for musb.

Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
---
 ...ange-to-revert-am3517-evm-support-and-to-.patch |   36 ++++++++++++++++++++
 recipes/linux/linux-omap-psp_2.6.32.bb             |    1 +
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-omap-psp-2.6.32/0003-Makefile-change-to-revert-am3517-evm-support-and-to-.patch

diff --git a/recipes/linux/linux-omap-psp-2.6.32/0003-Makefile-change-to-revert-am3517-evm-support-and-to-.patch b/recipes/linux/linux-omap-psp-2.6.32/0003-Makefile-change-to-revert-am3517-evm-support-and-to-.patch
new file mode 100644
index 0000000..38d52f5
--- /dev/null
+++ b/recipes/linux/linux-omap-psp-2.6.32/0003-Makefile-change-to-revert-am3517-evm-support-and-to-.patch
@@ -0,0 +1,36 @@
+From bf6347d8f42e053b187a499e5ed1fdf4f0992969 Mon Sep 17 00:00:00 2001
+From: Anil Kumar <anilm@mistralsolutions.com>
+Date: Thu, 5 May 2011 15:21:34 +0530
+Subject: [PATCH]  Makefile change to revert am3517-evm support and to add am3517-crane board support
+
+Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>
+---
+ drivers/usb/musb/Makefile |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/musb/Makefile b/drivers/usb/musb/Makefile
+index daf3415..8941549 100644
+--- a/drivers/usb/musb/Makefile
++++ b/drivers/usb/musb/Makefile
+@@ -19,11 +19,14 @@ ifeq ($(CONFIG_ARCH_OMAP2430),y)
+ endif
+ 
+ ifeq ($(CONFIG_ARCH_OMAP3430),y)
+-
+-   ifeq ($(CONFIG_MACH_CRANEBOARD),y)
+-	musb_hdrc-objs  += am3517.o
++   ifeq ($(CONFIG_MACH_OMAP3517EVM),y)
++        musb_hdrc-objs  += am3517.o
+    else
+-	musb_hdrc-objs	+= omap2430.o
++        ifeq ($(CONFIG_MACH_CRANEBOARD),y)
++	     musb_hdrc-objs  += am3517.o
++        else
++	     musb_hdrc-objs  += omap2430.o
++       endif
+    endif
+ endif
+ 
+-- 
+1.7.0.4
+
diff --git a/recipes/linux/linux-omap-psp_2.6.32.bb b/recipes/linux/linux-omap-psp_2.6.32.bb
index 1a3ea66..94abc26 100644
--- a/recipes/linux/linux-omap-psp_2.6.32.bb
+++ b/recipes/linux/linux-omap-psp_2.6.32.bb
@@ -139,6 +139,7 @@ SRC_URI = "git://arago-project.org/git/projects/linux-omap3.git;protocol=http;br
            file://porches.patch \
            file://0001-OMAP3-craneboard-print-expansionboard-name-detected-.patch \
            file://0002-OMAP3-craneboard-add-support-for-TinCanTools-Trainer.patch \
+           file://0003-Makefile-change-to-revert-am3517-evm-support-and-to-.patch \
            file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.7.0.4



