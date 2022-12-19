Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D06EC4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 07:34:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.15969.1671435244715302496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 23:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pnlshpzp;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id w26so5611294pfj.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 23:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YPhI3RN5a34N7I8WHgFh5q1JRZ3loI9IKG7soYceAc=;
        b=pnlshpzp3va41QIECQc1X5ZwMao+9/Gzw0zfLcfIBUPWb/FbOrD6QtMh6Yo8butd4n
         c3EbSEWlrusm7rsO4COtevouLqaKUtBnQG6jg6rCvp4qfFbpK6hECnIBWh/CCPUZaEtc
         fLy9pQDdjP6r5eaum7MMX/Ki+8xtahW/DFkw39NbJ6orqx3pcS1bF7dHQNxFH58K07gS
         QPfy+apQLP/8fpfaFWhUxNcRcxT7mKVo+03lgSeg1bLgcF+8nzRPlUZ5R+T7HIoLXiNU
         HVOrQPujXCG9Wuo8zT6g8oLQyaK7EkiBIthk17mJiXTWmnUvEfAkM8OQeOeZrgGdLkXf
         JkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YPhI3RN5a34N7I8WHgFh5q1JRZ3loI9IKG7soYceAc=;
        b=B0H2kcTgMvFxIxTS35vx6plHCDN08uT11bkuYPoa2QWxgbqAjvbPp+PFSh1oc7tzEu
         bMOLIVW/XEjtRTKR6ZHXRBdE061cWTryLECHxvlvmRzinEx2IPyrg5GZDIFb4tXwkh84
         AprXRS2JwpOrz2uS0LHUgxJmK4i5fqTn3gmMXhJvtBRHZ24sVQ8629KDGSUuFk2PCdmt
         /iDKXp+5KyeynQmTABnCt/fCItY4LwerZuNR8TdVZN5TgtTZlvR9rJ7IqQwRhxUzUEnI
         sfTwpGVUpyulKaWiJL6UFbyXMDpo1YBE3bDGaKQx5B2GwFDsGFBGYElk4nnj3raLbu4C
         KuSA==
X-Gm-Message-State: ANoB5pmp7HEZ7YrqEIDNZAl4nfpVc15f4a1NpqBuhZbJtfsAkjpeAHbQ
	75kt8Ra+HzVCa02L8lGut8cY5BjwM8A=
X-Google-Smtp-Source: AA0mqf4UlKEsr8AuTXACBQA9cCOexs7hWGdpbq00XHtoyc1LykBzY+uWqZwQMLy6+jo9tIWhFnfQLQ==
X-Received: by 2002:a05:6a00:1c9d:b0:577:753a:6af with SMTP id y29-20020a056a001c9d00b00577753a06afmr43249377pfw.31.1671435243494;
        Sun, 18 Dec 2022 23:34:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm5830350pfb.63.2022.12.18.23.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 23:34:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] cryptsetup: Upgrade to 2.6.0
Date: Sun, 18 Dec 2022 23:33:58 -0800
Message-Id: <20221219073400.1473072-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 07:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100090

- Disable documentation as it needs asciidoctor which is not available
- Rename cryptsetup-reencrypt packageconfig to luks2-reencryption to match
  the relevant configure option.
- Add a patch to enable 64bit off_t and lfs64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-off64_t-with-off_t.patch     | 101 ++++++++++++++++++
 ...ryptsetup_2.4.3.bb => cryptsetup_2.6.0.bb} |  13 ++-
 2 files changed, 109 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.4.3.bb => cryptsetup_2.6.0.bb} (92%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch b/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
new file mode 100644
index 0000000000..23aa86c0fb
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup/0001-Replace-off64_t-with-off_t.patch
@@ -0,0 +1,101 @@
+From 683d0c525765415be34c269edf9cc066276f9f65 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2022 13:53:51 -0800
+Subject: [PATCH] Replace off64_t with off_t
+
+AC_SYS_LARGEFILE autoconf macro is in use in configure script which will
+add needed feature macros on commandline to enable 64bit off_t.
+
+Also replace lseek64 with lseek, since it will be same when
+_FILE_OFFSET_BITS=64 is defined on relevant platforms via AC_SYS_LARGEFILE
+
+Upstream-Status: Submitted [https://gitlab.com/cryptsetup/cryptsetup/-/merge_requests/467]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/utils.c                 |  4 ++--
+ lib/utils_wipe.c            |  4 ++--
+ src/utils_reencrypt_luks1.c | 12 ++++++------
+ 3 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/lib/utils.c b/lib/utils.c
+index 9d79ee29..be5f5287 100644
+--- a/lib/utils.c
++++ b/lib/utils.c
+@@ -102,9 +102,9 @@ static int keyfile_seek(int fd, uint64_t bytes)
+ 	char tmp[BUFSIZ];
+ 	size_t next_read;
+ 	ssize_t bytes_r;
+-	off64_t r;
++	off_t r;
+ 
+-	r = lseek64(fd, bytes, SEEK_CUR);
++	r = lseek(fd, bytes, SEEK_CUR);
+ 	if (r > 0)
+ 		return 0;
+ 	if (r < 0 && errno != ESPIPE)
+diff --git a/lib/utils_wipe.c b/lib/utils_wipe.c
+index 285a9e77..0c376f44 100644
+--- a/lib/utils_wipe.c
++++ b/lib/utils_wipe.c
+@@ -150,7 +150,7 @@ static int wipe_block(struct crypt_device *cd, int devfd, crypt_wipe_pattern pat
+ 	if (blockdev && pattern == CRYPT_WIPE_ZERO &&
+ 	    !wipe_zeroout(cd, devfd, offset, wipe_block_size)) {
+ 		/* zeroout ioctl does not move offset */
+-		if (lseek64(devfd, offset + wipe_block_size, SEEK_SET) < 0) {
++		if (lseek(devfd, offset + wipe_block_size, SEEK_SET) < 0) {
+ 			log_err(cd, _("Cannot seek to device offset."));
+ 			return -EINVAL;
+ 		}
+@@ -221,7 +221,7 @@ int crypt_wipe_device(struct crypt_device *cd,
+ 	if (r)
+ 		goto out;
+ 
+-	if (lseek64(devfd, offset, SEEK_SET) < 0) {
++	if (lseek(devfd, offset, SEEK_SET) < 0) {
+ 		log_err(cd, _("Cannot seek to device offset."));
+ 		r = -EINVAL;
+ 		goto out;
+diff --git a/src/utils_reencrypt_luks1.c b/src/utils_reencrypt_luks1.c
+index 96368bdb..d83a1da4 100644
+--- a/src/utils_reencrypt_luks1.c
++++ b/src/utils_reencrypt_luks1.c
+@@ -729,8 +729,8 @@ static int copy_data_forward(struct reenc_ctx *rc, int fd_old, int fd_new,
+ 
+ 	log_dbg("Reencrypting in forward direction.");
+ 
+-	if (lseek64(fd_old, rc->device_offset, SEEK_SET) < 0 ||
+-	    lseek64(fd_new, rc->device_offset, SEEK_SET) < 0) {
++	if (lseek(fd_old, rc->device_offset, SEEK_SET) < 0 ||
++	    lseek(fd_new, rc->device_offset, SEEK_SET) < 0) {
+ 		log_err(_("Cannot seek to device offset."));
+ 		goto out;
+ 	}
+@@ -788,7 +788,7 @@ static int copy_data_backward(struct reenc_ctx *rc, int fd_old, int fd_new,
+ 			      size_t block_size, void *buf, uint64_t *bytes)
+ {
+ 	ssize_t s1, s2, working_block;
+-	off64_t working_offset;
++	off_t working_offset;
+ 	int r = -EIO;
+ 	char *backing_file = NULL;
+ 	struct tools_progress_params prog_parms = {
+@@ -827,8 +827,8 @@ static int copy_data_backward(struct reenc_ctx *rc, int fd_old, int fd_new,
+ 			working_block = block_size;
+ 		}
+ 
+-		if (lseek64(fd_old, working_offset, SEEK_SET) < 0 ||
+-		    lseek64(fd_new, working_offset, SEEK_SET) < 0) {
++		if (lseek(fd_old, working_offset, SEEK_SET) < 0 ||
++		    lseek(fd_new, working_offset, SEEK_SET) < 0) {
+ 			log_err(_("Cannot seek to device offset."));
+ 			goto out;
+ 		}
+@@ -874,7 +874,7 @@ static void zero_rest_of_device(int fd, size_t block_size, void *buf,
+ 
+ 	log_dbg("Zeroing rest of device.");
+ 
+-	if (lseek64(fd, offset, SEEK_SET) < 0) {
++	if (lseek(fd, offset, SEEK_SET) < 0) {
+ 		log_dbg("Cannot seek to device offset.");
+ 		return;
+ 	}
diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb
similarity index 92%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb
index 652fd66614..1d4f440871 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.6.0.bb
@@ -19,8 +19,10 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "fc0df945188172264ec5bf1d0bda08264fadc8a3f856d47eba91f31fe354b507"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz \
+           file://0001-Replace-off64_t-with-off_t.patch \
+           "
+SRC_URI[sha256sum] = "44397ba76e75a9cde5b02177bc63cd7af428a785788e3a7067733e7761842735"
 
 inherit autotools gettext pkgconfig
 
@@ -30,7 +32,7 @@ PACKAGECONFIG ??= " \
     keyring \
     cryptsetup \
     veritysetup \
-    cryptsetup-reencrypt \
+    luks2-reencryption \
     integritysetup \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
     kernel_crypto \
@@ -50,7 +52,7 @@ PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-pwquality,libpwquality"
 PACKAGECONFIG[passwdqc] = "--enable-passwdqc,--disable-passwdqc,passwdqc"
 PACKAGECONFIG[cryptsetup] = "--enable-cryptsetup,--disable-cryptsetup"
 PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
-PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
+PACKAGECONFIG[luks2-reencryption] = "--enable-luks2-reencryption,--disable-luks2-reencryption"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2-udevrules"
@@ -78,7 +80,8 @@ EXTRA_OECONF += "--enable-largefile"
 EXTRA_OECONF += "--disable-static-cryptsetup"
 # There's no recipe for libargon2 yet
 EXTRA_OECONF += "--disable-libargon2"
-
+# Disable documentation, there is no asciidoctor-native available in OE
+EXTRA_OECONF += "--disable-asciidoc"
 # libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), parallel threads and iteration time (ms)
 LUKS2_PBKDF ?= "argon2i"
 LUKS2_MEMORYKB ?= "1048576"
-- 
2.39.0


