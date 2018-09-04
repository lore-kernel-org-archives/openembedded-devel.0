Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD2474D2B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 22:08:53 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 207-v6so5679591wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 15:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=k3gxJk8QoYAOZZUa/R0mlOziz/0et5BmpfER9Cn0ABE=;
	b=ORcfmTWQMxL7iWJ9bwA/pNhr26+HE4Td08yVRUj+zMwJElAJus63AmAvI6/wFTWPJW
	AkU100G6Bm0yrQm3UqwUbo0FBgTQLzckPH+UEb+tpSyN7hKRVpd9dPzZv8Xzad2GFAQP
	Wpg9GfDRANsAodyO/KOzu7exmjPwIDfBHdtXDU7YI/icisk7VJq+Wt1PPReUAuYplytW
	Yq0OlkIMnSpHpEjS4kB3nJx9leHEP9cgS1VwYE4q6KqIW82ZECxvZ0Y7uuXg/MHPXTXs
	2AtCdAEj1LHPN0aTsewlGpztNWT4o/xLaiOEHUVAv4FhIU1uLAOr+Z7B+l2jNqtHVzLG
	rJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k3gxJk8QoYAOZZUa/R0mlOziz/0et5BmpfER9Cn0ABE=;
	b=cb/JoyVd69z5euPa9vVYQ+iSycs6rv/fq6G5arDeYGlBS1AYRUwDnHU7cGRjbnlZcZ
	NQ6oCFixkFk2Jqzy5ZCE/wh846U01C1jkHGUzRNCbLhSPECpofI+2tfjoTdc2wSj0Dcs
	uPEJjFkOGzBXyag3R131GxhqIVCarbpWp7js1Ld2i+pY3arixJWjDdVWWRe6R9JQ05n0
	XhRVXyLi/aTvlL7mkc36VNDpqFbUTjUJWLfTGlX/jtgU0vucLrzsGb3dahIBMZqNvbtx
	/9qn71BF+LiQJb+xJ7I6eipMtARhl45pIAQzHBeWuvM/ozrFF79DsbgYsrxLow6KEpJZ
	VyTA==
X-Gm-Message-State: APzg51Cm0UGDpUh5OhEF7JI5eXsqr28h+nQrO9DafdHpQO8Zdr4B2Khv
	VjYFBx93Dne9Ic5izN7IUN1IHDBY
X-Google-Smtp-Source: ANB0VdaPRncKG6g3efw/srgaadTRaNtxxq+HvSm/7rjVbKJhB7qJigmDxhmsi4rrD1ExdbHJFgqFDw==
X-Received: by 2002:a1c:5c4:: with SMTP id 187-v6mr9400487wmf.10.1536098934473;
	Tue, 04 Sep 2018 15:08:54 -0700 (PDT)
Received: from localhost.localdomain
	(host205-252-dynamic.245-95-r.retail.telecomitalia.it.
	[95.245.252.205]) by smtp.gmail.com with ESMTPSA id
	n11-v6sm17145wra.26.2018.09.04.15.08.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Sep 2018 15:08:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 00:08:50 +0200
Message-Id: <1536098930-32650-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc_2.0.4: add kexec_file_load() and getrandom() syscalls
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
X-List-Received-Date: Tue, 04 Sep 2018 22:08:54 -0000

Needed by kexec-tools afer 2.0.17

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../0001-klibc-add-getrandom-syscall.patch         | 27 ++++++++++++++++++++++
 ...1-klibc_2.0.4-add-kexec_file_load-syscall.patch | 27 ++++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |  2 ++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch
new file mode 100644
index 0000000..0768f6d
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc-add-getrandom-syscall.patch
@@ -0,0 +1,27 @@
+From e4d5d5224609d7d5c824dd231f5baec868befdfa Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 4 Sep 2018 23:56:00 +0200
+Subject: [PATCH 1/1] klibc: add getrandom() syscall
+
+needed by latest kexec-tools for qemuarm64 (kashan)
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ usr/klibc/SYSCALLS.def | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
+index 6b3bf4c..d4184ba 100644
+--- a/usr/klibc/SYSCALLS.def
++++ b/usr/klibc/SYSCALLS.def
+@@ -274,6 +274,7 @@ int syslog::klogctl(int, char *, int);
+ int sysinfo(struct sysinfo *);
+ long kexec_load(void *, unsigned long, struct kexec_segment *, unsigned long);
+ <x86_64,ppc64,s390x> long kexec_file_load(int, int, unsigned long, const char *, unsigned long);
++ssize_t getrandom(void *, size_t, unsigned int);
+ 
+ /*
+  * Low-level I/O (generally architecture-specific);
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
new file mode 100644
index 0000000..3d8d987
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
@@ -0,0 +1,27 @@
+From 90683d5eaabfa684a71411d6e3262153ac191ad8 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 4 Sep 2018 23:44:30 +0200
+Subject: [PATCH 1/1] klibc_2.0.4: add kexec_file_load syscall
+
+for supported archs only (matched in kexec-tools)
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ usr/klibc/SYSCALLS.def | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
+index c56e8f9..6b3bf4c 100644
+--- a/usr/klibc/SYSCALLS.def
++++ b/usr/klibc/SYSCALLS.def
+@@ -273,6 +273,7 @@ int reboot::__reboot(int, int, int, void *);
+ int syslog::klogctl(int, char *, int);
+ int sysinfo(struct sysinfo *);
+ long kexec_load(void *, unsigned long, struct kexec_segment *, unsigned long);
++<x86_64,ppc64,s390x> long kexec_file_load(int, int, unsigned long, const char *, unsigned long);
+ 
+ /*
+  * Low-level I/O (generally architecture-specific);
+-- 
+2.7.4
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 30294b1..8616f89 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -20,6 +20,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git \
            file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
            file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
            file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
+           file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch  \
+           file://0001-klibc-add-getrandom-syscall.patch \
 "
 
 ARMPATCHES ?= ""
-- 
2.7.4


