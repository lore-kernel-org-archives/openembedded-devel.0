Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C1A457382F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 22:44:22 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so22633731wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PtxzRImEYwyFuM8vmfNYCqrK60vPaQk6qLpNlRWIV9w=;
	b=EJltVza7BCrqDjivA18u/nZy1WbOHRcHCHT6hRewLcuK+NxrOZ+zbm/0b6rXCaaVkI
	K2wn6wsTSQrWSHDcbpM4TPRbSPmjEsWXv7+oVBdiQ4rEzh6RQf+QlTy/7mV3O3OaVOwZ
	VyaC/bJvb1Oyd6gHiU/DeE0DsBCxIc1nH5ke+ZVW1VC95O/xoaA1Yy7FcNvRHbDfg7lV
	UXIXdAv981fxww3g5VmA6ETYa4g8BAhygHNNF9Bo/J0/C1IDqERbanshemEuiTaaZqz+
	76zSGIAFYFi9Lqx7Mo92tAqQIYRwOat5MDoCELFWtHMDIx4vmqzHBI46j4nORdc3nQwD
	uz3A==
X-Received: by 10.194.122.105 with SMTP id lr9mr10014598wjb.153.1429829063261; 
	Thu, 23 Apr 2015 15:44:23 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host220-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.220])
	by mx.google.com with ESMTPSA id
	cf12sm14189005wjb.10.2015.04.23.15.44.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 15:44:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 00:44:14 +0200
Message-Id: <1429829054-20925-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot-cfg: fix for real ('S') doesn't exist warning
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
X-List-Received-Date: Thu, 23 Apr 2015 22:44:26 -0000

Remove unneeded do_configure_prepend and set S = "${WORKDIR}"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index bd861f3..2ffa3be 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -6,11 +6,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 SRC_URI = "file://icon.xpm"
 
-S = "${WORKDIR}/${BP}"
+#S = "${WORKDIR}/${BP}"
+S = "${WORKDIR}"
+
+#do_configure_prepend () {
+#    install -m 0644 ${WORKDIR}/icon.xpm ${S}
+#}
 
-do_configure_prepend () {
-    install -m 0644 ${WORKDIR}/icon.xpm ${S}
-}
 do_install_prepend () {
 echo '# /boot/boot.cfg - KEXECBOOT configuration file.
 #
-- 
1.9.1


