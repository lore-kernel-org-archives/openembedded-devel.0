Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1QK1HX-0005RI-Lp
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 06:44:19 +0200
Received: by gxk3 with SMTP id 3so59573gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 21:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RsrIWGk1Zo3Cyv22wYQzU3i74BvOPRcagrti6xwzzMc=;
	b=o97PDr+RzMtk+g55UuX8TB1YmruSEUmpEz91nhaVwxVZiySkvQ6EpavWekCgqec0Q2
	I6hpuio8xik5E3/PARqvN6l8FQdOmx/cRhzGoVA0ZGWgDKzXlX9ssK3D70zeahFkAgBN
	wdGrGSZ3EiclyAWgHMLbeiCnAbvanFvIUHoSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BPitWwq9tj7CLPMTvAaI7rMhnp/w93+3TRt4swdftj6mF2Nk++6383UjtYrq77Ripw
	artZ0eU44N2RoDqEbsb2kdh1QqRY2ghLBlQ0qJOYnJ0orKLs9uZNovuWNsCYzP68xkVt
	pnPZW/oPKgybbw1TSidDg+6KsEFUZftBl0GHI=
Received: by 10.90.194.2 with SMTP id r2mr4043369agf.86.1305088893128;
	Tue, 10 May 2011 21:41:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u11sm6708310anq.23.2011.05.10.21.41.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 21:41:32 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 May 2011 10:11:21 +0530
Message-Id: <1305088881-3527-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305088881-3527-1-git-send-email-heroor@gmail.com>
References: <1305088881-3527-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/2] ti816x machine: Update for latest kernel version
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
X-List-Received-Date: Wed, 11 May 2011 04:44:19 -0000

From: Siddharth Heroor <heroor@ti.com>

* In 2.6.37 the console is tied to ttyO2.
* Bump PR.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 conf/machine/include/ti816x.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti816x.inc b/conf/machine/include/ti816x.inc
index 9db1df8..ca0b4f5 100644
--- a/conf/machine/include/ti816x.inc
+++ b/conf/machine/include/ti816x.inc
@@ -7,7 +7,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-omap3"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 KERNEL_IMAGETYPE = "uImage"
 
@@ -22,5 +22,5 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 # Ship all kernel modules
 IMAGE_FSTYPES += "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lqn -e 128"
-SERIAL_CONSOLE = "115200 ttyS2"
+SERIAL_CONSOLE = "115200 ttyO2"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 ethernet"
-- 
1.7.0.4



