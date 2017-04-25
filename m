Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9F8977A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:40 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 70so1438410ita.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l8MbRmByXQJEBnm4u1AQhyk3Ar4oOo1c6SyZLWxjM9w=;
	b=cUjvm1brmLIOiwR0U1LUk99iIxX5H45ncHEaDVgYYVMEGMxnVLikwtwGza6HDqOfMj
	zFCM2Nzy9AeoDQSz7pQhCllnBexmj3OgJ+yaHGTsyMs+8qeVKP/IeinekPQVgISKywWc
	pKDFiRxbrfHxXKdFsqs4v+MJMMwIlaKt1t1eC9L6p2eAaQap4a8ZkhF+t7UpbSMHaQT5
	TgmMmr7qMzdcIKhQsXVr3eEbHs2ovU+MqNhXWHUGBKwRfxeEBOxqVts0DMCRQZ8XkT3n
	ie3UkhzeYhMbmNyRgv55Rd/HYq+opP4lpu1ukMu2u3Cfyz39uFv+BG+Wkt/sLrlVEr0k
	s3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l8MbRmByXQJEBnm4u1AQhyk3Ar4oOo1c6SyZLWxjM9w=;
	b=oeFuG7Ei8cZU3krvYG8KAUI8sGEBmQP1LAj6VHtk+Zqyedw1KKPgM4I8WT/z0mNzdh
	mvbyiBEv3tS81ffvC8iluxvtPPf8QoWVFT7vb5KuMqhHXIh77afgZuEpmSDn/zXGASMv
	FjYyxSifeVW3f5jDABALNoGwTwAgi6pV/6G3JClt461e1LqMWNb2WEoPH82yjrpd9UqL
	9YH1qoHyf7irDlHgcSSJ0RNsiDfnZ+okuETzlnYVCFFua4BrYwGuD60FMdct3kQK/MUv
	8F0AbV0hz1/qOZI7Ugz3f9DO9YpsskaE0f+VWW3hgxfz7JSZi1QA7rkAUWnXLsCxu4tP
	pkcw==
X-Gm-Message-State: AN3rC/6mrKOHCC3lklWmHGj8zSAZjKsfxAfI4hDT258F8QHprFyyWx3v
	5xXxNCpHVciJQg==
X-Received: by 10.36.101.210 with SMTP id u201mr19029410itb.118.1493092061794; 
	Mon, 24 Apr 2017 20:47:41 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:14 -0700
Message-Id: <20170425034719.8630-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 06/11] efibootmgr: Fix build with gcc 7
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:40 -0000

backport patch to remove double const in decls

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-extra-const-keywords-gcc-7-gripes-about.patch | 49 ++++++++++++++++++++++
 .../recipes-extended/efibootmgr/efibootmgr_0.12.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch b/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch
new file mode 100644
index 000000000..b6211c28a
--- /dev/null
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch
@@ -0,0 +1,49 @@
+From a9f8d414972b0b7c963d7efe38b5cfdcb6413c46 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 6 Feb 2017 16:34:54 -0500
+Subject: [PATCH] Remove extra const keywords gcc 7 gripes about.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+---
+ src/efibootdump.c | 2 +-
+ src/efibootmgr.c  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/efibootdump.c b/src/efibootdump.c
+index 3e448c2..5a9b681 100644
+--- a/src/efibootdump.c
++++ b/src/efibootdump.c
+@@ -36,7 +36,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
+ 	uint8_t *optional_data = NULL;
+ 	size_t optional_data_len = 0;
+ 	uint16_t pathlen;
+-	const unsigned char const *desc;
++	const unsigned char *desc;
+ 	char *raw;
+ 	size_t raw_len;
+ 
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index baefa68..683623b 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -214,7 +214,7 @@ warn_duplicate_name(list_t *boot_list)
+ 	list_t *pos;
+ 	var_entry_t *boot;
+ 	efi_load_option *load_option;
+-	const unsigned char const *desc;
++	const unsigned char *desc;
+ 
+ 	list_for_each(pos, boot_list) {
+ 		boot = list_entry(pos, var_entry_t, list);
+@@ -821,7 +821,7 @@ show_boot_vars()
+ {
+ 	list_t *pos;
+ 	var_entry_t *boot;
+-	const unsigned char const *description;
++	const unsigned char *description;
+ 	efi_load_option *load_option;
+ 	efidp dp = NULL;
+ 	unsigned char *optional_data = NULL;
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
index b25cfcabd..193150bb9 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
@@ -12,6 +12,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRCREV = "75d25807ba81cb724964c989012611272c8f1f5d"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
+           file://0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.12.2


