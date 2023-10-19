Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6635CCDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:34:50 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.26513.1697718889471092891
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEAhbepm;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b390036045so1331940b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 05:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697718888; x=1698323688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0eJEFTCWErHZjjHLsg3IHZUmD6FP++bu3nA2m80rqA=;
        b=TEAhbepmlJ+EPo94iXVneGPxeTO6aHheJATtSnI4y4wWl6UAZbkhvr7v+gN1V9Te4n
         LlsvxsSfgfS8jaXNjMRbUptJRbaMuswQoZKQ4cMjzgacAtMU812uJzwH9X33PbdgXjFG
         Zp5ufjMUOJFPaDEEX+lsM3GeWjzn7AdVu7Tf7jREmKuXGBADOH/i5boNjA+EPMgZmNv3
         kOeyTPX9PZLqL9wV7+xqOy6kSI6izHFL8LcES615QxoLK/7n8N2VIGoSOa5EwG0D/cpj
         gKIs33uM14WLg41asoQ3Li3zZENSWYay906AYLEsgGeYo0qvEl1bmnpFM6YG3QGg+JIz
         1Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697718888; x=1698323688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0eJEFTCWErHZjjHLsg3IHZUmD6FP++bu3nA2m80rqA=;
        b=dTP8KItkO5OxWBNhmn7Z2ERiNozmu7kW71jQlaic9Wwp71RZJhO/yuHR98J4/PEc3X
         6fLsW8iD0w+d6x127R5c9zVV/VflpLaHFMAfm+AoBbnCNJvX4oCT8MTnVv5iTet4Vnh7
         0QdI2XjSjLd1nloSllL41fIDXqpmaxJO76Qj5loJsIviYnd0SbmaqEy878MX7oSIXEQ9
         7j40LZhJAwVFVTsRIGjq6ENSeABpxOhzlj6FHHuGpMlzX2GuurcJJZxAM1Aw7HXrsNqN
         CNJM7IxzcpY6iOJvtBrRxa3xqVCzFS5SPhKUUwYxc1Fn2w36JF7+UoMWXT/rjiQW83V7
         VRjQ==
X-Gm-Message-State: AOJu0YwAoCG0nRVCQrj5c0ubZvnOA+A4mc+TkQ/Cv/FKzZZgputk5sGl
	SS5AhiWIjRsPCm/nygXqUm1OFaxgd4g=
X-Google-Smtp-Source: AGHT+IEMICtz80H4BZYqkla1IzK5MLzqyzApKvA0xxW6hbFACFicL6o5+90rhmiWEpzqP3HCE+7Gfw==
X-Received: by 2002:a05:6a00:27a6:b0:690:d0d4:6fb0 with SMTP id bd38-20020a056a0027a600b00690d0d46fb0mr1850212pfb.3.1697718888267;
        Thu, 19 Oct 2023 05:34:48 -0700 (PDT)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b0069023d80e63sm4996778pfg.25.2023.10.19.05.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:34:47 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	akuster808@gmail.com,
	raj.khem@gmail.com
Subject: [oe][meta-oe][kirkstone][PATCH] libcroco: Delete the recipe
Date: Thu, 19 Oct 2023 18:04:06 +0530
Message-Id: <20231019123406.13477-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 12:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105599

Delete libcroco recipe as it got added by mistake
from commit https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=522603beb6d88ad6ea443806bb986096d5b766e6

Actual recipe is present in poky.
https://git.yoctoproject.org/poky/tree/meta/recipes-support/libcroco/libcroco_0.6.13.bb?h=kirkstone

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 .../libcroco/libcroco/CVE-2020-12825.patch    | 190 ------------------
 .../libcroco/libcroco_0.6.13.bb               |  22 --
 2 files changed, 212 deletions(-)
 delete mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
 delete mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
deleted file mode 100644
index 8e58f7309..000000000
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
index fd5927e01..000000000
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
2.25.1


