Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PzvzP-0001Ly-C4
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:02:35 +0100
Received: by gxk3 with SMTP id 3so75253gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=gWRZ6FZ+xyOTwqdmaG/onpKAmpLr3YtoYVCZFh0t5AA=;
	b=rpxHhFB8Kw+qeG8DBw5BODLy99kzEM72uz7EMgyx7Cs3m+71OyI7MX2fvPDiM5aNMg
	R+TRYxAywDu9PsxtahUAJuCEAURAJ+lhI6aDP2fSVhBuoZXjhA8jkVDLRMfUrbGhkHmv
	r9rpjOIqQmcWqIIRQPPfAS1O6QmpH+thEbPvE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Xo5mPFZm1H0ylbblofnmf6Gr5QMuE5DK4CE5IbCv7evAOV1OJbwEkTE6Jo7lfPzelu
	BSJHDstpnJgXeXIH/5qSPwhAl406USb3HFqCKGMGAFjrDWTtuBBC0OH8X0XhYXDw3Pd5
	XzmO5WcVSW2H0r2urzeX8LDDqBTiQZgTRVMqM=
Received: by 10.236.182.138 with SMTP id o10mr345892yhm.65.1300301646206;
	Wed, 16 Mar 2011 11:54:06 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u29sm105866yhn.71.2011.03.16.11.54.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 11:54:05 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 13:54:01 -0500
Message-Id: <1300301642-18461-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2][2011.03-maintenance] dm368-evm: Add configuration for DM368 machine
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
X-List-Received-Date: Wed, 16 Mar 2011 19:02:35 -0000

* Added the configuration for the dm368-evm machine type.
* Updated the sort.sh script
* Updated the Linux kernel and u-boot recipes to support this
  new device.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/{dm365-evm.conf => dm368-evm.conf}    |    4 ++--
 contrib/angstrom/sort.sh                           |   18 +++++++++---------
 recipes/linux/linux-davinci.inc                    |    2 +-
 .../linux-davinci/{dm365-evm => dm365}/defconfig   |    0
 recipes/linux/linux-davinci_git.bb                 |    2 +-
 recipes/u-boot/u-boot_git.bb                       |   10 ++++++----
 6 files changed, 19 insertions(+), 17 deletions(-)
 copy conf/machine/{dm365-evm.conf => dm368-evm.conf} (57%)
 rename recipes/linux/linux-davinci/{dm365-evm => dm365}/defconfig (100%)

diff --git a/conf/machine/dm365-evm.conf b/conf/machine/dm368-evm.conf
similarity index 57%
copy from conf/machine/dm365-evm.conf
copy to conf/machine/dm368-evm.conf
index 5a51616..f916b36 100644
--- a/conf/machine/dm365-evm.conf
+++ b/conf/machine/dm368-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: DM365 CPUs on a Davinci DM365 EVM board
-#@DESCRIPTION: Machine configuration for the TI Davinci DM365 EVM board
+#@NAME: DM368 CPUs on a Davinci DM368 EVM board
+#@DESCRIPTION: Machine configuration for the TI Davinci DM368 EVM board
 
 require conf/machine/include/davinci.inc
 require conf/machine/include/dm365.inc
diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index 225ca08..b8d702b 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -59,15 +59,15 @@ case "$arch" in
  at91sam9263ek at91sam9g10ek at91sam9g20ek at91sam9g45ek at91sam9g45ekes
  at91sam9rlek aximx50 aximx50v bd-neon c7x0 chumby chumby-falconwing cm-x270
  cm-x300 da830-omapl137-evm da850-omapl138-evm davinci-dvevm davinci-sffsdr
- devkitidp-pxa255 dm355-evm dm355-leopard dm357-evm dm365-evm dm6446-evm
- dm6467-evm dm6467t-evm dns323 dockstar e680 ea3250 em-x270 er0100 eseries
- ghi270 gumstix gumstix-connex gumstix-custom-connex gumstix-custom-verdex
- gumstix-verdex h1910 h2200 h3900 h4000 h5000 hawkboard hipox htcalpine
- htcapache htcblueangel htchimalaya htcsable htctornado htcuniversal hx2000
- hx4700 imote2 ixp4xxle kixrp435 kuropro logicpd-pxa270 looxc550 lspro
- magician mainstone mh355 mp900c mtx-3 mtx-3a mv2120 mx21ads mx27ads n2100
- navman-icn330 netbook-pro neuros-osd neuros-osd2 nhk15 nokia770 nslu2le
- omap1510inn omap1610h2 omap1710h3 omap5912osk openrd-base openrd-client
+ devkitidp-pxa255 dm355-evm dm355-leopard dm357-evm dm365-evm dm368-evm
+ dm6446-evm dm6467-evm dm6467t-evm dns323 dockstar e680 ea3250 em-x270 er0100
+ eseries ghi270 gumstix gumstix-connex gumstix-custom-connex
+ gumstix-custom-verdex gumstix-verdex h1910 h2200 h3900 h4000 h5000 hawkboard
+ hipox htcalpine htcapache htcblueangel htchimalaya htcsable htctornado
+ htcuniversal hx2000 hx4700 imote2 ixp4xxle kixrp435 kuropro logicpd-pxa270
+ looxc550 lspro magician mainstone mh355 mp900c mtx-3 mtx-3a mv2120 mx21ads
+ mx27ads n2100 navman-icn330 netbook-pro neuros-osd neuros-osd2 nhk15 nokia770
+ nslu2le omap1510inn omap1610h2 omap1710h3 omap5912osk openrd-base openrd-client
  palmld palmt650 palmt680 palmtc palmtt palmtt3 palmtt5 palmtx palmz31
  palmz71 palmz72 poodle qemuarm rokre2 rokr-e2 rokre6 ronetix-pm9261
  ronetix-pm9263 sgh-i900 sheevaplug spitz stamp9g20evb topas910 tosa
diff --git a/recipes/linux/linux-davinci.inc b/recipes/linux/linux-davinci.inc
index a1233d4..6ee5752 100644
--- a/recipes/linux/linux-davinci.inc
+++ b/recipes/linux/linux-davinci.inc
@@ -8,7 +8,7 @@ require multi-kernel.inc
 SRC_URI = "git://arago-project.org/git/projects/linux-davinci.git;protocol=git \
 	file://defconfig"
 
-COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|dm6467t-evm|dm355-evm|dm365-evm)"
+COMPATIBLE_MACHINE = "(dm6446-evm|dm6467-evm|dm6467t-evm|dm355-evm|dm365-evm|dm386-evm)"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes/linux/linux-davinci/dm365-evm/defconfig b/recipes/linux/linux-davinci/dm365/defconfig
similarity index 100%
rename from recipes/linux/linux-davinci/dm365-evm/defconfig
rename to recipes/linux/linux-davinci/dm365/defconfig
diff --git a/recipes/linux/linux-davinci_git.bb b/recipes/linux/linux-davinci_git.bb
index e25a15a..13e2f61 100644
--- a/recipes/linux/linux-davinci_git.bb
+++ b/recipes/linux/linux-davinci_git.bb
@@ -3,7 +3,7 @@ require multi-kernel.inc
 DESCRIPTION = "Linux kernel for DaVinci processors"
 KERNEL_IMAGETYPE = "uImage"
 
-COMPATIBLE_MACHINE = "(dm355-evm|dm365-evm|dm6446-evm|dm6467-evm|dm6467t-evm|omapl137|omapl138|dm355-leopard|davinci-sffsdr|hawkboard)"
+COMPATIBLE_MACHINE = "(dm355-evm|dm365-evm|dm6446-evm|dm6467-evm|dm6467t-evm|omapl137|omapl138|dm355-leopard|davinci-sffsdr|hawkboard|dm368-evm)"
 
 DEFAULT_PREFERENCE = "1"
 DEFAULT_PREFERENCE_dm365 = "-1"
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 410e0b1..804b0e8 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -243,10 +243,12 @@ SRCREV_dm355-evm     = "ea7387c9511ac92a46d3d147adffe36f868820e4"
 PV_dm355-evm         = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
 PE_dm355-evm         = "1"
 
-SRC_URI_dm365-evm    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=u-boot-davinci-2009.06"
-SRCREV_dm365-evm     = "ea7387c9511ac92a46d3d147adffe36f868820e4"
-PV_dm365-evm         = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
-PE_dm365-evm         = "1"
+# Use this for both dm365-evm and dm368-evm devices by using the dm365
+# SOC_FAMILY
+SRC_URI_dm365    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=u-boot-davinci-2009.06"
+SRCREV_dm365     = "ea7387c9511ac92a46d3d147adffe36f868820e4"
+PV_dm365         = "2009.05+2009.06-rc0+${PR}+gitr${SRCREV}"
+PE_dm365         = "1"
 
 SRC_URI_dm6446-evm   = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=u-boot-davinci-2009.06"
 SRCREV_dm6446-evm    = "ea7387c9511ac92a46d3d147adffe36f868820e4"
-- 
1.7.0.4



