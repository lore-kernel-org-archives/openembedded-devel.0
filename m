Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id D36357C61E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:46:00 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id r124so7438986pgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=vEYoDWpdqa6zfbEJJrN78P6BuI74q/5vwlkSkMxiw0o=;
	b=T/bHY8HjzgVhfkq5T7LPOJ4ZJGTgJcyHjGBw3IsGtQhsqn97/yOMYd4ndpPP13dy+j
	XFIXRvUxGcGy2pzrj4qIo32XgChO1jWiWiO0MQZeFKcp7z60pmd2Jk8S3xMvSVRHOJRX
	dErWpnpMOMhgeNNrGcERp9OTR1hBA7qsvbAX37MaX1B63glwCuUQZKgeyY0k+QGkjzMr
	6bJketB+NqW7NaxKWJDsXMWf3Zsfxm75SZwhOl5BnJfuo5MzENM0TQbqCDGjwjorG2OO
	+QYie8AmxZANhWVSIaIFIEJ2s+NQXHFiP/cA8J/S5SUiSwwLwx/+4JE044Ju2klJmrFd
	/1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vEYoDWpdqa6zfbEJJrN78P6BuI74q/5vwlkSkMxiw0o=;
	b=SwSj9SmOOur9anGGNcoLSLtZwb5GgBqp/0rKc+mFi46se4T9zZwuohsrEKuWY4OWXb
	SUuiqdgkR2yaVE+dwQQt3xngEKgQO+5stbrxut7FvGD1UywNae81WsR7EZ95lBj8jPqe
	cntHjoP5c9eSZlqlIyKTUoW66ncnJXhxoh8vB+rVhaJ2tzJSRLvhcDf4xhC6KKEBIwJ4
	Ab8Ew3t1KS0n1XVmJ6EUG7wknMYlXKVF/Pa/qIf/p7w6hHwohsRWw4hr4nXPKUgnO4Fe
	5kt5gNw6se+oOl6rqjgbFq68f4T/T49peXUrgRr34vk4g6E9pXHeBJlGcP8OIwBoupzz
	lQPQ==
X-Gm-Message-State: APjAAAXZX/rBkHZmL9SmyukAlQCdSntdKT52D1O+68ATC9m7ifQjip0Y
	65YZ2WlR466UAaj79OvJzbGg/rMZ
X-Google-Smtp-Source: APXvYqwsBdevQyLXvdu5ZioDpeU4R9EXkZNPeexGUPfNaVTTwBdPbdEPgyHHljLkZs+fmz4L9wooyg==
X-Received: by 2002:a63:8743:: with SMTP id i64mr4755617pge.69.1551851161622; 
	Tue, 05 Mar 2019 21:46:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id m24sm1001144pgv.1.2019.03.05.21.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 21:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2019 21:45:45 -0800
Message-Id: <20190306054548.16430-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190306054548.16430-1-raj.khem@gmail.com>
References: <20190306054548.16430-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 09/12] webrtc-audio-processing: Add support for risc-v
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
X-List-Received-Date: Wed, 06 Mar 2019 05:46:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../riscv_support.patch                       | 33 +++++++++++++++++++
 .../webrtc-audio-processing_0.3.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch
new file mode 100644
index 0000000000..576b9860a8
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing/riscv_support.patch
@@ -0,0 +1,33 @@
+Add support for RISC-V
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/webrtc/base/basictypes.h
++++ b/webrtc/base/basictypes.h
+@@ -29,6 +29,10 @@
+ #define CPU_ARM 1
+ #endif
+ 
++#if defined(__riscv) || defined(_M_RISCV)
++#define CPU_RISCV 1
++#endif
++
+ #if defined(CPU_X86) && defined(CPU_ARM)
+ #error CPU_X86 and CPU_ARM both defined.
+ #endif
+--- a/webrtc/typedefs.h
++++ b/webrtc/typedefs.h
+@@ -56,6 +56,13 @@
+ #elif defined(__powerpc__)
+ #define WEBRTC_ARCH_32_BITS
+ #define WEBRTC_ARCH_BIG_ENDIAN
++#elif defined(__riscv)
++#if __riscv_xlen == 64
++# define WEBRTC_ARCH_64_BITS
++#else
++# define WEBRTC_ARCH_32_BITS
++#endif
++#define WEBRTC_ARCH_LITTLE_ENDIAN
+ #elif defined(__pnacl__)
+ #define WEBRTC_ARCH_32_BITS
+ #define WEBRTC_ARCH_LITTLE_ENDIAN
diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
index 2b0f7c6840..dbba2f488c 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing_0.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/${
            file://0004-typedefs.h-add-support-for-64-bit-and-big-endian-MIP.patch \
            file://0005-typedefs.h-add-support-for-PowerPC.patch \
            file://0006-common_audio-implement-endianness-conversion-in-wav-.patch \
+           file://riscv_support.patch \
 "
 
 SRC_URI[md5sum] = "336ae032f608e65808ac577cde0ab72c"
-- 
2.21.0


