Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SMR07-0008QB-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2012 23:40:51 +0200
Received: from mizar.localdomain (87.5.26.19) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD0B30A57A; Mon, 23 Apr 2012 23:31:19 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Apr 2012 23:31:14 +0200
Message-Id: <1335216674-11159-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
References: <1335216674-11159-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-kexecboot_3.2: unlock removing DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Mon, 23 Apr 2012 21:40:51 -0000

* klibc can now be built against kernel >3.1

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-kexecboot_3.2.bbappend |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
index 909bf9e..6ea2a00 100644
--- a/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
+++ b/recipes-kernel/linux/linux-kexecboot_3.2.bbappend
@@ -1,8 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/linux-kexecboot-${PV}:${THISDIR}/files:"
 
-# wait until klibc_2.0 is out (march/april 2012)
-DEFAULT_PREFERENCE = "-1"
-
 PR = "${INC_PR}.1"
 COMPATIBLE_MACHINE = "(akita|c7x0|collie|poodle|tosa|spitz)"
 
-- 
1.7.3.4



