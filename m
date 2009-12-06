Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsW-0000ZO-2I
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:47:04 +0100
Received: by mail-ew0-f224.google.com with SMTP id 24so4866247ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nseiW1PSLV4lsgtFqghs5FWL3oYE/Khut89XH5pRF/M=;
	b=dm9R0ddsiRk1AKrZ9z4Y3p6x+eO2FrGzT0ndmYhqQRndrs/KtKwNlf8PLHinePxMEY
	Q/mEAMwMprAvRDeVPUI7rqJeAzdZ4mvyOyXbOvNCLJAC/D2MVl/n5Z9IMbNfTSl7zAq7
	stB+yjPJ+EPyyTXeZEE7gBLDOS42/7rlSY7Jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=A+IYBT+PfBpVs+jtTaRuEWAE10FkDyont1DJmvZau5pMjj/nlqa99pJHOKtcREsAJg
	sfMC78fPuj7zPbIotQepPWw0tXtYPjCtvau56syr2r0fNS/IoY80kXjX/mDFN0t498Vk
	TAdtmFh7DK0h6/lbsWPpIAlQZzquFp/s5C8aw=
Received: by 10.213.102.202 with SMTP id h10mr5259161ebo.76.1260139519440;
	Sun, 06 Dec 2009 14:45:19 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:19 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:56 +0100
Message-Id: <1260139496-21442-21-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-20-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
	<1260139496-21442-4-git-send-email-leon@sidebranch.com>
	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
	<1260139496-21442-7-git-send-email-leon@sidebranch.com>
	<1260139496-21442-8-git-send-email-leon@sidebranch.com>
	<1260139496-21442-9-git-send-email-leon@sidebranch.com>
	<1260139496-21442-10-git-send-email-leon@sidebranch.com>
	<1260139496-21442-11-git-send-email-leon@sidebranch.com>
	<1260139496-21442-12-git-send-email-leon@sidebranch.com>
	<1260139496-21442-13-git-send-email-leon@sidebranch.com>
	<1260139496-21442-14-git-send-email-leon@sidebranch.com>
	<1260139496-21442-15-git-send-email-leon@sidebranch.com>
	<1260139496-21442-16-git-send-email-leon@sidebranch.com>
	<1260139496-21442-17-git-send-email-leon@sidebranch.com>
	<1260139496-21442-18-git-send-email-leon@sidebranch.com>
	<1260139496-21442-19-git-send-email-leon@sidebranch.com>
	<1260139496-21442-20-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] angstrom-2008.1.conf: Hard-code the nios2 version for linux-libc-headers.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:47:04 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/distro/angstrom-2008.1.conf |    3 ++-
 conf/machine/include/nios2.inc   |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 51d8242..63f6e3d 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -79,7 +79,8 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
 #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers_nios2	= "nios2-2.6.28"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
diff --git a/conf/machine/include/nios2.inc b/conf/machine/include/nios2.inc
index e23c72d..6a693fc 100644
--- a/conf/machine/include/nios2.inc
+++ b/conf/machine/include/nios2.inc
@@ -15,6 +15,7 @@ PREFERRED_VERSION_linux-nios2 ?= "2.6.28"
 # Select the nios2-specific toolchain parts
 PREFERRED_VERSION_binutils = "nios2-2.15"
 PREFERRED_VERSION_binutils-cross = "nios2-2.15"
+# For Angstrom, this is set in angstrom-2008.1.conf
 PREFERRED_VERSION_linux-libc-headers = "nios2-2.6.28"
 PREFERRED_VERSION_elf2flt-cross = "nios2-git"
 PREFERRED_VERSION_gcc-cross = "nios2-3.4.6"
-- 
1.6.0.4



