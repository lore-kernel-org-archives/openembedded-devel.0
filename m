Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJQf-0001Kf-LQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:42:33 +0100
Received: from mizar.localdomain (79.16.253.172) by smtp209.alice.it
	(8.6.023.02) id 4EF08A63019A2BB9; Sat, 7 Jan 2012 00:35:09 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat,  7 Jan 2012 00:35:04 +0100
Message-Id: <f22d0ec2c680acefa5832dbe510faa5cd77421de.1325892485.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1325892485.git.andrea.adami@gmail.com>
References: <cover.1325892485.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1325892485.git.andrea.adami@gmail.com>
References: <cover.1325892485.git.andrea.adami@gmail.com>
Subject: [meta-oe] [PATCH 1/2] kernel.bbclass: fix pkg_postinst and pkg_postrm (from oe-core)
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
X-List-Received-Date: Fri, 06 Jan 2012 23:42:33 -0000

* Symptom: kernel symlink in /boot is not created.
* Rename in order to create the expected files:
* /var/lib/opkg/info/kernel-3.1.4.postinst
* /var/lib/opkg/info/kernel-3.1.4.postrm

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 41f9b2d..e6f1bfa 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -228,11 +228,11 @@ do_savedefconfig() {
 do_savedefconfig[nostamp] = "1"
 addtask savedefconfig after do_configure
 
-pkg_postinst_kernel () {
+pkg_postinst_kernel-base () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
 
-pkg_postrm_kernel () {
+pkg_postrm_kernel-base () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
 }
 
-- 
1.7.3.4



