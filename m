Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1QLWWN-0001wM-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 10:17:51 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id BDFA6E92A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 May 2011 09:43:05 +0200 (CEST)
X-SENDER-IP: [83.227.57.42]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ais3AOqCz01T4zkqPGdsb2JhbACmFAsBAQEBNzK8OQGMDYYZBJARjnc
X-IronPort-AV: E=Sophos;i="4.64,368,1301868000"; d="scan'208";a="188284159"
Received: from c-2a39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost) ([83.227.57.42])
	by ipb2.telenor.se with ESMTP; 15 May 2011 09:43:05 +0200
From: ulf.samuelsson@atmel.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 09:43:01 +0200
Message-Id: <1305445381-4215-1-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH] at91: support linux-2.6.30 exp.4 patchset
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
X-List-Received-Date: Sun, 15 May 2011 08:17:51 -0000

From: Ulf Samuelsson <ulf.samuelsson@atmel.com>

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/linux/linux_2.6.30.bb |   62 ++++++++++++++++++++++------------------
 1 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/recipes/linux/linux_2.6.30.bb b/recipes/linux/linux_2.6.30.bb
index 4313e36..a49246c 100644
--- a/recipes/linux/linux_2.6.30.bb
+++ b/recipes/linux/linux_2.6.30.bb
@@ -26,25 +26,51 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=ke
            file://aufs2-30.patch \
            file://defconfig"
 
-SRC_URI_at91sam9m10ekes = " \
+AT91_EXPERIMENTAL_4 = " \
 	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
 	   http://maxim.org.za/AT91RM9200/2.6/${PV}-at91.patch.gz;apply=no;name=at91patch \
 	   ftp://www.at91.com/pub/linux/${PV}-at91/${PV}-at91-exp.${AT91_EXPERIMENTAL}.tar.gz;apply=no;name=at91exp${AT91_EXPERIMENTAL} \
-	   file://at91/exp.${AT91_EXPERIMENTAL}/0001-Configurable-partition-size.patch;apply=yes \
-	   file://at91/exp.${AT91_EXPERIMENTAL}/0002-mach-at91-KConfig-cleanup.patch;apply=yes \
+	   file://at91/exp.4/0001-Configurable-partition-size.patch;apply=yes \
+	   file://at91/exp.4/0002-mach-at91-KConfig-cleanup.patch;apply=yes \
 	   http://linux.hd-wireless.se/pub/Linux/BuildSAM9M10EKES/2.6.30-at91-sdio-irq-support-both-slots.patch;apply=yes;name=owlwifi \
-	   file://exp.${AT91_EXPERIMENTAL}/defconfig"
+	   file://defconfig"
+
+AT91_EXPERIMENTAL_2 = " \
+	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+	   http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;apply=yes;name=at91patch \
+	   ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2;apply=yes;name=at91exp2 \
+	   file://at91/linux-2.6.30-001-configurable-partition-size.patch.patch \
+	   file://at91/linux-2.6.30-002-mach-at91-Kconfig.patch \
+	   file://at91/linux-2.6.30-003-sam9m10g45ek.patch \
+	   file://defconfig"
 
 at91sam_patch = " \
 		"
 
-do_patch_prepend_at91sam9m10ekes() {
-	bb.build.exec_func('do_apply_at91_exp_patch', d)
-}
+SRC_URI_at91sam9m10ekes = "${AT91_EXPERIMENTAL_4}"
+SRC_URI_at91cap9stk	= "${AT91_EXPERIMENTAL_4}"
+SRC_URI_at91		= "${AT91_EXPERIMENTAL_2}"
+
+SRC_URI_append_at91sam9260ek = ${at91sam_patch}
+SRC_URI_append_at91sam9261ek = ${at91sam_patch}
+SRC_URI_append_at91sam9263ek = ${at91sam_patch}
+SRC_URI_append_at91sam9g10ek = ${at91sam_patch}
+SRC_URI_append_at91sam9g20ek = ${at91sam_patch}
+SRC_URI_append_at91sam9g20ek_2mmc = ${at91sam_patch}
+SRC_URI_append_at91sam9g45ekes = ${at91sam_patch}
+SRC_URI_append_at91sam9m10ekes = ${at91sam_patch}
+SRC_URI_append_at91sam9m10g45ek = ${at91sam_patch}
+SRC_URI_append_at91sam9rlek = ${at91sam_patch}
+SRC_URI_append_at91sam9xeek = ${at91sam_patch}
+
+#do_patch_prepend_at91sam9m10ekes() {
+#	bb.build.exec_func('do_apply_at91_exp_patch', d)
+#}
+
+addtask do_apply_at91_exp_patch before do_patch after do_unpack
 
 do_apply_at91_exp_patch () {
 	cd	${WORKDIR}
-	mv	exp.${AT91_EXPERIMENTAL}/defconfig	defconfig
 	cd	${S}
 	cat	../${PV}-at91.patch	| patch -p1
 	for	f in `ls ../${PV}-at91-exp.${AT91_EXPERIMENTAL}/*.patch` ; do
@@ -52,14 +78,6 @@ do_apply_at91_exp_patch () {
 	done
 }
 
-SRC_URI_at91 = " \
-	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
-	   http://maxim.org.za/AT91RM9200/2.6/2.6.30-at91.patch.gz;apply=yes;name=at91patch \
-	   ftp://www.at91.com/pub/buildroot/2.6.30-exp.2.patch.bz2;apply=yes;name=at91exp2 \
-	   file://at91/linux-2.6.30-001-configurable-partition-size.patch.patch \
-	   file://at91/linux-2.6.30-002-mach-at91-Kconfig.patch \
-	   file://at91/linux-2.6.30-003-sam9m10g45ek.patch \
-	   file://defconfig"
 
 SRC_URI_ronetix-pm9g45 = " \
 	   ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
@@ -84,18 +102,6 @@ SRC_URI_ronetix-pm9g45 = " \
 
 SRC_URI_append_mpc8315e-rdb = " file://mpc8315erdb-add-msi-to-dts.patch"
 
-SRC_URI_append_at91sam9260ek = ${at91sam_patch}
-SRC_URI_append_at91sam9261ek = ${at91sam_patch}
-SRC_URI_append_at91sam9263ek = ${at91sam_patch}
-SRC_URI_append_at91sam9rlek = ${at91sam_patch} 
-SRC_URI_append_at91sam9g20ek = ${at91sam_patch}
-SRC_URI_append_at91sam9g20ek_2mmc = ${at91sam_patch}
-SRC_URI_append_at91sam9g10ek = ${at91sam_patch}
-SRC_URI_append_at91sam9xeek = ${at91sam_patch}
-SRC_URI_append_at91sam9g45ekes = ${at91sam_patch}
-SRC_URI_append_at91sam9m10ekes = ${at91sam_patch}
-SRC_URI_append_at91sam9m10g45ek = ${at91sam_patch}
-
 # SRC_URI_append_at91sam9263ek = " file://hrw-linux-2.6.30-exp.patch "
 
 SRC_URI[kernel.md5sum] = "7a80058a6382e5108cdb5554d1609615"
-- 
1.7.4.1



