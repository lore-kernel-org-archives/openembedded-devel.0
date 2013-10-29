Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3689B6D40A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 23:47:45 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id q10so233183eaj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L9GdItlIsDx+6G7Vu/4QuH42ds9770rtdWi6fDGpz8o=;
	b=hnWgyXOq9p++EunJsV5Aq5V1efsQ2/QqDWmt05rr/tLMbLzLI/gHbSblAxgmHeNydX
	Rt6lId+CBKuZcSPJP2UKNvqD8SOJAj57bcJmSxv7JnzEwyokNcwyiB99So6WWNlI/oLK
	O0OvVAIeLDvD26Mrqq3bJuzP3Zw14gOcf6bsBxCq4Cwwy5BvQ80VG1Y+HE41+rkLMdbz
	NkwMW+IbzML1DrYb5FFbGSrHim7kywoQEpLRUNAYj/cY6pc/oVB6pNN3WN3OO4vsWCoC
	1v7aTiBkOJ+WuHyZLNQegRtaY+1TvkF8el/s7gRw73QdhDWc/DkDnjcN4l1Qz+VuTXlb
	NyfA==
X-Received: by 10.14.205.194 with SMTP id j42mr31314eeo.119.1383090466325;
	Tue, 29 Oct 2013 16:47:46 -0700 (PDT)
Received: from mizar.localdomain
	(host234-252-dynamic.45-79-r.retail.telecomitalia.it.
	[79.45.252.234])
	by mx.google.com with ESMTPSA id m54sm76232908eex.2.2013.10.29.16.47.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 16:47:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2013 00:47:41 +0100
Message-Id: <1383090461-19086-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] machine: add more JFFS2_ERASEBLOCK definitions
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
X-List-Received-Date: Tue, 29 Oct 2013 23:47:46 -0000

some missing found googling on the web 
0x40000 explicited even if image_types.bbclass default

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/ben-nanonote.conf | 2 ++
 conf/machine/h1940.conf        | 2 ++
 conf/machine/h3900.conf        | 2 ++
 conf/machine/h4000.conf        | 2 ++
 conf/machine/rx1950.conf       | 3 +++
 conf/machine/rx3000.conf       | 1 +
 6 files changed, 12 insertions(+)

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index 407d453..e09eb70 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -10,6 +10,8 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
 #KERNEL_IMAGETYPE = "uImage"
 KERNEL_IMAGETYPE = "vmlinux.bin"
 
+JFFS2_ERASEBLOCK = "0x80000"
+
 #ScreenInfo
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "320"
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 6eba1df..cd7e9d2 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -15,6 +15,8 @@ KERNEL_IMAGETYPE = "uImage"
 UBOOT_LOADADDRESS = "0x30108000"
 UBOOT_ENTRYPOINT = "0x30108000"
 
+JFFS2_ERASEBLOCK = "0x4000"
+
 # Set features for task-base
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index 2d3c70a..ff4135c 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -19,6 +19,8 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 
 MACHINE_EXTRA_RDEPENDS = "kernel ipaq-boot-params"
 
+JFFS2_ERASEBLOCK = "0x40000"
+
 #
 # Modules autoload and other boot properties
 #
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index af392ca..151200e 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -26,6 +26,8 @@ MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-h4000-audio \
                              keymaps \
                             "
 
+JFFS2_ERASEBLOCK = "0x40000"
+
 #
 # Modules autoload and other boot properties
 #
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index 54fe6a4..e4f933c 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -20,5 +20,8 @@ MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat qvga"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 PREFERRED_VERSION_linux = "2.6.35"
 
+JFFS2_ERASEBLOCK = "0x4000"
+
 SERIAL_CONSOLE = "115200 ttyS0 vt100"
 USE_VT = "0"
+
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 726db84..536dd30 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -22,6 +22,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 MACHINE_EXTRA_RDEPENDS = "tiinit acx-firmware"
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-acx \
                             "
+JFFS2_ERASEBLOCK = "0x4000"
 
 #
 # Modules autoload and other boot properties
-- 
1.8.1.5


