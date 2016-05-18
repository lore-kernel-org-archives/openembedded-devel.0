Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2E00E60796
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 04:43:05 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id xm6so3721667pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 21:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s1U+JqbrqAFDxTAa4W3p9aJDziLBipvP5Y1/laDRzCY=;
	b=oDaDO6ApPsKWSHIUMu4vBCYrPizMc+7OHrWUNyXK+B3msjXByalDc6S6BwXUoJN741
	mSIem+n4sFw3eq3u38VC5VqFgPIO1wDtsKp+u2FHVMw6qaPJL0Pg5pWO21+lkDrqnFSs
	zQemazb6sS+BO/X4x7026vHZmUgaS0eCneQk4xNqqbF/qNfnuR6gKrn0LuKmX5HN6tFQ
	yBaMtephQ7ycGyPNLZEYxVmLn2OPqPzPpRVnYtqCHTLz6bFoG/599mGS8Ee63ES6uIaw
	BrR0NEibvfeid7x11U9hXFwCqoe6h4DrcPMLt+GgNIrXJZUjMP3NwGLoEK2be+RC+eaX
	bi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s1U+JqbrqAFDxTAa4W3p9aJDziLBipvP5Y1/laDRzCY=;
	b=OOmrjMcjbHebZ1BF6VVHUEGd0Jt+3AKeIEOCgYxWdHlOkMspPXk0FpJcyVHlx7G90t
	nIi50vlHup3qMWDjmbTcreYI+MQ3xpXNDqxfZu6Cs79Wu1Cd8kda4E8Uz/YNwiq74CUw
	IbcBLf/WnPPXbDaYVfCSLNNwsmEMwHlDmHC1B67H9vdLsNWjXjNBqJKAj/Bqvs9DaQ02
	IJN3so9Eqnm6Pei/TQ7thuS5GxDrWV+Jpk+T+j9UmYxTJRxnj/r4RZsZQ9c0t6Ygb4Ma
	c9OKHgZ8DRxdBjlmQbwTEh+ej15GUmeqsNCOYTLoKOHiT5zK7d+R2Dn4M8ZUQm+Bwiwx
	wo3g==
X-Gm-Message-State: AOPr4FWgssoaGQ2fXghJTXhL8mAydpk8m5EyjZU6/cwvSwmZqHiIpuQ1NvKoI+qLbhy4Mg==
X-Received: by 10.66.62.106 with SMTP id x10mr7703924par.136.1463546587019;
	Tue, 17 May 2016 21:43:07 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	126sm8307958pfg.93.2016.05.17.21.43.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:43:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 21:42:58 -0700
Message-Id: <1463546578-7021-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [meta-initramfs][PATCH] initramfs-kexecboot-klibc-image: Skip for nios2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 04:43:07 -0000

nios2 does not support klibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-bsp/images/initramfs-kexecboot-klibc-image.bb           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index df97511..da3023f 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -5,3 +5,9 @@ SUMMARY = "Initramfs image for kexecboot kernel (klibc-static binaries)"
 # We really need just kexecboot, kexec and ubiattach
 # statically compiled against klibc
 IMAGE_INSTALL = "kexecboot-klibc kexec-klibc ubiattach-klibc"
+
+python () {
+    if d.getVar('TARGET_ARCH', True) == "nios2":
+        raise bb.parse.SkipPackage("'nios2' not supported arch")
+}
+
-- 
2.8.2


