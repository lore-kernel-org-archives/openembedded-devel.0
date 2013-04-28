Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UWZP1-0002uo-0i
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Apr 2013 23:45:00 +0200
Received: by mail-ee0-f43.google.com with SMTP id b47so1482759eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 14:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DmntrECj1UkWHk8uUzDJF3iOZjyIbWOrEkV9GWfdY2Q=;
	b=CceeZRijwSRYGYyrTshWPIme8A1V6fI7GyNbncCTas3eTRyBggA4GmCZmpttlI79L2
	LdnZx2t7O92cNrxePiPdfufoUzn7qJIZzYqORCjOtZOlnebiqSkk7g6/CL9i7Q9ob9+m
	1t7ZA8TTpGyubqno21LHJhPdiZSgx3ZQclzy8H+imnLZeMunpNy30H8ZY4OVGRau0jgB
	GCeFGyPYn2T15Kg4NLnjnaS34f+K8zFVYn6S5w7PKs0jtZpdY11Zqy1O5qEAjzpNomhQ
	tMuyLeE84ed/WEXd5oYxQMKgrUu64AZNvE02vBIXmMObCvz+9NbEI0y3Hh+bsRarZbfH
	wKUQ==
X-Received: by 10.14.0.5 with SMTP id 5mr115271376eea.13.1367184431062;
	Sun, 28 Apr 2013 14:27:11 -0700 (PDT)
Received: from mizar.localdomain
	(host80-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.80])
	by mx.google.com with ESMTPSA id
	r10sm11473291eez.10.2013.04.28.14.27.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 14:27:10 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Apr 2013 23:26:44 +0200
Message-Id: <1367184404-4572-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1367184404-4572-1-git-send-email-andrea.adami@gmail.com>
References: <1367184404-4572-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] initramfs-kexecboot(-klibc)-image: Drop legacy export of IMAGE_BASENAME
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
X-List-Received-Date: Sun, 28 Apr 2013 21:45:13 -0000

* We used to export this in the days an external script handled the image
* generation. This is no longer the case and hence we no longer need
* this export.
* As committed in oe-core with 919613c0e75362ee0eace99b51cc77d34a05372f

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb       | 2 --
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index e706ea8..dbe5583 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -16,8 +16,6 @@ IMAGE_INSTALL = "kexec kexecboot mtd-utils-ubifs"
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
 
-export IMAGE_BASENAME = "initramfs-kexecboot-image"
-
 IMAGE_LINGUAS = ""
 IMAGE_LOGIN_MANAGER = ""
 IMAGE_INIT_MANAGER = ""
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 92f387c..8c90fd2 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -2,8 +2,6 @@ require initramfs-kexecboot-image.bb
 
 IMAGE_INSTALL = "kexec-klibc kexecboot-klibc ubiattach-klibc"
 
-export IMAGE_BASENAME = "initramfs-kexecboot-klibc-image"
-
 # current version is known to fail on x86 and x86-64
 # due to missing vfscanf() in klibc
 COMPATIBLE_MACHINE_x86 = "(-)"
-- 
1.8.1.5



