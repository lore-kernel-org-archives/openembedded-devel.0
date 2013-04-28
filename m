Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UWZOt-0002u9-E2
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Apr 2013 23:44:54 +0200
Received: by mail-ee0-f54.google.com with SMTP id e49so1292938eek.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Apr 2013 14:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=JLI2vqFOoDyugJUGk+FewP3UJTIknlHH/WDDJU2qv8M=;
	b=FiO0vX41wclJrXK1trr2j8brBEbmUp16LZt/D4jKU/EwrWq9fk/6LmWoesUTFK4jyd
	3YhA5zn//BpypRne+CMpS9bImpmecEZyjfruwjvXNpihqXBeDak7ZN0Xyuh0Yz5Yziwq
	5Wdyyk/dO2x3RY9l57uP2Jo28vjs/h9zCm7y26f0IGu4UcvyAh4UDD3N9ArxPYjEVdkx
	bQ2zeUxIhBQgt9TDOV292C/991E95LP1wzERuixrjIdCU+ejDWPhTVMTUQkmXpPNw2Ka
	eGL9+dZFDIyPpwhbJCNR/21CHLy84U3Ac+kSAZdj8SpaET6+JGS/Tje5DVp1IWAGToi3
	2f4Q==
X-Received: by 10.14.0.5 with SMTP id 5mr115270481eea.13.1367184423248;
	Sun, 28 Apr 2013 14:27:03 -0700 (PDT)
Received: from mizar.localdomain
	(host80-250-dynamic.0-87-r.retail.telecomitalia.it. [87.0.250.80])
	by mx.google.com with ESMTPSA id
	r10sm11473291eez.10.2013.04.28.14.27.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Apr 2013 14:27:02 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Apr 2013 23:26:42 +0200
Message-Id: <1367184404-4572-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 1/3] kexec-tools-klibc_2.0.2: mask recipe for x86 and x86-64
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
X-List-Received-Date: Sun, 28 Apr 2013 21:45:05 -0000

* current recipe is failing because as of today klibc lacks vfscanf()
* and basename(). This latter is trivial to solve.
* Commit 3bf0213789d56054f601c5a06372f78567aacdd9 of kexec-tools
* introduced the issue in kexec/arch/i386/x86-linux-setup.c

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index 90b876c..d5a2ecc 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -7,6 +7,11 @@ inherit klibc
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
 
+# current version is known to fail on x86 and x86-64
+# due to missing vfscanf() in klibc
+COMPATIBLE_MACHINE_x86 = "(-)"
+COMPATIBLE_MACHINE_x86-64 = "(-)"
+
 SRC_URI += "file://elf.patch \
             file://errno.patch \
             file://string.patch \
-- 
1.8.1.5



