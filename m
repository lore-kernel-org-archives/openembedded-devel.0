Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f53.google.com (unknown [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 76B47660F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 23:24:12 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so3128806eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 May 2014 16:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y8OZXEXmEFBq6vjIelLCN0x0AS6glxVxp5wGHAVk20U=;
	b=XWdbsVty3kyuSg7nWpW1vvHNP9bBkj6xir86kn8R+eMC31v3Nd3rynI+1X1YDa96oW
	p6915GcaN0holqERl5vlZtibIhoUh6dk5esw1VvvHJt3rW53YwhqCJ5QbbE7QAkTLW1W
	paY58/y5PfKlZgMwwTWfaetjTHc8LJCPEs/V+/aMQp2ntEs+1WHGZ1uhPjakILU4P4H8
	18r8lYnzrP9hdF4LAQxvAW4VUCRyRdML5NfMnGXAukov43/+rA38vyK8Zc6B3fkvD2Ra
	1TDUwfEcnX4ERb7WXLnd61K3STM5a9hIuxovM7WMnkEU1Bg7VlZ8mykoME4EQLgbj+4p
	7TWw==
X-Received: by 10.14.127.9 with SMTP id c9mr1724049eei.93.1400801053886;
	Thu, 22 May 2014 16:24:13 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host38-245-dynamic.48-82-r.retail.telecomitalia.it. [82.48.245.38])
	by mx.google.com with ESMTPSA id h6sm3794049eew.38.2014.05.22.16.24.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 May 2014 16:24:13 -0700 (PDT)
From: YourName <andrea.adami@gmail.com>
X-Google-Original-From: YourName <email@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 May 2014 01:24:05 +0200
Message-Id: <1400801045-14912-2-git-send-email-email@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400801045-14912-1-git-send-email-email@gmail.com>
References: <1400801045-14912-1-git-send-email-email@gmail.com>
Subject: [meta-handheld][PATCH 2/2] initramfs-mininit-klibc-image: initial commit
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
X-List-Received-Date: Thu, 22 May 2014 23:24:14 -0000

From: Andrea Adami <andrea.adami@gmail.com>

This cpio does the job of finding and loop-mounting the rootfs file.
See https://github.com/pcercuei/mininit

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../images/initramfs-mininit-klibc-image.bb        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 recipes-bsp/images/initramfs-mininit-klibc-image.bb

diff --git a/recipes-bsp/images/initramfs-mininit-klibc-image.bb b/recipes-bsp/images/initramfs-mininit-klibc-image.bb
new file mode 100644
index 0000000..18aad75
--- /dev/null
+++ b/recipes-bsp/images/initramfs-mininit-klibc-image.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Initramfs image for mininit kernel"
+DESCRIPTION = "This image provides mininit (helper for booting loop images)."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+# avoid circular dependencies
+EXTRA_IMAGEDEPENDS = ""
+
+# We really need just kexecboot, kexec and ubiattach
+IMAGE_INSTALL = "mininit-klibc"
+
+# Do not pollute the initrd image with rootfs features
+IMAGE_FEATURES = ""
+
+IMAGE_LINGUAS = ""
+
+FEED_DEPLOYDIR_BASE_URI = ""
+LDCONFIGDEPEND = ""
+
+inherit image
-- 
1.9.1


