Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1463D6C4E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2019 05:29:19 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b5so10518115plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2019 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BW6W0qOJKPM98Tj6xOpKcc9AO1YSJ79jJzYEU470na4=;
	b=Up44TAEGB3HsSp2L0iJkl2hJa7FoEYcWjLGA8InS2ZDuJ0M6AdwugpQvuSfaaEGP6m
	ZSISF+/ipPhTQxaW6ItJehpyRQXOc++sZE+B0XGqaV20DwAbFwEpWCjZ5yvou9MbMe7X
	ZDk9yNvCgvbizTWMx5xK77Ncpv3YknxBjpBE9y36+qEBcL0My5PutrAQYISA19RLzK1Z
	fYPs3JDgceU6k8feoC9+ouFAV1RNf8kTyHVarz9ELxFsp0apND2dFgQHUfg8xswF4R/b
	VJyja01RAjbDOKfw7YIFx3t5nwQP56lMh5s9GnEwJzqyGPtb9qlTNK6KwmDIuJDhOUC1
	0qUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BW6W0qOJKPM98Tj6xOpKcc9AO1YSJ79jJzYEU470na4=;
	b=UHywl1wne72JPTtuqwu9xg/4gr6tde6fkPJeLD/kX2O/zLvrYyjET0uotvpvyYB1uk
	hzf2+MF/Jt9xcmgdZWk134pmzWD4tlI1v9qSll50+ZbMwWsYMt2/a1ph7eSW0py+w40J
	dRrYjvYw7jFmEAx9Rb//Hq2OeFkCNBx8JY7ABIlfXCAw2i8R/lsxfhi7FUPvlHaBF2Q3
	HfNpdsVQoKH16/xTEEAn95ZRDlQifUp+KBPrcRTXCY5iwvILmik22H49O7X58AQNbLHA
	EMltmGEqJBzRanUN26TEcyYEPvQQHlGEGjl/fweetdXjbXbqvyVKVVnKcHVbJN6odZJ7
	+/Lw==
X-Gm-Message-State: AJcUukeKZ1Gq8mCNVGHi4FWjxArILtFgH4lJRJSXTxN3Fwj0+zspqAYu
	P3beID3LWkkpZxO5wjV/XaFz6dYRG2o=
X-Google-Smtp-Source: ALg8bN5Fc5h+9sgMNvyjBCpnt2pDgsYVbsEaTcFNfxUzDRaAEYHTI5hzFW0dP+YS4Vt/yKKrfgCvdQ==
X-Received: by 2002:a17:902:27e6:: with SMTP id
	i35mr28344825plg.222.1548826160332; 
	Tue, 29 Jan 2019 21:29:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::26b6])
	by smtp.gmail.com with ESMTPSA id
	v190sm652633pfv.26.2019.01.29.21.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 21:29:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2019 21:29:04 -0800
Message-Id: <20190130052911.36336-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/8] cpuburn-arm: Move cpuburn-neon to cpuburn-arm and add more tests
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
X-List-Received-Date: Wed, 30 Jan 2019 05:29:20 -0000
Content-Transfer-Encoding: 8bit

This provides more benchmarks for different arm arches >= v7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-cpuburn-a8.S-Remove-.func-.endfunc.patch | 69 +++++++++++++++++++
 .../cpuburn/cpuburn-arm/0002-burn.S-Add.patch | 47 +++++++++++++
 .../0003-burn.S-Remove-.func-.endfunc.patch   | 31 +++++++++
 .../cpuburn/cpuburn-arm_git.bb                | 37 ++++++++++
 .../cpuburn/cpuburn-neon_20140626.bb          | 30 --------
 5 files changed, 184 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0001-cpuburn-a8.S-Remove-.func-.endfunc.patch
 create mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0002-burn.S-Add.patch
 create mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0003-burn.S-Remove-.func-.endfunc.patch
 create mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
 delete mode 100644 meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb

diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0001-cpuburn-a8.S-Remove-.func-.endfunc.patch b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0001-cpuburn-a8.S-Remove-.func-.endfunc.patch
new file mode 100644
index 0000000000..82f12fe811
--- /dev/null
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0001-cpuburn-a8.S-Remove-.func-.endfunc.patch
@@ -0,0 +1,69 @@
+From 064a63860bf9ee4bf54facb76ca66f9f957d4797 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 11:12:38 -0800
+Subject: [PATCH] cpuburn*.S: Remove .func/.endfunc
+
+These are needed to generate stabs debug info which we dont use
+and are silently ignored by gnu assembler when unused, clang assembler
+however barfs, so remove them
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ cpuburn-a7.S | 2 --
+ cpuburn-a8.S | 2 --
+ cpuburn-a9.S | 2 --
+ 3 files changed, 6 deletions(-)
+
+diff --git a/cpuburn-a7.S b/cpuburn-a7.S
+index 74e925a..c1e308c 100644
+--- a/cpuburn-a7.S
++++ b/cpuburn-a7.S
+@@ -42,7 +42,6 @@
+ 
+     .global main
+ 
+-.func main
+ .type main, %function
+ main:
+         push        {r4-r12, lr}
+@@ -88,4 +87,3 @@ main:
+ 
+         mov         r0, #0
+         pop         {r4-r12, pc}
+-.endfunc
+diff --git a/cpuburn-a8.S b/cpuburn-a8.S
+index c6f93a6..a42f5a5 100644
+--- a/cpuburn-a8.S
++++ b/cpuburn-a8.S
+@@ -46,7 +46,6 @@
+ /* 16 seems to be a good choice */
+ #define STEP                 16
+ 
+-.func main
+ .thumb_func
+ main:
+         mov         lr, pc
+@@ -70,4 +69,3 @@ main:
+         subs        lr, lr, #(STEP * 4)
+     .endr
+         bne         0b
+-.endfunc
+diff --git a/cpuburn-a9.S b/cpuburn-a9.S
+index 0338b00..a1ccae5 100644
+--- a/cpuburn-a9.S
++++ b/cpuburn-a9.S
+@@ -48,7 +48,6 @@
+ /* 64 seems to be a good choice */
+ #define STEP                 64
+ 
+-.func main
+ .type main, %function
+ main:
+ 
+@@ -94,4 +93,3 @@ main:
+         subsne      lr, lr, #(STEP * 4)
+     .endr
+         bne         0b
+-.endfunc
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0002-burn.S-Add.patch b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0002-burn.S-Add.patch
new file mode 100644
index 0000000000..eb68c9ce9b
--- /dev/null
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0002-burn.S-Add.patch
@@ -0,0 +1,47 @@
+From c2adcca93a0075665a8195caad49b89785886e8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 12:02:22 -0800
+Subject: [PATCH] burn.S: Add
+
+This is originally from
+https://hardwarebug.org/files/burn.S
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ burn.S | 26 ++++++++++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+ create mode 100644 burn.S
+
+diff --git a/burn.S b/burn.S
+new file mode 100644
+index 0000000..c372c87
+--- /dev/null
++++ b/burn.S
+@@ -0,0 +1,26 @@
++        .arch   armv7-a
++        .fpu    neon
++
++        .text
++
++        .global main
++        .type   main, STT_FUNC
++        .func   main
++main:
++        bic             sp,  sp,  #15
++1:
++        vld1.8          {q8}, [sp,:128]
++        smuad           r6,  r4,  r5
++        veor            q9,  q0,  q1
++        add             lr,  r4,  r5
++        ldr             ip,  [sp]
++        vext.8          q10, q3,  q4,  #1
++        eor             r5,  r4,  r5
++        vadd.i32        q11, q0,  q1
++        smusd           r6,  r4,  r5
++        ldr             r2,  [sp]
++        vext.8          q12, q1,  q2,  #3
++        ssub8           lr,  r4,  r5
++        vmul.u16        q13, q0,  q4
++        b               1b
++.endfunc
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0003-burn.S-Remove-.func-.endfunc.patch b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0003-burn.S-Remove-.func-.endfunc.patch
new file mode 100644
index 0000000000..f351b62c73
--- /dev/null
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm/0003-burn.S-Remove-.func-.endfunc.patch
@@ -0,0 +1,31 @@
+From 078df5b25d75578bb0448ca53514c23debe6d920 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 29 Jan 2019 12:03:11 -0800
+Subject: [PATCH] burn.S: Remove .func/.endfunc
+
+These are useless on Linux systems where we use dwarf debug info instead
+of stabs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ burn.S | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/burn.S b/burn.S
+index c372c87..4458f51 100644
+--- a/burn.S
++++ b/burn.S
+@@ -5,7 +5,6 @@
+ 
+         .global main
+         .type   main, STT_FUNC
+-        .func   main
+ main:
+         bic             sp,  sp,  #15
+ 1:
+@@ -23,4 +22,3 @@ main:
+         ssub8           lr,  r4,  r5
+         vmul.u16        q13, q0,  q4
+         b               1b
+-.endfunc
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
new file mode 100644
index 0000000000..d60624c88d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/cpuburn/cpuburn-arm_git.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A collection of cpuburn programs tuned for different ARM hardware"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://cpuburn-a53.S;beginline=1;endline=22;md5=3b7ccd70144c16d3fe14ac491c2d4a87"
+
+RPROVIDES_${PN} = "cpuburn-neon"
+PROVIDES += "cpuburn-neon"
+
+SRCREV = "ad7e646700d14b81413297bda02fb7fe96613c3f"
+
+PV = "1.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/ssvb/cpuburn-arm.git \
+           file://0001-cpuburn-a8.S-Remove-.func-.endfunc.patch \
+           file://0002-burn.S-Add.patch \
+           file://0003-burn.S-Remove-.func-.endfunc.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a7.S -o burn-a7
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-a8
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a9.S -o burn-a9
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a53.S -o burn-a53
+    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-krait.S -o burn-krait
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    for f in burn burn-a7 burn-a8 burn-a9 burn-a53 burn-krait; do
+        install -m 0755 $f ${D}${bindir}/$f
+    done
+}
+
+COMPATIBLE_MACHINE ?= "(^$)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
deleted file mode 100644
index 14e3fc4f38..0000000000
--- a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "CPU burn app that loads the NEON coprocessor fully"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://burn.S;md5=823abc72c2cd448e87df9bc5355a4456"
-
-DL_DIR_append = "/${PN}-${PV}"
-
-# Ensure to make this available for machine which has neon
-COMPATIBLE_MACHINE = "(${@bb.utils.contains("TUNE_FEATURES", "neon", "${MACHINE}", "Invalid!", d)})"
-
-SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \
-           https://raw.githubusercontent.com/ssvb/cpuburn-arm/dd5c5ba58d2b0b23cfab4a286f9d3f5510000f20/cpuburn-a8.S;name=ssvb"
-
-SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456"
-SRC_URI[mru.sha256sum] = "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2"
-SRC_URI[ssvb.md5sum] = "ba0ef2939a3b3b487523448c67544e94"
-SRC_URI[ssvb.sha256sum] = "ce42ebdc71c876a33d9f7534355ef76cefa0d00ddb19ad69cf05a266c861d08d"
-
-S = "${WORKDIR}"
-
-do_compile() {
-    ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn
-    ${CC} ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-neona8
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/burn ${D}${bindir}/burn-neon
-    install -m 0755 ${S}/burn-neona8 ${D}${bindir}/
-}
-
-- 
2.20.1


