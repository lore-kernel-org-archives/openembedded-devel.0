Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pzw0m-0001Mz-7L
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 20:04:00 +0100
Received: by yxn22 with SMTP id 22so791539yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7LT4XwzGy3fWF8YBBgUrHwaky45H5tH+nna2+Lcu7io=;
	b=u0vI3L9YgfPpRhnUGsg+kVEHmqLmSZiIZbDRX1ieW0yqj3DQ4lbVHJ6zbYq3FCWBpM
	bJPGv0iqm0h38Ac15hsIh5HEuXvbmlty/NomfXfUzy4Z9RSMXoSpOhclkKvVqy48hSY8
	ypWSrpUmfUV/Pe2BCDAMrUmoHdPgs6/BFieCw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KIStIAvuXmmwrteX2OG5z9e8vCnIpwUW7QSfg9wEvgrkkdLKF0ELfmiMD6uu/u5OkE
	uFOLMYy1hViGaCIsaEIZjW8FEsuNJOxh1gfCVIfaURm1orYTRfQYEwQOjKvTuVAgdnfW
	+g7+bhc7Ge0THyEg0WeQDree3F2ZHd4Wt7zas=
Received: by 10.236.76.167 with SMTP id b27mr227039yhe.371.1300302132999;
	Wed, 16 Mar 2011 12:02:12 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k5sm766126yhm.21.2011.03.16.12.02.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 12:02:12 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 14:02:04 -0500
Message-Id: <1300302126-32560-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
References: <1300302126-32560-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 2/4] dm368-evm: Add configuration for DM368 machine
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
X-List-Received-Date: Wed, 16 Mar 2011 19:04:00 -0000

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
index 2621551..c85f5b6 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -208,10 +208,12 @@ SRCREV_dm355-evm     = "ea7387c9511ac92a46d3d147adffe36f868820e4"
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



