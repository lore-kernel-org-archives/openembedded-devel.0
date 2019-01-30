Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAC87C268
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 15:06:03 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 4FA555C0F07;
	Wed, 30 Jan 2019 16:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548860763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=EddwVzd8TQUxbxH1qtVPV2i+CmZWEI4liJYQoWE0tOI=;
	b=eyAohDNrLK7PLbfYMGkg8IMqBOiDvQp3wM5ycwuT2hvsoDKwkM8HB6q2+ON5QcM33uVcRX
	oGlOVomtJNW+LfKzG4V4zDfOwB5jWc+1ZkOK3gTrtVDRWg7Izhd964SgJhOxecYUTovmna
	e6xja/JNgHLxJSaTNL5LXkwgVfyR7eQ=
From: Stefan Agner <stefan@agner.ch>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2019 16:05:50 +0100
Message-Id: <20190130150551.56036-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH 1/2] wireguard: use ${nonarch_base_libdir} for modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 15:06:03 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Use ${nonarch_base_libdir} for modules. This makes this recipe working
also when using usrmerge.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 .../recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
index 2c69c58f8..badc97a97 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20171221.bb
@@ -25,7 +25,7 @@ MODULE_NAME = "wireguard"
 PKG_${PN} = "kernel-module-${MODULE_NAME}"
 
 module_do_install() {
-    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
+    install -d ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}
     install -m 0644 ${MODULE_NAME}.ko \
-    ${D}/lib/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
+    ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/${MODULE_NAME}/${MODULE_NAME}.ko
 }
-- 
2.13.6


