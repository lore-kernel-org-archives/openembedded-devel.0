Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7878161110
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2013 00:09:41 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so740391eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2013 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OHNwQ7rHr+rfiGhKnBM8w2KJfQ6modi/rPHvbb0h4os=;
	b=ovE2IIfFxhX2YbMTAAaqvinvmA+j/Vno+kCFhRqmhCLlGnRoAY7tiNHO80YaWLTFLE
	EmbLigbDTV2QCHw6BVaHWSSRDS+OrnBrsAJMyKlqIGZ3Y37b3XMXelYwu8q80EUbP7A9
	1rLj8cdhV4WDjLATFfh8x4LGKREZmc7I/iylNs8bLQa6tZ29k0zisvFfard9aAFLHY1N
	+tFJ7hsxGJu1SCzOxUVp5vq0agBZIHRnu48MY8+PhcV+oGbpvaPmJDgt8b6RZdKJXhIs
	CuJ9UdBh+VP8SzyUdWXrNknr+2KGpG8CfQzXLjf8KEPzq9puUngsLtCKXuhd8XWh42Iu
	TzpQ==
X-Received: by 10.14.2.73 with SMTP id 49mr2268749eee.15.1387498181781;
	Thu, 19 Dec 2013 16:09:41 -0800 (PST)
Received: from mizar.localdomain
	(host247-89-dynamic.45-79-r.retail.telecomitalia.it. [79.45.89.247])
	by mx.google.com with ESMTPSA id
	o47sm13703869eem.21.2013.12.19.16.09.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Dec 2013 16:09:41 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2013 01:09:34 +0100
Message-Id: <1387498174-9872-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto*: zaurus: slim down kernel size
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
X-List-Received-Date: Fri, 20 Dec 2013 00:09:42 -0000

Adding a separate fragment with MD, ethernet and debug options removed 
which can be easily reenabled. Size is now around 2,3-2,5 megabytes.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/shrink_kernel.cfg       | 28 ++++++++++++++++++++++
 .../linux/linux-yocto-3.10/zaurus-common.scc       |  2 ++
 .../linux/linux-yocto-dev/shrink_kernel.cfg        | 28 ++++++++++++++++++++++
 .../linux/linux-yocto-dev/zaurus-common.scc        |  2 ++
 4 files changed, 60 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg
 create mode 100644 recipes-kernel/linux/linux-yocto-dev/shrink_kernel.cfg

diff --git a/recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg b/recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg
new file mode 100644
index 0000000..e784c03
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.10/shrink_kernel.cfg
@@ -0,0 +1,28 @@
+# CONFIG_MD is not set
+
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_FUJITSU is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XIRCOM is not set
+
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_BINARY_PRINTF is not set
+
+# CONFIG_KPROBES is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_KGDB is not set
diff --git a/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
index 6946ae0..b2354f8 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/zaurus-common.scc
@@ -10,3 +10,5 @@ include features/vfat/vfat.scc
 include features/scsi/disk.scc
 include features/hostapd/hostapd.scc
 include features/mac80211/mac80211.scc
+
+kconf hardware shrink_kernel.cfg
diff --git a/recipes-kernel/linux/linux-yocto-dev/shrink_kernel.cfg b/recipes-kernel/linux/linux-yocto-dev/shrink_kernel.cfg
new file mode 100644
index 0000000..e784c03
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-dev/shrink_kernel.cfg
@@ -0,0 +1,28 @@
+# CONFIG_MD is not set
+
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_CADENCE is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_CIRRUS is not set
+# CONFIG_NET_VENDOR_FARADAY is not set
+# CONFIG_NET_VENDOR_FUJITSU is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_WIZNET is not set
+# CONFIG_NET_VENDOR_XIRCOM is not set
+
+# CONFIG_FTRACE is not set
+# CONFIG_BRANCH_PROFILE_NONE is not set
+# CONFIG_BINARY_PRINTF is not set
+
+# CONFIG_KPROBES is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_KGDB is not set
diff --git a/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc b/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
index 6946ae0..b2354f8 100644
--- a/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
+++ b/recipes-kernel/linux/linux-yocto-dev/zaurus-common.scc
@@ -10,3 +10,5 @@ include features/vfat/vfat.scc
 include features/scsi/disk.scc
 include features/hostapd/hostapd.scc
 include features/mac80211/mac80211.scc
+
+kconf hardware shrink_kernel.cfg
-- 
1.8.1.5


