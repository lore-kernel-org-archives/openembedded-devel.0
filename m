Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RTWUt-0003Ic-Re
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:25:39 +0100
Received: by mail-fx0-f47.google.com with SMTP id t2so2756831faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 02:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iELjXYI8jUqE5PGrhEAx1i2qC1SRNDWI5RCk6p33NHw=;
	b=V7Z1XxT7XUMHds6EoMtqYS/DH7QBDG3EUpgDCE9utbkDRsNT2Wq/qq6mzKlWn/BjiH
	HC/mSUaiL8QRtB/h2nP5Fba4RjUfl+IVROeoYayXhcsLZWqZmknRrEur8J9hRLhYVXeD
	dxza3AUUfkXTnHGSdBxrwptjyX9Gm34UoWH0g=
Received: by 10.180.108.114 with SMTP id hj18mr28594088wib.2.1322129945372;
	Thu, 24 Nov 2011 02:19:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v6sm9259558wix.1.2011.11.24.02.19.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 02:19:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Nov 2011 11:18:41 +0100
Message-Id: <39ba8867e5460d67c8be4e972cb5b06e5d2b40ba.1322129758.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
References: <0004016e514fbb3f18793561ebf85766344ae499.1322129758.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322129758.git.Martin.Jansa@gmail.com>
References: <cover.1322129758.git.Martin.Jansa@gmail.com>
Subject: [meta-handheld 2/6] linux(kexecboot): update from 3.1.1 to 3.1.2
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
X-List-Received-Date: Thu, 24 Nov 2011 10:25:39 -0000

From: Andrea Adami <andrea.adami@gmail.com>

* apply latest patchset
* fix missing sha256sum in linux-kexecboot_3.1.bb

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.1.bb |    9 +++++----
 recipes-kernel/linux/linux_3.1.bb           |   10 +++++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.1.bb b/recipes-kernel/linux/linux-kexecboot_3.1.bb
index 44c76d6..d04be36 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.1.bb
+++ b/recipes-kernel/linux/linux-kexecboot_3.1.bb
@@ -1,12 +1,12 @@
 require linux-kexecboot.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 S = "${WORKDIR}/linux-${PV}"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.0/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.0/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -22,4 +22,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "8eb92cc70e7f8d1d18a349ba8c029d7d"
+SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
+SRC_URI[stablepatch.sha256sum] = "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/linux_3.1.bb
index c714040..88511c3 100644
--- a/recipes-kernel/linux/linux_3.1.bb
+++ b/recipes-kernel/linux/linux_3.1.bb
@@ -1,11 +1,11 @@
 require linux.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
-SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.0/linux-${PV}.tar.bz2;name=kernel \
-           ${KERNELORG_MIRROR}/linux/kernel/v3.0/patch-${PV}.1.bz2;apply=yes;name=stablepatch \
+SRC_URI += "${KERNELORG_MIRROR}/linux/kernel/v3.x/linux-${PV}.tar.bz2;name=kernel \
+           ${KERNELORG_MIRROR}/linux/kernel/v3.x/patch-${PV}.2.bz2;apply=yes;name=stablepatch \
            file://defconfig \
            file://${LOGO_SIZE}/logo_linux_clut224.ppm.bz2 \
            "
@@ -21,5 +21,5 @@ SRC_URI_append_poodle = " \
 
 SRC_URI[kernel.md5sum] = "8d43453f8159b2332ad410b19d86a931"
 SRC_URI[kernel.sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-SRC_URI[stablepatch.md5sum] = "8eb92cc70e7f8d1d18a349ba8c029d7d"
-SRC_URI[stablepatch.sha256sum] = "192b3716fa29bafcf8871676d530cf008b4bcc9ae98f1fde812de2a1047ee4c3"
+SRC_URI[stablepatch.md5sum] = "7487d8e6f00c077f6e15d6f4f9947c30"
+SRC_URI[stablepatch.sha256sum] = "bc6508cc2d275cbf4a20af74d7454d22791e439948c31b8397d265c20dfd6bb6"
-- 
1.7.8.rc3



