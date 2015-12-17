Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 719336FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 00:05:50 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id p187so23762136wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=47jGN5xNZ1YKq79pEloXlR+qIrHLbv3C2ITj9KW+k/s=;
	b=RRR0Hrm0vnziyf92qPTccTdlkzVcSehL6eB6jY+rJ41hmR2Ncw9i9KRtLt3J2trxBu
	8N6QU1TOjTmxplPD4CvrnVzxOCKyfRV6daxrjHvGs11RqUikShIzZ6dTkag19uZ6QkWq
	v6OPIWpzxd5jVS1yIad1ijfpI1YQFurLm89WwUMnh0c7rH+VnHHGnUQ+FDwzKbHaZO/R
	tvO0DWocW0uMdaNHOO2dZrwyoYF02s0glF9gTUKP1P3IpFIZNp5PHaOa9JIuwxpcIon7
	TeNJc0ipIuLGMlxK8FzdWatJCyIj8AR/jGQciwR2wcr/obwvsR5SNMh8MS/Xvm6ZUUnK
	weww==
X-Received: by 10.28.45.72 with SMTP id t69mr520875wmt.32.1450310751326;
	Wed, 16 Dec 2015 16:05:51 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host67-146-dynamic.30-79-r.retail.telecomitalia.it. [79.30.146.67])
	by smtp.gmail.com with ESMTPSA id t3sm7925732wjz.11.2015.12.16.16.05.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Dec 2015 16:05:50 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2015 01:05:44 +0100
Message-Id: <1450310744-27645-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: add explicit SRC_URI
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
X-List-Received-Date: Thu, 17 Dec 2015 00:05:51 -0000

After commit c2492ed SRC_URI of the recipe contains the kdump script.
Kdump is not in the purposes of this recipe so we restore the plain SRC_URI.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index d5b7bbe..c9fec25 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -8,6 +8,8 @@ inherit klibc
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
 
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+
 SRC_URI += " \
             file://kexec-elf-rel.patch \
             file://kexec-syscall.patch \
-- 
1.9.1


