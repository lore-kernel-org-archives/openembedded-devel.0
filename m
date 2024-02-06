Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85CDC4829A
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 10:24:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.18501.1707215070196882816
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 02:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DpHNBnPX;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40ef3f351d2so2175395e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 02:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707215068; x=1707819868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1G/GnqgwX9dWYxAjNMFpaFxrfVHevKWjly5yqVLKZ+M=;
        b=DpHNBnPXb4RS96FQiHfy+p55zeJ0i/J6A41Ezo0vmO1FG6oM0zyrbaf7xFYuXnh9vo
         7g1gwN2Jc8RzuE7jEsmuGpho/MXTPyh6Vl7AbX2qvvMnwVfPWkJZTxul3kEyVdPzqJKZ
         pin8TjfSa5FI5apzJrnHk6FD1b1K6c74Ok+apj1L58P1um1XCsV6JRfkoMYsfCbJugmG
         FAtqGQQu6qNRaCerPZ/Y4s/1SdUk6VWSBWTmQQgdkdYWgnB+zeypBmo3iETwiTmvHewi
         3ln64pp9SdFq2Ur839Ijy6/So9ws8gCU/XFM8n/rt5tSYncGuarL1+JSb1gKmpDrZvgY
         5wFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707215068; x=1707819868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1G/GnqgwX9dWYxAjNMFpaFxrfVHevKWjly5yqVLKZ+M=;
        b=cPIwnw7gK7iD1L4E4qcj73QtTWJzRRz7h4/0uc4D0hkimdjyDvTBDxtbB7DJeAVSo+
         ar3fDURxn9xwlvkGDZyVKaKxemBl4RDny+29H7wfcMmCn9d7mo1ESbD6pKSrth2J+5Lx
         myRV+lddg4uqnfghBtK/BEJQc1rZ2lVQoswEzYXRdrYz/FMNQs8b2fAUotbImKB+sg/5
         QCK9MsNpoSsxJS5TVGumIT+T10DcGKYLpVxPPIUMOiu66BP/JdyOFPI7YUtIYxSxI06P
         7KZWVjbD7Y4Gz66I3TEFK6pCLiModUpbFPd7UMVDxCRFDcwos23dZPCHYiU3X4IynaL8
         Yz5A==
X-Gm-Message-State: AOJu0YywsuR4Ov5lsKOCgVrmdHd4IXmlUeQhwdw0elDIVT5cJa3KOjnT
	L9CjfX754YmTFnlgmvsZlBrN6UB+v3qPbGvZv7tHcoM/GKHU0xLss0tBIufn
X-Google-Smtp-Source: AGHT+IHIGjZKj9CpX7e3ytuHlFWSQ3Gn1qOIbOjVdJAH/wUPZchma0rtiErz30c+p7VIpmMuQop6Ww==
X-Received: by 2002:a05:600c:314e:b0:40f:df20:3bc5 with SMTP id h14-20020a05600c314e00b0040fdf203bc5mr2201966wmo.2.1707215068419;
        Tue, 06 Feb 2024 02:24:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXbgHm7MAqwIpiuYT+zR/5HEvrMLIjFgDbNA7vABAs8JKiIH5C8x/059oNb3mXnvNUqJcQUaGFc5NdPt9TijGbIOn3nGTGw
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id iv16-20020a05600c549000b0040fb989f4bdsm1535868wmb.23.2024.02.06.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 02:24:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] Revert "libcroco: Add fix for CVE-2020-12825"
Date: Tue,  6 Feb 2024 11:24:22 +0100
Message-ID: <20240206102422.300643-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108623

This reverts commit 522603beb6d88ad6ea443806bb986096d5b766e6.

This change was for oe-core not meta-oe repository, creating
unused directory "meta" which doesn't belong here.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../libcroco/libcroco/CVE-2020-12825.patch    | 190 ------------------
 .../libcroco/libcroco_0.6.13.bb               |  22 --
 2 files changed, 212 deletions(-)
 delete mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
 delete mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
deleted file mode 100644
index 8e58f73097..0000000000
--- a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
+++ /dev/null
@@ -1,190 +0,0 @@
-From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@gnome.org>
-Date: Thu, 13 Aug 2020 20:03:05 -0500
-Subject: [PATCH] libcroco parser: limit recursion in block and any productions
-
-If we don't have any limits, we can recurse forever and overflow the
-stack.
-
-This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
-in cr-parser.c.
-
-Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
-Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
-
-CVE: CVE-2020-12825
-Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61593003b4c31f25.patch]
----
- src/cr-parser.c | 44 ++++++++++++++++++++-----------
- 1 file changed, 29 insertions(+), 15 deletions(-)
-
-diff --git a/src/cr-parser.c b/src/cr-parser.c
-index d85e71f0fc..cd7b6ebd4a 100644
---- a/src/cr-parser.c
-+++ b/src/cr-parser.c
-@@ -136,6 +136,8 @@ struct _CRParserPriv {
-
- #define CHARS_TAB_SIZE 12
-
-+#define RECURSIVE_CALLERS_LIMIT 100
-+
- /**
-  * IS_NUM:
-  *@a_char: the char to test.
-@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core (CRParser * a_this);
-
- static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this);
-
--static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
-+static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
-+                                               guint      n_calls);
-
--static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
-+static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
-+                                                 guint      n_calls);
-
- static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
-
-@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
-         cr_parser_try_to_skip_spaces_and_comments (a_this);
-
-         do {
--                status = cr_parser_parse_any_core (a_this);
-+                status = cr_parser_parse_any_core (a_this, 0);
-         } while (status == CR_OK);
-
-         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
-@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
-                                       token);
-                 token = NULL;
--                status = cr_parser_parse_block_core (a_this);
-+                status = cr_parser_parse_block_core (a_this, 0);
-                 CHECK_PARSING_STATUS (status,
-                                       FALSE);
-                 goto done;
-@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
-
-         RECORD_INITIAL_POS (a_this, &init_pos);
-
--        status = cr_parser_parse_any_core (a_this);
-+        status = cr_parser_parse_any_core (a_this, 0);
-         CHECK_PARSING_STATUS (status, FALSE);
-
-         do {
--                status = cr_parser_parse_any_core (a_this);
-+                status = cr_parser_parse_any_core (a_this, 0);
-
-         } while (status == CR_OK);
-
-@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
-  *in chapter 4.1 of the css2 spec.
-  *block ::= '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
-  *@param a_this the current instance of #CRParser.
-+ *@param n_calls used to limit recursion depth
-  *FIXME: code this function.
-  */
- static enum CRStatus
--cr_parser_parse_block_core (CRParser * a_this)
-+cr_parser_parse_block_core (CRParser * a_this,
-+                            guint      n_calls)
- {
-         CRToken *token = NULL;
-         CRInputPos init_pos;
-@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
-
-         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ERROR);
-
-+        if (n_calls > RECURSIVE_CALLERS_LIMIT)
-+                return CR_ERROR;
-+
-         RECORD_INITIAL_POS (a_this, &init_pos);
-
-         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token);
-@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
-         } else if (token->type == CBO_TK) {
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
-                 token = NULL;
--                status = cr_parser_parse_block_core (a_this);
-+                status = cr_parser_parse_block_core (a_this, n_calls + 1);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 goto parse_block_content;
-         } else {
-                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
-                 token = NULL;
--                status = cr_parser_parse_any_core (a_this);
-+                status = cr_parser_parse_any_core (a_this, n_calls + 1);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 goto parse_block_content;
-         }
-@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
-                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
-                                                token);
-                 token = NULL;
--                status = cr_parser_parse_block_core (a_this);
-+                status = cr_parser_parse_block_core (a_this, 0);
-                 CHECK_PARSING_STATUS (status, FALSE);
-                 ref++;
-                 goto continue_parsing;
-@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
-                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
-                                                token);
-                 token = NULL;
--                status = cr_parser_parse_any_core (a_this);
-+                status = cr_parser_parse_any_core (a_this, 0);
-                 if (status == CR_OK) {
-                         ref++;
-                         goto continue_parsing;
-@@ -1162,10 +1162,12 @@
-  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
-  *
-  *@param a_this the current instance of #CRParser.
-+ *@param n_calls used to limit recursion depth
-  *@return CR_OK upon successfull completion, an error code otherwise.
-  */
- static enum CRStatus
--cr_parser_parse_any_core (CRParser * a_this)
-+cr_parser_parse_any_core (CRParser * a_this,
-+                          guint      n_calls)
- {
-         CRToken *token1 = NULL,
-                 *token2 = NULL;
-@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
-
-         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
-
-+        if (n_calls > RECURSIVE_CALLERS_LIMIT)
-+                return CR_ERROR;
-+
-         RECORD_INITIAL_POS (a_this, &init_pos);
-
-         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token1);
-@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                  *We consider parameter as being an "any*" production.
-                  */
-                 do {
--                        status = cr_parser_parse_any_core (a_this);
-+                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
-                 } while (status == CR_OK);
-
-                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
-@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                 }
-
-                 do {
--                        status = cr_parser_parse_any_core (a_this);
-+                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
-                 } while (status == CR_OK);
-
-                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
-@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
-                 }
-
-                 do {
--                        status = cr_parser_parse_any_core (a_this);
-+                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
-                 } while (status == CR_OK);
-
-                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
---
-GitLab
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
deleted file mode 100644
index fd5927e014..0000000000
--- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Cascading Style Sheet (CSS) parsing and manipulation toolkit"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://src/cr-rgb.c;endline=22;md5=31d5f0944d556c8589d04ea6055fcc66 \
-                    file://tests/cr-test-utils.c;endline=21;md5=2382c27934cae1d3792fcb17a6142c4e"
-
-SECTION = "x11/utils"
-DEPENDS = "glib-2.0 libxml2 zlib"
-BBCLASSEXTEND = "native nativesdk"
-EXTRA_OECONF += "--enable-Bsymbolic=auto"
-
-BINCONFIG = "${bindir}/croco-0.6-config"
-
-inherit gnomebase gtk-doc binconfig-disabled
-
-SRC_URI += "file://CVE-2020-12825.patch"
-
-SRC_URI[archive.md5sum] = "c80c5a8385011a0260dce6bd0da93dce"
-SRC_URI[archive.sha256sum] = "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
-- 
2.43.0


