Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UWZzR-00068u-Rq
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 00:22:38 +0200
Received: by mail-ea0-f173.google.com with SMTP id m14so2286195eaj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 15:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Np0JBE8eMQVbNw696k1PM/9jP+zBzVEaUdRnYiKjcUk=;
	b=bY4XlPPCtk3hm6k1ZaCte1sHjyrMmgRlWBxv1lGebc6SZcH/RzC76crHQGhcIW3fJm
	50lAxjSNc7y3OfzgzGiCBtxERnDsiQrJ+OhrZEp8d0sOi7QxsZehreGHBw8eArNlFCHD
	QTlgudcKqav1iONZ+ddYhfaTT+VOpKcJGK2B/+GO95pssbZBDaHp0x3/WfAMZJVH+Ezt
	2VXdMxV6UlCD74VQZNwutGLcRRHg/m39GkPy6SJKqibfyI5mDPPNJheuv36YxBchqY2i
	mlpxfZacflaopZZmKh49tCC5X5N3s5H/sI73vQiFRa9t/HMa/onHkU5te9p7Hta9yuuJ
	jeQA==
X-Received: by 10.15.24.68 with SMTP id i44mr27642072eeu.19.1367186689858;
	Sun, 28 Apr 2013 15:04:49 -0700 (PDT)
Received: from mizar.localdomain
	(host80-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.80])
	by mx.google.com with ESMTPSA id j43sm29416765eep.4.2013.04.28.15.04.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 15:04:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 00:04:43 +0200
Message-Id: <1367186683-5805-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] kexecboot(-klibc): remove runtime dependency on kexec(-klibc)
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
X-List-Received-Date: Sun, 28 Apr 2013 22:22:44 -0000

* the binary itself can run without kexec (in host-debug mode) so
* specify in the cpio IMAGE which packages are needed at runtime

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb | 1 -
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index f9aee7c..a158eb4 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,4 +1,3 @@
-RDEPENDS_${PN} = "kexec-klibc"
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index fe1ef36..d664261 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,4 +1,3 @@
-RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
 PR = "r10+gitr${SRCREV}"
 
-- 
1.8.1.5



