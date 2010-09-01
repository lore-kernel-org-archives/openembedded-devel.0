Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OqrzC-0005hm-DJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 20:24:40 +0200
Received: by gya6 with SMTP id 6so3359102gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 11:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=h9ikwdplri3pJk0PRLznr89qpZ1jeGln4ZgvsNXRh0o=;
	b=KwOjWhl9Udrl6BtMTLbAZ+YJlEhGZqer9yCLMk240gv6gWWJKGSKPyn1kzaF+VlknG
	8v4wEAdQX0kbXNltlcyBLCh8GJr0X1oqgXRE/fA6gMKGSEMzmNco9Btlh2VR2aVnsSQy
	mWutSQYh49yyo88LeSowLL72ppeP5LdvsI8Hk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NpWs17CrAUIi9iF3/F1dezqoUdcknJsX+hM2CLFU25v1Ay+sBUHIVffhbMUjdLtzE4
	SjzNASQGTm8LiLFEWo6No2lI4E/fAf6FuGaGuSq0fEaTBTQxIbFO6zkFWorePiYiy0Th
	ZSqIoTTrQRh3DdUlrzNhgSzNXmlF3OQbziVhI=
Received: by 10.150.133.5 with SMTP id g5mr1095467ybd.311.1283365443292;
	Wed, 01 Sep 2010 11:24:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u42sm10435313yba.0.2010.09.01.11.24.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Sep 2010 11:24:02 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Sep 2010 13:15:07 -0500
Message-Id: <1283364908-21950-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] ti-graphics-sdk: Update download links
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
X-List-Received-Date: Wed, 01 Sep 2010 18:24:42 -0000

* Changed the download links to point to the specific version
  of the TI Graphics SDK installer rather than to just the
  latest.
* The libgles-omap3.inc file still contains the link to the
  latest version of the installer.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc          |    5 ++++-
 .../powervr-drivers/libgles-omap3_3.01.00.02.bb    |    2 +-
 .../powervr-drivers/libgles-omap3_3.01.00.06.bb    |    2 +-
 .../omap3-sgx-modules_1.4.14.2514.bb               |    2 +-
 .../omap3-sgx-modules_1.4.14.2616.bb               |    2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index d183486..5b248b0 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -15,7 +15,10 @@ PROVIDES += "virtual/egl"
 # 1. if you don't already have a ti account get one here. it's free:
 #  http://www.ti.com/hdr_my_ti
 # 2. fetch the gl-es bin (full OMAP Graphics SDK) from here:
-#  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+#    Check the libgles recipe for your version to find the link to the
+#    download for that version.  The following link will provide the
+#    latest version available.
+#    http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
 # 3. put the OMAP35x_*.bin file in $DL_DIR, i.e. downloads/
 #  mv OMAP35x_Graphics_SDK_setuplinux_3_01_00_06.bin ./downloads/
 # 4. make the checksum file in ./downloads/ directory:
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
index 3b68c18..544fabf 100644
--- a/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb
@@ -5,7 +5,7 @@ require libgles-omap3.inc
 PR = "r7"
 
 # download required binary distribution from:
-# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
 SGXPV = "3_01_00_02"
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
index bb7994f..0d41a23 100644
--- a/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb
@@ -7,7 +7,7 @@ ES5LOCATION = "${S}/gfx_rel_es5.x"
 require libgles-omap3.inc
 
 # download required binary distribution from:
-# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+#  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
 SGXPV = "3_01_00_06"
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
index 6f6e073..a2fcf22 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR_append = "a"
 
 # download required binary distribution from:
-# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_02/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
index 0d2818b..4ed2540 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 PR_append = "c"
 
 # download required binary distribution from:
-# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/3_01_00_06/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
 
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
-- 
1.7.0.4



