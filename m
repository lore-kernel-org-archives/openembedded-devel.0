Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1O9yBJ-0007ZX-49
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:19:49 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DD9B8491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 May 2010 12:16:02 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 6 May 2010 12:17:05 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 6E49372078; Thu,  6 May 2010 12:16:02 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 May 2010 12:15:49 +0200
Message-Id: <1273140949-14699-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <4BE185C7.50305@dresearch.de>
References: <4BE185C7.50305@dresearch.de>
X-OriginalArrivalTime: 06 May 2010 10:17:05.0261 (UTC)
	FILETIME=[46D739D0:01CAED05]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Thu, 06 May 2010 10:19:49 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 conf/distro/angstrom-2008.1.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 1df0c0b..760166b 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -81,7 +81,8 @@ PREFERRED_VERSION_linux-handhelds-2.6 ?= "2.6.21-hh20"
 #KERNEL_INITRAMFS_PATH = "${KERNEL_INITRAMFS_DIR}/$(readlink ${KERNEL_INITRAMFS_DIR}initramfs-bootmenu-image-${MACHINE}.cpio.gz)"
 
 #This is unrelated to the kernel version, but userspace apps (e.g. HAL) require a recent version to build against
-PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers       ?= "2.6.31"
+PREFERRED_VERSION_linux-libc-headers_hipox ?= "2.6.24"
 
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
-- 
1.6.4.2



