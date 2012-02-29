Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2qhi-0002f9-DL
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 22:04:55 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD052E9FCA; Wed, 29 Feb 2012 21:56:25 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 21:56:15 +0100
Message-Id: <1330548975-5970-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] klibc: add MIT License
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
X-List-Received-Date: Wed, 29 Feb 2012 21:04:55 -0000

* After a talk with Beth Flanagan licensing is now clear:
* "LICENSE = "BSD-3-Clause & GPL-2.0 & MIT" (If it's --without-zlib).
* If not then it's: LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
* bump INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index bd365da..0f7cbbe 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
 minimal entaglement, and portability, not speed."
-LICENSE = "BSD-3-Clause & GPL-2.0 & Zlib"
+LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
-- 
1.7.3.4



