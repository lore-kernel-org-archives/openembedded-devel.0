Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB75C10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 12:15:25 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.10004.1715084117781394967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 May 2024 05:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V2UBuku9;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-620e30d8f37so2611683a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715084116; x=1715688916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nx3ypMHLfXHZ13tyd6KXYg21B26Pn22H5Hjiv15f6LY=;
        b=V2UBuku9ITgHgxiCiVfgS4nOOrcNg+i0tjkpMHn1VPaumDTFfp/dUvAG+vHA8A8keZ
         ty5eoM29O2+jbSjT1C2xv5qEPSxkR69xSgT4Ju6E/xCyB7PBH4WZd8Bzow/JDvw0i2X0
         25IvSYwSggGhBX9t1LcB6f5jUO9QhIv6ayqp2slJgkc07qtgH47fnCY+pJ4B9OkvW34Y
         BX+Q80b9UceiXIDMVZ8ZLyC7C1N8BxEa2dxVrvruklAH2AdpQXmMlyw4CLvj1mzABLot
         hDguEwVHv+uc3+a16DF5P6XS1l8T0ySuQ91nEsZELdzPrYjnpW5Z7pTTxZio30tcpmB3
         bNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715084116; x=1715688916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx3ypMHLfXHZ13tyd6KXYg21B26Pn22H5Hjiv15f6LY=;
        b=WuK8YzpoKUQ5ebTofa+/9j2Ib/uUYVriJ5FVH5RuRP2hyX2qSaymSvTZpVnzcivaad
         qWN0QSR/45XdmBX1iB30+ybvMvs3ebxGFK9sV3/7UbzcYNiX/jXeAjj1nWktiXaFBpRe
         HOm8UlLmTSO0OZBo11jnVQVv8rogEim6mtlK1jx6jWiClcaqi/aLjbHROL/8jT0F4J14
         dx2590iR8j3AhYiBVRriDjh0He5hF0cnu5NycNzsQeqJ3WoVn7VoQmeL1HKh5D431AKc
         3wZX8iEoKs9cIwbmoK8autbxXXlxa8dZIJnpeJNNF2byP3OPnY+IRkBsS4uPazdzTnvc
         dgEw==
X-Gm-Message-State: AOJu0Yx6WlR+DuiRLdNPkV0vFwv/PKR0jcPgkS9Af6r09sTtzY/pAzLy
	IaSKsYUIayjOgRs1G6kKy2dgrgk7GfzBP8dWrqs0gWy1VxLnxRyt/KVGRXk=
X-Google-Smtp-Source: AGHT+IEAs7lQBSm6QS9UPWpLH/WAjWLFYTm/hgNzvWRCgNP9SxYZtuvukhV+uDoRPIR0UqOYdfPYLg==
X-Received: by 2002:a17:903:22c7:b0:1ec:5104:c75a with SMTP id y7-20020a17090322c700b001ec5104c75amr15949570plg.41.1715084115963;
        Tue, 07 May 2024 05:15:15 -0700 (PDT)
Received: from L-17494.kpit.com ([103.189.135.5])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001e20587b552sm9902248plr.163.2024.05.07.05.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 05:15:15 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	nikhil.r@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] libssh: Fix CVE CVE-2023-6004
Date: Tue,  7 May 2024 17:45:09 +0530
Message-Id: <20240507121509.264658-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 May 2024 12:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110267

A flaw was found in libssh. By utilizing the
ProxyCommand or ProxyJump feature, users can exploit
unchecked hostname syntax on the client. This issue
may allow an attacker to inject malicious code into
the command of the features mentioned through the
hostname parameter

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 ...on-parser-functions-to-config_parser.patch | 464 ++++++++++++++++++
 .../libssh/libssh/001_CVE-2023-6004.patch     |  30 ++
 .../libssh/libssh/002_CVE-2023-6004.patch     |  83 ++++
 .../libssh/libssh/003_CVE-2023-6004.patch     | 117 +++++
 .../libssh/libssh/004_CVE-2023-6004.patch     |  57 +++
 .../libssh/libssh/005_CVE-2023-6004.patch     | 142 ++++++
 .../libssh/libssh/006_CVE-2023-6004.patch     | 117 +++++
 .../recipes-support/libssh/libssh_0.8.9.bb    |   7 +
 8 files changed, 1017 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch b/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
new file mode 100644
index 000000000..f26b64410
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-config-Move-common-parser-functions-to-config_parser.patch
@@ -0,0 +1,464 @@
+From 79049981a513f9a10fac0f153e9b0b588326021f Mon Sep 17 00:00:00 2001
+From: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Date: Fri, 22 Feb 2019 13:06:49 +0100
+Subject: [PATCH] config: Move common parser functions to config_parser.c
+
+This will allow the moved functions to be used in the server side
+configuration parser implementation.
+
+Signed-off-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+CVE:CVE-2023-6004
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=79049981a513f9a10fac0f153e9b0b588326021f]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Removed 1 hunk from config.c as the function was intoduced in
+later version
+
+---
+ include/libssh/config_parser.h |  57 ++++++++
+ src/CMakeLists.txt             |   1 +
+ src/config.c                   | 216 +-----------------------------
+ src/config_parser.c            | 238 +++++++++++++++++++++++++++++++++
+ 4 files changed, 297 insertions(+), 215 deletions(-)
+ create mode 100644 include/libssh/config_parser.h
+ create mode 100644 src/config_parser.c
+
+diff --git a/include/libssh/config_parser.h b/include/libssh/config_parser.h
+new file mode 100644
+index 00000000..e974917c
+--- /dev/null
++++ b/include/libssh/config_parser.h
+@@ -0,0 +1,57 @@
++/*
++ * config_parser.h - Common configuration file parser functions
++ *
++ * This file is part of the SSH Library
++ *
++ * Copyright (c) 2019 by Red Hat, Inc.
++ *
++ * Author: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
++ *
++ * The SSH Library is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU Lesser General Public License as published by
++ * the Free Software Foundation; either version 2.1 of the License, or (at your
++ * option) any later version.
++ *
++ * The SSH Library is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
++ * License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with the SSH Library; see the file COPYING.  If not, write to
++ * the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
++ * MA 02111-1307, USA.
++ */
++
++#ifndef CONFIG_PARSER_H_
++#define CONFIG_PARSER_H_
++
++char *ssh_config_get_cmd(char **str);
++
++char *ssh_config_get_token(char **str);
++
++long ssh_config_get_long(char **str, long notfound);
++
++const char *ssh_config_get_str_tok(char **str, const char *def);
++
++int ssh_config_get_yesno(char **str, int notfound);
++
++/* @brief Parse SSH URI in format [user@]host[:port] from the given string
++ *
++ * @param[in]   tok      String to parse
++ * @param[out]  username Pointer to the location, where the new username will
++ *                       be stored or NULL if we do not care about the result.
++ * @param[out]  hostname Pointer to the location, where the new hostname will
++ *                       be stored or NULL if we do not care about the result.
++ * @param[out]  port     Pointer to the location, where the new port will
++ *                       be stored or NULL if we do not care about the result.
++ *
++ * @returns     SSH_OK if the provided string is in format of SSH URI,
++ *              SSH_ERROR on failure
++ */
++int ssh_config_parse_uri(const char *tok,
++        char **username,
++        char **hostname,
++        char **port);
++
++#endif /* LIBSSH_CONFIG_H_ */
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index fdb53baf..de66f056 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -163,6 +163,7 @@ set(libssh_SRCS
+   external/poly1305.c
+   external/sc25519.c
+   chachapoly.c
++  config_parser.c
+ )
+ 
+ if (CMAKE_USE_PTHREADS_INIT)
+diff --git a/src/config.c b/src/config.c
+index 85ecd96a..4268545d 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -22,7 +22,7 @@
+  */
+ 
+ #include "config.h"
+-
++#include "libssh/config_parser.h"
+ #include <ctype.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -228,102 +228,6 @@ static enum ssh_config_opcode_e ssh_config_get_opcode(char *keyword) {
+   return SOC_UNKNOWN;
+ }
+ 
+-static char *ssh_config_get_cmd(char **str) {
+-  register char *c;
+-  char *r;
+-
+-  /* Ignore leading spaces */
+-  for (c = *str; *c; c++) {
+-    if (! isblank(*c)) {
+-      break;
+-    }
+-  }
+-
+-  if (*c == '\"') {
+-    for (r = ++c; *c; c++) {
+-      if (*c == '\"') {
+-        *c = '\0';
+-        goto out;
+-      }
+-    }
+-  }
+-
+-  for (r = c; *c; c++) {
+-    if (*c == '\n') {
+-      *c = '\0';
+-      goto out;
+-    }
+-  }
+-
+-out:
+-  *str = c + 1;
+-
+-  return r;
+-}
+-
+-static char *ssh_config_get_token(char **str) {
+-  register char *c;
+-  char *r;
+-
+-  c = ssh_config_get_cmd(str);
+-
+-  for (r = c; *c; c++) {
+-    if (isblank(*c) || *c == '=') {
+-      *c = '\0';
+-      goto out;
+-    }
+-  }
+-
+-out:
+-  *str = c + 1;
+-
+-  return r;
+-}
+-
+-static long ssh_config_get_long(char **str, long notfound) {
+-  char *p, *endp;
+-  long i;
+-
+-  p = ssh_config_get_token(str);
+-  if (p && *p) {
+-    i = strtol(p, &endp, 10);
+-    if (p == endp) {
+-      return notfound;
+-    }
+-    return i;
+-  }
+-
+-  return notfound;
+-}
+-
+-static const char *ssh_config_get_str_tok(char **str, const char *def) {
+-  char *p;
+-
+-  p = ssh_config_get_token(str);
+-  if (p && *p) {
+-    return p;
+-  }
+-
+-  return def;
+-}
+-
+-static int ssh_config_get_yesno(char **str, int notfound) {
+-  const char *p;
+-
+-  p = ssh_config_get_str_tok(str, NULL);
+-  if (p == NULL) {
+-    return notfound;
+-  }
+-
+-  if (strncasecmp(p, "yes", 3) == 0) {
+-    return 1;
+-  } else if (strncasecmp(p, "no", 2) == 0) {
+-    return 0;
+-  }
+-
+-  return notfound;
+-}
+-
+ static void local_parse_file(ssh_session session, const char *filename, int *parsing, int seen[]) {
+   FILE *f;
+   char line[MAX_LINE_SIZE] = {0};
+diff --git a/src/config_parser.c b/src/config_parser.c
+new file mode 100644
+index 00000000..ae2aa2c8
+--- /dev/null
++++ b/src/config_parser.c
+@@ -0,0 +1,238 @@
++/*
++ * config_parser.c - Common configuration file parser functions
++ *
++ * This file is part of the SSH Library
++ *
++ * Copyright (c) 2009-2013    by Andreas Schneider <asn@cryptomilk.org>
++ *
++ * The SSH Library is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU Lesser General Public License as published by
++ * the Free Software Foundation; either version 2.1 of the License, or (at your
++ * option) any later version.
++ *
++ * The SSH Library is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
++ * License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with the SSH Library; see the file COPYING.  If not, write to
++ * the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston,
++ * MA 02111-1307, USA.
++ */
++
++#include "config.h"
++
++#include <ctype.h>
++#include <stdio.h>
++#include <string.h>
++#include <stdlib.h>
++
++#include "libssh/config_parser.h"
++#include "libssh/priv.h"
++
++char *ssh_config_get_cmd(char **str)
++{
++    register char *c;
++    char *r;
++
++    /* Ignore leading spaces */
++    for (c = *str; *c; c++) {
++        if (! isblank(*c)) {
++            break;
++        }
++    }
++
++    if (*c == '\"') {
++        for (r = ++c; *c; c++) {
++            if (*c == '\"') {
++                *c = '\0';
++                goto out;
++            }
++        }
++    }
++
++    for (r = c; *c; c++) {
++        if (*c == '\n') {
++            *c = '\0';
++            goto out;
++        }
++    }
++
++out:
++    *str = c + 1;
++
++    return r;
++}
++
++char *ssh_config_get_token(char **str)
++{
++    register char *c;
++    char *r;
++
++    c = ssh_config_get_cmd(str);
++
++    for (r = c; *c; c++) {
++        if (isblank(*c) || *c == '=') {
++            *c = '\0';
++            goto out;
++        }
++    }
++
++out:
++    *str = c + 1;
++
++    return r;
++}
++
++long ssh_config_get_long(char **str, long notfound)
++{
++    char *p, *endp;
++    long i;
++
++    p = ssh_config_get_token(str);
++    if (p && *p) {
++        i = strtol(p, &endp, 10);
++        if (p == endp) {
++            return notfound;
++        }
++        return i;
++    }
++
++    return notfound;
++}
++
++const char *ssh_config_get_str_tok(char **str, const char *def)
++{
++    char *p;
++
++    p = ssh_config_get_token(str);
++    if (p && *p) {
++        return p;
++    }
++
++    return def;
++}
++
++int ssh_config_get_yesno(char **str, int notfound)
++{
++    const char *p;
++
++    p = ssh_config_get_str_tok(str, NULL);
++    if (p == NULL) {
++        return notfound;
++    }
++
++    if (strncasecmp(p, "yes", 3) == 0) {
++        return 1;
++    } else if (strncasecmp(p, "no", 2) == 0) {
++        return 0;
++    }
++
++    return notfound;
++}
++
++int ssh_config_parse_uri(const char *tok,
++        char **username,
++        char **hostname,
++        char **port)
++{
++    char *endp = NULL;
++    long port_n;
++
++    /* Sanitize inputs */
++    if (username != NULL) {
++        *username = NULL;
++    }
++    if (hostname != NULL) {
++        *hostname = NULL;
++    }
++    if (port != NULL) {
++        *port = NULL;
++    }
++
++    /* Username part (optional) */
++    endp = strchr(tok, '@');
++    if (endp != NULL) {
++        /* Zero-length username is not valid */
++        if (tok == endp) {
++            goto error;
++        }
++        if (username != NULL) {
++            *username = strndup(tok, endp - tok);
++            if (*username == NULL) {
++                goto error;
++            }
++        }
++        tok = endp + 1;
++        /* If there is second @ character, this does not look like our URI */
++        endp = strchr(tok, '@');
++        if (endp != NULL) {
++            goto error;
++        }
++    }
++
++    /* Hostname */
++    if (*tok == '[') {
++        /* IPv6 address is enclosed with square brackets */
++        tok++;
++        endp = strchr(tok, ']');
++        if (endp == NULL) {
++            goto error;
++        }
++    } else {
++        /* Hostnames or aliases expand to the last colon or to the end */
++        endp = strrchr(tok, ':');
++        if (endp == NULL) {
++            endp = strchr(tok, '\0');
++        }
++    }
++    if (tok == endp) {
++        /* Zero-length hostnames are not valid */
++        goto error;
++    }
++    if (hostname != NULL) {
++        *hostname = strndup(tok, endp - tok);
++        if (*hostname == NULL) {
++            goto error;
++        }
++    }
++    /* Skip also the closing bracket */
++    if (*endp == ']') {
++        endp++;
++    }
++
++    /* Port (optional) */
++    if (*endp != '\0') {
++        char *port_end = NULL;
++
++        /* Verify the port is valid positive number */
++        port_n = strtol(endp + 1, &port_end, 10);
++        if (port_n < 1 || *port_end != '\0') {
++            SSH_LOG(SSH_LOG_WARN, "Failed to parse port number."
++                    " The value '%ld' is invalid or there are some"
++                    " trailing characters: '%s'", port_n, port_end);
++            goto error;
++        }
++        if (port != NULL) {
++            *port = strdup(endp + 1);
++            if (*port == NULL) {
++                goto error;
++            }
++        }
++    }
++
++    return SSH_OK;
++
++error:
++    if (username != NULL) {
++        SAFE_FREE(*username);
++    }
++    if (hostname != NULL) {
++        SAFE_FREE(*hostname);
++    }
++    if (port != NULL) {
++        SAFE_FREE(*port);
++    }
++    return SSH_ERROR;
++}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
new file mode 100644
index 000000000..e02cae182
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/001_CVE-2023-6004.patch
@@ -0,0 +1,30 @@
+From a66b4a6eae6614d200a3625862d77565b96a7cd3 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertpocs0@gmail.com>
+Date: Wed, 1 Nov 2023 11:24:43 +0100
+Subject: [PATCH] CVE-2023-6004: config_parser: Allow multiple '@' in usernames
+
+Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/a66b4a6eae6614d200a3625862d77565b96a7cd3]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+
+---
+ src/config_parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/config_parser.c b/src/config_parser.c
+index 0d988fec0..cf83e2c5e 100644
+--- a/src/config_parser.c
++++ b/src/config_parser.c
+@@ -180,7 +180,7 @@ int ssh_config_parse_uri(const char *tok,
+     }
+ 
+     /* Username part (optional) */
+-    endp = strchr(tok, '@');
++    endp = strrchr(tok, '@');
+     if (endp != NULL) {
+         /* Zero-length username is not valid */
+         if (tok == endp) {
diff --git a/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
new file mode 100644
index 000000000..a77783453
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/002_CVE-2023-6004.patch
@@ -0,0 +1,83 @@
+From 8615c24647f773a5e04203c7459512715d698be1 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertpocs0@gmail.com>
+Date: Tue, 31 Oct 2023 09:48:52 +0100
+Subject: [PATCH] CVE-2023-6004: options: Simplify the hostname parsing in
+ ssh_options_set
+
+Using ssh_config_parse_uri can simplify the parsing of the host
+parsing inside the function of ssh_options_set
+
+Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/8615c24647f773a5e04203c7459512715d698be1]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk 2 from option.c
+
+---
+ src/options.c | 40 ++++++++++++++++------------------------
+ 1 file changed, 16 insertions(+), 24 deletions(-)
+
+diff --git a/src/options.c b/src/options.c
+index 6f2c9397e..385114555 100644
+--- a/src/options.c
++++ b/src/options.c
+@@ -36,6 +36,7 @@
+ #include "libssh/session.h"
+ #include "libssh/misc.h"
+ #include "libssh/options.h"
++#include "libssh/config_parser.h"
+ #ifdef WITH_SERVER
+ #include "libssh/server.h"
+ #include "libssh/bind.h"
+@@ -415,33 +416,24 @@ int ssh_options_set(ssh_session session, enum ssh_options_e type,
+                 ssh_set_error_invalid(session);
+                 return -1;
+             } else {
+-                q = strdup(value);
+-                if (q == NULL) {
+-                    ssh_set_error_oom(session);
++                char *username = NULL, *hostname = NULL, *port = NULL;
++                rc = ssh_config_parse_uri(value, &username, &hostname, &port);
++                if (rc != SSH_OK) {
+                     return -1;
+                 }
+-                p = strchr(q, '@');
+-
+-                SAFE_FREE(session->opts.host);
+-
+-                if (p) {
+-                    *p = '\0';
+-                    session->opts.host = strdup(p + 1);
+-                    if (session->opts.host == NULL) {
+-                        SAFE_FREE(q);
+-                        ssh_set_error_oom(session);
+-                        return -1;
+-                    }
+-
++                if (port != NULL) {
++                    SAFE_FREE(username);
++                    SAFE_FREE(hostname);
++                    SAFE_FREE(port);
++                    return -1;
++                }
++                if (username != NULL) {
+                     SAFE_FREE(session->opts.username);
+-                    session->opts.username = strdup(q);
+-                    SAFE_FREE(q);
+-                    if (session->opts.username == NULL) {
+-                        ssh_set_error_oom(session);
+-                        return -1;
+-                    }
+-                } else {
+-                    session->opts.host = q;
++                   session->opts.username = username;
++                }
++                if (hostname != NULL) {
++                    SAFE_FREE(session->opts.host);
++                    session->opts.host = hostname;
+                 }
+             }
+             break;
diff --git a/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
new file mode 100644
index 000000000..a4e790ed0
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/003_CVE-2023-6004.patch
@@ -0,0 +1,117 @@
+From c6180409677c765e6b9ae2b18a3a7a9671ac1dbe Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertpocs0@gmail.com>
+Date: Tue, 10 Oct 2023 12:44:16 +0200
+Subject: [PATCH] CVE-2023-6004: misc: Add function to check allowed characters
+ of a hostname
+
+The hostname can be a domain name or an ip address. The colon has to be
+allowed because of IPv6 even it is prohibited in domain names.
+
+Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/c6180409677c765e6b9ae2b18a3a7a9671ac1dbe]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk 1 from misc.h and hunk 2 from misc.c
+---
+ include/libssh/misc.h |  3 ++
+ src/misc.c            | 68 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 71 insertions(+)
+
+diff --git a/include/libssh/misc.h b/include/libssh/misc.h
+index 924da5336..0924ba7fb 100644
+--- a/include/libssh/misc.h
++++ b/include/libssh/misc.h
+@@ -89,4 +89,6 @@ int ssh_match_group(const char *group, const char *object);
+ 
+ int ssh_quote_file_name(const char *file_name, char *buf, size_t buf_len);
+ 
++int ssh_check_hostname_syntax(const char *hostname);
++
+ #endif /* MISC_H_ */
+
+diff --git a/src/misc.c b/src/misc.c
+index 7c478a773..be6ee836e 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -94,6 +94,8 @@
+ #define ZLIB_STRING ""
+ #endif
+ 
++#define ARPA_DOMAIN_MAX_LEN 63
++
+ /**
+  * @defgroup libssh_misc The SSH helper functions.
+  * @ingroup libssh
+@@ -1292,4 +1294,69 @@ error:
+     return SSH_ERROR;
+ }
+ 
++/**
++ * @brief Checks syntax of a domain name
++ *
++ * The check is made based on the RFC1035 section 2.3.1
++ * Allowed characters are: hyphen, period, digits (0-9) and letters (a-zA-Z)
++ *
++ * The label should be no longer than 63 characters
++ * The label should start with a letter and end with a letter or number
++ * The label in this implementation can start with a number to allow virtual
++ * URLs to pass. Note that this will make IPv4 addresses to pass
++ * this check too.
++ *
++ * @param hostname The domain name to be checked, has to be null terminated
++ *
++ * @return SSH_OK if the hostname passes syntax check
++ *         SSH_ERROR otherwise or if hostname is NULL or empty string
++ */
++int ssh_check_hostname_syntax(const char *hostname)
++{
++    char *it = NULL, *s = NULL, *buf = NULL;
++    size_t it_len;
++    char c;
++
++    if (hostname == NULL || strlen(hostname) == 0) {
++        return SSH_ERROR;
++    }
++
++    /* strtok_r writes into the string, keep the input clean */
++    s = strdup(hostname);
++    if (s == NULL) {
++        return SSH_ERROR;
++    }
++
++    it = strtok_r(s, ".", &buf);
++    /* if the token has 0 length */
++    if (it == NULL) {
++        free(s);
++        return SSH_ERROR;
++    }
++    do {
++        it_len = strlen(it);
++        if (it_len > ARPA_DOMAIN_MAX_LEN ||
++            /* the first char must be a letter, but some virtual urls start
++             * with a number */
++            isalnum(it[0]) == 0 ||
++            isalnum(it[it_len - 1]) == 0) {
++            free(s);
++            return SSH_ERROR;
++        }
++        while (*it != '\0') {
++            c = *it;
++            /* the "." is allowed too, but tokenization removes it from the
++             * string */
++            if (isalnum(c) == 0 && c != '-') {
++                free(s);
++                return SSH_ERROR;
++            }
++            it++;
++        }
++    } while ((it = strtok_r(NULL, ".", &buf)) != NULL);
++
++    free(s);
++
++    return SSH_OK;
++}
+ /** @} */
diff --git a/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
new file mode 100644
index 000000000..39e6d9478
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/004_CVE-2023-6004.patch
@@ -0,0 +1,57 @@
+From 22492b69bba22b102342afc574800d354a08e405 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertpocs0@gmail.com>
+Date: Tue, 10 Oct 2023 18:33:56 +0200
+Subject: [PATCH] CVE-2023-6004: config_parser: Check for valid syntax of a
+ hostname if it is a domain name
+
+This prevents code injection.
+The domain name syntax checker is based on RFC1035.
+
+Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/22492b69bba22b102342afc574800d354a08e405]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk 2 and 3 from config_parser.c
+
+---
+ src/config_parser.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/config_parser.c b/src/config_parser.c
+index cf83e2c5e..b8b94611a 100644
+--- a/src/config_parser.c
++++ b/src/config_parser.c
+@@ -30,6 +30,7 @@
+ 
+ #include "libssh/config_parser.h"
+ #include "libssh/priv.h"
++#include "libssh/misc.h"
+ 
+ char *ssh_config_get_cmd(char **str)
+ {
+@@ -139,6 +140,7 @@ int ssh_config_parse_uri(const char *tok,
+ {
+     char *endp = NULL;
+     long port_n;
++    int rc;
+ 
+     /* Sanitize inputs */
+     if (username != NULL) {
+@@ -196,6 +198,14 @@ int ssh_config_parse_uri(const char *tok,
+         if (*hostname == NULL) {
+             goto error;
+         }
++        /* if not an ip, check syntax */
++        rc = ssh_is_ipaddr(*hostname);
++        if (rc == 0) {
++            rc = ssh_check_hostname_syntax(*hostname);
++            if (rc != SSH_OK) {
++                goto error;
++            }
++        }
+     }
+     /* Skip also the closing bracket */
+     if (*endp == ']') {
diff --git a/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
new file mode 100644
index 000000000..c86aba4d8
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/005_CVE-2023-6004.patch
@@ -0,0 +1,142 @@
+From cea841d71c025f9c998b7d5fc9f2a2839df62921 Mon Sep 17 00:00:00 2001
+From: Norbert Pocs <norbertpocs0@gmail.com>
+Date: Tue, 28 Nov 2023 15:26:45 +0100
+Subject: [PATCH] CVE-2023-6004 misc: Add ipv6 link-local check for an ip
+ address
+
+Signed-off-by: Norbert Pocs <norbertpocs0@gmail.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/cea841d71c025f9c998b7d5fc9f2a2839df62921]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Refreshed hunk 1 from CMakeLists.txt, hunk 1 from connect.c and
+hunks 2,3,4 from misc.c
+---
+ src/CMakeLists.txt |  1 +
+ src/connect.c      |  2 +-
+ src/misc.c         | 44 ++++++++++++++++++++++++++++++++++++++------
+ 3 files changed, 40 insertions(+), 7 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index d6245c0db..807313b59 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -14,6 +14,7 @@ set(LIBSSH_LINK_LIBRARIES
+ if (WIN32)
+   set(LIBSSH_LINK_LIBRARIES
+     ${LIBSSH_LINK_LIBRARIES}
++    iphlpapi
+     ws2_32
+   )
+ endif (WIN32)
+diff --git a/src/connect.c b/src/connect.c
+index 57e37e634..15cae6444 100644
+--- a/src/connect.c
++++ b/src/connect.c
+@@ -130,7 +130,7 @@ static int getai(const char *host, int port, struct addrinfo **ai) {
+ #endif
+   }
+ 
+-  if (ssh_is_ipaddr(host)) {
++  if (ssh_is_ipaddr(host) == 1) {
+     /* this is an IP address */
+     SSH_LOG(SSH_LOG_PACKET,"host %s matches an IP address",host);
+     hints.ai_flags |= AI_NUMERICHOST;
+diff --git a/src/misc.c b/src/misc.c
+index be6ee836e..7081f12ae 100644
+--- a/src/misc.c
++++ b/src/misc.c
+@@ -32,6 +32,7 @@
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
++#include <net/if.h>
+ 
+ #endif /* _WIN32 */
+ 
+@@ -59,6 +60,7 @@
+ #include <ws2tcpip.h>
+ #include <shlobj.h>
+ #include <direct.h>
++#include <netioapi.h>
+ 
+ #ifdef HAVE_IO_H
+ #include <io.h>
+@@ -191,22 +191,37 @@ int ssh_is_ipaddr_v4(const char *str) {
+ 
+ int ssh_is_ipaddr(const char *str) {
+     int rc = SOCKET_ERROR;
++    char *s = strdup(str);
+ 
+-    if (strchr(str, ':')) {
++    if (s == NULL) {
++        return -1;
++    }
++    if (strchr(s, ':')) {
+         struct sockaddr_storage ss;
+         int sslen = sizeof(ss);
++        char *network_interface = strchr(s, '%');
+ 
+-        /* TODO link-local (IP:v6:addr%ifname). */
+-        rc = WSAStringToAddressA((LPSTR) str,
++        /* link-local (IP:v6:addr%ifname). */
++        if (network_interface != NULL) {
++            rc = if_nametoindex(network_interface + 1);
++            if (rc == 0) {
++                free(s);
++                return 0;
++            }
++            *network_interface = '\0';
++        }
++        rc = WSAStringToAddressA((LPSTR) s,
+                                  AF_INET6,
+                                  NULL,
+                                  (struct sockaddr*)&ss,
+                                  &sslen);
+         if (rc == 0) {
++            free(s);
+             return 1;
+         }
+     }
+ 
++    free(s);
+     return ssh_is_ipaddr_v4(str);
+ }
+ #else /* _WIN32 */
+@@ -285,17 +300,32 @@ int ssh_is_ipaddr_v4(const char *str) {
+ 
+ int ssh_is_ipaddr(const char *str) {
+     int rc = -1;
++    char *s = strdup(str);
+ 
+-    if (strchr(str, ':')) {
++    if (s == NULL) {
++        return -1;
++    }
++    if (strchr(s, ':')) {
+         struct in6_addr dest6;
++        char *network_interface = strchr(s, '%');
+ 
+-        /* TODO link-local (IP:v6:addr%ifname). */
+-        rc = inet_pton(AF_INET6, str, &dest6);
++        /* link-local (IP:v6:addr%ifname). */
++        if (network_interface != NULL) {
++            rc = if_nametoindex(network_interface + 1);
++            if (rc == 0) {
++                free(s);
++                return 0;
++            }
++            *network_interface = '\0';
++        }
++        rc = inet_pton(AF_INET6, s, &dest6);
+         if (rc > 0) {
++	    free(s);
+             return 1;
+         }
+     }
+ 
++    free(s);
+     return ssh_is_ipaddr_v4(str);
+ }
diff --git a/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch b/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
new file mode 100644
index 000000000..f3cb2b998
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/006_CVE-2023-6004.patch
@@ -0,0 +1,117 @@
+From 1a02364b5107a4125ea3cb76fcdb6beabaebf3be Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Fri, 22 Dec 2023 10:32:40 +0100
+Subject: [PATCH] Fix regression in IPv6 addresses in hostname parsing
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 4f997aee7c7d7ea346b3e8ba505da0b7601ff318)
+
+CVE: CVE-2023-6004
+Upstream-Status: Backport [https://gitlab.com/libssh/libssh-mirror/-/commit/1a02364b5107a4125ea3cb76fcdb6beabaebf3be]
+Signed-off-by: nikhil r <nikhil.r@kpit.com>
+Comment: Removed 1 hunk from config_parser.c as the function was intoduced in
+later version
+
+---
+ include/libssh/config_parser.h | 11 ++++++++---
+ src/config.c                   |  4 ++--
+ src/config_parser.c            | 16 +++++++++++-----
+ src/options.c                  | 10 ++--------
+ 4 files changed, 23 insertions(+), 18 deletions(-)
+
+diff --git a/include/libssh/config_parser.h b/include/libssh/config_parser.h
+index a7dd42a2c..ca353432b 100644
+--- a/include/libssh/config_parser.h
++++ b/include/libssh/config_parser.h
+@@ -26,6 +26,8 @@
+ #ifndef CONFIG_PARSER_H_
+ #define CONFIG_PARSER_H_
+ 
++#include <stdbool.h>
++
+ char *ssh_config_get_cmd(char **str);
+ 
+ char *ssh_config_get_token(char **str);
+@@ -45,13 +47,16 @@ int ssh_config_get_yesno(char **str, int notfound);
+  *                       be stored or NULL if we do not care about the result.
+  * @param[out]  port     Pointer to the location, where the new port will
+  *                       be stored or NULL if we do not care about the result.
++ * @param[in]   ignore_port Set to true if the we should not attempt to parse
++ *                       port number.
+  *
+  * @returns     SSH_OK if the provided string is in format of SSH URI,
+  *              SSH_ERROR on failure
+  */
+ int ssh_config_parse_uri(const char *tok,
+-        char **username,
+-        char **hostname,
+-        char **port);
++                         char **username,
++                         char **hostname,
++                         char **port,
++                         bool ignore_port);
+ 
+ #endif /* LIBSSH_CONFIG_H_ */
+diff --git a/src/config_parser.c b/src/config_parser.c
+index b8b94611a..d4b2d2c3b 100644
+--- a/src/config_parser.c
++++ b/src/config_parser.c
+@@ -162,9 +162,10 @@ int ssh_config_get_yesno(char **str, int notfound)
+ }
+ 
+ int ssh_config_parse_uri(const char *tok,
+-        char **username,
+-        char **hostname,
+-        char **port)
++                         char **username,
++                         char **hostname,
++                         char **port,
++                         bool ignore_port)
+ {
+     char *endp = NULL;
+     long port_n;
+@@ -210,12 +211,17 @@ int ssh_config_parse_uri(const char *tok,
+         if (endp == NULL) {
+             goto error;
+         }
+-    } else {
+-        /* Hostnames or aliases expand to the last colon or to the end */
++    } else if (!ignore_port) {
++        /* Hostnames or aliases expand to the last colon (if port is requested)
++         * or to the end */
+         endp = strrchr(tok, ':');
+         if (endp == NULL) {
+             endp = strchr(tok, '\0');
+         }
++    } else {
++        /* If no port is requested, expand to the end of line
++         * (to accommodate the IPv6 addresses) */
++        endp = strchr(tok, '\0');
+     }
+     if (tok == endp) {
+         /* Zero-length hostnames are not valid */
+diff --git a/src/options.c b/src/options.c
+index 385114555..b3ecffe15 100644
+--- a/src/options.c
++++ b/src/options.c
+@@ -416,17 +416,11 @@ int ssh_options_set(ssh_session session, enum ssh_options_e type,
+                 ssh_set_error_invalid(session);
+                 return -1;
+             } else {
+-                char *username = NULL, *hostname = NULL, *port = NULL;
+-                rc = ssh_config_parse_uri(value, &username, &hostname, &port);
++                char *username = NULL, *hostname = NULL;
++                rc = ssh_config_parse_uri(value, &username, &hostname, NULL, true);
+                 if (rc != SSH_OK) {
+                     return -1;
+                 }
+-                if (port != NULL) {
+-                    SAFE_FREE(username);
+-                    SAFE_FREE(hostname);
+-                    SAFE_FREE(port);
+-                    return -1;
+-                }
+                 if (username != NULL) {
+                     SAFE_FREE(session->opts.username);
+                    session->opts.username = username;
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 530dda1f4..98910d306 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -11,6 +11,13 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2023-48795-1.patch \
            file://CVE-2023-48795-2.patch \
            file://CVE-2023-48795-3.patch \
+           file://0001-config-Move-common-parser-functions-to-config_parser.patch \
+           file://001_CVE-2023-6004.patch \
+           file://002_CVE-2023-6004.patch \
+           file://003_CVE-2023-6004.patch \
+           file://004_CVE-2023-6004.patch \
+           file://005_CVE-2023-6004.patch \
+           file://006_CVE-2023-6004.patch \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
-- 
2.25.1


