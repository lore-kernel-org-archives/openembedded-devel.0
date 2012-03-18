Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S93th-0001ph-HL
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 01:22:57 +0100
Received: from mizar.localdomain (87.14.251.149) by smtp209.alice.it
	(8.6.023.02) id 4EF08A6309B30BE1; Sun, 18 Mar 2012 01:14:08 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 01:13:55 +0100
Message-Id: <1332029635-5078-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-handheld][PATCH] keymaps: edit script to reuse 2.6 kernel keymaps
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
X-List-Received-Date: Sun, 18 Mar 2012 00:22:57 -0000

* The keymap.sh script installed by oe-core recipe has a check
* for KERNEL_MAJMIN=`uname -r | cut -d '.' -f 1,2`
* so the keymaps-2.6.map's are ignored when running 3.x kernels
* Thus, we replace the suffix of the runtime kernel with "2.6" in the .bbappend.
* Bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/keymaps/keymaps_1.0.bbappend |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/keymaps/keymaps_1.0.bbappend b/recipes-bsp/keymaps/keymaps_1.0.bbappend
index d3310c1..039b30c 100644
--- a/recipes-bsp/keymaps/keymaps_1.0.bbappend
+++ b/recipes-bsp/keymaps/keymaps_1.0.bbappend
@@ -1,4 +1,4 @@
-PRINC = "1"
+PRINC = "2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
@@ -20,6 +20,11 @@ SRC_URI_append_jornada6xx   = " file://keymap-uk-620-660.map \
 				file://keymap-uk.map \
 				"
 
+# we still use keymap-2.6.map files
+do_configure_append () {
+    sed -i -e 's/KERNEL_MAJMIN=.*$/KERNEL_MAJMIN="2.6"/' ${WORKDIR}/keymap.sh
+}
+
 do_install_append () {
     case ${MACHINE} in
         c7x0 | tosa | akita | spitz | collie | poodle | h2200 | h4000 | hx4700 | jornada6xx )
-- 
1.7.3.4



