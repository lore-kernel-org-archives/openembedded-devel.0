Return-Path: <chmorgan@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8A10165D6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 10:44:33 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id w8so6653342qac.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 03:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/NqsZxDL7eYVGH00C0q0jjX7cLzOGn4xDR2iFeD+GV4=;
	b=Jn2iKdeSkSvd7Jbs8bs7ZRIW64V+KMIF1gOZiP0HgenAw0amAlAnB8xCx6+ypXTk+U
	ZP16LA2bgh8i6t5r72H4d2LZA3IrtaiJRARKrHQVUK862k/EacKlP/vyHxbhsH1kJ86z
	ByB99bTBRrXhhW6cohJ2FMUH+y6UKji/MB06bzmhcmcBFAlJQ0ahoWYnujEG2EGUPEeP
	CL7ZrTOUYBeMU/jQ346Hi6O27TF/PR7fUel/A8aYh7bpXKbjfLDY2jTEFrVwoWNxIBoJ
	WD4xZWLuz2nOHK/yES1A2vTIaW+QctVyZjpFmxdob8HLVin+LnHToDIFibftxVez51sD
	TfWA==
X-Received: by 10.140.34.228 with SMTP id l91mr66934272qgl.85.1401878674763;
	Wed, 04 Jun 2014 03:44:34 -0700 (PDT)
Received: from localhost.localdomain (68-118-238-84.dhcp.oxfr.ma.charter.com.
	[68.118.238.84])
	by mx.google.com with ESMTPSA id h6sm3574235qaz.10.2014.06.04.03.44.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 03:44:34 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 06:44:10 -0400
Message-Id: <1401878650-3362-1-git-send-email-chmorgan@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH] Remove dfu-util svn recipes, these point at deprecated svn repositories, dfu-util uses git now
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 10:44:36 -0000

Signed-off-by: Chris Morgan <chmorgan@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb | 16 ----------------
 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb        | 16 ----------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
 delete mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_svn.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb b/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
deleted file mode 100644
index 4bed46a..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util-native_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require dfu-util_${PV}.bb
-
-inherit native deploy
-do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
-
-DEPENDS = "libusb-compat usbpath-native"
-
-do_deploy() {
-    install -d ${DEPLOY_DIR_TOOLS}
-    install -m 0755 src/dfu-util_static ${DEPLOY_DIR_TOOLS}/dfu-util-${PV}
-    rm -f ${DEPLOY_DIR_TOOLS}/dfu-util
-    ln -sf ./dfu-util-${PV} ${DEPLOY_DIR_TOOLS}/dfu-util
-
-}
-
-addtask deploy before do_package after do_install
diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb b/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
deleted file mode 100644
index 026a904..0000000
--- a/meta-oe/recipes-support/dfu-util/dfu-util_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "USB Device Firmware Upgrade utility"
-SECTION = "devel"
-AUTHOR = "Harald Welte <laforge@openmoko.org>"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRCREV = "4160"
-PV = "0.1+svnr${SRCPV}"
-PR = "r2"
-
-DEPENDS = "virtual/libusb0 usbpath"
-
-SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=dfu-util;protocol=http"
-S = "${WORKDIR}/dfu-util"
-
-inherit autotools
-
-- 
1.9.3


