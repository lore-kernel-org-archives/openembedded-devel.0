Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxz-0001ra-IP
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:34 +0200
Received: by mail-px0-f175.google.com with SMTP id 11so1624299pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=+Q+JjQ+IRu2XVPdxyviq+FBLWLcNiS7FtZ++ZlWzRC8=;
	b=RaSyLJ6GmJMg0OjCmfSZTxmKQ7axOOOlJHZAgG0JzG6mcc/8MnZA/L9Sf3D+J7guM7
	F6TT0ziQS549n5YgxrzkeQmx2vr76TA3eSQM/j/EzmfPh5zAiakMfGNUjdBg1QCl4fNg
	1d7lJVZ7YS8AxFUCCwQNmCVuFJZGpa+9TC4LE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mqgObr6sKYrMfQxqbJqyU5FH15CpWjQEhC9AXs7O34qhFImqlP/6GjEkKRcnRxv8nh
	jrIdX7NRqcFIkdCtIx7Mu4JI8UEh/5a5QVMkwXyneGZVJVruo1BQbj4NfMbBJgyZvfUb
	7G31aXsWvYpt7rqxM3Eqq7hFnVyHQMN3Bq9sI=
Received: by 10.142.140.19 with SMTP id n19mr2634599wfd.347.1283027102568;
	Sat, 28 Aug 2010 13:25:02 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:27 -0700
Message-Id: <1283027073-12308-18-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 17/23] initramfs-bootmenu-debug-image.bb, initramfs-bootmenu-image.bb: Rename klibc-utils-static-modprobe->klibc-static-utils-modprobe
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/images/initramfs-bootmenu-debug-image.bb |    2 +-
 recipes/images/initramfs-bootmenu-image.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/images/initramfs-bootmenu-debug-image.bb b/recipes/images/initramfs-bootmenu-debug-image.bb
index df5bf2b..a8f8ee3 100644
--- a/recipes/images/initramfs-bootmenu-debug-image.bb
+++ b/recipes/images/initramfs-bootmenu-debug-image.bb
@@ -1,7 +1,7 @@
 # initramfs image with interactive boot menu allowing to select rootfs location
 # from choices of block devices, loopback images and NFS.
 
-IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
+IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
 IMAGE_INSTALL += " dropbear dropbear-backdoor"
 IMAGE_LINGUAS = ""
 
diff --git a/recipes/images/initramfs-bootmenu-image.bb b/recipes/images/initramfs-bootmenu-image.bb
index 79806c9..51be798 100644
--- a/recipes/images/initramfs-bootmenu-image.bb
+++ b/recipes/images/initramfs-bootmenu-image.bb
@@ -1,7 +1,7 @@
 # initramfs image with interactive boot menu allowing to select rootfs location
 # from choices of block devices, loopback images and NFS.
 
-IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-utils-static-modprobe"
+IMAGE_INSTALL = "busybox-static initramfs-module-bootmenu initramfs-module-check-modules initramfs-module-kexecboot klibc-static-utils-modprobe"
 IMAGE_LINGUAS = ""
 
 
-- 
1.7.1



