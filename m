Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B744C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 11:16:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.12309.1674559002067308908
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 03:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FCJojglN;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id r2so13511022wrv.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 03:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxnZVUx1CS4E3pDxCsJcdrdlfpLkSZnXVoH6syGc2z4=;
        b=FCJojglNlwRy4UaKpDv8yqNar9sb21LyyyBJUVTwf1GSvNrsU6ZPsW+atgaqrNLdRo
         lvlZYMKV+zKuXjq7KUmrPaVGLAGIOuhwoEJkTDj9s8kLUrEpUZ/YgF/cW3yeOhIcPMbi
         xbcdKM2u9a6kCyI9Cfx4u80lhAUPHk3TiSakP+hV90vuTwo92iMAEBI9mUjTUQ4eOUdK
         ZiPJ6Ufn61StzjgWKWKhqbnQb1QgRyYrMY8wEyaFq14xxCD/EOVK7XTphSzTs4ETQdcU
         /t3jkyQc0MCuKQ7QYiu5aJ92KC2fXzFGrDxZYyDTFO6P2X3QaKBC7b/YlMS3bo0T1Agh
         Z1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxnZVUx1CS4E3pDxCsJcdrdlfpLkSZnXVoH6syGc2z4=;
        b=OzOaZc+qkYRgfvN3RDCcu0W0zv5tySrDKCwgBKpKX+5nKkyU51YzoLntoZ2NhO+hTw
         7GFQ3luvl/uEPHuCYM53t3iwqHjSp1u3wFadGuft4KgldHNFjPfkiXnTO8CeK6FICGsm
         0q98tSTvQleAjH1EzkI4l9sfJmuOd9RYTcuy2Ai9o7qSsxTPfvDMnw73d8d2P2bhlJa7
         1nYqKJdR3/V7RUcTp55wHwr2n44q5oF48XZq35+G/tEI6t0gMMewYHOGWnjAAttWKh+k
         +8zjahaEn193ojYQ0upjSjGpe3hVavNFv1cEIBH6B/e/iwODYO5qOwLdSIwtIFJNZitr
         B6+Q==
X-Gm-Message-State: AFqh2kocYkrTYY8mS9uDWMI+VQWmK4Ka7oP8h3q4RUk5dUud2r2SVghA
	EAr3ikONOg7+wDTcKpcmfXhJrBsAl/M=
X-Google-Smtp-Source: AMrXdXsABDbKD43kNYSFo77VRqrvFZZrmIzprFlkwHPm4RC9Kp71DYGtanwqJFek8CDvgjWkZiWlHg==
X-Received: by 2002:a5d:6346:0:b0:27d:a1ea:dcfa with SMTP id b6-20020a5d6346000000b0027da1eadcfamr24454347wrw.19.1674558999562;
        Tue, 24 Jan 2023 03:16:39 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id y3-20020adfdf03000000b002bbedd60a9asm1653462wrl.77.2023.01.24.03.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 03:16:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH] ntpsec: Upgrade 1.2.1 -> 1.2.2
Date: Tue, 24 Jan 2023 11:16:34 +0000
Message-Id: <20230124111634.29099-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 11:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100717

Drop backported patches, drop `wscript: Widen the search for tags` as
upstream has merged something similar which means devtool builds now
work.

Add BISONFLAGS support to fix build reproducbility issue.

Drop `--debug` which generates internal debug info.

License-Update: License files moved to separate directory
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...0001-Update-to-OpenSSL-3.0.0-alpha15.patch | 111 ------------------
 ....c-allow-clone3-for-glibc-2.34-in-se.patch |  31 -----
 ....c-allow-newfstatat-on-all-archs-for.patch |  42 -------
 .../0001-wscript-Add-BISONFLAGS-support.patch |  29 +++++
 ...01-wscript-Widen-the-search-for-tags.patch |  29 -----
 ....c-match-riscv-to-aarch-in-seccomp-f.patch |  34 ------
 .../{ntpsec_1.2.1.bb => ntpsec_1.2.2.bb}      |  24 ++--
 7 files changed, 42 insertions(+), 258 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-Update-to-OpenSSL-3.0.0-alpha15.patch
 delete mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
 delete mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
 create mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
 delete mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
 delete mode 100644 meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.1.bb => ntpsec_1.2.2.bb} (83%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-Update-to-OpenSSL-3.0.0-alpha15.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-Update-to-OpenSSL-3.0.0-alpha15.patch
deleted file mode 100644
index 825f6c93c320..000000000000
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-Update-to-OpenSSL-3.0.0-alpha15.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From ba368822d0a197cb84c46c911d40d0c52cf9c391 Mon Sep 17 00:00:00 2001
-From: Hal Murray <hmurray@megapathdsl.net>
-Date: Sun, 2 May 2021 22:24:26 -0700
-Subject: [PATCH] Update to OpenSSL 3.0.0-alpha15
-
-Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/ba368822d0a197cb84c46c911d40d0c52cf9c391]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- attic/cmac-timing.c | 37 ++++++++++++++-----------------------
- 1 file changed, 14 insertions(+), 23 deletions(-)
-
-diff --git a/attic/cmac-timing.c b/attic/cmac-timing.c
-index c2088db63a4c..464daa76b9e6 100644
---- a/attic/cmac-timing.c
-+++ b/attic/cmac-timing.c
-@@ -225,28 +225,14 @@ static void DoPKEY(
- #if OPENSSL_VERSION_NUMBER > 0x20000000L
- static size_t One_EVP_MAC(
-   EVP_MAC_CTX *ctx,         /* context  */
--  char *cipher,
-   uint8_t *key,             /* key pointer */
-   int     keylength,        /* key length */
-   uint8_t *pkt,             /* packet pointer */
-   int     pktlength         /* packet length */
- ) {
--	OSSL_PARAM params[3];
- 	size_t len = EVP_MAX_MD_SIZE;
- 
--	params[0] =
--          OSSL_PARAM_construct_utf8_string("cipher", cipher, 0);
--	params[1] =
--          OSSL_PARAM_construct_octet_string("key", key, keylength);
--	params[2] = OSSL_PARAM_construct_end();
--	if (0 == EVP_MAC_CTX_set_params(ctx, params)) {
--		unsigned long err = ERR_get_error();
--		char * str = ERR_error_string(err, NULL);
--		printf("## Oops, EVP_MAC_CTX_set_params() failed: %s.\n", str);
--		return 0;
--	}
--
--	if (0 == EVP_MAC_init(ctx)) {
-+	if (0 == EVP_MAC_init(ctx, key, keylength, NULL)) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
- 		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
-@@ -255,13 +241,13 @@ static size_t One_EVP_MAC(
- 	if (0 == EVP_MAC_update(ctx, pkt, pktlength)) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
--		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
-+		printf("## Oops, EVP_MAC_update() failed: %s.\n", str);
- 		return 0;
- 	}
- 	if (0 == EVP_MAC_final(ctx, answer, &len, sizeof(answer))) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
--		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
-+		printf("## Oops, EVP_MAC_final() failed: %s.\n", str);
- 		return 0;
- 	}
- 	return len;
-@@ -290,7 +276,7 @@ static void Do_EVP_MAC(
- 
- 	clock_gettime(CLOCK_MONOTONIC, &start);
- 	for (int i = 0; i < SAMPLESIZE; i++) {
--		digestlength = One_EVP_MAC(evp, cbc, key, keylength, pkt, pktlength);
-+		digestlength = One_EVP_MAC(evp, key, keylength, pkt, pktlength);
- if (0 == digestlength) break;
- 	}
- 	clock_gettime(CLOCK_MONOTONIC, &stop);
-@@ -305,26 +291,31 @@ static size_t One_EVP_MAC2(
-   uint8_t *pkt,             /* packet pointer */
-   int     pktlength         /* packet length */
- ) {
-+	EVP_MAC_CTX *dup;
- 	size_t len = EVP_MAX_MD_SIZE;
- 
--	if (0 == EVP_MAC_init(ctx)) {
-+	// dup = ctx;
-+	dup = EVP_MAC_CTX_dup(ctx);
-+
-+	if (0 == EVP_MAC_init(dup, NULL, 0, NULL)) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
- 		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
- 		return 0;
- 	}
--	if (0 == EVP_MAC_update(ctx, pkt, pktlength)) {
-+	if (0 == EVP_MAC_update(dup, pkt, pktlength)) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
--		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
-+		printf("## Oops, EVP_MAC_update() failed: %s.\n", str);
- 		return 0;
- 	}
--	if (0 == EVP_MAC_final(ctx, answer, &len, sizeof(answer))) {
-+	if (0 == EVP_MAC_final(dup, answer, &len, sizeof(answer))) {
- 		unsigned long err = ERR_get_error();
- 		char * str = ERR_error_string(err, NULL);
--		printf("## Oops, EVP_MAC_init() failed: %s.\n", str);
-+		printf("## Oops, EVP_MAC_final() failed: %s.\n", str);
- 		return 0;
- 	}
-+	EVP_MAC_CTX_free(dup);
- 	return len;
- }
- 
--- 
-2.33.0
-
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
deleted file mode 100644
index 112aaa2a07d6..000000000000
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d474682bb30b93d04b7b01c2dd09832e483265ed Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Sun, 14 Nov 2021 08:54:58 +0000
-Subject: [PATCH] ntpd/ntp_sandbox.c: allow clone3 for glibc-2.34 in seccomp
- filter
-
-Bug: https://bugs.gentoo.org/823692
-Fixes: https://gitlab.com/NTPsec/ntpsec/-/issues/713
-Signed-off-by: Sam James <sam@gentoo.org>
-Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/d474682bb30b93d04b7b01c2dd09832e483265ed]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- ntpd/ntp_sandbox.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
-index e66faaa8cbb0..3d6bccdfcf77 100644
---- a/ntpd/ntp_sandbox.c
-+++ b/ntpd/ntp_sandbox.c
-@@ -401,6 +401,7 @@ int scmp_sc[] = {
-  * rather than generate a trap.
-  */
- 	SCMP_SYS(clone),	/* threads */
-+	SCMP_SYS(clone3),
- 	SCMP_SYS(kill),		/* generate signal */
- 	SCMP_SYS(madvise),
- 	SCMP_SYS(mprotect),
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
deleted file mode 100644
index 3bec2cea7768..000000000000
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From a6c0847582305aaab122d54b635954829812922f Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alexk@zuma.ai>
-Date: Thu, 30 Dec 2021 09:32:26 +0000
-Subject: [PATCH 1/2] ntpd/ntp_sandbox.c: allow newfstatat on all archs for
- glibc-2.34 in seccomp filter
-
-On Yocto Poky, newfstatat is used on (at least) arm64, x86_64 and
-riscv64:
-
-  2021-12-30T09:32:04 ntpd[341]: ERR: SIGSYS: got a trap.
-  2021-12-30T09:32:04 ntpd[341]: ERR: SIGSYS/seccomp bad syscall 262/0xc000003e
-
-Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/a6c0847582305aaab122d54b635954829812922f]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- ntpd/ntp_sandbox.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
-index 3d6bccdfcf77..1ae82a671344 100644
---- a/ntpd/ntp_sandbox.c
-+++ b/ntpd/ntp_sandbox.c
-@@ -349,6 +349,7 @@ int scmp_sc[] = {
- 	SCMP_SYS(lseek),
- 	SCMP_SYS(membarrier),	/* Needed on Alpine 3.11.3 */
- 	SCMP_SYS(munmap),
-+	SCMP_SYS(newfstatat),
- 	SCMP_SYS(open),
- #ifdef __NR_openat
- 	SCMP_SYS(openat),	/* SUSE */
-@@ -452,7 +453,6 @@ int scmp_sc[] = {
- #endif
- #if defined(__aarch64__)
- 	SCMP_SYS(faccessat),
--	SCMP_SYS(newfstatat),
- 	SCMP_SYS(renameat),
- 	SCMP_SYS(linkat),
- 	SCMP_SYS(unlinkat),
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
new file mode 100644
index 000000000000..2e3730df4769
--- /dev/null
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
@@ -0,0 +1,29 @@
+From 792cb4f9d13450251c6344eed2b35f382c98df0d Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alexk@zuma.ai>
+Date: Thu, 19 Jan 2023 13:00:45 +0000
+Subject: [PATCH] wscript: Add BISONFLAGS support
+
+---
+ wscript | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/wscript b/wscript
+index 7329d6e46889..de51f1e9cdd9 100644
+--- a/wscript
++++ b/wscript
+@@ -140,6 +140,7 @@ def configure(ctx):
+     # Ensure m4 is present, or bison will fail with SIGPIPE
+     ctx.find_program('m4')
+     ctx.load('bison')
++    ctx.add_os_flags('BISONFLAGS')
+ 
+     for opt in opt_map:
+         ctx.env[opt] = opt_map[opt]
+@@ -911,6 +912,7 @@ int main(int argc, char **argv) {
+     msg_setting("CFLAGS", " ".join(ctx.env.CFLAGS))
+     msg_setting("LDFLAGS", " ".join(ctx.env.LDFLAGS))
+     msg_setting("LINKFLAGS_NTPD", " ".join(ctx.env.LINKFLAGS_NTPD))
++    msg_setting("BISONFLAGS", ctx.env.BISONFLAGS)
+     msg_setting("PREFIX", ctx.env.PREFIX)
+     msg_setting("LIBDIR", ctx.env.LIBDIR)
+     msg_setting("Droproot Support", droproot_type)
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
deleted file mode 100644
index 98c62eed4976..000000000000
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Widen-the-search-for-tags.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9a7dead72f41e79979625c9bdef2fb638427d3d6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Aug 2022 20:54:17 -0700
-Subject: [PATCH] wscript: Widen the search for tags
-
-Default is to look for annotated tags, howveer when using devtool we
-create our own git tree from release tarballs which will have tags but
-they are not annotated, therefore broaden the search to include all tags
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wscript | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/wscript b/wscript
-index 879ded1..dff835d 100644
---- a/wscript
-+++ b/wscript
-@@ -177,7 +177,7 @@ def configure(ctx):
-     if build_desc:
-         build_desc = ' ' + build_desc
-     if ctx.env.BIN_GIT:
--        cmd = ctx.env.BIN_GIT + shlex.split("describe --dirty")
-+        cmd = ctx.env.BIN_GIT + shlex.split("describe --tags --dirty")
-         git_short_hash = ctx.cmd_and_log(cmd).strip()
-         git_short_hash = '-'.join(git_short_hash.split('-')[1:])
- 
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
deleted file mode 100644
index 705a87bdfaa4..000000000000
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 0f94870b84e68448f16b1304058bde4628dafde5 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alexk@zuma.ai>
-Date: Thu, 30 Dec 2021 10:41:20 +0000
-Subject: [PATCH 2/2] ntpd/ntp_sandbox.c: match riscv to aarch in seccomp
- filter
-
-On Yocto Poky, faccessat (et al) are also used on riscv64:
-
-  2018-03-09T12:35:32 ntpd[341]: ERR: SIGSYS: got a trap.
-  2018-03-09T12:35:32 ntpd[341]: ERR: SIGSYS/seccomp bad syscall 48/0xc00000f3
-
-Upstream-Status: Backport [https://gitlab.com/NTPsec/ntpsec/-/commit/0f94870b84e68448f16b1304058bde4628dafde5]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@zuma.ai>
----
- ntpd/ntp_sandbox.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ntpd/ntp_sandbox.c b/ntpd/ntp_sandbox.c
-index 1ae82a671344..4a14ae224dc6 100644
---- a/ntpd/ntp_sandbox.c
-+++ b/ntpd/ntp_sandbox.c
-@@ -451,7 +451,7 @@ int scmp_sc[] = {
- 	/* gentoo 64-bit and 32-bit, Intel and Arm use mmap */
- 	SCMP_SYS(mmap),
- #endif
--#if defined(__aarch64__)
-+#if defined(__aarch64__) || defined(__riscv)
- 	SCMP_SYS(faccessat),
- 	SCMP_SYS(renameat),
- 	SCMP_SYS(linkat),
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb
similarity index 83%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb
index e975f903f93f..d11ada67ee5c 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.1.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.2.bb
@@ -2,25 +2,22 @@ SUMMARY = "The Network Time Protocol suite, refactored"
 HOMEPAGE = "https://www.ntpsec.org/"
 
 LICENSE = "CC-BY-4.0 & BSD-2-Clause & NTP & BSD-3-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=0520591566b6ed3a9ced8b15b4d4abf9 \
-                    file://libjsmn/LICENSE;md5=38118982429881235de8adf478a8e75d \
-                    file://docs/copyright.adoc;md5=9a1e3fce4b630078cb67ba2b619d2b13 \
-                    file://libaes_siv/COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSES/BSD-2;md5=653830da7b770a32f6f50f6107e0b186 \
+                    file://LICENSES/BSD-3;md5=55e9dcf6a625a2dcfcda4ef6a647fbfd \
+                    file://LICENSES/CC-BY-4.0;md5=2ab724713fdaf49e4523c4503bfd068d \
+                    file://LICENSES/MIT;md5=5a9dfc801af3eb49df2055c9b07918b2 \
+                    file://LICENSES/NTP;md5=cb56b7747f86157c78ca81f224806694"
 
 DEPENDS += "bison-native \
             openssl \
             python3"
 
 SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
-           file://0001-Update-to-OpenSSL-3.0.0-alpha15.patch \
-           file://0001-ntpd-ntp_sandbox.c-allow-clone3-for-glibc-2.34-in-se.patch \
-           file://0001-ntpd-ntp_sandbox.c-allow-newfstatat-on-all-archs-for.patch \
-           file://0002-ntpd-ntp_sandbox.c-match-riscv-to-aarch-in-seccomp-f.patch \
            file://volatiles.ntpsec \
-           file://0001-wscript-Widen-the-search-for-tags.patch \
+           file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "f2684835116c80b8f21782a5959a805ba3c44e3a681dd6c17c7cb00cc242c27a"
+SRC_URI[sha256sum] = "2f2848760b915dfe185b9217f777738b36ceeb78a7fc208b7e74e039dec22df5"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 
@@ -66,7 +63,6 @@ EXTRA_OECONF = "--cross-compiler='${CC}' \
                 --pyshebang=${bindir}/python3 \
                 --pythondir=${PYTHON_SITEPACKAGES_DIR} \
                 --pythonarchdir=${PYTHON_SITEPACKAGES_DIR} \
-                --enable-debug \
                 --enable-debug-gdb \
                 --enable-early-droproot"
 
@@ -74,6 +70,12 @@ EXTRA_OEWAF_BUILD ?= "-v"
 
 NTP_USER_HOME ?= "/var/lib/ntp"
 
+BISONFLAGS = "--file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
+do_configure:prepend() {
+	export BISONFLAGS="${BISONFLAGS}"
+}
+
 do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 755 ${S}/etc/rc/ntpd ${D}${sysconfdir}/init.d
-- 
2.39.0


