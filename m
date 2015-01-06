Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id CE9647201A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:01:25 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so29086247wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=iEuXicQ3EHoy28rql0CvIKwFWnR8I29bMgXJow9Vqcg=;
	b=Oqjh/sJsDy2HwQ5UKoNXfQRPtS/p24lU7s2vsCAmf4KSAG5mCWAXasBOx7Y+J2re/Q
	1J2Nv6OdnSDSfbMHx0S7E5bXjRgchOKtRzZRfQfnAJc2KBOwLgyqw7GQ6EXJ/MQpIZU/
	K9MPyUdSwP3fUiUZnvza+3sWBPy8US5cmhhpgIdtxnDAoxVUlC/5+04MTqSp+OCNgDS0
	w8QP54kgOLU5O/x04XVBp+kSthL6dRvMIGJiGi1/uJlUO4tNgZti3QZen8K0zNtCwcNY
	fzs2uUoLvrXlbUyUzU7oNuaLNTLmAjGwkcGGLb0qYwGwErNsr68QaBYp17j7Tzhndo7X
	Pbcw==
X-Received: by 10.180.20.242 with SMTP id q18mr35154589wie.80.1420542086181;
	Tue, 06 Jan 2015 03:01:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	c10sm78991054wjy.4.2015.01.06.03.01.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Jan 2015 03:01:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jan 2015 12:01:25 +0100
Message-Id: <1420542085-9367-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-oe][PATCH] linux.inc: support building with B != S which is default now
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
X-List-Received-Date: Tue, 06 Jan 2015 11:01:35 -0000

* this .inc file wasn't working since oe-core commit:
  commit 106dab2fd0321e6b4e77b40111e59a3a31d329d4
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Fri Dec 19 17:46:27 2014 +0000
  Subject: kernel: Fix non linux-yocto builds
* Fixes following do_configure error
  | NOTE: make oldconfig
  | make: *** No rule to make target `oldconfig'.  Stop.
  | ERROR: oe_runmake failed

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-kernel/linux/linux.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-kernel/linux/linux.inc
index 7b301ae..e200127 100644
--- a/meta-oe/recipes-kernel/linux/linux.inc
+++ b/meta-oe/recipes-kernel/linux/linux.inc
@@ -28,14 +28,14 @@ kernel_conf_variable() {
     CONF_SED_SCRIPT="$CONF_SED_SCRIPT /CONFIG_$1[ =]/d;"
     if test "$2" = "n"
     then
-        echo "# CONFIG_$1 is not set" >> ${S}/.config
+        echo "# CONFIG_$1 is not set" >> ${B}/.config
     else
-        echo "CONFIG_$1=$2" >> ${S}/.config
+        echo "CONFIG_$1=$2" >> ${B}/.config
     fi
 }
 
 do_configure_prepend() {
-    echo "" > ${S}/.config
+    echo "" > ${B}/.config
     CONF_SED_SCRIPT=""
 
     #
@@ -43,8 +43,8 @@ do_configure_prepend() {
     #
     if [ -e ${WORKDIR}/logo_linux_clut224.ppm ]; then
         install -m 0644 ${WORKDIR}/logo_linux_clut224.ppm drivers/video/logo/logo_linux_clut224.ppm
-    kernel_conf_variable LOGO y
-    kernel_conf_variable LOGO_LINUX_CLUT224 y
+        kernel_conf_variable LOGO y
+        kernel_conf_variable LOGO_LINUX_CLUT224 y
     fi
 
     #
@@ -59,7 +59,7 @@ do_configure_prepend() {
 
     # When enabling thumb for userspace we also need thumb support in the kernel
     if [ "${ARM_INSTRUCTION_SET}" = "thumb" ] ; then
-    kernel_conf_variable ARM_THUMB y
+        kernel_conf_variable ARM_THUMB y
     fi
 
     kernel_conf_variable CMDLINE "\"${CMDLINE} ${CMDLINE_DEBUG}\""
@@ -112,9 +112,9 @@ do_configure_prepend() {
     fi
 
     sed -e "${CONF_SED_SCRIPT}" \
-    < '${WORKDIR}/defconfig' >>'${S}/.config'
+    < '${WORKDIR}/defconfig' >>'${B}/.config'
 
-    yes '' | oe_runmake oldconfig
+    yes '' | oe_runmake -C ${S} O=${B} oldconfig
 }
 
 do_configure_append() {
-- 
2.2.1


