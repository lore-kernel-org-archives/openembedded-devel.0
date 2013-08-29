Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6306BEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:36:12 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so810464pbb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ItaQoDYHjbhWoLarSmiI9Cgu+yLIzqL3ZVRu68Ebzbk=;
	b=kRpfKlQQzJuYJp6572mRiQWm31mvDfxpO/T3GW1AiagPeSafbxUp83dudYxyOJLTQS
	8W4FIB7wTiKAAzqPDDRPInTJokai/jbfb6ZerNbeR+1VCEUl6CcWRD9MfsF9FxHRJKB+
	Mr6VVVboK79v9w711GSQ/FmEKxWI1GCprBlN/aLp8d6b7sA2Zyl2VbMEis0y5oNlsfWa
	72sRq2wO8hgXE0W273Wn50hyKbkprl8Ubpblyz9UyK54wvEwdtrxSQ4iNpVb0g7swPxA
	e6lXKV9ZNyrPc08hGVyptANyUytRUepGjMxcNB3tuqEdiWm3IpnPB/oC1Wr8IlOudwTL
	7mVg==
X-Received: by 10.68.211.233 with SMTP id nf9mr5391621pbc.26.1377801373425;
	Thu, 29 Aug 2013 11:36:13 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26]) by mx.google.com with ESMTPSA id
	zi1sm39412487pbb.28.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:36:12 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:35:55 +0400
Message-Id: <1377801358-3942-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
References: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core 2/5] qemu: Add support for qemuarma9.
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
X-List-Received-Date: Thu, 29 Aug 2013 18:36:12 -0000

This commit
- adds support for qemuarma9 machine support based on the vexpress-a9
  platform.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/conf/machine/qemuarma9.conf |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/qemuarma9.conf

diff --git a/meta/conf/machine/qemuarma9.conf b/meta/conf/machine/qemuarma9.conf
new file mode 100644
index 0000000..a46e28c
--- /dev/null
+++ b/meta/conf/machine/qemuarma9.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@NAME: qemuarma9
+#@DESCRIPTION: Machine configuration for QEMU ARM Cortex-A9.
+
+# Specify the default tune.
+DEFAULTTUNE = "armv7a-neon"
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-cortexa9.inc
+
+# Specify the preferred kernel version.
+PREFERRED_VERSION_linux-yocto ?= "3.8%"
+
+# Specify the kernel devicetree.
+KERNEL_DEVICETREE = "vexpress-v2p-ca9.dtb"
+
+# Specify the machine name used by the kernel.
+KMACHINE_qemuarma9 = "vexpress"
+
+# Specify the kernel image type.
+KERNEL_IMAGETYPE = "uImage"
+
+# Specify the serial console parameters.
+SERIAL_CONSOLE = "115200 ttyAMA0"
-- 
1.7.10.4


