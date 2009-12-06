Received: from ey-out-1920.google.com ([74.125.78.146])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsV-0000vu-EE
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:47:04 +0100
Received: by ey-out-1920.google.com with SMTP id 5so985090eyb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nYG6GsRhJglKBA0HgDpASrZhwkmz+9yaoQMOMeFFBQw=;
	b=xNtq5na6NJR3Lht6mePVIiURmLyKZtLWjiDokFPi+cNzmjZoCCTQ4TuRrvrKSfwlFY
	RkU6BnmyR6aR3XbrIezygdOb5LQJILdGDo+BkrhRPRqAUvEUuGjSR56zD223e3CdaDoT
	tqnlhw4acgQRHzIp/zCOHK/8XQxJbWk1pAg8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZxcHgckMX18vrqf6LLaQ5BUEs0Zj5Gf0wwqNOs/CkSLcNN+evvDnBE7T1uK8vHfFV2
	4D6hRkJXxiqI/AZQyxvhZJl/n99HK8sW/s26kPWHBGfITImK7/rR1Epf0v3rrGieXDXs
	08fWScMaPLOKA4nvIhknG7c5LBoqIR2YjK7LA=
Received: by 10.213.103.210 with SMTP id l18mr6150731ebo.71.1260139518806;
	Sun, 06 Dec 2009 14:45:18 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:18 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:55 +0100
Message-Id: <1260139496-21442-20-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-19-git-send-email-leon@sidebranch.com>
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
X-SA-Exim-Connect-IP: 74.125.78.146
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] angstrom-2008.1.conf: Conditionally set linux-libc-header version.
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

Systems with non-upstream kernel need an older linux-libc-header
version. Use ?= instead of = so that machines can override the
version.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 conf/distro/angstrom-2008.1.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index abc9a93..51d8242 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -79,7 +79,7 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
 #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers 	?= "2.6.31"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
-- 
1.6.0.4



