Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7579.1622856610008236399
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 18:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZ8u6+Aj;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso6877919pji.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 18:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2ERIKDUEb7N6ejiaZ/PF8eUkK8gR05XXpAZx/Ii7pE=;
        b=FZ8u6+AjRZjoFU4l0F4j+rokG7s80kUL86DU73kg3tXVYiQegwXxVYf0/WeDyuidoS
         wJLdsjcjp4niEJ1rx9qGRtH0/Jb2YPDstBhUELLps0hTm96xNkDsRMZIaVFBpI9N+Y28
         pw4zy9ogo2LteElJ3mxLK8fVFKhMeIjHqukgoSq4o/++c+ILn46pGSFGsX5zJcNde4FK
         hO7qgPnQybhkDd/W2mWeZLmceiYorSU41SSIx0xqZZsiBFusVIpwMbRWsI8wOOzhaAk+
         8CVuLDGQNkaXmdkP5Fx9siHcOTcZHOegHdRyNrb6hLptNqPgkUri4lE2j/xCM5DDQbbt
         lAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2ERIKDUEb7N6ejiaZ/PF8eUkK8gR05XXpAZx/Ii7pE=;
        b=U9Wzg4smdh5FngYAYhBLolwl4Ta+VBMb5tTIJJ8UxSvoF5fTRhfgshHdcaNoIdyLnh
         KTmoG80KCbsooxZdhhB+16jpA1MhAObEm1oM3PJrtBI6sVMZ3/QNm4OattkXdSRTfVEk
         1use9Hi3kbkTkjWKNzk+jWauuqhKaMYVFI2NIN8oU9RSFJ8rclZnDnsTFxVxWzJqyM8o
         Zit/ukHmospUITN2YJm+C6Wqahoy/8szqL0uDykGg9vGDEqqpRriw05DonTElPAZQrxr
         E80vuJrJBRMyAVBfaPSD7QthL/o8I+qKZSrIi2sHNEj238PVkvIMJQa1fyPVHvnYHbxc
         7XDQ==
X-Gm-Message-State: AOAM530FoH7K98+eME+0mjhUI/e5smwVoVbytY1ZaVCeW52vE7vJe901
	V2tAS/lrPXpHCTkk0B4V87mbcpAALtOm3w==
X-Google-Smtp-Source: ABdhPJwWt48Rqjf3MDkBsK2trapW0WL/dQMGRSpO1sO/usTHJIRQO5Ex+uNDpYGsBIIMEeu4ysn3Ww==
X-Received: by 2002:a17:903:31c3:b029:ed:6f74:49c7 with SMTP id v3-20020a17090331c3b02900ed6f7449c7mr6993219ple.12.1622856609292;
        Fri, 04 Jun 2021 18:30:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q68sm5767188pjq.45.2021.06.04.18.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 18:30:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] indent: Remove dead code using count_parens function
Date: Fri,  4 Jun 2021 18:30:02 -0700
Message-Id: <20210605013005.976154-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605013005.976154-1-raj.khem@gmail.com>
References: <20210605013005.976154-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang static analyser finds it as dead code, and it indeed is dead code
so remove it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Remove-dead-paren_level-code.patch   | 79 +++++++++++++++++++
 .../recipes-extended/indent/indent_2.2.12.bb  |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch

diff --git a/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch b/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch
new file mode 100644
index 0000000000..5a474cf0fc
--- /dev/null
+++ b/meta-oe/recipes-extended/indent/indent/0001-Remove-dead-paren_level-code.patch
@@ -0,0 +1,79 @@
+From 5af65ce9674a69054c9a8405e51794c6f3ca41df Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 4 Jun 2021 12:34:18 -0700
+Subject: [PATCH] Remove dead paren_level code
+
+Local variable `paren_level' in src/output.c:dump_line_code() is
+initialized to 0, then incremented with count_parens() return
+value, and then the variable is never used. Also count_parens()
+has no side effect. Thus this patch removes this useless code.
+
+Upstream-Status: Submitted [https://mail.gnu.org/archive/html/bug-indent/2011-04/msg00000.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/output.c | 35 -----------------------------------
+ 1 file changed, 35 deletions(-)
+
+diff --git a/src/output.c b/src/output.c
+index ee01bcc..5b92167 100644
+--- a/src/output.c
++++ b/src/output.c
+@@ -798,37 +798,6 @@ static int dump_line_label(void)
+    return cur_col;
+ }
+ 
+-/**
+- *
+- */
+-
+-static int count_parens(
+-    const char * string)
+-{
+-    int paren_level = 0;
+-
+-    while (*string)
+-    {
+-        switch (*string)
+-        {
+-        case '(':
+-        case '[':
+-            paren_level++;
+-            break;
+-        case ')':
+-        case ']':
+-            paren_level--;
+-            break;
+-        default:
+-            break;
+-        }
+-
+-        string++;
+-    }
+-
+-    return paren_level;
+-}
+-
+ /**
+  *
+  */
+@@ -840,8 +809,6 @@ static void dump_line_code(
+     BOOLEAN * pbreak_line,
+     int       target_col_break)
+ {
+-   int paren_level   = 0;
+-
+    if (s_code != e_code)
+    {                       /* print code section, if any */
+       int i;
+@@ -928,8 +895,6 @@ static void dump_line_code(
+ 
+          *pcur_col = count_columns (*pcur_col, s_code, NULL_CHAR);
+ 
+-         paren_level += count_parens(s_code);
+-
+          s_code[buf_break->offset] = c;
+ 
+          *pnot_truncated = 0;
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index 90ba8a2e65..829bf0fc1d 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
            file://0001-Makefile.am-remove-regression-dir.patch \
            file://0001-Fix-builds-with-recent-gettext.patch \
+           file://0001-Remove-dead-paren_level-code.patch \
            "
 SRC_URI[md5sum] = "4764b6ac98f6654a35da117b8e5e8e14"
 SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb3472664263bb8b"
-- 
2.31.1

