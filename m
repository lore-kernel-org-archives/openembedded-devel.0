Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5C94B6ACA0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:27:51 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so4761753wiv.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fQfo4AfxzVX03qukrAa5SsMrOU7MQIlh2H3O98Sanbk=;
	b=UT1R/MBuxrk/AgBCPTeCRNqfGsgiIYEXF4bsku6GxI5PfMtGf0FQn7TstNKbo/a1tC
	7X/Y+ZOpNuRBwXdoQ6yq444SQHgr+F1rx3BKSbP8PWFv5VELgfIT4ZHIGn5fLISxNqQM
	se89oX5ZaytElNleljfIBA1g+d32oNyYs6h5exZOFroixOJZnxUZdPLkSzHGpFL+ceIR
	Q51FHZk921+3gQcAdc1hDpTL4CUuswJw60prSFyJgcU8GFeIp5CtB2mW7uWpXtHtJCyH
	lIKdmJMKjLUs8Yw5QsYPZH11Ixuet6LRVccqNEJNFghHsbgHFenhxexsmgp0X+g5F+tJ
	PYCQ==
X-Received: by 10.194.7.167 with SMTP id k7mr15754228wja.11.1406237272693;
	Thu, 24 Jul 2014 14:27:52 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host253-222-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.222.253])
	by mx.google.com with ESMTPSA id ub11sm9613wib.1.2014.07.24.14.27.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Jul 2014 14:27:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jul 2014 23:27:36 +0200
Message-Id: <1406237257-13724-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: do not exec do_package_qa task
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
X-List-Received-Date: Thu, 24 Jul 2014 21:27:59 -0000

The task was added with commit d31f75a72cb2322f753d945da86d5f3287eef06b
"insane: Split do_package_qa into a separate task (from do_package)"
and we avoid it because the recipe does not create packages.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
index 8c7f717..a823e0f 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
@@ -13,6 +13,7 @@ INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
 # disable unneeded tasks
 do_install[noexec] = "1"
 do_package[noexec] = "1"
+do_package_qa[noexec] = "1"
 do_packagedata[noexec] = "1"
 do_package_deb[noexec] = "1"
 do_package_ipk[noexec] = "1"
-- 
1.9.1


