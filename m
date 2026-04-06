Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8274EF4ED2
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 11:56:05 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53334.1775476558545718420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 04:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dDWUB3oa;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10073; q=dns/txt;
  s=iport01; t=1775476558; x=1776686158;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SvX1jIZzimyxNsKAbXB/9WbvK1kgPk6MpLqRKhzAuIw=;
  b=dDWUB3oaOXDXMeD39FJ2zG7sQWxg3v59NY4X59GkE9kdVYjwrhBp8mlO
   xYIP9kiQcqB3LSMKt6XC5DJ2/Xq2x9SS8YavJypy5yoIEo3ElOJxJJ6l1
   jR3RCYQL9VzmDYiWayHi6YQpxaMFsJB7BvSheq8c46puN0Iiqv8V/UMR2
   aNIf/HH0NDeczBzJsHCHh5VCP6UDd584S8FVuVcQf1vJaCj08hYsSNaqs
   ZsbMxRgcaqe0TsXr1ddZbcHYahRbxL0SNH5XZP4neW8xrylAAg87BACTo
   uC0f9oOmRouHfbwvGWk5foe+UCljaKlNRI1cPI4JMUF3H0sZHAB/Ec3U9
   Q==;
X-CSE-ConnectionGUID: +fA6xGM/TwOa7Fum/xXuLw==
X-CSE-MsgGUID: SGL3ycyHQnyvLdOXQzSzMg==
X-IPAS-Result: =?us-ascii?q?A0BFAgBtntNp/4//Ja1aglmCV3FfQkkDlCeCIYEWnQeBf?=
 =?us-ascii?q?w8BAQEPRA0EAQGSMwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgE4ARgBWQMBAlojIYMCAYJzAgERthOCLIEBgygBMQUJA?=
 =?us-ascii?q?kNP2yYBCxQBgTiFPogcWxgBRIQ2JxsbgXKBFYJydoEFgVwEGIgKBIIigQ6BY?=
 =?us-ascii?q?YIHBoJNggCHX0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFLh?=
 =?us-ascii?q?kp0bYETg3dmAwsYDUgRLDcUGwQ+bgeLISeCNgF6EwErF3pULxgOAwySdB2SR?=
 =?us-ascii?q?oE1n1kKKIN0jB6VOhozhASUFYshhzGZBo4JlXNdhGiBaDyBWXAVgyIJSRkPj?=
 =?us-ascii?q?i0LC4hxwG8jNQIJAzABBwIHDgKBc5F9AQE?=
IronPort-Data: A9a23:riUUZaAob4/uVRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApDIjhGBRm
 GJMWmuOMqrcN2H1fYonaYjloU4AucLcm9IwOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAP9hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEgPtHUlEZGMok5cF+Xk9T8
 LsIGC0pcUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FMpj+C8aICIJrRmQ+1usWLDt
 2nX313/Ew8+OPuv8Ci+4Fej07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Rh33OK05hBZDvL8GQ+kBgAqjBIIkLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vf6gylPTHi/ehA0q
 olWa1/BNrsSWVet6/BkWyF+xJK+qjhzEhu7t2uq0tQcQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AeVL1Hmk84I8EYM6kIEoh6UFnfA3XOT7T5SnADGr?=
 =?us-ascii?q?/NXlOQeK7VFrX6JN5t9U7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1XMqDwweT81bAwSL+2uoYVucG/+aqJ+BLBscmoQ?=
 =?us-ascii?q?mgs+VKwh8HAekng+lZ4Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="707090254"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 11:55:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 8416918000244
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Apr 2026 11:55:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 30D53CC12B5; Mon,  6 Apr 2026 04:55:57 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][whinlatter][PATCH 3/3] libssh: Fix CVE-2026-0965
Date: Mon,  6 Apr 2026 04:55:35 -0700
Message-Id: <20260406115535.1242965-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126037

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76
[2] https://security-tracker.debian.org/tracker/CVE-2026-0965

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../libssh/libssh/CVE-2026-0965.patch         | 286 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.11.3.bb   |   1 +
 2 files changed, 287 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
new file mode 100644
index 0000000000..57cb9d6170
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0965.patch
@@ -0,0 +1,286 @@
+From 5858a988942d2e25985b34b8c40ce2792cbbe853 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 11 Dec 2025 17:33:19 +0100
+Subject: [PATCH 4/4] CVE-2026-0965 config: Do not attempt to read non-regular
+ and too large configuration files
+
+Changes also the reading of known_hosts to use the new helper function
+
+CVE: CVE-2026-0965
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=bf390a042623e02abc8f421c4c5fadc0429a8a76]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit a5eb30dbfd8f3526b2d04bd9f0a3803b665f5798)
+(cherry picked from commit bf390a042623e02abc8f421c4c5fadc0429a8a76)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ include/libssh/misc.h            |  3 ++
+ include/libssh/priv.h            |  3 ++
+ src/bind_config.c                |  4 +-
+ src/config.c                     |  8 ++--
+ src/dh-gex.c                     |  4 +-
+ src/known_hosts.c                |  2 +-
+ src/knownhosts.c                 |  2 +-
+ src/misc.c                       | 74 ++++++++++++++++++++++++++++++++
+ tests/unittests/torture_config.c | 20 +++++++++
+ 9 files changed, 110 insertions(+), 10 deletions(-)
+
+diff --git a/include/libssh/misc.h b/include/libssh/misc.h
+index ab726a0e..8eab94ee 100644
+--- a/include/libssh/misc.h
++++ b/include/libssh/misc.h
+@@ -36,6 +36,7 @@
+ #include <sys/types.h>
+ #include <stdbool.h>
+ #endif /* _WIN32 */
++#include <stdio.h>
+ 
+ #ifdef __cplusplus
+ extern "C" {
+@@ -136,6 +137,8 @@ int ssh_check_username_syntax(const char *username);
+ void ssh_proxyjumps_free(struct ssh_list *proxy_jump_list);
+ bool ssh_libssh_proxy_jumps(void);
+ 
++FILE *ssh_strict_fopen(const char *filename, size_t max_file_size);
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/include/libssh/priv.h b/include/libssh/priv.h
+index 35fd8506..62069970 100644
+--- a/include/libssh/priv.h
++++ b/include/libssh/priv.h
+@@ -473,6 +473,9 @@ char *ssh_strerror(int err_num, char *buf, size_t buflen);
+ #define SSH_TTY_MODES_MAX_BUFSIZE   (55 * 5 + 1)
+ int encode_current_tty_opts(unsigned char *buf, size_t buflen);
+ 
++/** The default maximum file size for a configuration file */
++#define SSH_MAX_CONFIG_FILE_SIZE 16 * 1024 * 1024
++
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/src/bind_config.c b/src/bind_config.c
+index 9e4a7fd4..c12f1003 100644
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
+index b4171efd..1ffad537 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -223,10 +223,9 @@ local_parse_file(ssh_session session,
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
+@@ -1466,8 +1465,9 @@ int ssh_config_parse_file(ssh_session session, const char *filename)
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
+index 46ba934e..428a5655 100644
+--- a/src/dh-gex.c
++++ b/src/dh-gex.c
+@@ -519,9 +519,9 @@ static int ssh_retrieve_dhgroup(char *moduli_file,
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
+index 3ef83e21..701576ce 100644
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
+index a2d08a75..3ab468de 100644
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
+         SSH_LOG(SSH_LOG_TRACE, "Failed to open the known_hosts file '%s': %s",
+diff --git a/src/misc.c b/src/misc.c
+index 774211fb..3968e6bc 100644
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
+@@ -2244,4 +2245,77 @@ ssh_libssh_proxy_jumps(void)
+     return !(t != NULL && t[0] == '1');
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
+index fcfe8fbc..0cb31a76 100644
+--- a/tests/unittests/torture_config.c
++++ b/tests/unittests/torture_config.c
+@@ -2675,6 +2675,23 @@ static void torture_config_match_complex(void **state)
+     ssh_string_free_char(v);
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
+@@ -2771,6 +2788,9 @@ int torture_run_tests(void)
+                                         setup, teardown),
+         cmocka_unit_test_setup_teardown(torture_config_match_complex,
+                                         setup, teardown),
++        cmocka_unit_test_setup_teardown(torture_config_invalid,
++                                        setup,
++                                        teardown),
+     };
+ 
+ 
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index 193ff3512d..c552692bde 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0968_p1.patch \
            file://CVE-2026-0968_p2.patch \
            file://CVE-2026-0967.patch \
+           file://CVE-2026-0965.patch \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
-- 
2.35.6


