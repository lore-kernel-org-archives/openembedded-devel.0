Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OvFGz-0002us-Ns
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 22:05:07 +0200
Received: by pxi11 with SMTP id 11so2389454pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=j5ESmMHcXrQeHwNJBk66B1Tb9MpJdG7xBdl5gr3m3n0=;
	b=Max+Grf2gGyFX16pD6DHRj4K9QjsGS7winjakZrh6tBt/ErCxvOFlgIiN//8NoMflg
	TGUiUkQbBrOKM4qC6nsz6zpgpTOBGjbBprS0P8CRZ5uJPZcRJCXOh05UDlT1eLtua1i5
	gEelNsPb9r4S59fJOKcAkTJcAbAr3YLKDb6j8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cCfb3j10gTaWWI//OFKLGN5z6kIZ9MHEgz+BQdggRETRP3rgGfXafNkulxImZy3o6g
	ZGfyk3sb8BYHirTX+ZeIpSKadYIPa32NNnEJ0oM145T1ZtNrVYlMgwHiBKHjbfAeEPuy
	T8fjYQUa/xcm9x3nl9yps35e7AMnJ1++E5b/o=
Received: by 10.142.230.8 with SMTP id c8mr412205wfh.313.1284408257610;
	Mon, 13 Sep 2010 13:04:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n36sm9143169wfa.4.2010.09.13.13.04.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 13 Sep 2010 13:04:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 13:04:13 -0700
Message-Id: <1284408253-19465-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v2] libgles-omap3_3.01.00.07.bb: Add recipe
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
X-List-Received-Date: Mon, 13 Sep 2010 20:05:07 -0000

* Fix omap3-sgx-modules_1.4.14.2616.bb to use new SDK

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/powervr-drivers/libgles-omap3.inc          |    2 +-
 .../powervr-drivers/libgles-omap3_3.01.00.07.bb    |   19 +++++++++++++++++++
 .../omap3-sgx-modules_1.4.14.2616.bb               |    8 +++-----
 3 files changed, 23 insertions(+), 6 deletions(-)
 create mode 100644 recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index d183486..a3a280b 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -24,7 +24,7 @@ PROVIDES += "virtual/egl"
 # 
 # voila!
 
-SRC_URI = "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
 		   file://cputype \
 		   file://rc.pvr \
 		   file://sample.desktop \
diff --git a/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
new file mode 100644
index 0000000..30a65b3
--- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb
@@ -0,0 +1,19 @@
+BINLOCATION = "${S}/gfx_rel_es3.x"
+
+ES2LOCATION = "${S}/gfx_rel_es2.x"
+ES3LOCATION = "${S}/gfx_rel_es3.x"
+ES5LOCATION = "${S}/gfx_rel_es5.x"
+
+require libgles-omap3.inc
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+SGXPV = "3_01_00_07"
+IMGPV = "1.4.14.2616"
+BINFILE := "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+SRC_URI[md5sum] = "b33a82d393ed0a6c26ad0d952542d762"
+SRC_URI[sha256sum] = "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f8fcfd74d0f2559d8e"
+
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
index 0d2818b..fc98b7b 100644
--- a/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
@@ -10,12 +10,11 @@ PR_append = "c"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
 
-SGXPV = "3_01_00_06"
+SGXPV = "3_01_00_07"
 IMGPV = "1.4.14.2616"
 BINFILE := "OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin"
 
 SRC_URI = "http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_${SGXPV}.bin \
-           file://texture-width.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}/GFX_Linux_KM"
@@ -35,6 +34,5 @@ do_install() {
 	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
 	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
 }
-
-SRC_URI[md5sum] = "7aa37ca72f34011d353e72cc67f8aac1"
-SRC_URI[sha256sum] = "02276bc728699c36b0d2411c60f23030aa066ca6b8ed5adb7a40204563a227fb"
+SRC_URI[md5sum] = "b33a82d393ed0a6c26ad0d952542d762"
+SRC_URI[sha256sum] = "6f1720c2a8c2ce84b0020e144c2d77b56106a1fff45b44f8fcfd74d0f2559d8e"
-- 
1.7.1



