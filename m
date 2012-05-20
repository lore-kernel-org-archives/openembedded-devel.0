Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SWDyR-0005qG-Qg
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 May 2012 23:47:35 +0200
Received: from mizar.localdomain (87.0.30.151) by smtp209.alice.it (8.6.023.02)
	id 4EF08A6310BC7C61; Sun, 20 May 2012 23:37:29 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 May 2012 23:37:21 +0200
Message-Id: <1337549842-1438-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
References: <1337549842-1438-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][meta-initramfs][PATCH 2/3] klibc: upgrade to git tag c2c7f19
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
X-List-Received-Date: Sun, 20 May 2012 21:47:35 -0000

* include last patches of may 2012
* tracking upstream wrt forthcoming 2.0 release
* bump INC_PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 3706598..4466225 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -21,7 +21,7 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
-SRCREV = "f8e0ad9812f5e3fe0e7006061b1d5f9f67a80325"
+SRCREV = "c2c7f19a094bba822995f7eba8ec8dfc5cbe4fdb"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
-- 
1.7.3.4



