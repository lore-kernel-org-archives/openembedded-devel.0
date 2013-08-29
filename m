Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 442F36BEF0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:36:15 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so817265pbb.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3wdMMfZ3hRK1nfgDe2nISOrgbOVled7J5ND0SCMywyc=;
	b=04O79zo96ZzYji73FFjiUpfXQJsfjuQSyNPpSHag0XAJ4l7xtk1n08YB82yANNh+F0
	WXj1T59JgZCN298pwDKq+zw2CvRmenpIRtcKC24Vjp+0l8lHJhtkFTIXu9FUYsm35V6Y
	Pzrjc6HG/+MOpVwqSRhQ4khIRcDdJu3d0KbZZsTFhVqhdPPPkRaSJzUV6+PLhW04U+My
	G/jn73xgo5Q3pwi9ubeUrvV8WP3yUTEyG5volsSprEeuziSFRb0ys4IiNN+ivZCekSEU
	8xocJwz7pzRwlO5lpB6Q337qpklwQP9DEFTvmMJjkh1j1Vovmz9vPxw6gO3VCorNDzKj
	tWug==
X-Received: by 10.66.26.132 with SMTP id l4mr5955471pag.138.1377801376376;
	Thu, 29 Aug 2013 11:36:16 -0700 (PDT)
Received: from titan.du.ae ([94.205.106.26]) by mx.google.com with ESMTPSA id
	zi1sm39412487pbb.28.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:36:15 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 22:35:56 +0400
Message-Id: <1377801358-3942-3-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
References: <1377801358-3942-1-git-send-email-elvis.dowson@gmail.com>
Cc: bruce.ashfield@windriver.com, Elvis Dowson <elvis.dowson@gmail.com>
Subject: [oe-core 3/5] qemu: Add support for qemuarmv7.
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
X-List-Received-Date: Thu, 29 Aug 2013 18:36:15 -0000

This commit
- adds support for qemuarmv7 machine support based on the beagleboard
  platform.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/conf/machine/qemuarmv7.conf |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/machine/qemuarmv7.conf

diff --git a/meta/conf/machine/qemuarmv7.conf b/meta/conf/machine/qemuarmv7.conf
new file mode 100644
index 0000000..7f70ddb
--- /dev/null
+++ b/meta/conf/machine/qemuarmv7.conf
@@ -0,0 +1,18 @@
+#@TYPE: Machine
+#@NAME: qemuarmv7
+#@DESCRIPTION: Machine configuration for QEMU ARM Cortex-A8.
+
+# Specify the default tune.
+DEFAULTTUNE = "armv7a-neon"
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-cortexa8.inc
+
+# Specify the preferred kernel version.
+PREFERRED_VERSION_linux-yocto ?= "3.8%"
+
+# Specify the machine name used by the kernel.
+KMACHINE_qemuarmv7 = "beagleboard"
+
+# Specify the serial console parameters.
+SERIAL_CONSOLE = "115200 ttyO2"
-- 
1.7.10.4


