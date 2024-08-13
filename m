Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB49C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:33:23 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.71186.1723552402346426458
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cVUtwTtO;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6e7b121be30so3427262a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1723552401; x=1724157201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIK0M7CINNNE2CiWkW0I5+FUPS672RpcTsWISiYpedc=;
        b=cVUtwTtOy8I20HSvEQAdSL+ckp4ZlvNtRg4jIFb9D8j/xUYtult8FyDDy7goQ+96Xm
         dj/WlvsF3AbK+3RAgL1SxlTuXfxMRyTNXSTN2iWSLCGwSHGYv3xySs4pqZMFoNIE0nb5
         X1WUCzjFYOUvK6pUrCpbcr/HsZ8FGTX5SOHLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723552401; x=1724157201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIK0M7CINNNE2CiWkW0I5+FUPS672RpcTsWISiYpedc=;
        b=U97YWDRzZcnZsrFrHxgFInmoeahJ66zrBvZzaE0WA8zCUmIFxoQgeDZOGm1uBht3+P
         dZ0YgxDWfEsPlyJKqRyl0fey6XO80jhaDyUDwscuOpKNU5EprWhsRjI/q4mrWSPEDGvR
         GOLsuFDE1HtKYSEpjNZxYpP/SBL0RsKtKLuVvJYIEZLmb1K2nA2xTtewbrWOwbg+9e9h
         XJ1UTXPD+0yMb6YhRROZHV7G28tOQ9OFk8YpVGOAK9wpBqOKHMI2gUpRbE9W8i/u27Iq
         thu6sTWMPCa+NtkfNmR+tkcoU1r6VBcpYa6O1cB4zAd4GH0/ePAogd0bTYp+GhQ5i4ys
         cbDQ==
X-Gm-Message-State: AOJu0Ywz6Bu3uhwv3cc0gfOtwzvXJIj8ybmU7lodfwE/5gA39HY46n9K
	wQlCSsLH1xzOUemYP1iUFSGMSGqTtfceXUgDXv8mQLNnBE0ZdpX4dhsfbA+A4OUPZBaLBo/5l2o
	A
X-Google-Smtp-Source: AGHT+IHPBRyxKLwWeG/Xb/FthNkMcUa7MsAPp96PS3s4KF+h0SqLIopNTo0ftzgysl3rCSg/E8bLYg==
X-Received: by 2002:a17:90a:c49:b0:2c4:dc63:96d7 with SMTP id 98e67ed59e1d1-2d392686847mr3293566a91.41.1723552400672;
        Tue, 13 Aug 2024 05:33:20 -0700 (PDT)
Received: from localhost.localdomain ([43.249.234.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcfe487esm7108527a91.42.2024.08.13.05.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:33:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: upgrade 0.8.9 -> 0.9.8
Date: Tue, 13 Aug 2024 18:03:08 +0530
Message-Id: <20240813123308.84239-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 12:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111792

Changelog:
==========
version 0.9.8 (released 2023-12-18)
 * Fix CVE-2023-6004: Command injection using proxycommand
 * Fix CVE-2023-48795: Potential downgrade attack using strict kex
 * Fix CVE-2023-6918: Missing checks for return values of MD functions
 * Allow @ in usernames when parsing from URI composes
 * Fix CVE-2023-1667: a NULL dereference during rekeying with algorithm guessing

remove 0001-config-Move-common-parser-functions-to-config_parser,
CVE-2023-6004.patch, CVE-2020-16135.patch, CVE-2023-48795-1.patch
which is fixed by upgrade.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 ...on-parser-functions-to-config_parser.patch | 464 ------------------
 .../libssh/libssh/001_CVE-2023-6004.patch     |  30 --
 .../libssh/libssh/002_CVE-2023-6004.patch     |  83 ----
 .../libssh/libssh/003_CVE-2023-6004.patch     | 117 -----
 .../libssh/libssh/004_CVE-2023-6004.patch     |  57 ---
 .../libssh/libssh/005_CVE-2023-6004.patch     | 142 ------
 .../libssh/libssh/006_CVE-2023-6004.patch     | 117 -----
 .../libssh/libssh/CVE-2020-16135.patch        |  44 --
 .../libssh/libssh/CVE-2023-48795-1.patch      | 385 ---------------
 .../libssh/libssh/CVE-2023-48795-2.patch      | 126 -----
 .../libssh/libssh/CVE-2023-48795-3.patch      |  47 --
 .../recipes-support/libssh/libssh_0.8.9.bb    |  49 --
 .../recipes-support/libssh/libssh_0.9.8.bb    |  29 ++
 13 files changed, 29 insertions(+), 1661 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
 delete mode 100644 meta-oe/recipes-support/libssh/libssh_0.8.9.bb
 create mode 100644 meta-oe/recipes-support/libssh/libssh_0.9.8.bb

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch b/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
deleted file mode 100644
index f26b644102..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
+++ /dev/null
@@ -1,464 +0,0 @@
-From 79049981a513f9a10fac0f153e9b0b588326021f Mon Sep 17 00:00:00 2001
-From: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-Date: Fri, 22 Feb 2019 13:06:49 +0100
-Subject: [PATCH] config: Move common parser functions to config_parser.c
-
-This will allow the moved functions to be used in the server side
-configuration parser implementation.
-
-Signed-off-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-
-CVE:CVE-2023-6004
-Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=79049981a513f9a10fac0f153e9b0b588326021f]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Removed 1 hunk from config.c as the function was intoduced in
-later version
-
----
- include/libssh/config_parser.h |  57 ++++++++
- src/CMakeLists.txt             |   1 +
- src/config.c                   | 216 +-----------------------------
- src/config_parser.c            | 238 +++++++++++++++++++++++++++++++++
- 4 files changed, 297 insertions(+), 215 deletions(-)
- create mode 100644 include/libssh/config_parser.h
- create mode 100644 src/config_parser.c
-
-diff --git a/include/libssh/config_parser.h b/include/libssh/config_parser.h
-new file mode 100644
-index 00000000..e974917c
---- /dev/null
-+++ b/include/libssh/config_parser.h
-@@ -0,0 +1,57 @@
-+/*
-+ * config_parser.h - Common configuration file parser functions
-+ *
-+ * This file is part of the SSH Library
-+ *
-+ * Copyright (c) 2019 by Red Hat, Inc.
-+ *
-+ * Author: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-+ *
-+ * The SSH Library is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU Lesser General Public License as published by
-+ * the Free Software Foundation; either version 2.1 of the License, or (at your
-+ * option) any later version.
-+ *
-+ * The SSH Library is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
-+ * License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with the SSH Library; see the file COPYING.  If not, write to
-+ * the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-+ * MA 02111-1307, USA.
-+ */
-+
-+#ifndef CONFIG_PARSER_H_
-+#define CONFIG_PARSER_H_
-+
-+char *ssh_config_get_cmd(char **str);
-+
-+char *ssh_config_get_token(char **str);
-+
-+long ssh_config_get_long(char **str, long notfound);
-+
-+const char *ssh_config_get_str_tok(char **str, const char *def);
-+
-+int ssh_config_get_yesno(char **str, int notfound);
-+
-+/* @brief Parse SSH URI in format [user@]host[:port] from the given string
-+ *
-+ * @param[in]   tok      String to parse
-+ * @param[out]  username Pointer to the location, where the new username will
-+ *                       be stored or NULL if we do not care about the result.
-+ * @param[out]  hostname Pointer to the location, where the new hostname will
-+ *                       be stored or NULL if we do not care about the result.
-+ * @param[out]  port     Pointer to the location, where the new port will
-+ *                       be stored or NULL if we do not care about the result.
-+ *
-+ * @returns     SSH_OK if the provided string is in format of SSH URI,
-+ *              SSH_ERROR on failure
-+ */
-+int ssh_config_parse_uri(const char *tok,
-+        char **username,
-+        char **hostname,
-+        char **port);
-+
-+#endif /* LIBSSH_CONFIG_H_ */
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index fdb53baf..de66f056 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -163,6 +163,7 @@ set(libssh_SRCS
-   external/poly1305.c
-   external/sc25519.c
-   chachapoly.c
-+  config_parser.c
- )
- 
- if (CMAKE_USE_PTHREADS_INIT)
-diff --git a/src/config.c b/src/config.c
-index 85ecd96a..4268545d 100644
---- a/src/config.c
-+++ b/src/config.c
-@@ -22,7 +22,7 @@
-  */
- 
- #include "config.h"
--
-+#include "libssh/config_parser.h"
- #include <ctype.h>
- #include <stdio.h>
- #include <string.h>
-@@ -228,102 +228,6 @@ static enum ssh_config_opcode_e ssh_config_get_opcode(char *keyword) {
-   return SOC_UNKNOWN;
- }
- 
--static char *ssh_config_get_cmd(char **str) {
--  register char *c;
--  char *r;
--
--  /* Ignore leading spaces */
--  for (c = *str; *c; c++) {
--    if (! isblank(*c)) {
--      break;
--    }
--  }
--
--  if (*c == '\"') {
--    for (r = ++c; *c; c++) {
--      if (*c == '\"') {
--        *c = '\0';
--        goto out;
--      }
--    }
--  }
--
--  for (r = c; *c; c++) {
--    if (*c == '\n') {
--      *c = '\0';
--      goto out;
--    }
--  }
--
--out:
--  *str = c + 1;
--
--  return r;
--}
--
--static char *ssh_config_get_token(char **str) {
--  register char *c;
--  char *r;
--
--  c = ssh_config_get_cmd(str);
--
--  for (r = c; *c; c++) {
--    if (isblank(*c) || *c == '=') {
--      *c = '\0';
--      goto out;
--    }
--  }
--
--out:
--  *str = c + 1;
--
--  return r;
--}
--
--static long ssh_config_get_long(char **str, long notfound) {
--  char *p, *endp;
--  long i;
--
--  p = ssh_config_get_token(str);
--  if (p && *p) {
--    i = strtol(p, &endp, 10);
--    if (p == endp) {
--      return notfound;
--    }
--    return i;
--  }
--
--  return notfound;
--}
--
--static const char *ssh_config_get_str_tok(char **str, const char *def) {
--  char *p;
--
--  p = ssh_config_get_token(str);
--  if (p && *p) {
--    return p;
--  }
--
--  return def;
--}
--
--static int ssh_config_get_yesno(char **str, int notfound) {
--  const char *p;
--
--  p = ssh_config_get_str_tok(str, NULL);
--  if (p == NULL) {
--    return notfound;
--  }
--
--  if (strncasecmp(p, "yes", 3) == 0) {
--    return 1;
--  } else if (strncasecmp(p, "no", 2) == 0) {
--    return 0;
--  }
--
--  return notfound;
--}
--
- static void local_parse_file(ssh_session session, const char *filename, int *parsing, int seen[]) {
-   FILE *f;
-   char line[MAX_LINE_SIZE] = {0};
-diff --git a/src/config_parser.c b/src/config_parser.c
-new file mode 100644
-index 00000000..ae2aa2c8
---- /dev/null
-+++ b/src/config_parser.c
-@@ -0,0 +1,238 @@
-+/*
-+ * config_parser.c - Common configuration file parser functions
-+ *
-+ * This file is part of the SSH Library
-+ *
-+ * Copyright (c) 2009-2013    by Andreas Schneider <asn@cryptomilk.org>
-+ *
-+ * The SSH Library is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU Lesser General Public License as published by
-+ * the Free Software Foundation; either version 2.1 of the License, or (at your
-+ * option) any later version.
-+ *
-+ * The SSH Library is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
-+ * License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with the SSH Library; see the file COPYING.  If not, write to
-+ * the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
-+ * MA 02111-1307, USA.
-+ */
-+
-+#include "config.h"
-+
-+#include <ctype.h>
-+#include <stdio.h>
-+#include <string.h>
-+#include <stdlib.h>
-+
-+#include "libssh/config_parser.h"
-+#include "libssh/priv.h"
-+
-+char *ssh_config_get_cmd(char **str)
-+{
-+    register char *c;
-+    char *r;
-+
-+    /* Ignore leading spaces */
-+    for (c = *str; *c; c++) {
-+        if (! isblank(*c)) {
-+            break;
-+        }
-+    }
-+
-+    if (*c == '\"') {
-+        for (r = ++c; *c; c++) {
-+            if (*c == '\"') {
-+                *c = '\0';
-+                goto out;
-+            }
-+        }
-+    }
-+
-+    for (r = c; *c; c++) {
-+        if (*c == '\n') {
-+            *c = '\0';
-+            goto out;
-+        }
-+    }
-+
-+out:
-+    *str = c + 1;
-+
-+    return r;
-+}
-+
-+char *ssh_config_get_token(char **str)
-+{
-+    register char *c;
-+    char *r;
-+
-+    c = ssh_config_get_cmd(str);
-+
-+    for (r = c; *c; c++) {
-+        if (isblank(*c) || *c == '=') {
-+            *c = '\0';
-+            goto out;
-+        }
-+    }
-+
-+out:
-+    *str = c + 1;
-+
-+    return r;
-+}
-+
-+long ssh_config_get_long(char **str, long notfound)
-+{
-+    char *p, *endp;
-+    long i;
-+
-+    p = ssh_config_get_token(str);
-+    if (p && *p) {
-+        i = strtol(p, &endp, 10);
-+        if (p == endp) {
-+            return notfound;
-+        }
-+        return i;
-+    }
-+
-+    return notfound;
-+}
-+
-+const char *ssh_config_get_str_tok(char **str, const char *def)
-+{
-+    char *p;
-+
-+    p = ssh_config_get_token(str);
-+    if (p && *p) {
-+        return p;
-+    }
-+
-+    return def;
-+}
-+
-+int ssh_config_get_yesno(char **str, int notfound)
-+{
-+    const char *p;
-+
-+    p = ssh_config_get_str_tok(str, NULL);
-+    if (p == NULL) {
-+        return notfound;
-+    }
-+
-+    if (strncasecmp(p, "yes", 3) == 0) {
-+        return 1;
-+    } else if (strncasecmp(p, "no", 2) == 0) {
-+        return 0;
-+    }
-+
-+    return notfound;
-+}
-+
-+int ssh_config_parse_uri(const char *tok,
-+        char **username,
-+        char **hostname,
-+        char **port)
-+{
-+    char *endp = NULL;
-+    long port_n;
-+
-+    /* Sanitize inputs */
-+    if (username != NULL) {
-+        *username = NULL;
-+    }
-+    if (hostname != NULL) {
-+        *hostname = NULL;
-+    }
-+    if (port != NULL) {
-+        *port = NULL;
-+    }
-+
-+    /* Username part (optional) */
-+    endp = strchr(tok, '@');
-+    if (endp != NULL) {
-+        /* Zero-length username is not valid */
-+        if (tok == endp) {
-+            goto error;
-+        }
-+        if (username != NULL) {
-+            *username = strndup(tok, endp - tok);
-+            if (*username == NULL) {
-+                goto error;
-+            }
-+        }
-+        tok = endp + 1;
-+        /* If there is second @ character, this does not look like our URI */
-+        endp = strchr(tok, '@');
-+        if (endp != NULL) {
-+            goto error;
-+        }
-+    }
-+
-+    /* Hostname */
-+    if (*tok == '[') {
-+        /* IPv6 address is enclosed with square brackets */
-+        tok++;
-+        endp = strchr(tok, ']');
-+        if (endp == NULL) {
-+            goto error;
-+        }
-+    } else {
-+        /* Hostnames or aliases expand to the last colon or to the end */
-+        endp = strrchr(tok, ':');
-+        if (endp == NULL) {
-+            endp = strchr(tok, '\0');
-+        }
-+    }
-+    if (tok == endp) {
-+        /* Zero-length hostnames are not valid */
-+        goto error;
-+    }
-+    if (hostname != NULL) {
-+        *hostname = strndup(tok, endp - tok);
-+        if (*hostname == NULL) {
-+            goto error;
-+        }
-+    }
-+    /* Skip also the closing bracket */
-+    if (*endp == ']') {
-+        endp++;
-+    }
-+
-+    /* Port (optional) */
-+    if (*endp != '\0') {
-+        char *port_end = NULL;
-+
-+        /* Verify the port is valid positive number */
-+        port_n = strtol(endp + 1, &port_end, 10);
-+        if (port_n < 1 || *port_end != '\0') {
-+            SSH_LOG(SSH_LOG_WARN, "Failed to parse port number."
-+                    " The value '%ld' is invalid or there are some"
-+                    " trailing characters: '%s'", port_n, port_end);
-+            goto error;
-+        }
-+        if (port != NULL) {
-+            *port = strdup(endp + 1);
-+            if (*port == NULL) {
-+                goto error;
-+            }
-+        }
-+    }
-+
-+    return SSH_OK;
-+
-+error:
-+    if (username != NULL) {
-+        SAFE_FREE(*username);
-+    }
-+    if (hostname != NULL) {
-+        SAFE_FREE(*hostname);
-+    }
-+    if (port != NULL) {
-+        SAFE_FREE(*port);
-+    }
-+    return SSH_ERROR;
-+}
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
deleted file mode 100644
index e02cae182a..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a66b4a6eae6614d200a3625862d77565b96a7cd3 Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertpocs0@gmail.com>
-Date: Wed, 1 Nov 2023 11:24:43 +0100
-Subject: [PATCH] CVE-2023-6004: config_parser: Allow multiple '@' in usernames
-
-Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/a66b4a6eae6614d200a3625862d77565b96a7cd3]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-
----
- src/config_parser.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/config_parser.c b/src/config_parser.c
-index 0d988fec0..cf83e2c5e 100644
---- a/src/config_parser.c
-+++ b/src/config_parser.c
-@@ -180,7 +180,7 @@ int ssh_config_parse_uri(const char *tok,
-     }
- 
-     /* Username part (optional) */
--    endp = strchr(tok, '@');
-+    endp = strrchr(tok, '@');
-     if (endp != NULL) {
-         /* Zero-length username is not valid */
-         if (tok == endp) {
diff --git a/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
deleted file mode 100644
index a77783453a..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 8615c24647f773a5e04203c7459512715d698be1 Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertpocs0@gmail.com>
-Date: Tue, 31 Oct 2023 09:48:52 +0100
-Subject: [PATCH] CVE-2023-6004: options: Simplify the hostname parsing in
- ssh_options_set
-
-Using ssh_config_parse_uri can simplify the parsing of the host
-parsing inside the function of ssh_options_set
-
-Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/8615c24647f773a5e04203c7459512715d698be1]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Refreshed hunk 2 from option.c
-
----
- src/options.c | 40 ++++++++++++++++------------------------
- 1 file changed, 16 insertions(+), 24 deletions(-)
-
-diff --git a/src/options.c b/src/options.c
-index 6f2c9397e..385114555 100644
---- a/src/options.c
-+++ b/src/options.c
-@@ -36,6 +36,7 @@
- #include "libssh/session.h"
- #include "libssh/misc.h"
- #include "libssh/options.h"
-+#include "libssh/config_parser.h"
- #ifdef WITH_SERVER
- #include "libssh/server.h"
- #include "libssh/bind.h"
-@@ -415,33 +416,24 @@ int ssh_options_set(ssh_session session, enum ssh_options_e type,
-                 ssh_set_error_invalid(session);
-                 return -1;
-             } else {
--                q = strdup(value);
--                if (q == NULL) {
--                    ssh_set_error_oom(session);
-+                char *username = NULL, *hostname = NULL, *port = NULL;
-+                rc = ssh_config_parse_uri(value, &username, &hostname, &port);
-+                if (rc != SSH_OK) {
-                     return -1;
-                 }
--                p = strchr(q, '@');
--
--                SAFE_FREE(session->opts.host);
--
--                if (p) {
--                    *p = '\0';
--                    session->opts.host = strdup(p + 1);
--                    if (session->opts.host == NULL) {
--                        SAFE_FREE(q);
--                        ssh_set_error_oom(session);
--                        return -1;
--                    }
--
-+                if (port != NULL) {
-+                    SAFE_FREE(username);
-+                    SAFE_FREE(hostname);
-+                    SAFE_FREE(port);
-+                    return -1;
-+                }
-+                if (username != NULL) {
-                     SAFE_FREE(session->opts.username);
--                    session->opts.username = strdup(q);
--                    SAFE_FREE(q);
--                    if (session->opts.username == NULL) {
--                        ssh_set_error_oom(session);
--                        return -1;
--                    }
--                } else {
--                    session->opts.host = q;
-+                   session->opts.username = username;
-+                }
-+                if (hostname != NULL) {
-+                    SAFE_FREE(session->opts.host);
-+                    session->opts.host = hostname;
-                 }
-             }
-             break;
diff --git a/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
deleted file mode 100644
index a4e790ed0c..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From c6180409677c765e6b9ae2b18a3a7a9671ac1dbe Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertpocs0@gmail.com>
-Date: Tue, 10 Oct 2023 12:44:16 +0200
-Subject: [PATCH] CVE-2023-6004: misc: Add function to check allowed characters
- of a hostname
-
-The hostname can be a domain name or an ip address. The colon has to be
-allowed because of IPv6 even it is prohibited in domain names.
-
-Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/c6180409677c765e6b9ae2b18a3a7a9671ac1dbe]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Refreshed hunk 1 from misc.h and hunk 2 from misc.c
----
- include/libssh/misc.h |  3 ++
- src/misc.c            | 68 +++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 71 insertions(+)
-
-diff --git a/include/libssh/misc.h b/include/libssh/misc.h
-index 924da5336..0924ba7fb 100644
---- a/include/libssh/misc.h
-+++ b/include/libssh/misc.h
-@@ -89,4 +89,6 @@ int ssh_match_group(const char *group, const char *object);
- 
- int ssh_quote_file_name(const char *file_name, char *buf, size_t buf_len);
- 
-+int ssh_check_hostname_syntax(const char *hostname);
-+
- #endif /* MISC_H_ */
-
-diff --git a/src/misc.c b/src/misc.c
-index 7c478a773..be6ee836e 100644
---- a/src/misc.c
-+++ b/src/misc.c
-@@ -94,6 +94,8 @@
- #define ZLIB_STRING ""
- #endif
- 
-+#define ARPA_DOMAIN_MAX_LEN 63
-+
- /**
-  * @defgroup libssh_misc The SSH helper functions.
-  * @ingroup libssh
-@@ -1292,4 +1294,69 @@ error:
-     return SSH_ERROR;
- }
- 
-+/**
-+ * @brief Checks syntax of a domain name
-+ *
-+ * The check is made based on the RFC1035 section 2.3.1
-+ * Allowed characters are: hyphen, period, digits (0-9) and letters (a-zA-Z)
-+ *
-+ * The label should be no longer than 63 characters
-+ * The label should start with a letter and end with a letter or number
-+ * The label in this implementation can start with a number to allow virtual
-+ * URLs to pass. Note that this will make IPv4 addresses to pass
-+ * this check too.
-+ *
-+ * @param hostname The domain name to be checked, has to be null terminated
-+ *
-+ * @return SSH_OK if the hostname passes syntax check
-+ *         SSH_ERROR otherwise or if hostname is NULL or empty string
-+ */
-+int ssh_check_hostname_syntax(const char *hostname)
-+{
-+    char *it = NULL, *s = NULL, *buf = NULL;
-+    size_t it_len;
-+    char c;
-+
-+    if (hostname == NULL || strlen(hostname) == 0) {
-+        return SSH_ERROR;
-+    }
-+
-+    /* strtok_r writes into the string, keep the input clean */
-+    s = strdup(hostname);
-+    if (s == NULL) {
-+        return SSH_ERROR;
-+    }
-+
-+    it = strtok_r(s, ".", &buf);
-+    /* if the token has 0 length */
-+    if (it == NULL) {
-+        free(s);
-+        return SSH_ERROR;
-+    }
-+    do {
-+        it_len = strlen(it);
-+        if (it_len > ARPA_DOMAIN_MAX_LEN ||
-+            /* the first char must be a letter, but some virtual urls start
-+             * with a number */
-+            isalnum(it[0]) == 0 ||
-+            isalnum(it[it_len - 1]) == 0) {
-+            free(s);
-+            return SSH_ERROR;
-+        }
-+        while (*it != '\0') {
-+            c = *it;
-+            /* the "." is allowed too, but tokenization removes it from the
-+             * string */
-+            if (isalnum(c) == 0 && c != '-') {
-+                free(s);
-+                return SSH_ERROR;
-+            }
-+            it++;
-+        }
-+    } while ((it = strtok_r(NULL, ".", &buf)) != NULL);
-+
-+    free(s);
-+
-+    return SSH_OK;
-+}
- /** @} */
diff --git a/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
deleted file mode 100644
index 39e6d94788..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 22492b69bba22b102342afc574800d354a08e405 Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertpocs0@gmail.com>
-Date: Tue, 10 Oct 2023 18:33:56 +0200
-Subject: [PATCH] CVE-2023-6004: config_parser: Check for valid syntax of a
- hostname if it is a domain name
-
-This prevents code injection.
-The domain name syntax checker is based on RFC1035.
-
-Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/22492b69bba22b102342afc574800d354a08e405]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Refreshed hunk 2 and 3 from config_parser.c
-
----
- src/config_parser.c | 12 +++++++++++-
- 1 file changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/src/config_parser.c b/src/config_parser.c
-index cf83e2c5e..b8b94611a 100644
---- a/src/config_parser.c
-+++ b/src/config_parser.c
-@@ -30,6 +30,7 @@
- 
- #include "libssh/config_parser.h"
- #include "libssh/priv.h"
-+#include "libssh/misc.h"
- 
- char *ssh_config_get_cmd(char **str)
- {
-@@ -139,6 +140,7 @@ int ssh_config_parse_uri(const char *tok,
- {
-     char *endp = NULL;
-     long port_n;
-+    int rc;
- 
-     /* Sanitize inputs */
-     if (username != NULL) {
-@@ -196,6 +198,14 @@ int ssh_config_parse_uri(const char *tok,
-         if (*hostname == NULL) {
-             goto error;
-         }
-+        /* if not an ip, check syntax */
-+        rc = ssh_is_ipaddr(*hostname);
-+        if (rc == 0) {
-+            rc = ssh_check_hostname_syntax(*hostname);
-+            if (rc != SSH_OK) {
-+                goto error;
-+            }
-+        }
-     }
-     /* Skip also the closing bracket */
-     if (*endp == ']') {
diff --git a/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
deleted file mode 100644
index c86aba4d88..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From cea841d71c025f9c998b7d5fc9f2a2839df62921 Mon Sep 17 00:00:00 2001
-From: Norbert Pocs <norbertpocs0@gmail.com>
-Date: Tue, 28 Nov 2023 15:26:45 +0100
-Subject: [PATCH] CVE-2023-6004 misc: Add ipv6 link-local check for an ip
- address
-
-Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/cea841d71c025f9c998b7d5fc9f2a2839df62921]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Refreshed hunk 1 from CMakeLists.txt, hunk 1 from connect.c and
-hunks 2,3,4 from misc.c
----
- src/CMakeLists.txt |  1 +
- src/connect.c      |  2 +-
- src/misc.c         | 44 ++++++++++++++++++++++++++++++++++++++------
- 3 files changed, 40 insertions(+), 7 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index d6245c0db..807313b59 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -14,6 +14,7 @@ set(LIBSSH_LINK_LIBRARIES
- if (WIN32)
-   set(LIBSSH_LINK_LIBRARIES
-     ${LIBSSH_LINK_LIBRARIES}
-+    iphlpapi
-     ws2_32
-   )
- endif (WIN32)
-diff --git a/src/connect.c b/src/connect.c
-index 57e37e634..15cae6444 100644
---- a/src/connect.c
-+++ b/src/connect.c
-@@ -130,7 +130,7 @@ static int getai(const char *host, int port, struct addrinfo **ai) {
- #endif
-   }
- 
--  if (ssh_is_ipaddr(host)) {
-+  if (ssh_is_ipaddr(host) == 1) {
-     /* this is an IP address */
-     SSH_LOG(SSH_LOG_PACKET,"host %s matches an IP address",host);
-     hints.ai_flags |= AI_NUMERICHOST;
-diff --git a/src/misc.c b/src/misc.c
-index be6ee836e..7081f12ae 100644
---- a/src/misc.c
-+++ b/src/misc.c
-@@ -32,6 +32,7 @@
- #include <sys/socket.h>
- #include <netinet/in.h>
- #include <arpa/inet.h>
-+#include <net/if.h>
- 
- #endif /* _WIN32 */
- 
-@@ -59,6 +60,7 @@
- #include <ws2tcpip.h>
- #include <shlobj.h>
- #include <direct.h>
-+#include <netioapi.h>
- 
- #ifdef HAVE_IO_H
- #include <io.h>
-@@ -191,22 +191,37 @@ int ssh_is_ipaddr_v4(const char *str) {
- 
- int ssh_is_ipaddr(const char *str) {
-     int rc = SOCKET_ERROR;
-+    char *s = strdup(str);
- 
--    if (strchr(str, ':')) {
-+    if (s == NULL) {
-+        return -1;
-+    }
-+    if (strchr(s, ':')) {
-         struct sockaddr_storage ss;
-         int sslen = sizeof(ss);
-+        char *network_interface = strchr(s, '%');
- 
--        /* TODO link-local (IP:v6:addr%ifname). */
--        rc = WSAStringToAddressA((LPSTR) str,
-+        /* link-local (IP:v6:addr%ifname). */
-+        if (network_interface != NULL) {
-+            rc = if_nametoindex(network_interface + 1);
-+            if (rc == 0) {
-+                free(s);
-+                return 0;
-+            }
-+            *network_interface = '\0';
-+        }
-+        rc = WSAStringToAddressA((LPSTR) s,
-                                  AF_INET6,
-                                  NULL,
-                                  (struct sockaddr*)&ss,
-                                  &sslen);
-         if (rc == 0) {
-+            free(s);
-             return 1;
-         }
-     }
- 
-+    free(s);
-     return ssh_is_ipaddr_v4(str);
- }
- #else /* _WIN32 */
-@@ -285,17 +300,32 @@ int ssh_is_ipaddr_v4(const char *str) {
- 
- int ssh_is_ipaddr(const char *str) {
-     int rc = -1;
-+    char *s = strdup(str);
- 
--    if (strchr(str, ':')) {
-+    if (s == NULL) {
-+        return -1;
-+    }
-+    if (strchr(s, ':')) {
-         struct in6_addr dest6;
-+        char *network_interface = strchr(s, '%');
- 
--        /* TODO link-local (IP:v6:addr%ifname). */
--        rc = inet_pton(AF_INET6, str, &dest6);
-+        /* link-local (IP:v6:addr%ifname). */
-+        if (network_interface != NULL) {
-+            rc = if_nametoindex(network_interface + 1);
-+            if (rc == 0) {
-+                free(s);
-+                return 0;
-+            }
-+            *network_interface = '\0';
-+        }
-+        rc = inet_pton(AF_INET6, s, &dest6);
-         if (rc > 0) {
-+	    free(s);
-             return 1;
-         }
-     }
- 
-+    free(s);
-     return ssh_is_ipaddr_v4(str);
- }
diff --git a/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
deleted file mode 100644
index f3cb2b998e..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 1a02364b5107a4125ea3cb76fcdb6beabaebf3be Mon Sep 17 00:00:00 2001
-From: Jakub Jelen <jjelen@redhat.com>
-Date: Fri, 22 Dec 2023 10:32:40 +0100
-Subject: [PATCH] Fix regression in IPv6 addresses in hostname parsing
-
-Signed-off-by: Jakub Jelen <jjelen@redhat.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-(cherry picked from commit 4f997aee7c7d7ea346b3e8ba505da0b7601ff318)
-
-CVE: CVE-2023-6004
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/1a02364b5107a4125ea3cb76fcdb6beabaebf3be]
-Signed-off-by: nikhil r <nikhil.r@kpit.com>
-Comment: Removed 1 hunk from config_parser.c as the function was intoduced in
-later version
-
----
- include/libssh/config_parser.h | 11 ++++++++---
- src/config.c                   |  4 ++--
- src/config_parser.c            | 16 +++++++++++-----
- src/options.c                  | 10 ++--------
- 4 files changed, 23 insertions(+), 18 deletions(-)
-
-diff --git a/include/libssh/config_parser.h b/include/libssh/config_parser.h
-index a7dd42a2c..ca353432b 100644
---- a/include/libssh/config_parser.h
-+++ b/include/libssh/config_parser.h
-@@ -26,6 +26,8 @@
- #ifndef CONFIG_PARSER_H_
- #define CONFIG_PARSER_H_
- 
-+#include <stdbool.h>
-+
- char *ssh_config_get_cmd(char **str);
- 
- char *ssh_config_get_token(char **str);
-@@ -45,13 +47,16 @@ int ssh_config_get_yesno(char **str, int notfound);
-  *                       be stored or NULL if we do not care about the result.
-  * @param[out]  port     Pointer to the location, where the new port will
-  *                       be stored or NULL if we do not care about the result.
-+ * @param[in]   ignore_port Set to true if the we should not attempt to parse
-+ *                       port number.
-  *
-  * @returns     SSH_OK if the provided string is in format of SSH URI,
-  *              SSH_ERROR on failure
-  */
- int ssh_config_parse_uri(const char *tok,
--        char **username,
--        char **hostname,
--        char **port);
-+                         char **username,
-+                         char **hostname,
-+                         char **port,
-+                         bool ignore_port);
- 
- #endif /* LIBSSH_CONFIG_H_ */
-diff --git a/src/config_parser.c b/src/config_parser.c
-index b8b94611a..d4b2d2c3b 100644
---- a/src/config_parser.c
-+++ b/src/config_parser.c
-@@ -162,9 +162,10 @@ int ssh_config_get_yesno(char **str, int notfound)
- }
- 
- int ssh_config_parse_uri(const char *tok,
--        char **username,
--        char **hostname,
--        char **port)
-+                         char **username,
-+                         char **hostname,
-+                         char **port,
-+                         bool ignore_port)
- {
-     char *endp = NULL;
-     long port_n;
-@@ -210,12 +211,17 @@ int ssh_config_parse_uri(const char *tok,
-         if (endp == NULL) {
-             goto error;
-         }
--    } else {
--        /* Hostnames or aliases expand to the last colon or to the end */
-+    } else if (!ignore_port) {
-+        /* Hostnames or aliases expand to the last colon (if port is requested)
-+         * or to the end */
-         endp = strrchr(tok, ':');
-         if (endp == NULL) {
-             endp = strchr(tok, '\0');
-         }
-+    } else {
-+        /* If no port is requested, expand to the end of line
-+         * (to accommodate the IPv6 addresses) */
-+        endp = strchr(tok, '\0');
-     }
-     if (tok == endp) {
-         /* Zero-length hostnames are not valid */
-diff --git a/src/options.c b/src/options.c
-index 385114555..b3ecffe15 100644
---- a/src/options.c
-+++ b/src/options.c
-@@ -416,17 +416,11 @@ int ssh_options_set(ssh_session session, enum ssh_options_e type,
-                 ssh_set_error_invalid(session);
-                 return -1;
-             } else {
--                char *username = NULL, *hostname = NULL, *port = NULL;
--                rc = ssh_config_parse_uri(value, &username, &hostname, &port);
-+                char *username = NULL, *hostname = NULL;
-+                rc = ssh_config_parse_uri(value, &username, &hostname, NULL, true);
-                 if (rc != SSH_OK) {
-                     return -1;
-                 }
--                if (port != NULL) {
--                    SAFE_FREE(username);
--                    SAFE_FREE(hostname);
--                    SAFE_FREE(port);
--                    return -1;
--                }
-                 if (username != NULL) {
-                     SAFE_FREE(session->opts.username);
-                    session->opts.username = username;
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
deleted file mode 100644
index 63b78688dd..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Wed, 3 Jun 2020 10:04:09 +0200
-Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
-
-Add a missing NULL check for the pointer returned by ssh_buffer_new() in
-sftpserver.c.
-
-Thanks to Ramin Farajpour Cami for spotting this.
-
-Fixes T232
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
-Reviewed-by: Jakub Jelen <jjelen@redhat.com>
-(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
-
-Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/patch/?id=0a9268a60f2d3748ca69bde5651f20e72761058c]
-CVE: CVE-2020-16135
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/sftpserver.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/sftpserver.c b/src/sftpserver.c
-index 1717aa417..1af8a0e76 100644
---- a/src/sftpserver.c
-+++ b/src/sftpserver.c
-@@ -64,6 +64,12 @@ sftp_client_message sftp_get_client_message(sftp_session sftp) {
- 
-   /* take a copy of the whole packet */
-   msg->complete_message = ssh_buffer_new();
-+  if (msg->complete_message == NULL) {
-+      ssh_set_error_oom(session);
-+      sftp_client_message_free(msg);
-+      return NULL;
-+  }
-+
-   ssh_buffer_add_data(msg->complete_message,
-                       ssh_buffer_get(payload),
-                       ssh_buffer_get_len(payload));
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
deleted file mode 100644
index 413e5b3d11..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-1.patch
+++ /dev/null
@@ -1,385 +0,0 @@
-From 4cef5e965a46e9271aed62631b152e4bd23c1e3c Mon Sep 17 00:00:00 2001
-From: Aris Adamantiadis <aris@0xbadc0de.be>
-Date: Tue, 12 Dec 2023 23:09:57 +0100
-Subject: [PATCH] CVE-2023-48795: client side mitigation
-
-Signed-off-by: Aris Adamantiadis <aris@0xbadc0de.be>
-Signed-off-by: Jakub Jelen <jjelen@redhat.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/4cef5e965a46e9271aed62631b152e4bd23c1e3c]
-CVE: CVE-2023-48795
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- include/libssh/packet.h  |  1 +
- include/libssh/session.h |  6 +++++
- src/curve25519.c         | 18 +++----------
- src/dh.c                 |  6 +----
- src/ecdh.c               |  7 +----
- src/ecdh_crypto.c        | 10 ++-----
- src/ecdh_gcrypt.c        | 10 +++----
- src/ecdh_mbedcrypto.c    | 11 +++-----
- src/kex.c                | 34 ++++++++++++++++++++----
- src/packet.c             | 56 +++++++++++++++++++++++++++++++++++++++-
- src/packet_cb.c          | 12 +++++++++
- 11 files changed, 118 insertions(+), 53 deletions(-)
-
-diff --git a/include/libssh/packet.h b/include/libssh/packet.h
-index fbe09700..8800e16b 100644
---- a/include/libssh/packet.h
-+++ b/include/libssh/packet.h
-@@ -63,6 +63,7 @@ SSH_PACKET_CALLBACK(ssh_packet_ext_info);
- SSH_PACKET_CALLBACK(ssh_packet_kexdh_init);
- #endif
- 
-+int ssh_packet_send_newkeys(ssh_session session);
- int ssh_packet_send_unimplemented(ssh_session session, uint32_t seqnum);
- int ssh_packet_parse_type(ssh_session session);
- //int packet_flush(ssh_session session, int enforce_blocking);
-diff --git a/include/libssh/session.h b/include/libssh/session.h
-index 23633cc2..b8810f54 100644
---- a/include/libssh/session.h
-+++ b/include/libssh/session.h
-@@ -69,6 +69,12 @@ enum ssh_pending_call_e {
- /* Client successfully authenticated */
- #define SSH_SESSION_FLAG_AUTHENTICATED 2
- 
-+/* The current SSH2 session implements the "strict KEX" feature and should behave
-+ * differently on SSH2_MSG_NEWKEYS. */
-+#define SSH_SESSION_FLAG_KEX_STRICT 0x0010
-+/* Unexpected packets have been sent while the session was still unencrypted */
-+#define SSH_SESSION_FLAG_KEX_TAINTED 0x0020
-+
- /* codes to use with ssh_handle_packets*() */
- /* Infinite timeout */
- #define SSH_TIMEOUT_INFINITE -1
-diff --git a/src/curve25519.c b/src/curve25519.c
-index 167209f4..6eda5feb 100644
---- a/src/curve25519.c
-+++ b/src/curve25519.c
-@@ -166,12 +166,7 @@ int ssh_client_curve25519_reply(ssh_session session, ssh_buffer packet){
-   }
- 
-   /* Send the MSG_NEWKEYS */
--  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
--    goto error;
--  }
--
--  rc=ssh_packet_send(session);
--  SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
-+  rc = ssh_packet_send_newkeys(session);
-   return rc;
- error:
-   return SSH_ERROR;
-@@ -297,15 +292,10 @@ int ssh_server_curve25519_init(ssh_session session, ssh_buffer packet){
-         return SSH_ERROR;
-     }
- 
--    /* Send the MSG_NEWKEYS */
--    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
--    if (rc < 0) {
--        goto error;
--    }
--
-     session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
--    rc = ssh_packet_send(session);
--    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
-+
-+    /* Send the MSG_NEWKEYS */
-+    rc = ssh_packet_send_newkeys(session);
- 
-     return rc;
- error:
-diff --git a/src/dh.c b/src/dh.c
-index cc12fd46..33883f2d 100644
---- a/src/dh.c
-+++ b/src/dh.c
-@@ -735,11 +735,7 @@ int ssh_client_dh_reply(ssh_session session, ssh_buffer packet){
-   }
- 
-   /* Send the MSG_NEWKEYS */
--  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
--    goto error;
--  }
--
--  rc=ssh_packet_send(session);
-+  rc = ssh_packet_send_newkeys(session);
-   SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
-   return rc;
- error:
-diff --git a/src/ecdh.c b/src/ecdh.c
-index f7fcaf13..1fef7ec9 100644
---- a/src/ecdh.c
-+++ b/src/ecdh.c
-@@ -72,12 +72,7 @@ int ssh_client_ecdh_reply(ssh_session session, ssh_buffer packet){
-   }
- 
-   /* Send the MSG_NEWKEYS */
--  if (ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS) < 0) {
--    goto error;
--  }
--
--  rc=ssh_packet_send(session);
--  SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
-+  rc = ssh_packet_send_newkeys(session);
-   return rc;
- error:
-   return SSH_ERROR;
-diff --git a/src/ecdh_crypto.c b/src/ecdh_crypto.c
-index 24f21c03..7e5f0cc7 100644
---- a/src/ecdh_crypto.c
-+++ b/src/ecdh_crypto.c
-@@ -318,15 +318,9 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet){
-         return SSH_ERROR;
-     }
- 
--    /* Send the MSG_NEWKEYS */
--    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
--    if (rc < 0) {
--        return SSH_ERROR;;
--    }
--
-     session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
--    rc = ssh_packet_send(session);
--    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
-+    /* Send the MSG_NEWKEYS */
-+    rc = ssh_packet_send_newkeys(session);
- 
-     return rc;
- }
-diff --git a/src/ecdh_gcrypt.c b/src/ecdh_gcrypt.c
-index e43cacea..c1db7f5d 100644
---- a/src/ecdh_gcrypt.c
-+++ b/src/ecdh_gcrypt.c
-@@ -362,17 +362,13 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet) {
-         goto out;
-     }
- 
--
-+    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
-     /* Send the MSG_NEWKEYS */
--    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
--    if (rc != SSH_OK) {
-+    rc = ssh_packet_send_newkeys(session);
-+    if (rc == SSH_ERROR) {
-         goto out;
-     }
- 
--    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
--    rc = ssh_packet_send(session);
--    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
--
-  out:
-     gcry_sexp_release(param);
-     gcry_sexp_release(key);
-diff --git a/src/ecdh_mbedcrypto.c b/src/ecdh_mbedcrypto.c
-index fa350028..24924508 100644
---- a/src/ecdh_mbedcrypto.c
-+++ b/src/ecdh_mbedcrypto.c
-@@ -293,16 +293,13 @@ int ssh_server_ecdh_init(ssh_session session, ssh_buffer packet)
-         goto out;
-     }
- 
--    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
--    if (rc < 0) {
--        rc = SSH_ERROR;
-+        session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
-+	/* Send the MSG_NEWKEYS */
-+	rc = ssh_packet_send_newkeys(session);
-+	if (rc == SSH_ERROR) {
-         goto out;
-     }
- 
--    session->dh_handshake_state = DH_STATE_NEWKEYS_SENT;
--    rc = ssh_packet_send(session);
--    SSH_LOG(SSH_LOG_PROTOCOL, "SSH_MSG_NEWKEYS sent");
--
- out:
-     mbedtls_ecp_group_free(&grp);
-     return rc;
-diff --git a/src/kex.c b/src/kex.c
-index 82686e4b..7f1bb324 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -105,6 +105,9 @@
- 
- /* RFC 8308 */
- #define KEX_EXTENSION_CLIENT "ext-info-c"
-+/* Strict kex mitigation against CVE-2023-48795 */
-+#define KEX_STRICT_CLIENT "kex-strict-c-v00@openssh.com"
-+#define KEX_STRICT_SERVER "kex-strict-s-v00@openssh.com"
- 
- /* NOTE: This is a fixed API and the index is defined by ssh_kex_types_e */
- static const char *default_methods[] = {
-@@ -521,6 +524,27 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit){
-             goto error;
-         }
- 
-+	/*
-+	 * handle the "strict KEX" feature. If supported by peer, then set up the
-+	 * flag and verify packet sequence numbers.
-+	 */
-+	if (server_kex) {
-+	    ok = ssh_match_group(session->next_crypto->client_kex.methods[SSH_KEX],
-+			         KEX_STRICT_CLIENT);
-+	    if (ok) {
-+		SSH_LOG(SSH_LOG_DEBUG, "Client supports strict kex, enabling.");
-+		session->flags |= SSH_SESSION_FLAG_KEX_STRICT;
-+	    }
-+	} else {
-+	    /* client kex */
-+	    ok = ssh_match_group(session->next_crypto->server_kex.methods[SSH_KEX],
-+			         KEX_STRICT_SERVER);
-+	    if (ok) {
-+		SSH_LOG(SSH_LOG_DEBUG, "Server supports strict kex, enabling.");
-+		session->flags |= SSH_SESSION_FLAG_KEX_STRICT;
-+	    }
-+	}
-+
-         /*
-          * If client sent a ext-info-c message in the kex list, it supports
-          * RFC 8308 extension negotiation.
-@@ -778,21 +802,21 @@ int ssh_set_client_kex(ssh_session session)
-         return SSH_OK;
-     }
- 
--    /* Here we append  ext-info-c  to the list of kex algorithms */
-+    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com to the list of kex algorithms */
-     kex = client->methods[SSH_KEX];
-     len = strlen(kex);
--    if (len + strlen(KEX_EXTENSION_CLIENT) + 2 < len) {
-+    /* Comma, comma, nul byte */
-+    kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 + strlen(KEX_STRICT_CLIENT ) + 1;
-+    if (kex_len >= MAX_PACKET_LEN) {
-         /* Overflow */
-         return SSH_ERROR;
-     }
--    kex_len = len + strlen(KEX_EXTENSION_CLIENT) + 2; /* comma, NULL */
-     kex_tmp = realloc(kex, kex_len);
-     if (kex_tmp == NULL) {
--        free(kex);
-         ssh_set_error_oom(session);
-         return SSH_ERROR;
-     }
--    snprintf(kex_tmp + len, kex_len - len, ",%s", KEX_EXTENSION_CLIENT);
-+    snprintf(kex_tmp + len, kex_len - len, ",%s,%s", KEX_EXTENSION_CLIENT, KEX_STRICT_CLIENT);
-     client->methods[SSH_KEX] = kex_tmp;
- 
-     return SSH_OK;
-diff --git a/src/packet.c b/src/packet.c
-index 61a44237..8025a7ff 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -1126,6 +1126,19 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
-             }
- #endif /* WITH_ZLIB */
-             payloadsize = ssh_buffer_get_len(session->in_buffer);
-+	    if (session->recv_seq == UINT32_MAX) {
-+		/* Overflowing sequence numbers is always fishy */
-+		if (session->current_crypto == NULL) {
-+		    /* don't allow sequence number overflow when unencrypted */
-+		    ssh_set_error(session,
-+				  SSH_FATAL,
-+				  "Incoming sequence number overflow");
-+		    goto error;
-+		} else {
-+		    SSH_LOG(SSH_LOG_WARNING,
-+			    "Incoming sequence number overflow");
-+		}
-+	    }
-             session->recv_seq++;
-             if (session->raw_counter != NULL) {
-                 session->raw_counter->in_bytes += payloadsize;
-@@ -1141,7 +1154,19 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
-             SSH_LOG(SSH_LOG_PACKET,
-                     "packet: read type %hhd [len=%d,padding=%hhd,comp=%d,payload=%d]",
-                     session->in_packet.type, packet_len, padding, compsize, payloadsize);
--
-+	    if (session->current_crypto == NULL) {
-+		/* In strict kex, only a few packets are allowed. Taint the session
-+		 * if we received packets that are normally allowed but to be
-+		 * refused if we are in strict kex when KEX is over.
-+		 */
-+		uint8_t type = session->in_packet.type;
-+
-+		if (type != SSH2_MSG_KEXINIT && type != SSH2_MSG_NEWKEYS &&
-+		    (type < SSH2_MSG_KEXDH_INIT ||
-+		     type > SSH2_MSG_KEX_DH_GEX_REQUEST)) {
-+		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
-+		}
-+	    }
-             /* Check if the packet is expected */
-             filter_result = ssh_packet_incoming_filter(session);
- 
-@@ -1153,6 +1178,9 @@ int ssh_packet_socket_callback(const void *data, size_t receivedlen, void *user)
-             case SSH_PACKET_DENIED:
-                 goto error;
-             case SSH_PACKET_UNKNOWN:
-+		if (session->current_crypto == NULL) {
-+		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
-+		}
-                 ssh_packet_send_unimplemented(session, session->recv_seq - 1);
-                 break;
-             }
-@@ -1276,9 +1304,35 @@ void ssh_packet_process(ssh_session session, uint8_t type){
- 	if(r==SSH_PACKET_NOT_USED){
- 		SSH_LOG(SSH_LOG_RARE,"Couldn't do anything with packet type %d",type);
- 		ssh_packet_send_unimplemented(session, session->recv_seq-1);
-+		if (session->current_crypto == NULL) {
-+		    session->flags |= SSH_SESSION_FLAG_KEX_TAINTED;
-+		}
- 	}
- }
- 
-+/** @internal
-+ * @brief sends a SSH_MSG_NEWKEYS when enabling the new negotiated ciphers
-+ * @param session the SSH session
-+ * @return SSH_ERROR on error, else SSH_OK
-+ */
-+int ssh_packet_send_newkeys(ssh_session session)
-+{
-+    int rc;
-+
-+    /* Send the MSG_NEWKEYS */
-+    rc = ssh_buffer_add_u8(session->out_buffer, SSH2_MSG_NEWKEYS);
-+    if (rc < 0) {
-+	return rc;
-+    }
-+
-+    rc = ssh_packet_send(session);
-+    if (rc == SSH_ERROR) {
-+	return rc;
-+    }
-+    SSH_LOG(SSH_LOG_DEBUG, "SSH_MSG_NEWKEYS sent");
-+    return rc;
-+}
-+
- /** @internal
-  * @brief sends a SSH_MSG_UNIMPLEMENTED answer to an unhandled packet
-  * @param session the SSH session
-diff --git a/src/packet_cb.c b/src/packet_cb.c
-index 6aa64766..de03fb07 100644
---- a/src/packet_cb.c
-+++ b/src/packet_cb.c
-@@ -154,6 +154,18 @@ SSH_PACKET_CALLBACK(ssh_packet_newkeys){
-       goto error;
-   }
- 
-+  if (session->flags & SSH_SESSION_FLAG_KEX_STRICT) {
-+      /* reset packet sequence number when running in strict kex mode */
-+      session->recv_seq = 0;
-+      /* Check that we aren't tainted */
-+      if (session->flags & SSH_SESSION_FLAG_KEX_TAINTED) {
-+	  ssh_set_error(session,
-+			SSH_FATAL,
-+			"Received unexpected packets in strict KEX mode.");
-+	  goto error;
-+      }
-+}
-+
-   if(session->server){
-     /* server things are done in server.c */
-     session->dh_handshake_state=DH_STATE_FINISHED;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
deleted file mode 100644
index fe3300503f..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-2.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From 0870c8db28be9eb457ee3d4f9a168959d9507efd Mon Sep 17 00:00:00 2001
-From: Aris Adamantiadis <aris@0xbadc0de.be>
-Date: Tue, 12 Dec 2023 23:30:26 +0100
-Subject: [PATCH] CVE-2023-48795: Server side mitigations
-
-Signed-off-by: Aris Adamantiadis <aris@0xbadc0de.be>
-Signed-off-by: Jakub Jelen <jjelen@redhat.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/0870c8db28be9eb457ee3d4f9a168959d9507efd]
-CVE: CVE-2023-48795
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- include/libssh/kex.h |  1 +
- src/kex.c            | 46 ++++++++++++++++++++++++++++++++++----------
- src/server.c         |  8 +++++++-
- 3 files changed, 44 insertions(+), 11 deletions(-)
-
-diff --git a/include/libssh/kex.h b/include/libssh/kex.h
-index a626d105..2b1a74d5 100644
---- a/include/libssh/kex.h
-+++ b/include/libssh/kex.h
-@@ -36,6 +36,7 @@ SSH_PACKET_CALLBACK(ssh_packet_kexinit);
- int ssh_send_kex(ssh_session session, int server_kex);
- void ssh_list_kex(struct ssh_kex_struct *kex);
- int ssh_set_client_kex(ssh_session session);
-+int ssh_kex_append_extensions(ssh_session session, struct ssh_kex_struct *pkex);
- int ssh_kex_select_methods(ssh_session session);
- int ssh_verify_existing_algo(enum ssh_kex_types_e algo, const char *name);
- char *ssh_keep_known_algos(enum ssh_kex_types_e algo, const char *list);
-diff --git a/src/kex.c b/src/kex.c
-index 2ed90235..b03e6484 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -766,11 +766,8 @@ int ssh_set_client_kex(ssh_session session)
- {
-     struct ssh_kex_struct *client= &session->next_crypto->client_kex;
-     const char *wanted;
--    char *kex = NULL;
--    char *kex_tmp = NULL;
-     int ok;
-     int i;
--    size_t kex_len, len;
- 
-     ok = ssh_get_random(client->cookie, 16, 0);
-     if (!ok) {
-@@ -802,11 +799,33 @@ int ssh_set_client_kex(ssh_session session)
-         return SSH_OK;
-     }
- 
--    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com to the list of kex algorithms */
--    kex = client->methods[SSH_KEX];
-+    ok = ssh_kex_append_extensions(session, client);
-+    if (ok != SSH_OK){
-+	return ok;
-+    }
-+
-+    return SSH_OK;
-+}
-+
-+int ssh_kex_append_extensions(ssh_session session, struct ssh_kex_struct *pkex)
-+{
-+    char *kex = NULL;
-+    char *kex_tmp = NULL;
-+    size_t kex_len, len;
-+
-+    /* Here we append ext-info-c and kex-strict-c-v00@openssh.com for client
-+     * and kex-strict-s-v00@openssh.com for server to the list of kex algorithms
-+     */
-+    kex = pkex->methods[SSH_KEX];
-     len = strlen(kex);
--    /* Comma, comma, nul byte */
--    kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 + strlen(KEX_STRICT_CLIENT ) + 1;
-+    if (session->server) {
-+	/* Comma, nul byte */
-+	kex_len = len + 1 + strlen(KEX_STRICT_SERVER) + 1;
-+    } else {
-+	/* Comma, comma, nul byte */
-+	kex_len = len + 1 + strlen(KEX_EXTENSION_CLIENT) + 1 +
-+		  strlen(KEX_STRICT_CLIENT) + 1;
-+    }
-     if (kex_len >= MAX_PACKET_LEN) {
-         /* Overflow */
-         return SSH_ERROR;
-@@ -816,9 +835,16 @@ int ssh_set_client_kex(ssh_session session)
-         ssh_set_error_oom(session);
-         return SSH_ERROR;
-     }
--    snprintf(kex_tmp + len, kex_len - len, ",%s,%s", KEX_EXTENSION_CLIENT, KEX_STRICT_CLIENT);
--    client->methods[SSH_KEX] = kex_tmp;
--
-+    if (session->server){
-+	snprintf(kex_tmp + len, kex_len - len, ",%s", KEX_STRICT_SERVER);
-+    } else {
-+	snprintf(kex_tmp + len,
-+		 kex_len - len,
-+		 ",%s,%s",
-+		 KEX_EXTENSION_CLIENT,
-+		 KEX_STRICT_CLIENT);
-+    }
-+    pkex->methods[SSH_KEX] = kex_tmp;
-     return SSH_OK;
- }
- 
-diff --git a/src/server.c b/src/server.c
-index bc98da4f..f3d24a7b 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -158,7 +158,13 @@ static int server_set_kex(ssh_session session) {
-     }
-   }
- 
--  return 0;
-+  /* Do not append the extensions during rekey */
-+  if (session->flags & SSH_SESSION_FLAG_AUTHENTICATED) {
-+      return SSH_OK;
-+  }
-+
-+  rc = ssh_kex_append_extensions(session, server);
-+  return rc;
- }
- 
- int ssh_server_init_kex(ssh_session session) {
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
deleted file mode 100644
index 1635a4c2dc..0000000000
--- a/meta-oe/recipes-support/libssh/libssh/CVE-2023-48795-3.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 5846e57538c750c5ce67df887d09fa99861c79c6 Mon Sep 17 00:00:00 2001
-From: Jakub Jelen <jjelen@redhat.com>
-Date: Thu, 14 Dec 2023 12:22:01 +0100
-Subject: [PATCH] CVE-2023-48795: Strip extensions from both kex lists for
- matching
-
-Signed-off-by: Jakub Jelen <jjelen@redhat.com>
-Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
-
-Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/5846e57538c750c5ce67df887d09fa99861c79c6]
-CVE: CVE-2023-48795
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- src/kex.c | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/src/kex.c b/src/kex.c
-index b03e6484..c100d908 100644
---- a/src/kex.c
-+++ b/src/kex.c
-@@ -857,11 +857,19 @@ int ssh_kex_select_methods (ssh_session session){
-     char *ext_start = NULL;
-     int i;
- 
--    /* Here we should drop the  ext-info-c  from the list so we avoid matching.
-+    /* Here we should drop the extensions from the list so we avoid matching.
-      * it. We added it to the end, so we can just truncate the string here */
--    ext_start = strstr(client->methods[SSH_KEX], ","KEX_EXTENSION_CLIENT);
--    if (ext_start != NULL) {
--        ext_start[0] = '\0';
-+    if (session->client) {
-+	ext_start = strstr(client->methods[SSH_KEX], "," KEX_EXTENSION_CLIENT);
-+	if (ext_start != NULL) {
-+	    ext_start[0] = '\0';
-+	}
-+    }
-+    if (session->server) {
-+	ext_start = strstr(server->methods[SSH_KEX], "," KEX_STRICT_SERVER);
-+	if (ext_start != NULL) {
-+	    ext_start[0] = '\0';
-+	}
-     }
- 
-     for (i = 0; i < KEX_METHODS_SIZE; i++) {
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
deleted file mode 100644
index 98910d3068..0000000000
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
-HOMEPAGE = "http://www.libssh.org"
-SECTION = "libs"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
-
-DEPENDS = "zlib openssl"
-
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.8 \
-           file://CVE-2020-16135.patch \
-           file://CVE-2023-48795-1.patch \
-           file://CVE-2023-48795-2.patch \
-           file://CVE-2023-48795-3.patch \
-           file://0001-config-Move-common-parser-functions-to-config_parser.patch \
-           file://001_CVE-2023-6004.patch \
-           file://002_CVE-2023-6004.patch \
-           file://003_CVE-2023-6004.patch \
-           file://004_CVE-2023-6004.patch \
-           file://005_CVE-2023-6004.patch \
-           file://006_CVE-2023-6004.patch \
-          "
-SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-PACKAGECONFIG ??= "gcrypt"
-PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
-PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-
-EXTRA_OECMAKE = " \
-    -DWITH_PCAP=1 \
-    -DWITH_SFTP=1 \
-    -DWITH_ZLIB=1 \
-    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
-    "
-
-do_configure:prepend () {
-    # Disable building of examples
-    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/' ${S}/CMakeLists.txt \
-        || bbfatal "Failed to disable examples"
-}
-
-TOOLCHAIN = "gcc"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/libssh/libssh_0.9.8.bb b/meta-oe/recipes-support/libssh/libssh_0.9.8.bb
new file mode 100644
index 0000000000..9a22eb8608
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh_0.9.8.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Multiplatform C library implementing the SSHv2 and SSHv1 protocol"
+HOMEPAGE = "http://www.libssh.org"
+SECTION = "libs"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
+
+DEPENDS = "zlib openssl"
+
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.9"
+SRCREV = "d18bd233582a33f6768fe55148740fd6f9c3848c"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= "gcrypt"
+PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
+PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
+
+ARM_INSTRUCTION_SET:armv5 = "arm"
+
+EXTRA_OECMAKE = " \
+    -DWITH_PCAP=1 \
+    -DWITH_SFTP=1 \
+    -DWITH_ZLIB=1 \
+    -DWITH_EXAMPLES=0 \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


