Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 66A6A78489
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:10:36 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id e143so2845132lfg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UdousQQBTR24ALpGRNCFA5+7yGTmqdUSye6az7JYoqw=;
	b=EWshQbitpDgONUyLeGQGuHNmrIrspJEEoTuOAaGNY5KoY5h59suAXZfXO6SE3g1Rdg
	iHw2bkbKsVCno9rakCsaLJBPx2olQ9DX7Qp+B9a4iXsAR50w0kr6TNOh4V+i7ISJRPBt
	FMAQ89AiLMeKVMwk4/HlwyiMaGqEZJ6gj7ALpn11B54Clz+xs5Rz3juNF677igXHbUay
	aJnvfmnBudpWgFY4SDCiiYn8IcyhkEU9XJ89Zl6UroA/6AM/f3OEulBOp3teDh7jIIH6
	p/CqBolodmR9kSMBUZCioSajXFB310U3W5765IgU3b/FdBv75beR+tN8P+gSV5MPKr98
	E2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UdousQQBTR24ALpGRNCFA5+7yGTmqdUSye6az7JYoqw=;
	b=iMTJSm3f7vc09BUrQZo/M4deyagmXi1zSQR53uIF+0KcwOpQptK6ZFJJWdYVDOKsNp
	zurTJ0LM/0r4tkn0GuQDEKDYdNEBDK2WWtUHc7aSGvDi1WTX9jd901t55sG+5M2178/6
	u7OccciR4ztZncVLOmUMGYm1DuAV4O3t6ive/7ASIwTTz+bIHpVS/d4zUWp0EXaEPkku
	m2xqfZLyFckL96ppkzV147TL9ftyMwOPfSFFmiB+FtV6H/gj/Oaf0oYdO/VInJqyMJaH
	vGQDsp3cSjdgg36k+1Ts+7cXFK1doHkHAK9jOSB1ZqoTMHLbMnOU3pe467buqugmEp/D
	v3Jg==
X-Gm-Message-State: AJaThX7aN767gL9Rst1NoYfyvVs40mwa2DHZIbO1f0OCxFbv5DVkwutw
	iyzL6H/+1TFjojK5xHzBhRLD2nz+
X-Google-Smtp-Source: ABhQp+TFFfH0GPUMpxKYo6r0tQ5ICXNzcMIkB1KdYWIYZ+ydU4CNyOwT4iEMYTVQIrUjU/R7cgkzrA==
X-Received: by 10.25.87.66 with SMTP id l63mr114951lfb.101.1510143037055;
	Wed, 08 Nov 2017 04:10:37 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x18sm744216lja.55.2017.11.08.04.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:10:35 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Nov 2017 13:10:27 +0100
Message-Id: <20171108121027.27572-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
References: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 4/4] opencv: Fix java wrapper generation
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
X-List-Received-Date: Wed, 08 Nov 2017 12:10:36 -0000

During configuration the java wrappers are generated (if java
is enabled via PACKAGECOFIG).

Unfortunately, the script that generates the .java files do not handle
properly paths with special symbols, such as +.

This is just a workaround for that.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv/javagen.patch | 16 ++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb        |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/javagen.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/javagen.patch b/meta-oe/recipes-support/opencv/opencv/javagen.patch
new file mode 100644
index 000000000000..56526ecd80a8
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/javagen.patch
@@ -0,0 +1,16 @@
+Upstream-status: Inappropriate [OE specific] https://github.com/opencv/opencv/pull/10039#issuecomment-342539288
+
+Signed-off-by: Ricardo Ribalda <ricardo.ribalda@gmail.com>
+diff --git a/modules/java/CMakeLists.txt b/modules/java/CMakeLists.txt
+index 74bc0ef04169..4622fbf9a5f1 100644
+--- a/modules/java/CMakeLists.txt
++++ b/modules/java/CMakeLists.txt
+@@ -291,7 +291,7 @@ foreach(java_file ${step3_input_files})
+   endif()
+   if(__configure)
+     configure_file("${java_file}" "${java_src_dir}/${output_name}" @ONLY)
+-  elseif(NOT "${java_file}" MATCHES "${OpenCV_BINARY_DIR}/")
++  elseif(EXISTS "${java_file}" AND NOT "${java_file}" MATCHES "${OpenCV_BINARY_DIR}/")
+     configure_file("${java_file}" "${java_src_dir}/${output_name}" COPYONLY)
+   else()
+     add_custom_command(OUTPUT "${java_src_dir}/${output_name}"
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index 8f0aa7f5499c..773bfe9f7a09 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -57,6 +57,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0001-carotene-don-t-use-__asm__-with-aarch64.patch \
     file://0002-Do-not-enable-asm-with-clang.patch \
     file://CVE-2017-14136.patch \
+    file://javagen.patch \
     file://protobuf.patch \
 "
 PV = "3.3+git${SRCPV}"
-- 
2.14.2


