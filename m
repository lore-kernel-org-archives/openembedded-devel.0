Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2C27C631
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 16:18:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 125so6773232pgc.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 09:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=83ALRBPtcO+Tw7E5Mhs3/7epPituz3UrzedACOfEX3I=;
	b=JSO1wr2GaNlNbWl4I20h4cu6bq2h2UXEZTy1COFm9zgd0ws/bKrF1Ir7CAMy43e9AC
	/DHB51yM/SEVVcYw2QH2bVGv+KWdCPDEq22scibM1uyBzHtjBoRWnqNUvgqcAl8KO8ix
	OSiceANwhv/dWNlTBU2fH3cgMtmQ7KePm4hhKEjtR2gAkLHOLkGz4FEHLdEDZBhT0aZ1
	ATSwtGB0I8VNTtqQX2RcbV1KasRKc3JHrfKfALkEaliUXLeS7uiQyrZAobSvkaUY7g6M
	rTFoihXRwuSM7rk86k25rZFEQYsuivUFjD6Y7+xSkRwR6K5Vtza543IkKFjmnLrZQ6MN
	Bv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=83ALRBPtcO+Tw7E5Mhs3/7epPituz3UrzedACOfEX3I=;
	b=ULQEixPWbmEcLBHJrcmgrJx3zhYLHm9RP7EH5MEtA0DyqNwBTM0IWJ1ciyOvWWL5m8
	Yf3DfL2+p88gDLUCtlz2LKs4b5dN3Wrk0QjiHNkdFPSrre92GVmIrnBBL187rhgHpDHy
	JZm9g2ZtX5xlTdONX9lusGg9mPR/20N+Fj7Nnkses+q1kzOC4xMQxF0JuhuTloXDDc4C
	unhPXjN5Jdd3gA9KiVmoGdyWK0uPdEZVCbR9vcNjHRQnngsDJQQTjnMA44PtqzJDt41N
	RXXDfCyv5SxoS90+DKZ+2pUHaVcSgzk+9P9erojE0SB1t+SyXppXtzLWCFDax6WiWZRT
	Kzpw==
X-Gm-Message-State: APjAAAWWbIlsmx6gYfsoSQV66M3T76vz7nCbdpudRQIjOy6Q07yHcGi9
	zW/IsJYYDnGTyOeTqokdLFz9+7+a
X-Google-Smtp-Source: APXvYqwSGdqAujzcvJiwv/Kk6AVmy2Rds3nE300tlpPWXnM89r3yVldGkba1FH3nnuUb8A+zaYnzfw==
X-Received: by 2002:a17:902:9a88:: with SMTP id w8mr5149715plp.8.1552666694585;
	Fri, 15 Mar 2019 09:18:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	h23sm3047286pfn.68.2019.03.15.09.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 09:18:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 09:18:04 -0700
Message-Id: <20190315161804.26688-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] kexec-tools, kexec: Fix build with latest klibc
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
X-List-Received-Date: Fri, 15 Mar 2019 16:18:14 -0000
Content-Transfer-Encoding: 8bit

klibc has changed its signature of reboot() API
adapt the use here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ecboot-Use-new-reboot-API-with-klibc.patch | 42 +++++++++++++++++++
 .../recipes-bsp/kexecboot/kexecboot_git.bb    |  2 +
 .../kexec-tools-klibc/klibc-reboot.patch      | 11 +++++
 .../kexec/kexec-tools-klibc_git.bb            |  3 +-
 4 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-Use-new-reboot-API-with-klibc.patch
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch

diff --git a/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-Use-new-reboot-API-with-klibc.patch b/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-Use-new-reboot-API-with-klibc.patch
new file mode 100644
index 0000000000..52d622a2f8
--- /dev/null
+++ b/meta-initramfs/recipes-bsp/kexecboot/files/0001-kexecboot-Use-new-reboot-API-with-klibc.patch
@@ -0,0 +1,42 @@
+From a6d1678379df6142a68cc9bb76dae540a31b8fdb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Mar 2019 23:47:50 -0700
+Subject: [PATCH] kexecboot: Use new reboot() API with klibc
+
+Klibc has changed this API in
+https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=6b621b8705ce5901dcf49607c8a3523c9e521901
+
+therefore adopt the code
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/kexecboot.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/kexecboot.c b/src/kexecboot.c
+index cf49b40..c785fce 100644
+--- a/src/kexecboot.c
++++ b/src/kexecboot.c
+@@ -857,7 +857,7 @@ int process_ctx_menu(struct params_t *params, int action) {
+ #else
+ 		sync();
+ 		/* if ( -1 == reboot(LINUX_REBOOT_CMD_RESTART) ) { */
+-		if ( -1 == reboot(RB_AUTOBOOT) ) {
++		if ( -1 == reboot(RB_AUTOBOOT, NULL) ) {
+ 			log_msg(lg, "Can't initiate reboot: %s", ERRMSG);
+ 		}
+ #endif
+@@ -874,7 +874,7 @@ int process_ctx_menu(struct params_t *params, int action) {
+ #else
+ 		sync();
+ 		/* if ( -1 == reboot(LINUX_REBOOT_CMD_POWER_OFF) ) { */
+-		if ( -1 == reboot(RB_POWER_OFF) ) {
++		if ( -1 == reboot(RB_POWER_OFF, NULL) ) {
+ 			log_msg(lg, "Can't initiate shutdown: %s", ERRMSG);
+ 		}
+ #endif
+-- 
+2.21.0
+
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
index 61210e7680..4b20e1ed9a 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PV = "0.6+git${SRCPV}"
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/kexecboot/kexecboot.git"
+SRC_URI_append_libc-klibc = " file://0001-kexecboot-Use-new-reboot-API-with-klibc.patch "
+
 SRCREV = "7409a1e0aaea61af87c4eca0149cec18a9f58ab6"
 inherit autotools
 
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
new file mode 100644
index 0000000000..be1301df68
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/klibc-reboot.patch
@@ -0,0 +1,11 @@
+--- a/kexec/kexec.c
++++ b/kexec/kexec.c
+@@ -901,7 +901,7 @@ static int my_exec(void)
+ 	if (xen_present())
+ 		xen_kexec_exec();
+ 	else
+-		reboot(LINUX_REBOOT_CMD_KEXEC);
++		reboot(LINUX_REBOOT_CMD_KEXEC, NULL);
+ 	/* I have failed if I make it here */
+ 	fprintf(stderr, "kexec failed: %s\n", 
+ 		strerror(errno));
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index ebf5ff5ae4..7ad55d8b8c 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -31,7 +31,8 @@ KLIBC_PATCHES += " \
             file://0012-purgatory-string.c-avoid-inclusion-of-string.h.patch \
             file://0013-sha256.h-avoid-inclusion-of-sys-types.h.patch \
             file://0014-add-if_nameindex-from-musl.patch \
-            file://0015-vmcore-dmesg-fix-warning.patch"
+            file://0015-vmcore-dmesg-fix-warning.patch \
+            file://klibc-reboot.patch"
 
 WARNING_FIXES = ""
 FROM_OE_CORE = "file://arm_crashdump-fix-buffer-align.patch \
-- 
2.21.0


