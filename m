Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id AFC6D6CE93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 22:46:21 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so1475073eae.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Kvs4AC/T+ohTPENjx5bhw/DSsgzR166ZFJCXON6gSL8=;
	b=VjLkn03PU1JtGgMhxJHYY7t3EqzNZLX0abPc3gQ9egHUMY0HMu3kCVH0rtu2T4M7U3
	qoZOduf0BzTzfkxSkkTWF+07a2QLrxAlNmOZTfhSojRXanVW01XTX4QaqjPjS59+8WYB
	Zya5qvvhAHVJOLaDj7LPBBMs1wCAsSHsW8lYX0gCXWKOrObT1rQHT0dGLRNWQDzpXx+z
	LUh1aqrOOK594dLxtqfy/rSa1VdTiQLmm7NDysEj0FOJisb+WC+vIr9ej+4c4KYc1VQK
	mwJYvB/YagslinSGKsnYgIWsBbW2GtVtUjkzvQOvJxLytrFdABrabMjUWywzb9rlx3Ij
	avvw==
X-Received: by 10.15.64.1 with SMTP id n1mr24319246eex.15.1381445183047;
	Thu, 10 Oct 2013 15:46:23 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id
	h52sm106773373eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 15:46:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 00:46:20 +0200
Message-Id: <1381445180-5220-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] kexecboot_0.6: fix LIC_FILES_CHKSUM for kexecboot-klibc
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
X-List-Received-Date: Thu, 10 Oct 2013 22:46:22 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 7b8d088..4657505 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -37,6 +37,7 @@ HOMEPAGE = "http://kexecboot.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+S = "${WORKDIR}/kexecboot-${PV}"
 SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
 SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0ac7849298258f0f15"
-- 
1.8.1.5


