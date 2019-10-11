Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C69047F4B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:55:30 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i76so5069528pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2019 21:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lRTpj0n8phlsixSjkD03p+NPeefhTVP1tNw5a+7iWN0=;
	b=G1+iKX68AGubATuRgpqlweZ/qIQbTqTbtUFbPZlYmmKKMlvhkytH//pxY4syPDNqOU
	zDh5NzSAb/y2Gvu9OaxGxI5tQog93Ath0ZVMomhfXVGa8JaHnFiQvSsvP4C/DqBtu759
	up/mT9OCznl4DA4sv9himuykB7JwtKwz38dx8u2UdRCZ4DbSVG6MWAf91NEqhKXjbqA5
	o2amGVwROJbFmDOv2Kb6st6RMum3bofsq3Q/jsJd1uTA0NxKtoCsJhHD+mns39LVqfAC
	4A3NNbqRqINViXUcAVrSGmwEWIar41S411BRd3xjFEzSVysNcMjbTGxqd8/+Om/qP8tu
	NCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lRTpj0n8phlsixSjkD03p+NPeefhTVP1tNw5a+7iWN0=;
	b=XMnJX47Z//PHTxrjMeg2gJST/3MYj3kmEi1iCR4PlPsagIY+04l+SnQOmpDGdZffet
	FXJkmcWKfZ1jKqEqD3Mu9Dr3s4TCL/1j69hRqyMp5JpbbgaYGDwOfTGhkHlWsVrzule8
	LADXiJw9x4PcEfwfkufGmRAbQUio4NVQfmTp4LDahU21jCR+i33gBGKjBSXaFyaIt3Pv
	8s8Ls5NUGxe7JUblDSm43GvAnKFEuD2Ws6EDRs9zSUXyG1OeecsTLGigo6EC+mFSvlt2
	aDVMBz4KqTRAGv+vep0zW0cdUxr1RZIrUmCZQEu2tJQmRFSwwb+4fQFSr7MalYjKQivA
	S/iw==
X-Gm-Message-State: APjAAAVlIEyqNO5H8R65kl2tXzLYEOQ5i7s6FM3XWkIaExV2WBATWh9J
	JKavD/auIwlkJBjNJvjdXlmTQi5rC5s=
X-Google-Smtp-Source: APXvYqx2uqMTvj/azH3Jp4G8q3LwfdCA9THU2WiQD/YSWK0iNOl7Lpta9+G31pxPwQd4niRlW51dwg==
X-Received: by 2002:a63:c446:: with SMTP id m6mr654753pgg.136.1570769730994;
	Thu, 10 Oct 2019 21:55:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	b185sm9695570pfg.14.2019.10.10.21.55.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 21:55:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 21:55:17 -0700
Message-Id: <20191011045517.2565168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] a2jmidid: Fix build on risv
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
X-List-Received-Date: Fri, 11 Oct 2019 04:55:30 -0000
Content-Transfer-Encoding: 8bit

Fixes
../a2jmidid-8/sigsegv.c:102:39: error: no member named 'gregs' in 'struct mcontext_t'
|                 ucontext->uc_mcontext.gregs[i]
|                 ~~~~~~~~~~~~~~~~~~~~~ ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../jack/a2jmidid/riscv_ucontext.patch        | 24 +++++++++++++++++++
 meta-oe/recipes-multimedia/jack/a2jmidid_8.bb |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch

diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch b/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch
new file mode 100644
index 0000000000..23618f18a1
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid/riscv_ucontext.patch
@@ -0,0 +1,24 @@
+Add riscv specific checks to choose correct gregs and context structure definitions
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/sigsegv.c
++++ b/sigsegv.c
+@@ -91,7 +91,7 @@ static void signal_segv(int signum, sigi
+     a2j_error("info.si_errno = %d", info->si_errno);
+     a2j_error("info.si_code  = %d (%s)", info->si_code, si_codes[info->si_code]);
+     a2j_error("info.si_addr  = %p", info->si_addr);
+-#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__)
++#if !defined(__alpha__) && !defined(__ia64__) && !defined(__FreeBSD_kernel__) && !defined(__arm__) && !defined(__hppa__) && !defined(__sh__) && !defined(__aarch64__) && !defined(__riscv)
+     for(i = 0; i < NGREG; i++)
+         a2j_error("reg[%02d]       = 0x" REGFORMAT, i,
+ #if defined(__powerpc__)
+@@ -102,7 +102,7 @@ static void signal_segv(int signum, sigi
+                 ucontext->uc_mcontext.gregs[i]
+ #endif
+                 );
+-#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 */
++#endif /* alpha, ia64, kFreeBSD, arm, hppa aarch64 riscv */
+ 
+ #if defined(SIGSEGV_STACK_X86) || defined(SIGSEGV_STACK_IA64)
+ # if defined(SIGSEGV_STACK_IA64)
diff --git a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
index 7dcaaf6828..a0aa412232 100644
--- a/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
+++ b/meta-oe/recipes-multimedia/jack/a2jmidid_8.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     http://download.gna.org/${BPN}/${BPN}-${PV}.tar.bz2 \
     file://0001-wscript-add-pthread-library-dependency-to-fix-linkin.patch \
     file://0002-aarch64.patch \
+    file://riscv_ucontext.patch \
 "
 SRC_URI[md5sum] = "9cf4edbc3ad2ddeeaf6c8c1791ff3ddd"
 SRC_URI[sha256sum] = "2a9635f62aabc59edb54ada07048dd47e896b90caff94bcee710d3582606f55f"
-- 
2.23.0


