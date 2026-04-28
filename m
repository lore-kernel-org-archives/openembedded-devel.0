Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847D7FF885A
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:01:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5412.1777352491443121431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 22:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pk7WpZhW;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae146b604so73767125ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352491; x=1777957291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcJRZdYJEMiMQ6hiF4tMJIhiL1q4NBq7vkY6GCODzgc=;
        b=pk7WpZhWwA6iresJS+9p5XoL1ujii94sSG0FrGB0kYngTA1UjCZ7CDVv23tq/s5RKe
         yyw0nu51bta7oKM36M9CQNSAehf0HQNl/7ZXu5tmknGu8+Sdoom06WirHyxzN+cmrnF9
         BvQQ9eHhnGOcgqxOogmBANCUbKCPWvSOeXBpw89HBRLe266nZGE7scCeIue1LgXcerAh
         e4AkebAHY1oGgD9EEUWVPt3x6Od9mil1pvgE48c6vkmCK4bBGuNm6b5MeRP2H6QE4a9A
         C5LSEAXO3Dly/9WORogIHax11BIpPsnsdPuUjbs4YvmjiDNLePqJTqERpfdtW9rqr//w
         QH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352491; x=1777957291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZcJRZdYJEMiMQ6hiF4tMJIhiL1q4NBq7vkY6GCODzgc=;
        b=C7jGLdUt0eoKXKvz7H/v2sLDNTiY/IlD+wHTkDeB61xBEsbIWLlfHGVxfAFnzuxtHB
         TrrEqqMcoyjKSs3lGqYcgXs+Vo5t8GtNXIQWgMSWztsHCajw7MfK4WP93VKwgVP4kzSz
         b0mK2Jc4/V8mezn3jmE3t04dZVk1Trp4UaIDP/Tq/o8P0jT4aFcr1a8VpmEqRLWp7GCa
         DH+mAzFN2B3Icd2TLb25qqJC0Wy2gq9g4esjkhVfRMbC6zdjsUvzCB5ubY2Kl7l6SDLc
         qNq+Ce7fhlU2/CSIkGSPmLAhu9CJhbWkm3RIPC9n0Wm9mXNtWaBZZw/yTHkx3C3/qng1
         +17w==
X-Gm-Message-State: AOJu0Yw2Ci9TPSrx2HmJG1Hco120f8M8cJwm9ZAMiJzUhDC82p0qLxVZ
	Symaossq8Dc8erlDDATV/rCRFMJ2sPTh1ei41vXiBVUnSWUq82qLqMkktRxp5nzv
X-Gm-Gg: AeBDietGlHYnhmY+KE2uJCHLLVeifkZiQxZkAJ7X4OSBPEWe+CnUqzCs3tIR2NfzKWH
	G17bGMcc7ipK+F0OGavVW7yFxfDv6Fol4BskZ5FIQdbwE+tFO/33extmJL0vZvbOH/nIGGj+fm9
	5lgOv4NeKUyfN2uRW6tY4eReliskAypkwlJgsgaiucsd50YICarD0IQZqFN8VkbOtGx49tUkDkJ
	szhFFjio5KruXPYxli97xZ/ijXjiOCEyHh9fUlgldx5HHDT+Eqz7x9qDGww4eXX2T794+EvstrW
	GS9/LYiQ+kM2o9r97AUSfrKmklC/bm3r3NG137f2E5mNagYZY+3MntkIUxinTRfIg4/fmrw5a27
	f/cNDViiBN05iMvOPBdW0Ey0uKuP62Z1nKISBPBvVd5gRFdWUX8zb3bt0VdFJuLft64wjs9DqCw
	Ivw9FFFQme/AF7QO5jner9K0s+HgDGSTXDzoUKGeMOXLvxoZE=
X-Received: by 2002:a17:903:2403:b0:2b0:54dc:63e with SMTP id d9443c01a7336-2b97c4d8b01mr11197935ad.33.1777352490485;
        Mon, 27 Apr 2026 22:01:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d619sm11798385ad.70.2026.04.27.22.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:01:30 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/5] libssh: Fix CVE-2026-0965
Date: Tue, 28 Apr 2026 17:01:08 +1200
Message-ID: <20260428050109.2099228-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
References: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126645

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport the patch [1] as mentioned in [2]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76
[2] https://security-tracker.debian.org/tracker/CVE-2026-0965

Ptests passed:
root@qemux86:~# ptest-runner libssh
START: ptest-runner
2026-04-28T04:44
BEGIN: /usr/lib/libssh/ptest
...
...
DURATION: 269
END: /usr/lib/libssh/ptest
2026-04-28T04:49
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libssh/libssh/CVE-2026-0965.patch         | 284 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   1 +
 2 files changed, 285 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
new file mode 100644
index 0000000000..c30310bc70
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
@@ -0,0 +1,284 @@
+From cc84dbc554e4e3d760234ea0e24284ef09fd3428 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 17:33:19 +0100
+Subject: [PATCH] CVE-2026-0965 config: Do not attempt to read non-regular and
+ too large configuration files
+
+Changes also the reading of known_hosts to use the new helper function
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
+
+CVE: CVE-2026-0965
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ include/libssh/misc.h            |  4 +-
+ include/libssh/priv.h            |  3 ++
+ src/bind_config.c                |  4 +-
+ src/config.c                     |  8 ++--
+ src/dh-gex.c                     |  4 +-
+ src/known_hosts.c                |  2 +-
+ src/knownhosts.c                 |  2 +-
+ src/misc.c                       | 74 ++++++++++++++++++++++++++++++++
+ tests/unittests/torture_config.c | 20 +++++++++
+ 9 files changed, 110 insertions(+), 11 deletions(-)
+
+diff --git a/include/libssh/misc.h b/include/libssh/misc.h
+index 0924ba7f..5591c925 100644
+--- a/include/libssh/misc.h
++++ b/include/libssh/misc.h
+@@ -20,7 +20,7 @@
+ 
+ #ifndef MISC_H_
+ #define MISC_H_
+-
++#include <stdio.h>
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
+@@ -106,6 +106,8 @@ char *ssh_strreplace(const char *src, const char *pattern, const char *repl);
+ 
+ int ssh_check_hostname_syntax(const char *hostname);
+ 
++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/include/libssh/priv.h b/include/libssh/priv.h
+index 47af57f4..b55df501 100644
+--- a/include/libssh/priv.h
++++ b/include/libssh/priv.h
+@@ -438,6 +438,9 @@ bool is_ssh_initialized(void);
+ #define SSH_ERRNO_MSG_MAX   1024
+ char *ssh_strerror(int err_num, char *buf, size_t buflen);
+ 
++/** The default maximum file size for a configuration file */
++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/src/bind_config.c b/src/bind_config.c
+index ed42cbe3..c429bce2 100644
+--- a/src/bind_config.c
++++ b/src/bind_config.c
+@@ -212,7 +212,7 @@ local_parse_file(ssh_bind bind,
+         return;
+     }
+ 
+-    f = fopen(filename, "r");
++    f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+     if (f == NULL) {
+         SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
+                 filename);
+@@ -636,7 +636,7 @@ int ssh_bind_config_parse_file(ssh_bind bind, const char *filename)
+      * option to be redefined later by another file. */
+     uint8_t seen[BIND_CFG_MAX] = {0};
+ 
+-    f = fopen(filename, "r");
++    f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+     if (f == NULL) {
+         return 0;
+     }
+diff --git a/src/config.c b/src/config.c
+index d4d8d419..87cdaaaf 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -215,10 +215,9 @@ local_parse_file(ssh_session session,
+         return;
+     }
+ 
+-    f = fopen(filename, "r");
++    f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+     if (f == NULL) {
+-        SSH_LOG(SSH_LOG_RARE, "Cannot find file %s to load",
+-                filename);
++        /* The underlying function logs the reasons */
+         return;
+     }
+ 
+@@ -1205,8 +1204,9 @@ int ssh_config_parse_file(ssh_session session, const char *filename)
+     int parsing, rv;
+     bool global = 0;
+ 
+-    f = fopen(filename, "r");
++    f = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+     if (f == NULL) {
++        /* The underlying function logs the reasons */
+         return 0;
+     }
+ 
+diff --git a/src/dh-gex.c b/src/dh-gex.c
+index 642a88ae..aadc7c09 100644
+--- a/src/dh-gex.c
++++ b/src/dh-gex.c
+@@ -520,9 +520,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
+     }
+ 
+     if (moduli_file != NULL)
+-        moduli = fopen(moduli_file, "r");
++        moduli = ssh_strict_fopen(moduli_file, SSH_MAX_CONFIG_FILE_SIZE);
+     else
+-        moduli = fopen(MODULI_FILE, "r");
++        moduli = ssh_strict_fopen(MODULI_FILE, SSH_MAX_CONFIG_FILE_SIZE);
+ 
+     if (moduli == NULL) {
+         char err_msg[SSH_ERRNO_MSG_MAX] = {0};
+diff --git a/src/known_hosts.c b/src/known_hosts.c
+index f660a6f3..ba2ae4d5 100644
+--- a/src/known_hosts.c
++++ b/src/known_hosts.c
+@@ -83,7 +83,7 @@ static struct ssh_tokens_st *ssh_get_knownhost_line(FILE **file,
+     struct ssh_tokens_st *tokens = NULL;
+ 
+     if (*file == NULL) {
+-        *file = fopen(filename,"r");
++        *file = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+         if (*file == NULL) {
+             return NULL;
+         }
+diff --git a/src/knownhosts.c b/src/knownhosts.c
+index 109b4f06..f0fde696 100644
+--- a/src/knownhosts.c
++++ b/src/knownhosts.c
+@@ -232,7 +232,7 @@ static int ssh_known_hosts_read_entries(const char *match,
+     FILE *fp = NULL;
+     int rc;
+ 
+-    fp = fopen(filename, "r");
++    fp = ssh_strict_fopen(filename, SSH_MAX_CONFIG_FILE_SIZE);
+     if (fp == NULL) {
+         char err_msg[SSH_ERRNO_MSG_MAX] = {0};
+         SSH_LOG(SSH_LOG_WARN, "Failed to open the known_hosts file '%s': %s",
+diff --git a/src/misc.c b/src/misc.c
+index 565abcfc..e78c92ba 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -37,6 +37,7 @@
+ #endif /* _WIN32 */
+ 
+ #include <errno.h>
++#include <fcntl.h>
+ #include <limits.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -2074,4 +2075,77 @@ int ssh_check_hostname_syntax(const char *hostname)
+     return SSH_OK;
+ }
+ 
++/**
++ * @internal
++ *
++ * @brief Safely open a file containing some configuration.
++ *
++ * Runs checks if the file can be used as some configuration file (is regular
++ * file and is not too large). If so, returns the opened file (for reading).
++ * Otherwise logs error and returns `NULL`.
++ *
++ * @param filename      The path to the file to open.
++ * @param max_file_size Maximum file size that is accepted.
++ *
++ * @returns the opened file or `NULL` on error.
++ */
++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size)
++{
++    FILE *f = NULL;
++    struct stat sb;
++    char err_msg[SSH_ERRNO_MSG_MAX] = {0};
++    int r, fd;
++
++    /* open first to avoid TOCTOU */
++    fd = open(filename, O_RDONLY);
++    if (fd == -1) {
++        SSH_LOG(SSH_LOG_RARE,
++                "Failed to open a file %s for reading: %s",
++                filename,
++                ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
++        return NULL;
++    }
++
++    /* Check the file is sensible for a configuration file */
++    r = fstat(fd, &sb);
++    if (r != 0) {
++        SSH_LOG(SSH_LOG_RARE,
++                "Failed to stat %s: %s",
++                filename,
++                ssh_strerror(errno, err_msg, SSH_ERRNO_MSG_MAX));
++        close(fd);
++        return NULL;
++    }
++    if ((sb.st_mode & S_IFMT) != S_IFREG) {
++        SSH_LOG(SSH_LOG_RARE,
++                "The file %s is not a regular file: skipping",
++                filename);
++        close(fd);
++        return NULL;
++    }
++
++    if ((size_t)sb.st_size > max_file_size) {
++        SSH_LOG(SSH_LOG_RARE,
++                "The file %s is too large (%jd MB > %zu MB): skipping",
++                filename,
++                (intmax_t)sb.st_size / 1024 / 1024,
++                max_file_size / 1024 / 1024);
++        close(fd);
++        return NULL;
++    }
++
++    f = fdopen(fd, "r");
++    if (f == NULL) {
++        SSH_LOG(SSH_LOG_RARE,
++                "Failed to open a file %s for reading: %s",
++                filename,
++                ssh_strerror(r, err_msg, SSH_ERRNO_MSG_MAX));
++        close(fd);
++        return NULL;
++    }
++
++    /* the flcose() will close also the underlying fd */
++    return f;
++}
++
+ /** @} */
+diff --git a/tests/unittests/torture_config.c b/tests/unittests/torture_config.c
+index 3569b51a..b4c7b0a7 100644
+--- a/tests/unittests/torture_config.c
++++ b/tests/unittests/torture_config.c
+@@ -1908,6 +1908,23 @@ static void torture_config_make_absolute_no_sshdir(void **state)
+     torture_config_make_absolute_int(state, 1);
+ }
+ 
++/* Invalid configuration files
++ */
++static void torture_config_invalid(void **state)
++{
++    ssh_session session = *state;
++
++    ssh_options_set(session, SSH_OPTIONS_HOST, "Bar");
++
++    /* non-regular file -- ignored (or missing on non-unix) so OK */
++    _parse_config(session, "/dev/random", NULL, SSH_OK);
++
++#ifndef _WIN32
++    /* huge file -- ignored (or missing on non-unix) so OK */
++    _parse_config(session, "/proc/kcore", NULL, SSH_OK);
++#endif
++}
++
+ int torture_run_tests(void)
+ {
+     int rc;
+@@ -1980,6 +1997,9 @@ int torture_run_tests(void)
+                                         setup, teardown),
+         cmocka_unit_test_setup_teardown(torture_config_make_absolute_no_sshdir,
+                                         setup_no_sshdir, teardown),
++        cmocka_unit_test_setup_teardown(torture_config_invalid,
++                                        setup,
++                                        teardown),
+     };
+ 
+ 
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index e4a28af7a6..189305fd2e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0968-1.patch \
            file://CVE-2026-0968-2.patch \
            file://CVE-2026-0967.patch \
+           file://CVE-2026-0965.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 

