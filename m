Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 206A078284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 03:56:35 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t3so2052075pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 20:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bi1s/1Z/vr+t5he8SaqmsAxZ6sVRJvBFU76jYta2eIA=;
	b=D8SKQPGPivnWAhtc90U7Omxwfs5o+3Fv25XtB27NfHT+AzCk/t4e07UZtSYevmPmI7
	XjXZO+P0mFv7yWmGr7KETnN+ynOywx/yrrHRZZM/5Th35GYB9IgSFeo/2vhYlwW/OTV6
	b3cEnY8BkQUj+W7G2HPN/778oiUTOpic8sEHkwjf+abvAutBEKhfe6HtMePsrADz6j8M
	HwplA58kVLeKsGiqkorl7jZHNEcF59BK6S1JLd5Ep6x7mfjrBC0QYYt0/HvOkub6jh6L
	i7/nTv+KljGWpc/EzHn5Ta2b1NWgV6emI/ly415Uzp5y/s/F4Skj5sQsaUCS93P3WHgb
	FvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bi1s/1Z/vr+t5he8SaqmsAxZ6sVRJvBFU76jYta2eIA=;
	b=drs50Yc/9nL2yodV3ZN+Jrke+MztN9G+nD5m6A1xpjhECsBUqbF4TIc+dVOAzGBFrU
	K8UO8rNUb+hgn7REZneUDRVDAIegdvnB2ZuqQ0H5cMO6za3QtMlF6LnMsIUyAolx2GCV
	scQuaLQi9cm7Tud5JuWhlhXyC4hobgKpnl2vsU4/fI6IsvdmJ9QWgQy8NLyNGJcl/S3W
	zat2RHWzc/UrL/dmJ/eo9c857mfLpt25rUjMszSDvLfURJfh3rS2aQSNmnCtDJ+npOz8
	QeNKb9DMVnQ/nu8sePNtplos2eJJuj4RUSRCm6qjINk5MNJM3nxA6JzBohNFIkE9VfNf
	ehlA==
X-Gm-Message-State: AHYfb5hJkpcZ6xroqAR334o/QgH+dz4WbjHki+PazPcorIj6g+pFBIgD
	ojRL4tH86pMHL5GW
X-Received: by 10.84.129.103 with SMTP id 94mr8966709plb.63.1503633397201;
	Thu, 24 Aug 2017 20:56:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	n19sm9591917pfi.35.2017.08.24.20.56.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 20:56:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 20:56:27 -0700
Message-Id: <20170825035628.7995-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170825035628.7995-1-raj.khem@gmail.com>
References: <20170825035628.7995-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] efibootmgr: Upgrade to 0.15
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
X-List-Received-Date: Fri, 25 Aug 2017 03:56:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-extra-const-keywords-gcc-7-gripes-about.patch | 49 ----------------------
 .../{efibootmgr_0.12.bb => efibootmgr_0.15.bb}     | 13 +++---
 2 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch
 rename meta-oe/recipes-extended/efibootmgr/{efibootmgr_0.12.bb => efibootmgr_0.15.bb} (57%)

diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch b/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch
deleted file mode 100644
index b6211c28a..000000000
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr/0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From a9f8d414972b0b7c963d7efe38b5cfdcb6413c46 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 6 Feb 2017 16:34:54 -0500
-Subject: [PATCH] Remove extra const keywords gcc 7 gripes about.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
----
- src/efibootdump.c | 2 +-
- src/efibootmgr.c  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/efibootdump.c b/src/efibootdump.c
-index 3e448c2..5a9b681 100644
---- a/src/efibootdump.c
-+++ b/src/efibootdump.c
-@@ -36,7 +36,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
- 	uint8_t *optional_data = NULL;
- 	size_t optional_data_len = 0;
- 	uint16_t pathlen;
--	const unsigned char const *desc;
-+	const unsigned char *desc;
- 	char *raw;
- 	size_t raw_len;
- 
-diff --git a/src/efibootmgr.c b/src/efibootmgr.c
-index baefa68..683623b 100644
---- a/src/efibootmgr.c
-+++ b/src/efibootmgr.c
-@@ -214,7 +214,7 @@ warn_duplicate_name(list_t *boot_list)
- 	list_t *pos;
- 	var_entry_t *boot;
- 	efi_load_option *load_option;
--	const unsigned char const *desc;
-+	const unsigned char *desc;
- 
- 	list_for_each(pos, boot_list) {
- 		boot = list_entry(pos, var_entry_t, list);
-@@ -821,7 +821,7 @@ show_boot_vars()
- {
- 	list_t *pos;
- 	var_entry_t *boot;
--	const unsigned char const *description;
-+	const unsigned char *description;
- 	efi_load_option *load_option;
- 	efidp dp = NULL;
- 	unsigned char *optional_data = NULL;
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.15.bb
similarity index 57%
rename from meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
rename to meta-oe/recipes-extended/efibootmgr/efibootmgr_0.15.bb
index 193150bb9..9cc62a959 100644
--- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb
+++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.15.bb
@@ -10,19 +10,18 @@ DEPENDS = "pciutils zlib efivar"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "75d25807ba81cb724964c989012611272c8f1f5d"
+SRCREV = "5c14da22802576a99ebb854f7aa174f796f7b031"
 SRC_URI = "git://github.com/rhinstaller/efibootmgr.git;protocol=https \
-           file://0001-Remove-extra-const-keywords-gcc-7-gripes-about.patch \
           "
-
 S = "${WORKDIR}/git"
 
-
 inherit pkgconfig
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar` \
-                 -DEFIBOOTMGR_VERSION=\"$(RELEASE_MAJOR).$(RELEASE_MINOR)\" '"
+EXTRA_OEMAKE = "'EFIDIR=/' 'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/src/include `pkg-config --cflags efivar`'"
 
+CFLAGS_append_toolchain-clang = " -Wno-error"
 do_install () {
-    install -D -p -m0755 src/efibootmgr ${D}/${sbindir}/efibootmgr
+    install -D -p -m0755 ${B}/src/efibootmgr ${D}/${sbindir}/efibootmgr
 }
+
+CLEANBROKEN = "1"
-- 
2.14.1


