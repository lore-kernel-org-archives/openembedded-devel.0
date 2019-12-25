Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 887606C23A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 16:57:16 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r11so11821167pgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Dec 2019 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yqXuDyk/k5qi0oJk5X90GukFRT22ekXKXiUKwJnd3YI=;
	b=M6xENjYugeh0QvbV5dXJH3GhrQAbh5hbqKNbT+47cxg+PkDVLUnTEhE6rPn6I8/Hwq
	CyPvEH3/gYIsYoqELx68f9/lMpDLwhqbRJnn62/jP6Jy+bVepaRTcTuHfnUQrRHMu/qQ
	PfPH48c/Fg6svREcTADTc4TYtfyIIhO4O103odgt4ZMwsQEaPUQ4QnSB9UadZIUXxPz/
	f3M8S57mzbBe17MKOYEYOGRtCJoHGgwouEnnIvdVCDFCu/B9rgol0si3QSe21Y5g2VRJ
	BuY3UJjrH9VXjMEKVp6KzEExFLM5wPgD6UYDz8qyEYPUiFfRisD1hOnFJE6u99m1QEaA
	cRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yqXuDyk/k5qi0oJk5X90GukFRT22ekXKXiUKwJnd3YI=;
	b=boaAUBhGSpWKq2OacfVL4a1dgJEWdX0SLDDSLi0zUHY0KbIjG0aHFHVmdhlE/0CmJQ
	eLY8DnuVvWzyE4StOwiRgc3U5ab3i7tNeb29G/q6AjCjLNAzPjIMcscXbZiscU1pSTUK
	0OCl2/rZyakP6EZMkblPs8mE85gO1XGM1vasDZo8+ow4b+UtY2RiqoZXk+Va33qQs7vi
	BddQyfwcJ6gL2hZNDRvLsZaWigs2n0XbvS4Zr9IXBI5tbE8hrpdsWYPRHnTCIaQgY1CO
	V0jHZf203bKBJ17LB8w0Y1yk/55RniEJTdyC/RFDse2jAFUUZpf/jzHuuCIvdU0utT7K
	cfLw==
X-Gm-Message-State: APjAAAXqXj3N8/9dqgdDCTa97464XttBz3jq+Zy9NipuzOk69ww8n3jH
	wGuSQP+l8maV8J3y/3SNJxoeU0E1PWE=
X-Google-Smtp-Source: APXvYqzI6rsNKd4l80gLeNRSYmgVMk+kF719AarmYrpgd9lD/UUmwHYr7VvR2KoIIest/U+hsQrLdA==
X-Received: by 2002:a63:3484:: with SMTP id b126mr42740531pga.17.1577293037198;
	Wed, 25 Dec 2019 08:57:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	p23sm30380829pgh.83.2019.12.25.08.57.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Dec 2019 08:57:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Dec 2019 08:57:07 -0800
Message-Id: <20191225165709.2123137-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] upm: Fix 'may be used uninitialized' errors
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
X-List-Received-Date: Wed, 25 Dec 2019 16:57:16 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nitialize-local-variables-before-use.patch | 57 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-initialize-local-variables-before-use.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-initialize-local-variables-before-use.patch b/meta-oe/recipes-extended/upm/upm/0001-initialize-local-variables-before-use.patch
new file mode 100644
index 0000000000..f9fae1641d
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-initialize-local-variables-before-use.patch
@@ -0,0 +1,57 @@
+From cce8be3966b602cf7e20d559e50fcf493b9b42cc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Dec 2019 18:13:21 -0800
+Subject: [PATCH] initialize local variables before use
+
+fixes
+error: 'ctrl_reg2_data' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+
+Upstream-Status: Submitted [https://github.com/eclipse/upm/pull/693]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/kxtj3/kxtj3.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/kxtj3/kxtj3.c b/src/kxtj3/kxtj3.c
+index a6f3c4f8..050ae585 100755
+--- a/src/kxtj3/kxtj3.c
++++ b/src/kxtj3/kxtj3.c
+@@ -715,7 +715,7 @@ upm_result_t kxtj3_sensor_software_reset(const kxtj3_context dev)
+     if (kxtj3_set_bit_on(dev, KXTJ3_CTRL_REG2, KXTJ3_CTRL_REG2_SRST) != UPM_SUCCESS)
+         return UPM_ERROR_OPERATION_FAILED;
+ 
+-    uint8_t ctrl_reg2_data;
++    uint8_t ctrl_reg2_data = 0;
+     kxtj3_read_register(dev, KXTJ3_CTRL_REG2, &ctrl_reg2_data);
+ 
+     uint8_t srst_counter = 0;
+@@ -824,7 +824,7 @@ upm_result_t kxtj3_enable_interrupt_pin(const kxtj3_context dev, KXTJ3_INTERRUPT
+                                         KXTJ3_INTERRUPT_RESPONSE_T response_type)
+ {
+     assert(dev != NULL);
+-    uint8_t int_reg_value;
++    uint8_t int_reg_value = 0;
+     kxtj3_read_register(dev, KXTJ3_INT_CTRL_REG1, &int_reg_value);
+ 
+     if (polarity)
+@@ -865,7 +865,7 @@ upm_result_t kxtj3_set_interrupt_response(const kxtj3_context dev, KXTJ3_INTERRU
+ bool kxtj3_get_interrupt_status(const kxtj3_context dev)
+ {
+     assert(dev != NULL);
+-    uint8_t status_reg_value;
++    uint8_t status_reg_value = 0;
+     kxtj3_read_register(dev, KXTJ3_STATUS_REG, &status_reg_value);
+     if (!(status_reg_value & KXTJ3_STATUS_REG_INT))
+         return false;
+@@ -955,7 +955,7 @@ kxtj3_wakeup_axes kxtj3_get_wakeup_axis_and_direction(kxtj3_context dev)
+ {
+     assert(dev != NULL);
+ 
+-    uint8_t int_source2_value;
++    uint8_t int_source2_value = 0;
+     kxtj3_read_register(dev, KXTJ3_INT_SOURCE2, &int_source2_value);
+ 
+     kxtj3_wakeup_axes wakeup_axis;
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index dbe97370d5..7564738dda 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -13,6 +13,7 @@ PV = "2.0.0+git${SRCPV}"
 SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
            file://0001-CMakeLists.txt-Use-SWIG_SUPPORT_FILES-to-find-the-li.patch \
            file://0001-Use-stdint-types.patch \
+           file://0001-initialize-local-variables-before-use.patch \
            "
 
 SRC_URI_append_toolchain-clang_x86 = " file://0001-nmea_gps-Link-with-latomic.patch "
-- 
2.24.1


