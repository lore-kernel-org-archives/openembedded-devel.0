Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TiZOG-0004pD-5z
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Dec 2012 00:37:32 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so13717eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 15:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZxAwCcDVETK7J6/LmSOgsdH5nI15CPeWzXfBnfiDXfw=;
	b=CnJcWSreydsQSAbPw4gX02DMxMWVK0pAvi6tCxBsEO05Qb9zGWWVavBZfwPEeLKPeI
	5liL9prMQieGXZDQSW3kNi3TQHaj4rly0vwcv+k+vPL8Go0JJPTKh4DpP60pI5yedW1n
	NSiWIXYXLI5Q8rWJeKOkz3kWkriVSUuyvwCAjXoG0XZ7Prp2tERufMnPyPiFFQv87c5F
	XA/oyrH/YaHybvdpVZycbb64s/jSOJXXQxDxfUdkCYeuTojWA7fwj/scIj0w07UAgDht
	4mhZL5zTUYRPHtdWw0JprgSVn8VzBBzvA4HRIg1edHpGsBSYp5RpaJ8nOCK35c6MEyng
	QqsA==
Received: by 10.14.206.197 with SMTP id l45mr65036509eeo.17.1355268179569;
	Tue, 11 Dec 2012 15:22:59 -0800 (PST)
Received: from mizar.localdomain
	(host85-229-dynamic.1-79-r.retail.telecomitalia.it. [79.1.229.85])
	by mx.google.com with ESMTPS id 6sm40582357eea.3.2012.12.11.15.22.58
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2012 15:22:58 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Dec 2012 00:22:54 +0100
Message-Id: <1355268174-17953-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-initramfs][PATCH] kexecboot(-klibc): upgrade to b667914
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
X-List-Received-Date: Tue, 11 Dec 2012 23:37:32 -0000

* now including boot from ubifs
* fixed extra menu redrawing
* 24bpp fixes
* first round of big-endian fixes

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/kexecboot-klibc_git.bb   |    4 ++--
 .../recipes-bsp/kexecboot/kexecboot_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index da479c8..f9aee7c 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -1,9 +1,9 @@
 RDEPENDS_${PN} = "kexec-klibc"
 PV = "0.5.9"
-PR = "r9+gitr${SRCREV}"
+PR = "r10+gitr${SRCREV}"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
-SRCREV = "0daa774eac019602cd89048961e95985ea50dadf"
+SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
 S = "${WORKDIR}/git"
 
 # the binary is statically linked against klibc
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index a3b4cde..fe1ef36 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -1,9 +1,9 @@
 RDEPENDS_${PN} = "kexec"
 PV = "0.5.9"
-PR = "r9+gitr${SRCREV}"
+PR = "r10+gitr${SRCREV}"
 
 SRC_URI = "git://github.com/kexecboot/kexecboot.git;protocol=git"
-SRCREV = "0daa774eac019602cd89048961e95985ea50dadf"
+SRCREV = "b667914bb0cba1c30f9b771abccfe98f1419afeb"
 S = "${WORKDIR}/git"
 
 require kexecboot.inc
-- 
1.7.8.6



